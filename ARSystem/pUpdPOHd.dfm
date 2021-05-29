object UpdPOHd: TUpdPOHd
  Left = 196
  Top = 157
  Width = 722
  Height = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'PURCHASE ORDER RECORD'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 706
    Height = 421
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 1
    object Label6: TLabel
      Left = 16
      Top = 160
      Width = 56
      Height = 13
      Caption = 'Stock Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 229
      Width = 46
      Height = 13
      Caption = 'Unit Price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 264
      Width = 60
      Height = 13
      Caption = 'Ordered Qty.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 293
      Width = 51
      Height = 13
      Caption = 'Total Price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 341
      Width = 42
      Height = 13
      Caption = 'Tax Amt.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 373
      Width = 51
      Height = 13
      Caption = 'Gross Amt.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 424
      Top = 341
      Width = 67
      Height = 13
      Caption = 'Delivered Qty.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 428
      Top = 373
      Width = 39
      Height = 13
      Caption = 'Balance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 16
      Top = 192
      Width = 42
      Height = 13
      Caption = 'Currency'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object gbhd: TGroupBox
      Left = 8
      Top = 8
      Width = 697
      Height = 141
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 15
        Width = 35
        Height = 13
        Caption = 'PO No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 45
        Width = 44
        Height = 13
        Caption = 'Customer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 80
        Width = 29
        Height = 13
        Caption = 'Terms'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 475
        Top = 80
        Width = 64
        Height = 13
        Caption = 'Delivery Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 475
        Top = 16
        Width = 41
        Height = 13
        Caption = 'PO Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbepono: TDBEdit
        Left = 80
        Top = 15
        Width = 121
        Height = 21
        Color = clWhite
        DataField = 'purchno'
        DataSource = dmardata.dspohd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = dbeponoExit
      end
      object dblterms: TDBEdit
        Left = 80
        Top = 80
        Width = 121
        Height = 21
        Color = clWhite
        DataField = 'termcode'
        DataSource = dmardata.dspohd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object cbMultiple: TCheckBox
        Left = 16
        Top = 116
        Width = 97
        Height = 17
        Caption = 'Multiple Product'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
      object DBEdit2: TDBEdit
        Left = 550
        Top = 15
        Width = 121
        Height = 21
        Color = clWhite
        DataField = 'purchdate'
        DataSource = dmardata.dspohd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 550
        Top = 80
        Width = 121
        Height = 21
        Color = clWhite
        DataField = 'drdate'
        DataSource = dmardata.dspohd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 80
        Top = 47
        Width = 385
        Height = 21
        Color = clWhite
        DataField = 'custcode'
        DataSource = dmardata.dspohd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'custcode'
        ListField = 'custname'
        ListSource = dmardata.dsCustomer
        ParentFont = False
        TabOrder = 2
        OnClick = DBLookupComboBox1Click
      end
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 296
      Top = 158
      Width = 377
      Height = 21
      DataField = 'prodcode'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'prodcode'
      ListField = 'prodname'
      ListSource = dmardata.dsStock
      ParentFont = False
      TabOrder = 2
      OnClick = FindPrice
      OnExit = FindPrice
    end
    object DBEdit5: TDBEdit
      Left = 78
      Top = 229
      Width = 121
      Height = 21
      DataField = 'unitprice'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = CompPrice
    end
    object DBEdit6: TDBEdit
      Left = 78
      Top = 266
      Width = 121
      Height = 21
      DataField = 'orderqty'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = CompPrice
    end
    object DBEdit7: TDBEdit
      Left = 78
      Top = 295
      Width = 121
      Height = 21
      DataField = 'netamt'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 78
      Top = 341
      Width = 121
      Height = 21
      DataField = 'taxamt'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 78
      Top = 373
      Width = 121
      Height = 21
      DataField = 'grossamt'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object DBEdit10: TDBEdit
      Left = 504
      Top = 341
      Width = 121
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'DeliverQty'
      DataSource = dmardata.dspodet
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 504
      Top = 373
      Width = 121
      Height = 21
      Color = clGradientInactiveCaption
      DataField = 'lastqty'
      DataSource = dmardata.dspodet
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 78
      Top = 159
      Width = 203
      Height = 21
      DataField = 'prodcode'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = FindPrice
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 80
      Top = 192
      Width = 145
      Height = 21
      DataField = 'CurrencyCode'
      DataSource = dmardata.dspodet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CurrencyCode'
      ListField = 'CurrencyName'
      ListSource = dmardata.dsCurrency
      ParentFont = False
      TabOrder = 10
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 462
    Width = 706
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clActiveCaption
    TabOrder = 2
    object btnok: TButton
      Left = 544
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnokClick
    end
    object btncancel: TButton
      Left = 624
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btncancelClick
    end
  end
end
