unit Demo01_MainForm;


interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  VFrames;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fActivated : boolean;
    fVideoImage: TVideoImage;
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

  Caption := 'Demo01  [Initializing video...]';
end;




procedure TForm1.FormActivate(Sender: TObject);
var
  DeviceList: TStringList;
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
      Caption := 'Demo01  [No video device found]';
      MessageDlg('No video device found.'#10'Application will terminate.', mtError, [mbOK], 0);
      Application.Terminate;
      exit;
    end
    else begin
      // If at least one camera has been found, initialize first camera within the list
      fVideoImage.VideoStart(DeviceList[0]);
      Caption := 'Demo01  ['+DeviceList[0]+']';
    end;
end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fVideoImage.VideoStop;
end;

end.
