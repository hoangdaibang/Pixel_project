object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'PIXEL_N'
  ClientHeight = 567
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = -1
    Top = 0
    Width = 850
    Height = 569
    ActivePage = TabSheet5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Image 1'
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 619
        Height = 539
        Align = alClient
        AutoSize = True
        Enabled = False
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
        OnMouseUp = Image1MouseUp
        ExplicitWidth = 545
        ExplicitHeight = 523
      end
      object Panelcontrol1: TPanel
        Left = 619
        Top = 0
        Width = 223
        Height = 539
        Align = alRight
        TabOrder = 0
        object LabelMouselocal1: TLabel
          Left = 1
          Top = 25
          Width = 221
          Height = 17
          Align = alTop
          Caption = 'Mouse local :'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 76
        end
        object RedIntensity1: TLabel
          Left = 1
          Top = 42
          Width = 221
          Height = 17
          Align = alTop
          Caption = 'Red : '
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 32
        end
        object GreenIntensity1: TLabel
          Left = 1
          Top = 59
          Width = 221
          Height = 17
          Align = alTop
          Caption = 'Green :'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 41
        end
        object BlueIntensity1: TLabel
          Left = 1
          Top = 76
          Width = 221
          Height = 17
          Align = alTop
          Caption = 'Blue :'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 32
        end
        object Intensity1: TLabel
          Left = 1
          Top = 93
          Width = 221
          Height = 17
          Align = alTop
          Caption = 'Intensity : '
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 60
        end
        object ButtonLoadImage1: TButton
          Left = 1
          Top = 1
          Width = 221
          Height = 24
          Align = alTop
          Caption = 'Load Image 1...'
          TabOrder = 0
          OnClick = ButtonLoadImage1Click
        end
        object Panel5: TPanel
          Left = 1
          Top = 110
          Width = 221
          Height = 155
          Align = alTop
          TabOrder = 1
          object Label2: TLabel
            Left = 30
            Top = 19
            Width = 19
            Height = 17
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
          object LabelY11: TLabel
            Left = 128
            Top = 19
            Width = 19
            Height = 17
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
          object LabelX21: TLabel
            Left = 30
            Top = 71
            Width = 19
            Height = 17
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
          object LabelY21: TLabel
            Left = 128
            Top = 71
            Width = 19
            Height = 17
            BiDiMode = bdRightToLeft
            Caption = ':Y2'
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
          object LabelSelectPixel1: TLabel
            Left = 1
            Top = 1
            Width = 219
            Height = 17
            Align = alTop
            Caption = 'Select Pixel :'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Book Antiqua'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 71
          end
          object EditX11: TEdit
            Left = 25
            Top = 42
            Width = 81
            Height = 23
            Color = clWhite
            TabOrder = 0
            Text = '100'
          end
          object EditY11: TEdit
            Left = 120
            Top = 42
            Width = 81
            Height = 23
            TabOrder = 1
            Text = '100'
          end
          object EditX21: TEdit
            Left = 25
            Top = 94
            Width = 81
            Height = 23
            TabOrder = 2
            Text = '200'
          end
          object ButtonSelectMatrix1: TButton
            Left = 1
            Top = 131
            Width = 219
            Height = 23
            Align = alBottom
            Caption = 'Select'
            TabOrder = 3
            OnClick = ButtonSelectMatrix1Click
          end
          object EditY21: TEdit
            Left = 120
            Top = 94
            Width = 81
            Height = 23
            TabOrder = 4
            Text = '200'
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Image 2'
      ImageIndex = 2
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 609
        Height = 539
        Align = alClient
        AutoSize = True
        Enabled = False
        OnMouseDown = Image2MouseDown
        OnMouseMove = Image2MouseMove
        OnMouseUp = Image2MouseDown
        ExplicitWidth = 561
        ExplicitHeight = 473
      end
      object Panelcontrol2: TPanel
        Left = 609
        Top = 0
        Width = 233
        Height = 539
        Align = alRight
        TabOrder = 0
        ExplicitLeft = 615
        object LabelMouselocal2: TLabel
          Left = 1
          Top = 26
          Width = 231
          Height = 17
          Align = alTop
          Caption = 'Mouse local :'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 76
        end
        object RedIntensity2: TLabel
          Left = 1
          Top = 43
          Width = 231
          Height = 17
          Align = alTop
          Caption = 'Red : '
          Color = clRed
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 32
        end
        object GreenIntensity2: TLabel
          Left = 1
          Top = 60
          Width = 231
          Height = 17
          Align = alTop
          Caption = 'Green :'
          Color = clGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 41
        end
        object BlueIntensity2: TLabel
          Left = 1
          Top = 77
          Width = 231
          Height = 17
          Align = alTop
          Caption = 'Blue :'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 32
        end
        object Intensity2: TLabel
          Left = 1
          Top = 94
          Width = 231
          Height = 17
          Align = alTop
          Caption = 'Intensity : '
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 60
        end
        object ButtonLoadImage2: TButton
          Left = 1
          Top = 1
          Width = 231
          Height = 25
          Align = alTop
          Caption = 'Load Image 2...'
          TabOrder = 0
          OnClick = ButtonLoadImage2Click
        end
        object Panel6: TPanel
          Left = 1
          Top = 111
          Width = 231
          Height = 162
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 30
            Top = 27
            Width = 19
            Height = 17
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
          object LabelY12: TLabel
            Left = 128
            Top = 27
            Width = 19
            Height = 17
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
          object LabelX22: TLabel
            Left = 30
            Top = 79
            Width = 19
            Height = 17
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
          object LabelY22: TLabel
            Left = 128
            Top = 79
            Width = 19
            Height = 17
            BiDiMode = bdRightToLeft
            Caption = ':Y2'
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
          object LabelSelectPixel2: TLabel
            Left = 1
            Top = 1
            Width = 229
            Height = 17
            Align = alTop
            Caption = 'Select Pixel :'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Book Antiqua'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 71
          end
          object EditX12: TEdit
            Left = 25
            Top = 50
            Width = 81
            Height = 23
            Color = clWhite
            TabOrder = 0
            Text = '100'
          end
          object EditY12: TEdit
            Left = 120
            Top = 50
            Width = 81
            Height = 23
            TabOrder = 1
            Text = '100'
          end
          object EditX22: TEdit
            Left = 25
            Top = 102
            Width = 81
            Height = 23
            TabOrder = 2
            Text = '200'
          end
          object ButtonSelectMatrix2: TButton
            Left = 1
            Top = 138
            Width = 229
            Height = 23
            Align = alBottom
            Caption = 'Select'
            TabOrder = 3
            OnClick = ButtonSelectMatrix2Click
          end
          object EditY22: TEdit
            Left = 120
            Top = 102
            Width = 81
            Height = 23
            TabOrder = 4
            Text = '200'
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Data'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 401
        Height = 509
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
        TabOrder = 0
        ExplicitHeight = 503
      end
      object Memo2: TMemo
        Left = 425
        Top = 0
        Width = 417
        Height = 509
        Align = alRight
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
        ExplicitHeight = 503
      end
      object PanelSave1: TPanel
        Left = 0
        Top = 509
        Width = 842
        Height = 30
        Align = alBottom
        TabOrder = 2
        object ButtonSave1: TButton
          Left = 691
          Top = 1
          Width = 75
          Height = 28
          Align = alRight
          Caption = 'Save...'
          TabOrder = 0
          OnClick = ButtonSave1Click
          ExplicitHeight = 34
        end
        object ButtonClear1: TButton
          Left = 766
          Top = 1
          Width = 75
          Height = 28
          Align = alRight
          Caption = 'Clear'
          TabOrder = 1
          OnClick = ButtonClear1Click
          ExplicitHeight = 34
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
      object SLScope1: TSLScope
        Left = 0
        Top = 0
        Width = 842
        Height = 509
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
            Name = 'Red 1'
          end
          item
            Name = 'Green 1'
          end
          item
            Name = 'Blue 1'
          end
          item
            Name = 'Intensity 1'
          end
          item
            Name = 'Red 2'
            Color = clMaroon
          end
          item
            Name = 'Green 2'
            Color = clGreen
          end
          item
            Name = 'Blue 2'
            Color = clNavy
          end
          item
            Name = 'Intensity 2'
          end>
        ExplicitHeight = 503
      end
      object PanelSave2: TPanel
        Left = 0
        Top = 509
        Width = 842
        Height = 30
        Align = alBottom
        TabOrder = 1
        object ButtonSave2: TButton
          Left = 691
          Top = 1
          Width = 75
          Height = 28
          Align = alRight
          Caption = 'Save...'
          TabOrder = 0
          OnClick = ButtonSave1Click
          ExplicitHeight = 34
        end
        object ButtonClear2: TButton
          Left = 766
          Top = 1
          Width = 75
          Height = 28
          Align = alRight
          Caption = 'Clear'
          TabOrder = 1
          OnClick = ButtonClear1Click
          ExplicitHeight = 34
        end
        object ButtonShow: TButton
          Left = 502
          Top = 1
          Width = 75
          Height = 28
          Align = alLeft
          Caption = 'Show'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = ButtonShowClick
          ExplicitLeft = 317
          ExplicitHeight = 65
        end
        object Intensity1CheckBox: TCheckBox
          Left = 164
          Top = 1
          Width = 73
          Height = 28
          Align = alLeft
          Caption = 'Intensity'
          Checked = True
          State = cbChecked
          TabOrder = 3
          ExplicitHeight = 34
        end
        object Blue1CheckBox: TCheckBox
          Left = 107
          Top = 1
          Width = 57
          Height = 28
          Align = alLeft
          Caption = 'Blue'
          Checked = True
          State = cbChecked
          TabOrder = 4
          ExplicitHeight = 34
        end
        object Red1CheckBox: TCheckBox
          Left = 1
          Top = 1
          Width = 49
          Height = 28
          Align = alLeft
          Caption = 'Red '
          Checked = True
          State = cbChecked
          TabOrder = 5
          ExplicitHeight = 34
        end
        object Green1CheckBox: TCheckBox
          Left = 50
          Top = 1
          Width = 57
          Height = 28
          Align = alLeft
          Caption = 'Green'
          Checked = True
          State = cbChecked
          TabOrder = 6
          ExplicitHeight = 34
        end
        object Red2CheckBox: TCheckBox
          Left = 237
          Top = 1
          Width = 57
          Height = 28
          Align = alLeft
          Caption = 'Red 2'
          Checked = True
          State = cbChecked
          TabOrder = 7
          ExplicitLeft = 312
          ExplicitHeight = 65
        end
        object Green2CheckBox: TCheckBox
          Left = 294
          Top = 1
          Width = 65
          Height = 28
          Align = alLeft
          Caption = 'Green 2'
          Checked = True
          State = cbChecked
          TabOrder = 8
          ExplicitLeft = 528
          ExplicitTop = 32
          ExplicitHeight = 17
        end
        object Blue2CheckBox: TCheckBox
          Left = 359
          Top = 1
          Width = 63
          Height = 28
          Align = alLeft
          Caption = 'Blue 2'
          Checked = True
          State = cbChecked
          TabOrder = 9
          ExplicitLeft = 434
          ExplicitHeight = 65
        end
        object Intensity2CheckBox: TCheckBox
          Left = 422
          Top = 1
          Width = 80
          Height = 28
          Align = alLeft
          Caption = 'Intensity 2'
          Checked = True
          State = cbChecked
          TabOrder = 10
          ExplicitLeft = 481
          ExplicitHeight = 65
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 40
    Top = 576
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 232
    Top = 576
  end
  object SaveDialog1: TSaveDialog
    Left = 416
    Top = 576
  end
  object OpenPictureDialog2: TOpenPictureDialog
    Left = 136
    Top = 576
  end
  object SaveDialog2: TSaveDialog
    Left = 480
    Top = 576
  end
  object SavePictureDialog2: TSavePictureDialog
    Left = 328
    Top = 576
  end
end
