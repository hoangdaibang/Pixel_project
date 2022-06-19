program pixel;

uses
  Forms,
  Unit2 in '..\EDITTING\FIXPIXELPJ\Unit2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
