unit Demo02_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  VFrames, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    BitBtn_Start: TBitBtn;
    BitBtn_Stop: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn_StartClick(Sender: TObject);
    procedure BitBtn_StopClick(Sender: TObject);
  private
    { Private declarations }
    fActivated  : boolean;
    fVideoImage : TVideoImage;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  PaintBox1.Align := alClient;
  fActivated      := false;

  // Create instance of our video image class.
  fVideoImage     := TVideoImage.Create;
  // Tell fVideoImage where to paint the images it receives from the camera
  // (Only in case we do not want to modify the images by ourselves)
  fVideoImage.SetDisplayCanvas(PaintBox1.Canvas);

  Caption := 'Demo02';
end;



procedure TForm1.FormActivate(Sender: TObject);
var
  DeviceList : TStringList;
begin
  IF fActivated then
    exit;
  fActivated := true;


  // Get list of available cameras
  DeviceList := TStringList.Create;
  fVideoImage.GetListOfDevices(DeviceList);

  IF DeviceList.Count < 1 then
    begin
      // If no camera has been found, terminate program
      Caption := 'Demo02  [No video device found]';
      MessageDlg('No video device found.'#10'Application will terminate.', mtError, [mbOK], 0);
      Application.Terminate;
      exit;
    end
    else begin
      // If at least one camera has been found.
      Combobox1.items.Assign(DeviceList);
      Combobox1.ItemIndex := 0;
      BitBtn_Start.Enabled := true;
    end;
end;

procedure TForm1.BitBtn_StartClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  BitBtn_Start.Enabled := false;
  Application.ProcessMessages;

  fVideoImage.VideoStart(ComboBox1.Items[ComboBox1.itemindex]);

  BitBtn_Stop.Enabled  := true;
  Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn_StopClick(Sender: TObject);
begin
  FVideoImage.VideoStop;
  BitBtn_Start.Enabled := true;
  BitBtn_Stop.Enabled  := false;
end;

end.
