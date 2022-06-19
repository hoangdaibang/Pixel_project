object Form1: TForm1
  Left = 167
  Top = 95
  Caption = 'PIXEL_N'
  ClientHeight = 569
  ClientWidth = 850
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
    Left = -1
    Top = 0
    Width = 826
    Height = 553
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Image 1'
      ExplicitLeft = 8
      ExplicitTop = 29
      ExplicitWidth = 817
      ExplicitHeight = 508
      object Image1: TImage
        Left = 3
        Top = 3
        Width = 625
        Height = 500
        AutoSize = True
        Enabled = False
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
      end
      object LabelMouselocal1: TLabel
        Left = 648
        Top = 31
        Width = 78
        Height = 16
        Caption = 'Mouse local :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object RedIntensity: TLabel
        Left = 647
        Top = 53
        Width = 35
        Height = 16
        Caption = 'Red : '
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object GreenIntensity1: TLabel
        Left = 648
        Top = 75
        Width = 43
        Height = 16
        Caption = 'Green :'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object BlueIntensity1: TLabel
        Left = 648
        Top = 97
        Width = 34
        Height = 16
        Caption = 'Blue :'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LabelX11: TLabel
        Left = 645
        Top = 141
        Width = 18
        Height = 16
        BiDiMode = bdRightToLeft
        Caption = ':X1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 645
        Top = 191
        Width = 18
        Height = 16
        Caption = 'X2:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Intensity1: TLabel
        Left = 648
        Top = 119
        Width = 61
        Height = 16
        Caption = 'Intensity : '
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 732
        Top = 141
        Width = 20
        Height = 16
        BiDiMode = bdRightToLeft
        Caption = ':Y1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 732
        Top = 191
        Width = 20
        Height = 16
        BiDiMode = bdRightToLeft
        Caption = ':Y1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Button1: TButton
        Left = 648
        Top = 0
        Width = 81
        Height = 25
        Caption = 'Load Image 1...'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 645
        Top = 163
        Width = 81
        Height = 22
        Color = clWhite
        TabOrder = 1
        Text = '100'
      end
      object Edit2: TEdit
        Left = 732
        Top = 163
        Width = 81
        Height = 22
        TabOrder = 2
        Text = '100'
      end
      object Edit3: TEdit
        Left = 645
        Top = 213
        Width = 81
        Height = 22
        TabOrder = 3
        Text = '200'
      end
      object Edit4: TEdit
        Left = 732
        Top = 213
        Width = 81
        Height = 22
        TabOrder = 4
        Text = '200'
      end
      object Button2: TButton
        Left = 645
        Top = 241
        Width = 81
        Height = 25
        Caption = 'Select'
        TabOrder = 5
        OnClick = Button2Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Image 2'
      ImageIndex = 2
      ExplicitLeft = 2
      ExplicitWidth = 817
      ExplicitHeight = 508
      object Image2: TImage
        Left = 11
        Top = 8
        Width = 625
        Height = 500
        AutoSize = True
        Enabled = False
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
      end
      object Label10: TLabel
        Left = 656
        Top = 39
        Width = 78
        Height = 16
        Caption = 'Mouse local :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label11: TLabel
        Left = 655
        Top = 61
        Width = 35
        Height = 16
        Caption = 'Red : '
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label12: TLabel
        Left = 656
        Top = 83
        Width = 43
        Height = 16
        Caption = 'Green :'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label13: TLabel
        Left = 656
        Top = 105
        Width = 34
        Height = 16
        Caption = 'Blue :'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 656
        Top = 127
        Width = 61
        Height = 16
        Caption = 'Intensity : '
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 653
        Top = 149
        Width = 18
        Height = 16
        BiDiMode = bdRightToLeft
        Caption = ':X1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 740
        Top = 149
        Width = 20
        Height = 16
        BiDiMode = bdRightToLeft
        Caption = ':Y1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 653
        Top = 199
        Width = 18
        Height = 16
        Caption = 'X2:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label18: TLabel
        Left = 740
        Top = 199
        Width = 20
        Height = 16
        BiDiMode = bdRightToLeft
        Caption = ':Y1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentBiDiMode = False
        ParentColor = False
        ParentFont = False
      end
      object Button8: TButton
        Left = 657
        Top = 8
        Width = 81
        Height = 25
        Caption = 'Load Image 2...'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit5: TEdit
        Left = 653
        Top = 171
        Width = 81
        Height = 22
        Color = clWhite
        TabOrder = 1
        Text = '100'
      end
      object Edit6: TEdit
        Left = 736
        Top = 171
        Width = 81
        Height = 22
        TabOrder = 2
        Text = '100'
      end
      object Edit7: TEdit
        Left = 653
        Top = 221
        Width = 81
        Height = 22
        TabOrder = 3
        Text = '200'
      end
      object Edit8: TEdit
        Left = 736
        Top = 221
        Width = 81
        Height = 22
        TabOrder = 4
        Text = '200'
      end
      object Button9: TButton
        Left = 653
        Top = 249
        Width = 81
        Height = 25
        Caption = 'Select'
        TabOrder = 5
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Data'
      ImageIndex = 1
      ExplicitWidth = 834
      ExplicitHeight = 376
      object Memo1: TMemo
        Left = 417
        Top = 0
        Width = 401
        Height = 488
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Book Antiqua'
        Font.Style = []
        Lines.Strings = (
          
            'X     II     Red     II     Green     II     Blue     II     Int' +
            'ensity')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitLeft = 522
        ExplicitWidth = 225
        ExplicitHeight = 377
      end
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 417
        Height = 488
        Align = alLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Book Antiqua'
        Font.Style = []
        Lines.Strings = (
          
            'X     II     Red     II     Green     II     Blue     II     Int' +
            'ensity')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitHeight = 496
      end
      object Panel2: TPanel
        Left = 0
        Top = 488
        Width = 818
        Height = 36
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 496
        ExplicitWidth = 834
        object Button6: TButton
          Left = 667
          Top = 1
          Width = 75
          Height = 34
          Align = alRight
          Caption = 'Save...'
          TabOrder = 0
          OnClick = Button6Click
          ExplicitLeft = 70
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object Button7: TButton
          Left = 742
          Top = 1
          Width = 75
          Height = 34
          Align = alRight
          Caption = 'Clear'
          TabOrder = 1
          OnClick = Button7Click
          ExplicitLeft = 166
          ExplicitTop = 24
          ExplicitHeight = 25
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Graphs'
      DragMode = dmAutomatic
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      ExplicitLeft = 8
      ExplicitTop = 17
      ExplicitWidth = 834
      ExplicitHeight = 532
      object SLScope1: TSLScope
        Left = 0
        Top = 0
        Width = 818
        Height = 488
        Align = alClient
        Color = clGray
        Title.Text = 'Graphs'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Name = 'Book Antiqua'
        TabOrder = 0
        YAxis.Font.Name = 'Book Antiqua'
        YAxis.Min.Value = -100.000000000000000000
        YAxis.Min.DataValue = -100.000000000000000000
        YAxis.Max.Value = 100.000000000000000000
        YAxis.Max.DataValue = 100.000000000000000000
        YAxis.Max.Range.High.Value = 100.000000000000000000
        YAxis.Max.Range.Low.Value = -100.000000000000000000
        YAxis.AxisLabel.Font.Charset = ANSI_CHARSET
        YAxis.AxisLabel.Font.Name = 'Book Antiqua'
        YAxis.AxisLabel.Font.Style = []
        YAxis.AxisLabel.Text = 'Intensity'
        XAxis.Font.Charset = ANSI_CHARSET
        XAxis.Font.Name = 'Book Antiqua'
        XAxis.Min.AutoScale = False
        XAxis.Max.DataValue = 10000.000000000000000000
        XAxis.Max.Range.High.Value = 100.000000000000000000
        XAxis.AxisLabel.Font.Charset = ANSI_CHARSET
        XAxis.AxisLabel.Font.Name = 'Book Antiqua'
        XAxis.AxisLabel.Font.Style = []
        XAxis.AxisLabel.Text = 'Pixel'
        XAxis.MaxSample.Value = 10000
        Legend.MarkerGroups.Caption.Font.Style = []
        Legend.Cursors.Caption.Font.Style = []
        Legend.CursorLinks.Caption.Font.Style = []
        Legend.Zones.Caption.Font.Style = []
        Legend.Ellipses.Caption.Font.Style = []
        Legend.Labels.Caption.Font.Style = []
        Legend.Channels.Caption.Font.Style = []
        Legend.ChannelLinks.Caption.Font.Style = []
        DataView.Border.Pen.Color = clOlive
        Channels = <
          item
            Name = 'Red'
          end
          item
            Name = 'Green'
          end
          item
            Name = 'Blue'
          end
          item
            Name = 'Intensity'
          end>
        ExplicitTop = 1
        ExplicitWidth = 833
        ExplicitHeight = 288
      end
      object Panel1: TPanel
        Left = 0
        Top = 488
        Width = 818
        Height = 36
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 496
        ExplicitWidth = 834
        object Button4: TButton
          Left = 667
          Top = 1
          Width = 75
          Height = 34
          Align = alRight
          Caption = 'Save...'
          TabOrder = 0
          OnClick = Button4Click
          ExplicitLeft = 669
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object Button5: TButton
          Left = 742
          Top = 1
          Width = 75
          Height = 34
          Align = alRight
          Caption = 'Clear'
          TabOrder = 1
          OnClick = Button5Click
          ExplicitLeft = 750
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object Button3: TButton
          Left = 237
          Top = 1
          Width = 75
          Height = 34
          Align = alLeft
          Caption = 'Show'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button3Click
          ExplicitLeft = 262
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object CheckBox4: TCheckBox
          Left = 164
          Top = 1
          Width = 73
          Height = 34
          Align = alLeft
          Caption = 'Intensity'
          Checked = True
          State = cbChecked
          TabOrder = 3
          ExplicitLeft = 183
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object CheckBox3: TCheckBox
          Left = 107
          Top = 1
          Width = 57
          Height = 34
          Align = alLeft
          Caption = 'Blue'
          Checked = True
          State = cbChecked
          TabOrder = 4
          ExplicitLeft = 120
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object CheckBox1: TCheckBox
          Left = 1
          Top = 1
          Width = 49
          Height = 34
          Align = alLeft
          Caption = 'Red '
          Checked = True
          State = cbChecked
          TabOrder = 5
          ExplicitLeft = 8
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object CheckBox2: TCheckBox
          Left = 50
          Top = 1
          Width = 57
          Height = 34
          Align = alLeft
          Caption = 'Green'
          Checked = True
          State = cbChecked
          TabOrder = 6
          ExplicitLeft = 57
          ExplicitTop = 16
          ExplicitHeight = 17
        end
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 4
    Top = 576
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 40
    Top = 576
  end
  object SaveDialog1: TSaveDialog
    Left = 72
    Top = 576
  end
end
