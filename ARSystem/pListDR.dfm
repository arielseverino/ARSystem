object ListDR: TListDR
  Left = 192
  Top = 125
  Width = 891
  Height = 457
  Caption = 'List DR'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dtStart: TDateTimePicker
    Left = 16
    Top = 8
    Width = 90
    Height = 21
    Date = 43466.510017731480000000
    Time = 43466.510017731480000000
    TabOrder = 0
  end
  object dtEnd: TDateTimePicker
    Left = 112
    Top = 8
    Width = 90
    Height = 21
    Date = 43830.510068217590000000
    Time = 43830.510068217590000000
    TabOrder = 1
  end
  object dbgOld: TDBGrid
    Left = 13
    Top = 40
    Width = 857
    Height = 177
    DataSource = dsDRHd
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgOldDblClick
  end
  object btnDR: TButton
    Left = 216
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 3
    OnClick = btnDRClick
  end
  object DBGrid1: TDBGrid
    Left = 13
    Top = 232
    Width = 857
    Height = 177
    DataSource = dsDRDet
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsDRHd: TDataSource
    DataSet = qryDRHd
    Left = 96
    Top = 160
  end
  object qryDRHd: TQuery
    DatabaseName = 'ARDB'
    Left = 120
    Top = 160
  end
  object dsDRDet: TDataSource
    DataSet = qryDRDet
    Left = 104
    Top = 296
  end
  object qryDRDet: TQuery
    DatabaseName = 'ARDB'
    Left = 144
    Top = 296
  end
end
