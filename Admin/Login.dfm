object Form8: TForm8
  Left = 216
  Top = 136
  Width = 333
  Height = 264
  BorderIcons = []
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 72
    Width = 59
    Height = 16
    Caption = 'Username'
  end
  object Label2: TLabel
    Left = 40
    Top = 120
    Width = 57
    Height = 16
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 128
    Top = 16
    Width = 76
    Height = 32
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 24
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 144
    Top = 120
    Width = 121
    Height = 24
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 64
    Top = 176
    Width = 81
    Height = 33
    Caption = 'Login'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 176
    Width = 81
    Height = 33
    Caption = 'Keluar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM DataToko WHERE ID=1')
  end
end
