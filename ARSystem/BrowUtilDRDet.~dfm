object BrowUtilDRDetail: TBrowUtilDRDetail
  Left = 192
  Top = 124
  Width = 928
  Height = 480
  Caption = 'BrowUtilDRDetail'
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
    Left = 24
    Top = 20
    Width = 55
    Height = 13
    Caption = 'Old DR No.'
  end
  object Label2: TLabel
    Left = 472
    Top = 20
    Width = 61
    Height = 13
    Caption = 'New DR No.'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 430
    Height = 369
    DataSource = dsOld
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 464
    Top = 56
    Width = 430
    Height = 369
    DataSource = dsNew
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edODRNo: TEdit
    Left = 88
    Top = 20
    Width = 130
    Height = 21
    TabOrder = 2
    OnExit = edODRNoExit
  end
  object Button1: TButton
    Left = 224
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Transfer'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edNDRNo: TEdit
    Left = 544
    Top = 20
    Width = 130
    Height = 21
    TabOrder = 4
    OnExit = edNDRNoExit
  end
  object Button2: TButton
    Left = 680
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Return'
    TabOrder = 5
    OnClick = Button2Click
  end
  object dsOld: TDataSource
    DataSet = qryOld
    Left = 104
    Top = 152
  end
  object dsNew: TDataSource
    DataSet = qryNew
    Left = 432
    Top = 136
  end
  object qryOld: TQuery
    DatabaseName = 'ARDB'
    Left = 120
    Top = 152
  end
  object qryNew: TQuery
    DatabaseName = 'ARDB'
    Left = 448
    Top = 144
  end
  object tOld: TTable
    DatabaseName = 'ARDB'
    TableName = 'SALEDET.DB'
    Left = 144
    Top = 392
  end
  object tNew: TTable
    DatabaseName = 'ARDB'
    TableName = 'SALEDET.DB'
    Left = 248
    Top = 296
  end
end
