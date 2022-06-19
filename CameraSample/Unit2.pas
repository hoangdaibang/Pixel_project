unit uWebCam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmWebCam = class(TForm)
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
  frmWebCam: TfrmWebCam;

implementation

{$R *.dfm}

end.
