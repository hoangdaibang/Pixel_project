unit PIXEL_N;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Jpeg, pngimage,  StdCtrls, ExtCtrls, ExtDlgs, ComCtrls,
  LPControl, SLControlCollection, LPControlDrawLayers, SLScope, Mitov.VCLTypes,
  SLBasicDataDisplay, SLDataDisplay, SLDataChart;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenPictureDialog2: TOpenPictureDialog;
    SavePictureDialog2: TSavePictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    SaveDialog2: TSaveDialog;
        SaveDialog1: TSaveDialog;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    SLScope1: TSLScope;
    PanelSave2: TPanel;
    ButtonSave2: TButton;
    ButtonClear2: TButton;
    ButtonShow: TButton;
    Intensity1CheckBox: TCheckBox;
    Blue1CheckBox: TCheckBox;
    Red1CheckBox: TCheckBox;
    Green1CheckBox: TCheckBox;
    PanelSave1: TPanel;
    ButtonSave1: TButton;
    ButtonClear1: TButton;
    Panelcontrol1: TPanel;
    ButtonLoadImage1: TButton;
    LabelMouselocal1: TLabel;
    RedIntensity1: TLabel;
    GreenIntensity1: TLabel;
    BlueIntensity1: TLabel;
    Intensity1: TLabel;
    Panelcontrol2: TPanel;
    LabelMouselocal2: TLabel;
    RedIntensity2: TLabel;
    GreenIntensity2: TLabel;
    BlueIntensity2: TLabel;
    Intensity2: TLabel;
    ButtonLoadImage2: TButton;
    Panel6: TPanel;
    Label1: TLabel;
    LabelY12: TLabel;
    EditX12: TEdit;
    EditY12: TEdit;
    LabelX22: TLabel;
    EditX22: TEdit;
    LabelY22: TLabel;
    ButtonSelectMatrix2: TButton;
    EditY22: TEdit;
    Panel5: TPanel;
    Label2: TLabel;
    LabelY11: TLabel;
    LabelX21: TLabel;
    LabelY21: TLabel;
    EditX11: TEdit;
    EditY11: TEdit;
    EditX21: TEdit;
    ButtonSelectMatrix1: TButton;
    EditY21: TEdit;
    LabelSelectPixel1: TLabel;
    LabelSelectPixel2: TLabel;
    Red2CheckBox: TCheckBox;
    Green2CheckBox: TCheckBox;
    Blue2CheckBox: TCheckBox;
    Intensity2CheckBox: TCheckBox;
    TabSheet5: TTabSheet;

    procedure ButtonLoadImage1Click(Sender: TObject);
    procedure ButtonLoadImage2Click(Sender: TObject);
    procedure ButtonSelectMatrix1Click(Sender: TObject);
    procedure ButtonSelectMatrix2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonShowClick(Sender: TObject);
    procedure ButtonSave1Click(Sender: TObject);
    procedure ButtonClear1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    StartPoint : TPoint;
    EndPoint : TPoint;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  X11,Y11,X21,Y21,X12,Y12,X22,Y22 : Integer;
  dir : string;

implementation

{$R *.dfm}
//Setup at begin//////////////////////////////////////////////////////////////////////////////

procedure TForm1.FormCreate(Sender: TObject);
begin
dir := GetCurrentDir;
CreateDir('Temp');
end;

//Data Processing image 1/////////////////////////////////////////////////////////////////////

procedure DataProcessing1 (X11,Y11,X21,Y21  :Integer);
type
  PPixelRec = ^TPixelRec;
  TPixelRec = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  iX,iY : Integer;
  Pixel: PPixelRec;
  RGB : TRGBTriple;
  sR,sG,sB : byte;
  color : longInt;
  S : String;
  I : Integer;
begin
  Form1.Memo1.Lines.Clear;
  Form1.SLScope1.Channels[0].Data.Clear;
  Form1.SLScope1.Channels[1].Data.Clear;
  Form1.SLScope1.Channels[2].Data.Clear;
  Form1.SLScope1.Channels[3].Data.Clear;
  S := 'X' + '            ' + 'Red' + '            ' + 'Green' + '            ' + 'B'+ '            ' + 'InTensity';
  Form1.Memo1.Lines.Add(S);
  for iX := X11 to X21 do
      Begin
        for iY := Y11 to Y21 do
          Begin
            color := Form1.Image1.canvas.pixels[iX,iY];
            sR := color and $ff;
            sG := (color shr 8) and $ff;
            sB := (color shr 16) and $ff;
            I := Round((sR + sG + sB) / 3);
          end;
          Form1.SLScope1.Channels [0].Data.AddYPoint(sR);
          Form1.SLScope1.Channels [1].Data.AddYPoint(sG);
          Form1.SLScope1.Channels [2].Data.AddYPoint(sB);
          Form1.SLScope1.Channels [3].Data.AddYPoint(I);
          S := IntToStr(iX) + '            ' + IntToStr(sR) + '            ' + IntToStr(sG) + '            ' + IntToStr(sB)+ '            ' + IntToStr(I);
        Form1.Memo1.Lines.Add(S);
      end;
end;

procedure DrawRectangle1 (X11,Y11,X21,Y21  :Integer);
var
  Bitmap: TBitmap;
begin
  Form1.image1.Picture.LoadFromFile(dir + '/Temp/TempImage1.bmp');
  Bitmap := TBitmap.Create;
  try
    Bitmap.LoadFromFile(dir + '/Temp/TempImage1.bmp');
    Form1.Image1.Canvas.Brush.Bitmap := Bitmap;
    Form1.Image1.Canvas.Pen.Color := clBlue;
    Form1.Image1.Canvas.Rectangle(X11,Y11,X21,Y21);
    Form1.Image1.Canvas.FillRect(Rect(X11 + 2,Y11 + 2,X21 - 2,Y21 -2));
  finally
    Form1.Image1.Canvas.Brush.Bitmap := nil;
    Bitmap.Free;
  end;
end;

//Data Processing image 2/////////////////////////////////////////////////////////////////////////////

procedure DataProcessing2 (X12,Y12,X22,Y22  :Integer);
type
  PPixelRec = ^TPixelRec;
  TPixelRec = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  iX,iY : Integer;
  Pixel: PPixelRec;
  RGB : TRGBTriple;
  sR,sG,sB : byte;
  color : longInt;
  S : String;
  I : Integer;
begin
  Form1.Memo2.Lines.Clear;
  Form1.SLScope1.Channels[4].Data.Clear;
  Form1.SLScope1.Channels[5].Data.Clear;
  Form1.SLScope1.Channels[6].Data.Clear;
  Form1.SLScope1.Channels[7].Data.Clear;
  S := 'X' + '            ' + 'Red' + '            ' + 'Green' + '            ' + 'B'+ '            ' + 'InTensity';
  Form1.Memo2.Lines.Add(S);
  for iX := X12 to X22 do
      Begin
        for iY := Y12 to Y22 do
          Begin
            color := Form1.Image1.canvas.pixels[iX,iY];
            sR := color and $ff;
            sG := (color shr 8) and $ff;
            sB := (color shr 16) and $ff;
            I := Round((sR + sG + sB) / 3);
          end;
          Form1.SLScope1.Channels [4].Data.AddYPoint(sR);
          Form1.SLScope1.Channels [5].Data.AddYPoint(sG);
          Form1.SLScope1.Channels [6].Data.AddYPoint(sB);
          Form1.SLScope1.Channels [7].Data.AddYPoint(I);
          S := IntToStr(iX) + '            ' + IntToStr(sR) + '            ' + IntToStr(sG) + '            ' + IntToStr(sB)+ '            ' + IntToStr(I);
        Form1.Memo2.Lines.Add(S);
      end;
end;

procedure DrawRectangle2 (X12,Y12,X22,Y22  :Integer);
var
  Bitmap: TBitmap;
begin
  Form1.image2.Picture.LoadFromFile(dir + '/Temp/TempImage2.bmp');
  Bitmap := TBitmap.Create;
  try
    Bitmap.LoadFromFile(dir + '/Temp/TempImage2.bmp');
    Form1.Image2.Canvas.Brush.Bitmap := Bitmap;
    Form1.Image2.Canvas.Pen.Color := clBlue;
    Form1.Image2.Canvas.Rectangle(X12,Y12,X22,Y22);
    Form1.Image2.Canvas.FillRect(Rect(X12 + 2,Y12 + 2,X22 - 2,Y22 -2));
  finally
    Form1.Image2.Canvas.Brush.Bitmap := nil;
    Bitmap.Free;
  end;
end;

//Interfacec ation image 1//////////////////////////////////////////////////////////////////////////////////

procedure TForm1.ButtonLoadImage1Click(Sender: TObject);
var
  Picture1: TPicture;
  Bitmap1: TBitmap;
begin
  Image1.Enabled := True;
  Picture1 := TPicture.Create;
    try
      if OpenPictureDialog1.Execute then
        Picture1.LoadFromFile(OpenPictureDialog1.FileName);
        Bitmap1 := TBitmap.Create;
      try
        Bitmap1.Width := Picture1.Width;
        Bitmap1.Height := Picture1.Height;
        image1.Width := Bitmap1.Width;
        image1.Height := Bitmap1.Height;
        PageControl1.Width := Bitmap1.Width + 200;
        PageControl1.Height := Bitmap1.Height + 20;
        Form1.Width := PageControl1.Width + 20;
        Form1.Height := PageControl1.Height + 40;
        Bitmap1.Canvas.Draw(0, 0, Picture1.Graphic);
        Bitmap1.SaveToFile(dir + '/Temp/TempImage1.bmp');
        image1.Picture.LoadFromFile(dir + '/Temp/TempImage1.bmp');
      finally
        Bitmap1.Free;
      end;
    finally
      Picture1.Free;
    end;
end;

procedure TForm1.ButtonSelectMatrix1Click(Sender: TObject);
begin
  X11 := StrToInt(EditX11.Text);
  Y11 := StrToInt(EditY11.Text);
  X21 := StrToInt(EditX21.Text);
  Y21 := StrToInt(EditY21.Text);
  DataProcessing1 (X11,Y11,X21,Y21);
  DrawRectangle1 (X11,Y11,X21,Y21);
end;

procedure TForm1.ButtonShowClick(Sender: TObject);
begin
  SLScope1.Channels [0].Visible := Red1Checkbox.Checked;
  SLScope1.Channels [1].Visible := Green1Checkbox.Checked;
  SLScope1.Channels [2].Visible := Blue1Checkbox.Checked;
  SLScope1.Channels [3].Visible := Intensity1Checkbox.Checked;
  SLScope1.Channels [4].Visible := Red2Checkbox.Checked;
  SLScope1.Channels [5].Visible := Green2Checkbox.Checked;
  SLScope1.Channels [6].Visible := Blue2Checkbox.Checked;
  SLScope1.Channels [7].Visible := Intensity2Checkbox.Checked;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
type
  PPixelRec = ^TPixelRec;
  TPixelRec = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  Pixel: PPixelRec;
  RGB : TRGBTriple;
  sR,sG,sB : byte;
  color : longInt;
  L : String;
  I : Integer;
begin
  L := 'Mouse local : X = ' + IntToStr(X) + ' , Y = ' + IntToStr(Y);
  LabelMouselocal1.Caption := L;
  color := Image1.canvas.pixels[X,Y];
  sR := color and $ff;
  sG := (color shr 8) and $ff;
  sB := (color shr 16) and $ff;
  I := Round((sR + sG + sB) / 3);
  RedIntensity1.Caption := 'Red : ' + IntToStr(sR);
  GreenIntensity1.Caption := 'Green : ' + IntToStr(sG);
  BlueIntensity1.Caption := 'Blue : ' + IntToStr(sB);
  Intensity1.Caption := 'Intensity : ' + IntToStr(I);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X11 := X;
  Y11 := Y;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X21 := X;
  Y21 := Y;
  DrawRectangle1 (X11,Y11,X21,Y21);
  dataprocessing1 (X11,Y11,X21,Y21);
end;

//Interface action image 2/////////////////////////////////////////////////////////////

procedure TForm1.ButtonLoadImage2Click(Sender: TObject);
var
  Picture2: TPicture;
  Bitmap2: TBitmap;
begin
  Image2.Enabled := True;
  Picture2 := TPicture.Create;
    try
      if OpenPictureDialog2.Execute then
        Picture2.LoadFromFile(OpenPictureDialog2.FileName);
        Bitmap2 := TBitmap.Create;
      try
        Bitmap2.Width := Picture2.Width;
        Bitmap2.Height := Picture2.Height;
        image2.Width := Bitmap2.Width;
        image2.Height := Bitmap2.Height;
        PageControl1.Width := Bitmap2.Width + 200;
        PageControl1.Height := Bitmap2.Height + 20;
        Form1.Width := PageControl1.Width + 20;
        Form1.Height := PageControl1.Height + 40;
        Bitmap2.Canvas.Draw(0, 0, Picture2.Graphic);
        Bitmap2.SaveToFile(dir + '/Temp/TempImage2.bmp');
        image2.Picture.LoadFromFile(dir + '/Temp/TempImage2.bmp');
      finally
        Bitmap2.Free;
      end;
    finally
      Picture2.Free;
    end;
end;

procedure TForm1.ButtonSelectMatrix2Click(Sender: TObject);
begin
  X12 := StrToInt(EditX12.Text);
  Y12 := StrToInt(EditY12.Text);
  X22 := StrToInt(EditX22.Text);
  Y22 := StrToInt(EditY22.Text);
  DataProcessing2 (X12,Y12,X22,Y22);
  DrawRectangle2 (X12,Y12,X22,Y22);
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
type
  PPixelRec = ^TPixelRec;
  TPixelRec = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  Pixel2: PPixelRec;
  RGB : TRGBTriple;
  sR,sG,sB : byte;
  color : longInt;
  L : String;
  I : Integer;
begin
  L := 'Mouse local : X = ' + IntToStr(X) + ' , Y = ' + IntToStr(Y);
  LabelMouselocal2.Caption := L;
  color := Image2.Canvas.Pixels[X,Y];
  sR := color and $ff;
  sG := (color shr 8) and $ff;
  sB := (color shr 16) and $ff;
  I := Round((sR + sG + sB) / 3);
  RedIntensity1.Caption := 'Red : ' + IntToStr(sR);
  GreenIntensity1.Caption := 'Green : ' + IntToStr(sG);
  BlueIntensity1.Caption := 'Blue : ' + IntToStr(sB);
  Intensity1.Caption := 'Intensity : ' + IntToStr(I);
end;

procedure TForm1.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X12 := X;
  Y12 := Y;
end;

procedure TForm1.Image2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X22 := X;
  Y22 := Y;
  DataProcessing2 (X12,Y12,X22,Y22);
  DrawRectangle2 (X12,Y12,X22,Y22);
end;

//Clean data////////////////////////////////////////////////////////////////

procedure TForm1.ButtonClear1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
end;

//Save data//////////////////////////////////////////////////////////////////////

procedure TForm1.ButtonSave1Click(Sender: TObject);
var
  V0name,Viname: String;
  k:integer;
  V0,Vi:TextFile;
begin
  if SaveDialog1.Execute then
    V0name:= SaveDialog1.Filename;
  if V0name <> '' then
    begin
      assignfile(V0,V0name);
      rewrite(V0);
      writeln(V0,memo1.lines.text);
      closefile(V0);
    end;
end;



end.
