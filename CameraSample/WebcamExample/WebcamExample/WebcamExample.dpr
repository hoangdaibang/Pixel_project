program WebcamExample;

uses
  Forms,
  uMain in 'uMain.pas' {FormMain},
  uWebcam in 'uWebcam.pas',
  uFunctions in 'uFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
