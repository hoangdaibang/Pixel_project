object frm: Tfrm
  Left = 0
  Top = 0
  Caption = 'frmWedCam'
  ClientHeight = 181
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 240
    Height = 181
    Align = alClient
    TabOrder = 0
    object pbCamera: TPaintBox
      Left = 1
      Top = 1
      Width = 238
      Height = 154
      Align = alClient
      ExplicitWidth = 205
    end
    object btnTake: TButton
      Left = 1
      Top = 155
      Width = 238
      Height = 25
      Align = alBottom
      Caption = 'Take a Picture'
      TabOrder = 0
    end
  end
  object PnlRight: TPanel
    Left = 240
    Top = 0
    Width = 256
    Height = 181
    Align = alRight
    TabOrder = 1
    object imgSnapshot: TImage
      Left = 1
      Top = 1
      Width = 254
      Height = 154
      Align = alClient
      ExplicitHeight = 220
    end
    object btnSave: TButton
      Left = 1
      Top = 155
      Width = 254
      Height = 25
      Align = alBottom
      Caption = 'Save the Picture'
      TabOrder = 0
    end
  end
end
