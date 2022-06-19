program Demo01;

uses
  Forms,
  Demo01_MainForm in 'Demo01_MainForm.pas' {Form1},
  Direct3D9 in '..\Common\DirectX\Direct3D9.pas',
  DirectDraw in '..\Common\DirectX\DirectDraw.pas',
  DirectShow9 in '..\Common\DirectX\DirectShow9.pas',
  DirectSound in '..\Common\DirectX\DirectSound.pas',
  DXTypes in '..\Common\DirectX\DXTypes.pas',
  VFrames in '..\Common\VFrames.pas',
  VSample in '..\Common\VSample.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
