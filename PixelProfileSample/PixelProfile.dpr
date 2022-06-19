// Pixel Profile
// efg, September 1998
// www.efg2.com/lab

program PixelProfile;

uses
  Forms,
  ScreenPixelProfile in 'ScreenPixelProfile.pas' {FormPixelProfile},
  LineLibrary in 'LineLibrary.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormPixelProfile, FormPixelProfile);
  Application.Run;
end.
