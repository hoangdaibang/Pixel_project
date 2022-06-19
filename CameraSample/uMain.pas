unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls ,
  uWebCam,
  VFrames in 'Win32\WebcamFiles\VFrames.pas',
  VSample in 'Win32\WebcamFiles\VSample.pas',
  Direct3D9 in 'Win32\WebcamFiles\DirectX\Direct3D9.pas',
  DirectDraw in 'Win32\WebcamFiles\DirectX\DirectDraw.pas',
  DirectShow9 in 'Win32\WebcamFiles\DirectX\DirectShow9.pas',
  DirectSound in 'Win32\WebcamFiles\DirectX\DirectSound.pas',
  DXTypes in 'Win32\WebcamFiles\DirectX\DXTypes.pas';;

type
  TfrmMain = class(TForm)
    imgProfile: TImage;
    btnTakePhoto: TButton;
    btnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

end.
