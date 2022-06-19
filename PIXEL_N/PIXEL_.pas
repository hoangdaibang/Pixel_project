unit PIXEL_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Jpeg, pngimage,  StdCtrls, ExtCtrls, ExtDlgs, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Picture: TPicture;
  Bitmap: TBitmap;
begin
  Picture := TPicture.Create;
  try
    IF OPENPICTUREDIALOG1.Execute THEN
      Picture.LoadFromFile(OpenPictureDialog1.FileName);
      Bitmap := TBitmap.Create;
    try
      Bitmap.Width := Picture.Width;
      Bitmap.Height := Picture.Height;
      IMAGE1.Width := Bitmap.Width;
      IMAGE1.Height := Bitmap.Width;
      Bitmap.Canvas.Draw(0, 0, Picture.Graphic);
      Bitmap.SaveToFile('C:\Users\BG\Downloads\test.bmp');
    finally
      IMAGE1.Picture.LoadFromFile('C:\Users\BG\Downloads\test.bmp');
      Bitmap.Free;
    end;
  finally
    Picture.Free;
  end;
  END;
end.
