unit Demo03_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,
  VFrames, ExtDlgs;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    BitBtn_Start: TBitBtn;
    BitBtn_Stop: TBitBtn;
    BitBtn_Properties: TBitBtn;
    BitBtn_StreamProp: TBitBtn;
    CheckBox_Crosshair: TCheckBox;
    CheckBox_Mirror: TCheckBox;
    BitBtn_SaveBMP: TBitBtn;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn_StartClick(Sender: TObject);
    procedure BitBtn_StopClick(Sender: TObject);
    procedure BitBtn_PropertiesClick(Sender: TObject);
    procedure BitBtn_StreamPropClick(Sender: TObject);
    procedure BitBtn_SaveBMPClick(Sender: TObject);
  private
    { Private declarations }
    fActivated  : boolean;
    fVideoImage : TVideoImage;
    fVideoBitmap: TBitmap;
    procedure OnNewVideoFrame(Sender : TObject; Width, Height: integer; DataPtr: pointer);
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
  fVideoBitmap    := TBitmap.create;

  // Create instance of our video image class.
  fVideoImage     := TVideoImage.Create;
  // Tell fVideoImage what routine to call whan a new video-frame has arrived.
  // (This way we control painting by ourselves)
  fVideoImage.OnNewVideoFrame := OnNewVideoFrame;

  Caption := 'Demo03';
end;



procedure TForm1.OnNewVideoFrame(Sender : TObject; Width, Height: integer; DataPtr: pointer);
var
  i, r : integer;
begin
  // Retreive latest video image
  fVideoImage.GetBitmap(fVideoBitmap);

  // Paint a crosshair onto video image
  IF CheckBox_Crosshair.Checked then
    begin
      WITH fVideoBitmap.Canvas DO
        BEGIN
          Brush.Style := bsClear;
          Pen.Width   := 3;
          Pen.Color   := clRed;
          moveto(0, fVideoBitmap.Height div 2);
          lineto(fVideoBitmap.Width, fVideoBitmap.Height div 2);
          moveto(fVideoBitmap.Width div 2, 0);
          lineto(fVideoBitmap.Width div 2, fVideoBitmap.Height);
          FOR i := 1 TO 3 DO
            begin
              r := (fVideoBitmap.Height div 8) *i;
              ellipse(fVideoBitmap.Width div 2 -r, fVideoBitmap.Height div 2 -r,
                      fVideoBitmap.Width div 2 +r, fVideoBitmap.Height div 2 +r);
            end;
        END;
    end;

  // Paint image onto screen, either normally or flipped.  
  IF CheckBox_Mirror.Checked
    then Paintbox1.Canvas.CopyRect(Rect(0, 0, fVideoBitmap.Width, fVideoBitmap.height),
                                   fVideoBitmap.Canvas,
                                   Rect(fVideoBitmap.Width-1, 0, 0, fVideoBitmap.height))
    else Paintbox1.Canvas.Draw(0, 0, fVideoBitmap);
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
      Caption := 'Demo03  [No video device found]';
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
  BitBtn_Properties.Enabled := true;
  BitBtn_StreamProp.Enabled := true;
  BitBtn_SaveBMP.Enabled := true;
  Screen.Cursor := crDefault;
end;


procedure TForm1.BitBtn_StopClick(Sender: TObject);
begin
  FVideoImage.VideoStop;
  BitBtn_Start.Enabled := true;
  BitBtn_Stop.Enabled  := false;
  BitBtn_Properties.Enabled := false;
  BitBtn_StreamProp.Enabled := false;
  BitBtn_SaveBMP.Enabled := false;
end;


procedure TForm1.BitBtn_PropertiesClick(Sender: TObject);
begin
  FVideoImage.ShowProperty;
end;


procedure TForm1.BitBtn_StreamPropClick(Sender: TObject);
begin
  FVideoImage.ShowProperty_Stream;
end;

procedure TForm1.BitBtn_SaveBMPClick(Sender: TObject);
VAR
  BMP : TBitmap;
begin
  BMP := TBitmap.Create;
  BMP.Assign(fVideoBitmap);
  IF SavePictureDialog1.Execute then
    begin
      try
        // Will not save the flipping. Sorry, I'm a lazy guy...
        BMP.SaveToFile(SavePictureDialog1.FileName);
      except
        MessageDlg('Could not save file ' + SavePictureDialog1.FileName + '!', mterror, [mbOK], 0);
      end;
    end;
  BMP.Free;
end;

end.
