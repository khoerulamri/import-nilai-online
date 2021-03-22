object Flogin: TFlogin
  Left = 404
  Top = 220
  BorderStyle = bsDialog
  Caption = 'Login...'
  ClientHeight = 64
  ClientWidth = 256
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
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Username '
  end
  object lbl2: TLabel
    Left = 8
    Top = 40
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object edt1: TEdit
    Left = 64
    Top = 8
    Width = 177
    Height = 21
    TabOrder = 0
    OnKeyPress = edt1KeyPress
  end
  object edt2: TEdit
    Left = 64
    Top = 32
    Width = 177
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edt2KeyPress
  end
end
