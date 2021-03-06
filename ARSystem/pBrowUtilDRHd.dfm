object BrowUtilDRHd: TBrowUtilDRHd
  Left = 192
  Top = 124
  Width = 928
  Height = 480
  Caption = 'AR Utility'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Start'
  end
  object Label2: TLabel
    Left = 152
    Top = 8
    Width = 19
    Height = 13
    Caption = 'End'
  end
  object lblCtr: TLabel
    Left = 16
    Top = 424
    Width = 6
    Height = 13
    Caption = '0'
  end
  object dbgOld: TDBGrid
    Left = 16
    Top = 72
    Width = 857
    Height = 345
    DataSource = dsTranDR
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 280
    Top = 8
    Width = 150
    Height = 25
    Caption = 'List Header With No A'
    TabOrder = 1
    OnClick = Button1Click
  end
  object dtStart: TDateTimePicker
    Left = 48
    Top = 8
    Width = 90
    Height = 21
    Date = 43522.510017731480000000
    Time = 43522.510017731480000000
    TabOrder = 2
  end
  object dtEnd: TDateTimePicker
    Left = 176
    Top = 8
    Width = 90
    Height = 21
    Date = 43522.510068217590000000
    Time = 43522.510068217590000000
    TabOrder = 3
  end
  object Button2: TButton
    Left = 440
    Top = 8
    Width = 160
    Height = 25
    Caption = 'Add A to SI and DR (Current)'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 608
    Top = 8
    Width = 160
    Height = 25
    Caption = 'Add A to SI and DR (Alll)'
    TabOrder = 5
    OnClick = Button3Click
  end
  object cbDetail: TCheckBox
    Left = 800
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Detail Only'
    TabOrder = 6
  end
  object Button4: TButton
    Left = 440
    Top = 40
    Width = 161
    Height = 25
    Caption = 'Add A to Detail only'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 280
    Top = 40
    Width = 150
    Height = 25
    Caption = 'List Detail With No Header'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 24
    Top = 40
    Width = 241
    Height = 25
    Caption = 'Correct DR Detail with A in SI'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 608
    Top = 40
    Width = 161
    Height = 25
    Caption = 'Change small a to capital'
    TabOrder = 10
    OnClick = Button7Click
  end
  object dsTranDR: TDataSource
    DataSet = qryTranDR
    Left = 72
    Top = 144
  end
  object qryTranDR: TQuery
    DatabaseName = 'ARDB'
    Left = 96
    Top = 144
  end
  object tTranDR: TTable
    DatabaseName = 'ARDB'
    TableName = 'TranDR.db'
    Left = 104
    Top = 216
  end
  object tHd: TTable
    DatabaseName = 'ARDB'
    TableName = 'Salehd.DB'
    Left = 104
    Top = 280
  end
  object dsHead: TDataSource
    DataSet = tHd
    Left = 80
    Top = 280
  end
  object dsDet: TDataSource
    DataSet = tDet
    Left = 88
    Top = 344
  end
  object tDet: TTable
    DatabaseName = 'ARDB'
    TableName = 'SALEDET.DB'
    Left = 112
    Top = 344
  end
  object dsReusable1: TDataSource
    DataSet = qryReusable1
    Left = 256
    Top = 200
  end
  object qryReusable1: TQuery
    DatabaseName = 'ARDB'
    Left = 280
    Top = 200
  end
end
