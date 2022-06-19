// Pixel Profile
// efg, September 1998
// www.efg2.com/lab

unit ScreenPixelProfile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtDlgs, ExtCtrls, ComCtrls, Buttons,
  LineLibrary, // RestrictCursorToDrawingArea, TLineSelected, NearLine
  Grids, Spin, TeEngine, Series, TeeProcs, Chart;

type
  TDrawingTool = (dtNone, dtSelectTool, dtLineTool);

  TFormPixelProfile = class(TForm)
    PageControlProfile: TPageControl;
    TabSheetImage: TTabSheet;
    ButtonLoadA: TButton;
    LabelPoints: TLabel;
    LabelFilename: TLabel;
    GroupBoxDraw: TGroupBox;
    SpeedButtonLine: TSpeedButton;
    SpeedButtonSelect: TSpeedButton;
    SpeedButtonErase: TSpeedButton;
    TabSheetData: TTabSheet;
    OpenPictureDialog: TOpenPictureDialog;
    TabSheetGraphs: TTabSheet;
    MemoData: TMemo;
    ChartPixelProfile: TChart;
    SeriesRed: TLineSeries;
    SeriesGreen: TLineSeries;
    SeriesBlue: TLineSeries;
    SeriesIntensity: TLineSeries;
    CheckBoxRed: TCheckBox;
    CheckBoxGreen: TCheckBox;
    CheckBoxBlue: TCheckBox;
    CheckBoxIntensity: TCheckBox;
    CheckBoxHue: TCheckBox;
    CheckBoxSaturation: TCheckBox;
    CheckBoxValue: TCheckBox;
    SeriesHue: TLineSeries;
    SeriesSaturation: TLineSeries;
    SeriesValue: TLineSeries;
    ImagePixelRow: TImage;
    LabelPixelSlice: TLabel;
    ButtonPrintGraph: TButton;
    Image: TImage;
    procedure ButtonLoadImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButtonEraseClick(Sender: TObject);
    procedure SpeedButtonToolClick(Sender: TObject);
    procedure CheckBoxPlaneClick(Sender: TObject);
    procedure ButtonPrintGraphClick(Sender: TObject);

  private
    Bitmap           :  TBitmap;
    ImageDesignHeight:  INTEGER;
    ImageDesignWidth :  INTEGER;
    Drawing          :  BOOLEAN;
    DrawingTool      :  TDrawingTool;
    EndPoint         :  TPoint;
    Selected         :  TLineSelected;
    StartPoint       :  TPoint;

    MovingPoint      :  TPoint;   // Point used when moving, stretching

    PROCEDURE CreateProfileLine;

    PROCEDURE UpdateImage;
    PROCEDURE UpdateLineLength;

  public
    { Public declarations }
  end;

var
  FormPixelProfile: TFormPixelProfile;

implementation
{$R *.DFM}

  USES
{$IFDEF GIF}
    GIFImage,    // TGIFImage (by Anders Melander)
{$ENDIF}
    Math,        // MinIntValue, MaxIntValue
    JPEG;        // TJPEGImage

  CONST
    MaxPixelCount              = 65536;
    RubberBandColor  : TColor  = clNavy;
    SquareHalfSize             = 4;
    OffScreenCoordinate        = -3*SquareHalfSize;

  TYPE
    EImageProcessingError = CLASS(Exception);
    TRGBTripleArray = ARRAY[0..MaxPixelCount-1] OF TRGBTriple;
    pRGBTripleArray = ^TRGBTripleArray;

  // Draw End Point "Handle"
  PROCEDURE DrawEndPoint  (CONST Canvas    :  TCanvas;
                           CONST Point     :  TPoint;
                           CONST PenColor  :  TColor;
                           CONST BrushColor:  TColor;
                           CONST HalfSize  :  INTEGER {Pixels});
  BEGIN
    WITH Canvas DO
    BEGIN
      Pen.Color   := PenColor;
      Pen.Style   := psSolid;
      Pen.Width   := 1;  {Hardwire for now}

      Brush.Color := BrushColor;

      Rectangle (Point.X-HalfSize, Point.Y-HalfSize,
                 Point.X+HalfSize, Point.Y+HalfSize)
    END
  END {DrawEndPoint};


  FUNCTION OKPoint(CONST p:  TPoint): BOOLEAN;
  BEGIN
    RESULT := (p.X <> OffScreenCoordinate) AND
              (p.Y <> OffScreenCoordinate)
  END {OKPoint};


  FUNCTION Distance(CONST a,b:  TPoint):  DOUBLE;
  BEGIN
    RESULT := SQRT( SQR(a.X-b.X) + SQR(a.Y-b.Y) )
  END {Distance};


  // RGB, each 0 to 255, to HSV.
  //   H = 0 to 359 (corresponding to 0..359 degrees around hexcone)
  //   S = 0 (shade of gray) to 255 (pure color)
  //   V = 0 (black) to 255 {white)

  // Based on C Code in "Computer Graphics -- Principles and Practice,"
  // Foley et al, 1996, p. 592.  Floating point fractions, 0..1, replaced with
  // integer values, 0..255.
  PROCEDURE RGBtoHSV (CONST RGB:    TRGBTriple;  {r, g and b IN [0..255]}
                      VAR   H,S,V:  INTEGER);    {h IN 0..359; s,v IN 0..255}
    VAR
      Delta   :  INTEGER;
      MinValue:  INTEGER;
  BEGIN
    WITH RGB DO
    BEGIN
      MinValue := MinIntValue( [rgbtRed, rgbtGreen, rgbtBlue] );
      V        := MaxIntValue( [rgbtRed, rgbtGreen, rgbtBlue] )
    END;

    Delta := V - MinValue;

    // Calculate saturation:  saturation is 0 if r, g and b are all 0
    IF   V = 0
    THEN S := 0
    ELSE S := (255 * Delta) DIV V;

    IF   S = 0
    THEN H := 0   {Achromatic:  When s = 0, h is undefined but assigned the value 0}
    ELSE BEGIN    {Chromatic}

      WITH RGB DO
      BEGIN
        IF   rgbtRed = V
        THEN H := (60*(rgbtGreen-rgbtBlue)) DIV Delta            {degrees -- between yellow and magenta}
        ELSE
          IF   rgbtGreen = V
          THEN H := 120 + (60*(rgbtBlue-rgbtRed)) DIV Delta      {degrees -- between cyan and yellow}
          ELSE
            IF  rgbtBlue = V
            THEN H := 240 + (60*(rgbtRed-rgbtGreen)) DIV Delta;  {degrees -- between magenta and cyan}
      END;

      IF   H < 0
      THEN H := H + 360;

    END
  END {RGBtoHSV};

/////////////////////////////////////////////////////////////////////////////


  PROCEDURE TFormPixelProfile.CreateProfileLine;
    VAR
      BitmapSlice  :  TBitmap;
      fraction     :  DOUBLE;
      H,S,V        :  INTEGER;
      i,j          :  INTEGER;
      Intensity    :  BYTE;
      k            :  INTEGER;
      m            :  INTEGER;
      PixelDistance:  INTEGER;
      RGB          :  TRGBTriple;
      x,y          :  DOUBLE;
  begin
    Screen.Cursor := crHourGlass;

    TRY
      IF   OKPoint(StartPoint) AND OKPOint(EndPoint)
      THEN PixelDistance := TRUNC(Distance(StartPoint, EndPoint)+0.5)
      ELSE PixelDistance := 0;

      // Don't bother unless at least 2 pixels are in the profile line
      IF   PixelDistance < 2
      THEN BEGIN
        ImagePixelRow.Picture := NIL;
        TabSheetGraphs.TabVisible := FALSE;
        TabSheetData.TabVisible   := FALSE;
      END
      ELSE BEGIN
        TabSheetGraphs.TabVisible := TRUE;
        TabSheetData.TabVisible   := TRUE;

        ChartPixelProfile.BottomAxis.Maximum := PixelDistance;

        CASE PixelDistance OF
            0 .. 10:  ChartPixelProfile.BottomAxis.Increment :=  1;
           11 .. 50:  ChartPixelProfile.BottomAxis.Increment :=  5;
           51 ..125:  ChartPixelProfile.BottomAxis.Increment := 10;
          126 ..250:  ChartPixelProfile.BottomAxis.Increment := 25;
          ELSE
            ChartPixelProfile.BottomAxis.Increment := 50;
        END;

        BitmapSlice := TBitmap.Create;
        TRY
          BitmapSlice.Height := 3;
          BitmapSlice.PixelFormat := pf24Bit;
          BitmapSlice.Width  := PixelDistance+1;

          SeriesRed.Clear;
          SeriesGreen.Clear;
          SeriesBlue.Clear;
          SeriesIntensity.Clear;
          SeriesHue.Clear;
          SeriesSaturation.Clear;
          SeriesValue.Clear;
          MemoData.Clear;

          MemoData.Lines.Add(' #      X     Y      R   G   B   I     H   S   V');
          MemoData.Lines.Add('---   ----- -----   --- --- --- ---   --- --- ---');

          FOR k := 0 TO PixelDistance DO
          BEGIN
            fraction := k / PixelDistance;
            // Add 0.5 to endpoints so "line" is from center of pixel
            x := (1.0 - fraction) * (StartPoint.X + 0.5) +
                 fraction         * (EndPoint.X   + 0.5);

            y := (1.0 - fraction) * (StartPoint.Y + 0.5)  +
                 fraction         * (EndPoint.Y   + 0.5);

            i := TRUNC(x);
            j := TRUNC(y);
            RGB := pRGBTripleArray(Bitmap.Scanline[j])[i];

            FOR m := 0 TO BitmapSlice.Height-1 DO
            BEGIN
              pRGBTripleArray(BitmapSlice.Scanline[m])[k] := RGB
            END;

            RGBToHSV(RGB, H,S,V);

            Intensity := (RGB.rgbtred+RGB.rgbtgreen+RGB.rgbtblue) DIV 3;
            MemoData.Lines.Add(Format('%3d   %5.1f %5.1f   %3d %3d %3d %3d   %3d %3d %3d',
                 [k, x, y, RGB.rgbtred,RGB.rgbtgreen,RGB.rgbtblue,
                          Intensity, H,S,V] ));
            SeriesRed.AddXY      (k, RGB.rgbtRed,       '', clTeeColor);
            SeriesGreen.AddXY    (k, RGB.rgbtGreen,     '', clTeeColor);
            SeriesBlue.AddXY     (k, RGB.rgbtBlue,      '', clTeeColor);

            SeriesIntensity.AddXY(k, Intensity,         '', clTeeColor);

            SeriesHue.AddXY       (k, H,                '', clTeeColor);
            SeriesSaturation.AddXY(k, S,                '', clTeeColor);
            SeriesValue.AddXY     (k, V,                '', clTeeColor)
          END;

          ImagePixelRow.Picture.Graphic := BitmapSlice;
        FINALLY
          BitmapSlice.Free
        END
      END
    FINALLY
      Screen.Cursor := crDefault
    END
  END {CreateProfileLine};


  // Usually UpdateImage is too sluggish to be called on MouseMove events
  PROCEDURE TFormPixelProfile.UpdateImage;
  BEGIN
    IF   Assigned(Bitmap)
    THEN BEGIN
      Image.Picture.Graphic := Bitmap;

      IF  OKPoint(StartPoint) AND OKPoint(EndPoint)
      THEN BEGIN
        WITH Image.Canvas DO
        BEGIN
          // Use bsClear so brush isn't background of dotted line
          Brush.Style := bsClear;

          Pen.Color := clRed;
          Pen.Style := psSolid;
          Pen.Width := 1;
          MoveTo(StartPoint.X, StartPoint.Y);
          LineTo(EndPoint.X, EndPoint.Y);

          DrawEndPoint (Image.Canvas, StartPoint,
                        clBlack, clRed, SquareHalfSize);

          DrawEndPoint (Image.Canvas, EndPoint,
                        clBlack, clRed, SquareHalfSize)
        END
      END;

      UpdateLineLength;
      CreateProfileLine
    END
  END {UpdateImages};


  PROCEDURE TFormPixelProfile.UpdateLineLength;
    VAR
      s:  STRING;
  BEGIN
    s := 'Points = ';

    s := s + '(' + IntToStr(StartPoint.x) + ', ' +
                   IntToStr(StartPoint.y) + ')   ';
    s := s + '(' + IntToStr(EndPoint.x) + ', ' +
                   IntToStr(EndPoint.y) + ')   ';

    IF  OKPoint(StartPoint) AND
        OKPoint(EndPoint)
    THEN BEGIN
      s := s + '  Distance = ' +
              Format('%.1f', [Distance(StartPoint, EndPoint) ]);
      LabelPoints.Caption := s;

      ChartPixelProfile.Title.Text.Clear;
      ChartPixelProfile.Title.Text.Add(
                                      'Pixel Profile:   ' +
                                      LabelFilename.Caption +
                                      '   from (' +
                                      IntToStr(StartPoint.x) + ', ' +
                                      IntToStr(StartPoint.y) + ') to (' +
                                      IntToStr(EndPoint.x) + ', ' +
                                      IntToStr(EndPoint.y) + ')');
    END
    ELSE LabelPoints.Caption := ''
  END {UpdateLineLength};


//////////////////////////////////////////////////////////////////////////////


procedure TFormPixelProfile.ButtonLoadImageClick(Sender: TObject);
  VAR
    Picture :  TPicture;
    s       :  STRING;
begin
  IF   OpenPictureDialog.Execute
  THEN BEGIN
    // Free previous Bitmap (if any).  Keep Bitmap in memory for manipulation.
    IF   Assigned(Bitmap)
    THEN Bitmap.Free;

    Bitmap := TBitmap.Create;

    // Use polymorphic TPicture to load any registered file type
    Picture := TPicture.Create;
    TRY
      Picture.LoadFromFile(OpenPictureDialog.Filename);

      // Try converting into bitmap
      TRY
        Bitmap.Assign(Picture.Graphic);
      EXCEPT
        Bitmap.Width  := Picture.Graphic.Width;
        Bitmap.Height := Picture.Graphic.Height;
        Bitmap.PixelFormat := pf24bit;
        Bitmap.Canvas.Draw(0,0, Picture.Graphic)
      END;

    FINALLY
      Picture.Free
    END;

    // Force this (if necessary)
    Bitmap.PixelFormat := pf24Bit;

    // Make TImage same size as TBitmap to avoid flicker
    Image.Width  := MinIntValue( [Bitmap.Width,  ImageDesignWidth] );
    Image.Height := MinIntValue( [Bitmap.Height, ImageDesignHeight] );

    DrawingTool := dtLineTool;

    // Get rid of any previous line
    StartPoint := Point(OffScreenCoordinate, OffScreenCoordinate);
    EndPoint   := StartPoint;

    // Make sure this is fully qualified name.  This will be used to save
    // image .INI file with alignment points.
    LabelFilename.Caption := OpenPictureDialog.Filename;

    s := ExtractFilename(OpenPictureDialog.Filename);
    LabelFilename.Caption := COPY(s, 1, LENGTH(s)-4);

    OpenPictureDialog.InitialDir :=
      ExtractFilePath(OpenPictureDialog.Filename);

    UpdateImage;
    GroupBoxDraw.Visible := TRUE;
  END
end;


procedure TFormPixelProfile.FormCreate(Sender: TObject);
begin
  ImageDesignWidth  := Image.Width;
  ImageDesignHeight := Image.Height;

  TabSheetGraphs.TabVisible := FALSE;
  TabSheetData.TabVisible   := FALSE;

  // Make sure ICO, WMF, GIF, etc. are in list
  OpenPictureDialog.Filter := GraphicFilter(TGraphic);

  Bitmap := NIL;

  Drawing := FALSE;
  DrawingTool := dtLineTool;

  LabelPoints.Caption := '';
  LabelFilename.Caption := '';

  PageControlProfile.ActivePage := TabSheetImage
end;


procedure TFormPixelProfile.FormDestroy(Sender: TObject);
begin
  Bitmap.Free
end;


procedure TFormPixelProfile.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin

  IF   Assigned(Bitmap)
  THEN BEGIN

  CASE button OF
    mbLeft:
      BEGIN

       WITH Image.Canvas DO
        BEGIN
          Pen.Color := clRed;
          Pen.Style := psSolid;
          Pen.Width := 1;
          Pen.Mode  := pmCopy
        END;

        CASE DrawingTool OF
          dtLineTool:
            BEGIN
              Drawing := TRUE;
              StartPoint := Point(X,Y);
              EndPoint   := Point(X,Y);
              Screen.Cursor := crCross;
              RestrictCursorToDrawingArea (Image);
              DrawEndPoint (Image.Canvas, StartPoint,
                          clBlack, clRed, SquareHalfSize)
            END;

          dtSelectTool:
            BEGIN
              Selected := lsNotSelected;
              MovingPoint := Point(X,Y);
              IF   SquareContainsPoint(StartPoint, SquareHalfSize, MovingPoint)
              THEN Selected := lsPoint1
              ELSE
                IF   SquareContainsPoint(EndPoint, SquareHalfSize, MovingPoint)
                THEN Selected := lsPoint2
                ELSE
                  IF   NearLine(MovingPoint, StartPoint, EndPoint)
                  THEN Selected := lsLine;

              IF   Selected IN [lsPoint1, lsPoint2, lsLine]
              THEN BEGIN
                Screen.Cursor := crDrag;
                RestrictCursorToDrawingArea(Image)
              END
            END
        END;

        WITH Image.Canvas DO
        BEGIN
          Pen.Style := psSolid;
          Pen.Mode  := pmNotXOR;
          Pen.Color := RubberBandColor;
          Pen.Width := 1;
        END
      END;
      
    mbMiddle:
      BEGIN
        // Ignore for now
      END;

    mbRight:
      BEGIN
        // Ignore for now
      END

  END

  END

end;


procedure TFormPixelProfile.ImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);

  VAR
    Delta:  TPoint;
begin
  // Ignore unless/until bitmap is present
  IF   Assigned(Bitmap)
  THEN BEGIN

    CASE DrawingTool OF
      dtLineTool:
        BEGIN
          // If drawing new line
          IF   Drawing
          THEN BEGIN
            WITH Image.Canvas DO
            BEGIN
              // Use NOT XOR mode to erase old line
              MoveTo(StartPoint.X, StartPoint.Y);
              LineTo(EndPoint.X, EndPoint.Y);

              // Draw new line
              EndPoint := Point(X,Y);
              MoveTo(StartPoint.X, StartPoint.Y);
              LineTo(EndPoint.X, EndPoint.Y);

              // Additional information displayed here, namely, X,Y, R,G,B and
              // intensity caused unacceptable flicker, so these were deleted.
              UpdateLineLength
            END
          END
        END;

      dtSelectTool:
        BEGIN
          CASE Selected OF
            lsPoint1:
              BEGIN
                WITH  Image.Canvas DO
                BEGIN
                  // Use NOT XOR mode to erase old line
                  MoveTo(StartPoint.X, StartPoint.Y);
                  LineTo(EndPoint.X, EndPoint.Y);

                  // Draw new line
                  StartPoint := Point(X,Y);
                  MoveTo(StartPoint.X, StartPoint.Y);
                  LineTo(EndPoint.X, EndPoint.Y);
                END;

                UpdateLineLength
              END;

            lsPoint2:
              BEGIN
                WITH  Image.Canvas DO
                BEGIN
                  // Use NOT XOR mode to erase old line
                  MoveTo(StartPoint.X, StartPoint.Y);
                  LineTo(EndPoint.X, EndPoint.Y);

                  // Draw new line
                  EndPoint := Point(X,Y);
                  MoveTo(StartPoint.X, StartPoint.Y);
                  LineTo(EndPoint.X, EndPoint.Y);
                END;

                UpdateLineLength
              END;

            lsLine:
              BEGIN
                WITH  Image.Canvas DO
                BEGIN
                  // Use NOT XOR mode to erase old line
                  MoveTo(StartPoint.X, StartPoint.Y);
                  LineTo(EndPoint.X, EndPoint.Y);

                  Delta := SubtractPoints(Point(X,Y), MovingPoint);
                  MovingPoint := Point(X,Y);
                  StartPoint := AddPoints(StartPoint, Delta);
                  EndPoint := AddPoints(EndPoint, Delta);
                  MoveTo(StartPoint.X, StartPoint.Y);
                  LineTo(EndPoint.X, EndPoint.Y);
                END
              END

           ELSE
             IF   SquareContainsPoint(StartPoint, SquareHalfSize, Point(X,Y)) OR
                  SquareContainsPoint(EndPoint, SquareHalfSize, Point(X,Y)) OR
                  NearLine(Point(X,Y), StartPoint, EndPoint)
             THEN Screen.Cursor := crHandPoint
             ELSE Screen.Cursor := crDefault
          END
        END
    END

  END
end;


procedure TFormPixelProfile.ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  VAR
    Delta:  TPoint;
begin
  // Ignore unless/until bitmap is present
  IF   Assigned(Bitmap)
  THEN BEGIN

    CASE button OF
      mbLeft:
        CASE DrawingTool OF
          dtLineTool:
            BEGIN
              EndPoint := Point(X,Y);
              UpdateImage;
              Drawing := FALSE;
              Screen.Cursor := crDefault;
              RemoveCursorRestrictions
            END;

          dtSelectTool:
            BEGIN
              // Final adjustment
              CASE Selected OF
                lsPoint1:  StartPoint := Point(X,Y);
                lsPoint2:  EndPoint := Point(X,Y);

                lsLine:
                  BEGIN
                    Delta := SubtractPoints(Point(X,Y), MovingPoint);
                    MovingPoint := Point(X,Y);
                    StartPoint := AddPoints(StartPoint, Delta);
                    EndPoint := AddPoints(EndPoint, Delta)
                  END;
              END;

              IF   Selected <> lsNotSelected
              THEN BEGIN
                UpdateImage;
                Selected := lsNotSelected;
                Screen.Cursor := crDefault;
                RemoveCursorRestrictions
              END
            END
        END;

      mbMiddle:
        BEGIN
          // Ignore for now
        END;

      mbRight:
        BEGIN
          // Ignore for now
        END
    END

  END

end;


procedure TFormPixelProfile.SpeedButtonEraseClick(Sender: TObject);

begin
  StartPoint := Point(OffScreenCoordinate, OffScreenCoordinate);
  EndPoint := Point(OffScreenCoordinate, OffScreenCoordinate);
  UpdateImage
end;


procedure TFormPixelProfile.SpeedButtonToolClick(Sender: TObject);
begin
  CASE (Sender AS TSpeedButton).Tag OF
    1:  DrawingTool := dtLineTool;
    2:  DrawingTool := dtSelectTool
  END;

end;


//////////////////////////////////////////////////////////////////////////////

procedure TFormPixelProfile.CheckBoxPlaneClick(Sender: TObject);
begin
  CASE (Sender AS TCheckBox).Tag OF
    1:  SeriesRed.Active   := CheckboxRed.Checked;
    2:  SeriesGreen.Active := CheckboxGreen.Checked;
    3:  SeriesBlue.Active  := CheckboxBlue.Checked;

    4:  SeriesIntensity.Active := CheckboxIntensity.Checked;

    5:  SeriesHue.Active := CheckboxHue.Checked;
    6:  SeriesSaturation.Active := CheckboxSaturation.Checked;
    7:  SeriesValue.Active := CheckboxValue.Checked;
    ELSE
      // Do nothing
  END;
end;

procedure TFormPixelProfile.ButtonPrintGraphClick(Sender: TObject);
begin
  ChartPixelProfile.PrintLandScape
end;

end.
