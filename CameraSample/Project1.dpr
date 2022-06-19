program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uWebCam in 'uWebCam.pas' {frmWebCam};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmWebCam, frmWebCam);
  Application.Run;
end.
