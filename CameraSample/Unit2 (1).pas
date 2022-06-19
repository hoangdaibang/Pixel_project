unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,VFrames,
  VSample in 'Win32\WebcamFiles\VSample.pas',
  Direct3D9 in 'Win32\WebcamFiles\DirectX\Direct3D9.pas',
  DirectDraw in 'Win32\WebcamFiles\DirectX\DirectDraw.pas',
  DirectShow9 in 'Win32\WebcamFiles\DirectX\DirectShow9.pas',
  DirectSound in 'Win32\WebcamFiles\DirectX\DirectSound.pas',
  DXTypes in 'Win32\WebcamFiles\DirectX\DXTypes.pas';

type
  Tfrm = class(TForm)
    PnlLeft: TPanel;
    PnlRight: TPanel;
    pbCamera: TPaintBox;
    btnTake: TButton;
    imgSnapshot: TImage;
    btnSave: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm: Tfrm;

implementation

{$R *.dfm}

end.
