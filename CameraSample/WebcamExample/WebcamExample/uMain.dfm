object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Webcam Example - Counterstrikewi'
  ClientHeight = 448
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 35
    Width = 494
    Height = 385
    Stretch = True
  end
  object Label1: TLabel
    Left = 8
    Top = 426
    Width = 201
    Height = 13
    Caption = 'Big thanks to Slayer; Schwarze Sonne Rat'
  end
  object Label2: TLabel
    Left = 420
    Top = 426
    Width = 85
    Height = 13
    Caption = 'www.delphi.co.nr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 330
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'Select a webcam driver'
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 425
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 472
    Top = 40
  end
end
