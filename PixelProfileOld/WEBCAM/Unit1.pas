unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
Dialogs, ExtCtrls, StdCtrls,ShellAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Timer1: TTimer;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const WM_CAP_START = WM_USER;
WM_CAP_STOP = WM_CAP_START + 68;
WM_CAP_DRIVER_CONNECT = WM_CAP_START + 10;
WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + 11;
WM_CAP_SAVEDIB = WM_CAP_START + 25;
WM_CAP_GRAB_FRAME = WM_CAP_START + 60;
WM_CAP_SEQUENCE = WM_CAP_START + 62;
WM_CAP_FILE_SET_CAPTURE_FILEA = WM_CAP_START + 20;

function capCreateCaptureWindowA(lpszWindowName : PCHAR;
dwStyle : longint;
x : integer;
y : integer;
nWidth : integer;
nHeight : integer;
ParentWin : HWND;
nId : integer): HWND;
stdcall external 'AVICAP32.DLL';
var
  Form1: TForm1;

implementation
{$R *.dfm}


var hWndC : THandle;

procedure TForm1.Button1Click(Sender: TObject);
begin
 hWndC := capCreateCaptureWindowA('My Own Capture Window',
WS_CHILD or WS_VISIBLE ,
0,
0,
Panel1.Width,
Panel1.Height,
Panel1.Handle,
0); //создаем область для вывода получаемых в будущем картинок =)

if hWndC <> 0 then //если при создании области ошибок не возникло, то сопкойно начинаем забирать данный с веб-камеры
SendMessage(hWndC, WM_CAP_DRIVER_CONNECT, 0, 0);  //забираем картинку с вебкамеры

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  hWndC := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if hWndC <> 0 then
  begin
    SendMessage(hWndC, WM_CAP_DRIVER_DISCONNECT, 0, 0);  //"отключаемся" от веб-камеры
    hWndC := 0;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if hWndC <> 0 then SendMessage(hWndC, WM_CAP_GRAB_FRAME, 0, 0); //забираем картинку с вебкамеры
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   ShellExecute(Handle, nil, 'http://ignatiev.su', nil, nil, SW_SHOW);
end;

end.
