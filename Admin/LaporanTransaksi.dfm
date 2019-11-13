object Form9: TForm9
  Left = 247
  Top = 118
  Width = 727
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Laporan Transaksi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 232
    Top = 24
    Width = 245
    Height = 32
    Caption = 'Laporan Transaksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 488
    Width = 129
    Height = 16
    Caption = 'Total Barang Terjual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 508
    Width = 112
    Height = 16
    Caption = 'Total Keuntungan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 528
    Width = 223
    Height = 16
    Caption = 'Jumlah Barang yang Dikembalikan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 256
    Top = 488
    Width = 7
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 256
    Top = 508
    Width = 7
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 256
    Top = 528
    Width = 7
    Height = 16
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 120
    Width = 680
    Height = 353
    ColCount = 7
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 0
    OnSelectCell = StringGrid1SelectCell
  end
  object Edit1: TEdit
    Left = 120
    Top = 72
    Width = 297
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object DateTimePicker1: TDateTimePicker
    Left = 120
    Top = 72
    Width = 297
    Height = 31
    Date = 42708.793992662040000000
    Time = 42708.793992662040000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object ComboBox1: TComboBox
    Left = 424
    Top = 72
    Width = 161
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 23
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'Nama Barang'
    OnChange = ComboBox1Change
    Items.Strings = (
      'Nama Barang'
      'Kode Transaksi'
      'Waktu')
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Transaksi')
    Left = 8
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 48
    object Return1: TMenuItem
      Caption = 'Return'
      OnClick = Return1Click
    end
    object ReturnSemua1: TMenuItem
      Caption = 'Return Semua'
      OnClick = ReturnSemua1Click
    end
  end
end
