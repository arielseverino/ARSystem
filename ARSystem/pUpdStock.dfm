object UpdStock: TUpdStock
  Left = 348
  Top = 127
  Width = 551
  Height = 437
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
    Width = 535
    Height = 41
    Align = alTop
    Caption = 'STOCK RECORD'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object stockpanel: TPanel
    Left = 0
    Top = 41
    Width = 535
    Height = 276
    Align = alClient
    Color = clWhite
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 15
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Stock Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 64
      Width = 59
      Height = 13
      Caption = 'Stock Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 120
      Width = 58
      Height = 13
      Caption = 'Selling Price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 15
      Top = 184
      Width = 63
      Height = 13
      Caption = 'Unit of Meas.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 232
      Width = 47
      Height = 13
      Caption = 'Customer '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbestockcode: TDBEdit
      Left = 80
      Top = 13
      Width = 121
      Height = 21
      DataField = 'prodcode'
      DataSource = dmardata.dsStock
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 80
      Top = 61
      Width = 441
      Height = 21
      DataField = 'prodname'
      DataSource = dmardata.dsStock
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbesellingprice: TDBEdit
      Left = 80
      Top = 120
      Width = 121
      Height = 21
      DataField = 'saleprice'
      DataSource = dmardata.dsStock
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 80
      Top = 181
      Width = 450
      Height = 21
      DataField = 'unitmeas'
      DataSource = dmardata.dsStock
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 80
      Top = 229
      Width = 441
      Height = 21
      Color = clWhite
      DataField = 'custcode'
      DataSource = dmardata.dsStock
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'custcode'
      ListField = 'custname'
      ListSource = dmardata.dsCustomer
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 317
    Width = 535
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Color = clActiveCaption
    TabOrder = 2
    object Label8: TLabel
      Left = 16
      Top = 13
      Width = 37
      Height = 13
      Caption = 'Search '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edkey: TEdit
      Left = 64
      Top = 10
      Width = 467
      Height = 21
      TabOrder = 0
      OnChange = edkeyChange
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 358
    Width = 535
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clActiveCaption
    TabOrder = 3
    object BrowseBtn: TButton
      Left = 336
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Browse'
      TabOrder = 0
      OnClick = BrowseBtnClick
    end
    object CancelBtn: TButton
      Left = 392
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Cancel'
      Enabled = False
      TabOrder = 1
      OnClick = CancelBtnClick
    end
    object PrevBtn: TButton
      Left = 7
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Prior'
      TabOrder = 2
      OnClick = PrevBtnClick
    end
    object NextBtn: TButton
      Left = 64
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Next '
      TabOrder = 3
      OnClick = NextBtnClick
    end
    object AddBtn: TButton
      Left = 126
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Add'
      TabOrder = 4
      OnClick = AddBtnClick
    end
    object EditBtn: TButton
      Left = 182
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Edit'
      TabOrder = 5
      OnClick = EditBtnClick
    end
    object DelBtn: TButton
      Left = 238
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Delete'
      TabOrder = 6
      OnClick = DelBtnClick
    end
    object closebtn: TButton
      Left = 480
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Close'
      ModalResult = 1
      TabOrder = 7
    end
  end
end
