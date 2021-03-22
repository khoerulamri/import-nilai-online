object Futama: TFutama
  Left = 324
  Top = 79
  BorderStyle = bsSingle
  Caption = 'Menu Utama'
  ClientHeight = 453
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 369
    Height = 313
    Caption = 'z'
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 24
      Width = 64
      Height = 13
      Caption = 'Tahun Ajaran'
    end
    object lbl2: TLabel
      Left = 8
      Top = 48
      Width = 44
      Height = 13
      Caption = 'Semester'
    end
    object lbl3: TLabel
      Left = 8
      Top = 128
      Width = 53
      Height = 13
      Caption = 'Total Data '
    end
    object spl1: TSplitter
      Left = 2
      Top = 15
      Height = 296
    end
    object btn1: TBitBtn
      Left = 152
      Top = 16
      Width = 201
      Height = 113
      Caption = 'Tampilan Data Semuanya '
      TabOrder = 3
      OnClick = btn1Click
    end
    object edt1: TEdit
      Left = 80
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 1
      OnKeyPress = edt1KeyPress
    end
    object dbgrd1: TDBGrid
      Left = 8
      Top = 144
      Width = 345
      Height = 161
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object medtTaSiswa: TMaskEdit
      Left = 80
      Top = 16
      Width = 65
      Height = 21
      EditMask = '9999/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 0
      Text = '    /    '
      OnKeyPress = medtTaSiswaKeyPress
    end
    object rg1: TRadioGroup
      Left = 8
      Top = 64
      Width = 137
      Height = 65
      Items.Strings = (
        'UTS'
        'FINAL')
      TabOrder = 2
    end
  end
  object grp2: TGroupBox
    Left = 0
    Top = 312
    Width = 369
    Height = 137
    TabOrder = 1
    object lbl6: TLabel
      Left = 156
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Proses Data'
    end
    object spl2: TSplitter
      Left = 2
      Top = 15
      Height = 120
    end
    object lbl7: TLabel
      Left = 159
      Top = 118
      Width = 50
      Height = 13
      Caption = 'Total Data'
    end
    object btn2: TBitBtn
      Left = 12
      Top = 13
      Width = 345
      Height = 41
      Caption = 'Import'
      TabOrder = 0
      OnClick = btn2Click
    end
    object pb1: TProgressBar
      Left = 8
      Top = 72
      Width = 353
      Height = 41
      TabOrder = 1
    end
  end
end
