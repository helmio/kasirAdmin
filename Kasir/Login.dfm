object Form2: TForm2
  Left = 447
  Top = 142
  Width = 303
  Height = 236
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
    Left = 96
    Top = 16
    Width = 87
    Height = 32
    Caption = 'LOGIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 66
    Width = 59
    Height = 16
    Caption = 'Username'
  end
  object Label3: TLabel
    Left = 32
    Top = 108
    Width = 57
    Height = 16
    Caption = 'Password'
  end
  object Edit1: TEdit
    Left = 120
    Top = 64
    Width = 121
    Height = 24
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 120
    Top = 104
    Width = 121
    Height = 24
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 56
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 152
    Width = 75
    Height = 25
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
      'select * from DataKaryawan')
  end
end
