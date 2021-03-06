unit PIXEL_N;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Jpeg, pngimage,  StdCtrls, ExtCtrls, ExtDlgs, ComCtrls,
  LPControl, SLControlCollection, LPControlDrawLayers, SLScope;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    OpenPictureDialog1: TOpenPictureDialog;
    Button1: TButton;
    Button2: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    Label7: TLabel;
    TabSheet3: TTabSheet;
    SLScope1: TSLScope;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    SavePictureDialog1: TSavePictureDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    StartPoint : TPoint;
    EndPoint : TPoint;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  X1,Y1,X2,Y2 : Integer;

implementation

{$R *.dfm}
procedure DataProcessing (X1,Y1,X2,Y2  :Integer);
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
  S := 'X' + '     II     ' + 'Red' + '     II     ' + 'Green' + '     II     ' + 'B'+ '     II     ' + 'InTensity';
  Form1.Memo1.Lines.Add(S);
  for iX := X1 to X2 do
      Begin
        for iY := Y1 to Y2 do
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
          S := IntToStr(iX) + '     II     ' + IntToStr(sR) + '     II     ' + IntToStr(sG) + '     II     ' + IntToStr(sB)+ '     II     ' + IntToStr(I);
        Form1.Memo1.Lines.Add(S);
      end;
end;

procedure DrawRectangle (X1,Y1,X2,Y2  :Integer);
var
  Bitmap: TBitmap;
begin
  Form1.image1.Picture.LoadFromFile('C:\temp.bmp');
  Bitmap := TBitmap.Create;
  try
    Bitmap.LoadFromFile('C:\temp.bmp');
    Form1.Image1.Canvas.Brush.Bitmap := Bitmap;
    Form1.Image1.Canvas.Pen.Color := clBlue;
    Form1.Image1.Canvas.Rectangle(X1,Y1,X2,Y2);
    Form1.Image1.Canvas.FillRect(Rect(X1 + 2,Y1 + 2,X2 - 2,Y2 -2));
  finally
    Form1.Image1.Canvas.Brush.Bitmap := nil;
    Bitmap.Free;
  end;
end;
/////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Button1Click(Sender: TObject);
var
  Picture: TPicture;
  Bitmap: TBitmap;
begin
  Image1.Enabled := True;
  Picture := TPicture.Create;
    try
      if OpenPictureDialog1.Execute then
        Picture.LoadFromFile(OpenPictureDialog1.FileName);
        Bitmap := TBitmap.Create;
      try
        Bitmap.Width := Picture.Width;
        Bitmap.Height := Picture.Height;
        image1.Width := Bitmap.Width;
        image1.Height := Bitmap.Height;
        Button1.Left := Bitmap.Width + 10;
        PageControl1.Width := Bitmap.Width + 205;
        PageControl1.Height := Bitmap.Height + 100;
        Label1.Left := Bitmap.Width + 15;
        Label2.Left := Bitmap.Width + 15;
        Label3.Left := Bitmap.Width + 15;
        Label4.Left := Bitmap.Width + 15;
        Label5.Left := Bitmap.Width + 15;
        Label6.Left := Bitmap.Width + 15;
        Label7.Left := Bitmap.Width + 15;
        Edit1.Left  := Bitmap.Width + 15;
        Edit2.Left  := Bitmap.Width + 105;
        Edit3.Left  := Bitmap.Width + 15;
        Edit4.Left  := Bitmap.Width + 105;
        Button2.Left := Bitmap.Width + 15;
        Form1.Width := PageControl1.Width + 10;
        Form1.Height := PageControl1.Height + 30;
        Bitmap.Canvas.Draw(0, 0, Picture.Graphic);
        Bitmap.SaveToFile('C:\temp.bmp');
        image1.Picture.LoadFromFile('C:\temp.bmp');
      finally
        Bitmap.Free;
      end;
    finally
      Picture.Free;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  X1 := StrToInt(Edit1.Text);
  Y1 := StrToInt(Edit2.Text);
  X2 := StrToInt(Edit3.Text);
  Y2 := StrToInt(Edit4.Text);
  DataProcessing (X1,Y1,X2,Y2);
  DrawRectangle (X1,Y1,X2,Y2);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SLScope1.Channels [0].Visible := Checkbox1.Checked;
  SLScope1.Channels [1].Visible := Checkbox2.Checked;
  SLScope1.Channels [2].Visible := Checkbox3.Checked;
  SLScope1.Channels [3].Visible := Checkbox4.Checked;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    SlScope1.SaveToJpeg(SavePictureDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form1.SLScope1.Channels[0].Data.Clear;
  Form1.SLScope1.Channels[1].Data.Clear;
  Form1.SLScope1.Channels[2].Data.Clear;
  Form1.SLScope1.Channels[3].Data.Clear;
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
  Label1.Caption := L;
  color := Image1.canvas.pixels[X,Y];
  sR := color and $ff;
  sG := (color shr 8) and $ff;
  sB := (color shr 16) and $ff;
  I := Round((sR + sG + sB) / 3);
  Label2.Caption := 'Red : ' + IntToStr(sR);
  Label3.Caption := 'Green : ' + IntToStr(sG);
  Label4.Caption := 'Blue : ' + IntToStr(sB);
  Label7.Caption := 'Intensity : ' + IntToStr(I);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X1 := X;
  Y1 := Y;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  X2 := X;
  Y2 := Y;
  DrawRectangle (X1,Y1,X2,Y2);
  dataprocessing (X1,Y1,X2,Y2);
end;

procedure TForm1.Button6Click(Sender: TObject);
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

procedure TForm1.Button7Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
