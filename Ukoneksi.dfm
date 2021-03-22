object Fkoneksi: TFkoneksi
  Left = 268
  Top = 181
  BorderStyle = bsSingle
  Caption = 'Koneksi'
  ClientHeight = 161
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 145
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Server'
    end
    object lbl2: TLabel
      Left = 8
      Top = 40
      Width = 48
      Height = 13
      Caption = 'Username'
    end
    object lbl3: TLabel
      Left = 8
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object lbl4: TLabel
      Left = 8
      Top = 88
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object edttxtser: TEdit
      Left = 88
      Top = 16
      Width = 200
      Height = 21
      TabOrder = 0
    end
    object edttxtuser: TEdit
      Left = 88
      Top = 40
      Width = 200
      Height = 21
      TabOrder = 1
    end
    object edttxtpass: TEdit
      Left = 88
      Top = 64
      Width = 200
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object edttxtdb: TEdit
      Left = 88
      Top = 88
      Width = 200
      Height = 21
      TabOrder = 3
    end
    object btn1: TButton
      Left = 136
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 4
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 216
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Tutup'
      TabOrder = 5
      OnClick = btn2Click
    end
  end
end
