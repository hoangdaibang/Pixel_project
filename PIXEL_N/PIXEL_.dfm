object Form1: TForm1
  Left = 2
  Top = 1
  Width = 798
  Height = 570
  VertScrollBar.Position = 351
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = -351
    Width = 1920
    Height = 1080
    ActivePage = TabSheet1
    DragMode = dmAutomatic
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Image1: TImage
        Left = 8
        Top = 8
        Width = 1920
        Height = 1080
        AutoSize = True
      end
      object Button1: TButton
        Left = 816
        Top = 8
        Width = 67
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 4
    Top = 552
  end
end
