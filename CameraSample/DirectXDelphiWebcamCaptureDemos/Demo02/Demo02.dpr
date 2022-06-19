program Demo02;

uses
  Forms,
  Demo02_MainForm in 'Demo02_MainForm.pas' {Form1},
  VFrames in '..\Common\VFrames.pas',
  VSample in '..\Common\VSample.pas',
  Direct3D9 in '..\Common\DirectX\Direct3D9.pas',
  DirectDraw in '..\Common\DirectX\DirectDraw.pas',
  DirectShow9 in '..\Common\DirectX\DirectShow9.pas',
  DirectSound in '..\Common\DirectX\DirectSound.pas',
  DXTypes in '..\Common\DirectX\DXTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
