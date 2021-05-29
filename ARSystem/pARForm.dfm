object ARForm: TARForm
  Left = 275
  Top = 161
  Width = 842
  Height = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 473
    Height = 169
    DataSource = dsSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 528
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Currency'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Customer'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 528
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Transfer SH'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 528
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Transfer SD'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 200
    Width = 473
    Height = 145
    DataSource = dmardata.dsDest
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn5: TBitBtn
    Left = 528
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Open SH'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 536
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Open SD'
    TabOrder = 7
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 528
    Top = 304
    Width = 75
    Height = 25
    Caption = '&Print'
    TabOrder = 8
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 528
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Setup'
    TabOrder = 9
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 528
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Product'
    TabOrder = 10
    OnClick = BitBtn9Click
  end
  object BitBtn10: TBitBtn
    Left = 528
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 11
    OnClick = BitBtn10Click
  end
  object Button1: TButton
    Left = 528
    Top = 336
    Width = 75
    Height = 25
    Caption = 'PO'
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 520
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Tran Type'
    TabOrder = 13
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 520
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Company'
    TabOrder = 14
    OnClick = Button3Click
  end
  object BitBtn11: TBitBtn
    Left = 16
    Top = 400
    Width = 75
    Height = 25
    Caption = 'BitBtn11'
    TabOrder = 15
    OnClick = BitBtn11Click
  end
  object ListBox1: TListBox
    Left = 624
    Top = 24
    Width = 185
    Height = 377
    ItemHeight = 13
    TabOrder = 16
  end
  object BitBtn12: TBitBtn
    Left = 96
    Top = 400
    Width = 75
    Height = 25
    Caption = 'BitBtn12'
    TabOrder = 17
    OnClick = BitBtn12Click
  end
  object BitBtn13: TBitBtn
    Left = 184
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Header'
    TabOrder = 18
    OnClick = BitBtn13Click
  end
  object BitBtn14: TBitBtn
    Left = 272
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Detail'
    TabOrder = 19
    OnClick = BitBtn14Click
  end
  object BitBtn15: TBitBtn
    Left = 408
    Top = 400
    Width = 75
    Height = 25
    Caption = 'BitBtn15'
    TabOrder = 20
    OnClick = BitBtn15Click
  end
  object qrySource: TQuery
    DatabaseName = 'ARDB'
    SQL.Strings = (
      'Select * '
      'from Salehd'
      'where (DRNo='#39'23321A'#39')')
    Left = 304
    Top = 272
  end
  object dsSource: TDataSource
    DataSet = qrySource
    Left = 328
    Top = 272
  end
end
