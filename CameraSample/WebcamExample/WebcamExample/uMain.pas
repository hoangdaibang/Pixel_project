unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI;

type
  TFormMain = class(TForm)
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  uWebcam, uFunctions;

procedure TFormMain.BitBtn1Click(Sender: TObject);
begin
  ComboBox1.Clear;
  WebcamList;
  ComboBox1.Text := 'Please select a webcam to capture from';
end;

procedure TFormMain.BitBtn2Click(Sender: TObject);
begin
  if BitBtn2.Caption = 'Start' then
  begin
    if IsNumber(ComboBox1.Text[1]) then
    begin
      ConnectWebcam(StrToInt(ComboBox1.Text[1]));
      Timer1.Enabled := True;
      BitBtn2.Caption := 'Stop';
    end
    else
      MessageBox(Application.Handle,'You must select a webcam to capture from','ERROR',0);
  end
  else
  begin
    Timer1.Enabled := False;
    CloseWebcam;
    BitBtn2.Caption := 'Start';
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  WebcamInit;
  TimeSeparator := '-';
  BitBtn1.Click;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  CloseWebcam;
end;

procedure TFormMain.Label2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.delphi.co.nr',nil,nil, SW_SHOWNORMAL) ;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
var
  FilePath : String;
begin
  FilePath := ExtractFilePath(ParamStr(0))+TimetoStr(Time())+'.bmp';
  CaptureWebcam(FilePath);
  Image1.Picture.LoadFromFile(FilePath);
end;

end.
