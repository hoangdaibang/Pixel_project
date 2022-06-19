object Form1: TForm1
  Left = 846
  Top = 301
  Width = 339
  Height = 325
  Caption = 'WebCam'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'OpenVideo'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'CloseVideo'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 48
    Width = 320
    Height = 240
    TabOrder = 2
  end
  object Button3: TButton
    Left = 168
    Top = 16
    Width = 75
    Height = 25
    Caption = 'About'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 16
    Top = 248
  end
end
