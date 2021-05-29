object BrowCompare: TBrowCompare
  Left = 192
  Top = 125
  Width = 870
  Height = 500
  Caption = 'Compare'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgOld: TDBGrid
    Left = 13
    Top = 40
    Width = 796
    Height = 401
    DataSource = dsDRDet
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dtStart: TDateTimePicker
    Left = 16
    Top = 8
    Width = 90
    Height = 21
    Date = 43466.510017731480000000
    Time = 43466.510017731480000000
    TabOrder = 1
  end
  object dtEnd: TDateTimePicker
    Left = 112
    Top = 8
    Width = 90
    Height = 21
    Date = 43830.510068217590000000
    Time = 43830.510068217590000000
    TabOrder = 2
  end
  object btnDR: TButton
    Left = 216
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Comp Det and Header'
    TabOrder = 3
    OnClick = btnDRClick
  end
  object Button1: TButton
    Left = 368
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Set tax 0 for null'
    TabOrder = 4
    OnClick = Button1Click
  end
  object dsDRDet: TDataSource
    DataSet = qryDRDet
    Left = 96
    Top = 160
  end
  object qryDRDet: TQuery
    DatabaseName = 'ARDB'
    Left = 120
    Top = 160
  end
  object tNew: TTable
    DatabaseName = 'ARDB'
    TableName = 'SALEDET.DB'
    Left = 248
    Top = 296
  end
end
