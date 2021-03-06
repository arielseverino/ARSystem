object UpdEWT: TUpdEWT
  Left = 93
  Top = 50
  Width = 613
  Height = 490
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
    Width = 597
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'EWT RECORD'
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
    Width = 597
    Height = 370
    Align = alClient
    Caption = 'EWT RECORD'
    Color = clWhite
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 319
      Width = 60
      Height = 13
      Caption = 'Prepared by '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 11
      Top = 342
      Width = 63
      Height = 13
      Caption = 'Approved by '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 357
      Top = 310
      Width = 244
      Height = 52
      Color = clSkyBlue
      ParentColor = False
      TabOrder = 0
      object Label10: TLabel
        Left = 11
        Top = 21
        Width = 114
        Height = 16
        Alignment = taRightJustify
        Caption = 'CM / DM Amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 135
        Top = 21
        Width = 100
        Height = 17
        Color = clActiveCaption
        DataField = 'TaxAmt'
        DataSource = dmardata.dsPayCusHd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object gbHead: TGroupBox
      Left = 8
      Top = 5
      Width = 593
      Height = 72
      Color = clSkyBlue
      ParentColor = False
      TabOrder = 1
      object Label2: TLabel
        Left = 388
        Top = 15
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Payment Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 40
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cust. Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 204
        Top = 40
        Width = 55
        Height = 13
        Caption = 'Cust. Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedrdate: TDBEdit
        Left = 464
        Top = 15
        Width = 121
        Height = 21
        DataField = 'ADJDATE'
        DataSource = dmardata.dsTaxAdj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 72
        Top = 40
        Width = 120
        Height = 21
        DataField = 'CustCode'
        DataSource = dmardata.dsTaxAdj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 268
        Top = 40
        Width = 317
        Height = 21
        DataField = 'CustCode'
        DataSource = dmardata.dsTaxAdj
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
      end
    end
    object gbewtdet: TGroupBox
      Left = 7
      Top = 77
      Width = 594
      Height = 233
      Enabled = False
      TabOrder = 2
      object Label15: TLabel
        Left = 292
        Top = 18
        Width = 17
        Height = 13
        Caption = 'No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 62
        Width = 49
        Height = 13
        Caption = 'Particulars'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 175
        Width = 36
        Height = 13
        Caption = 'Amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbradjtype: TDBRadioGroup
        Left = 8
        Top = 13
        Width = 209
        Height = 40
        Columns = 2
        DataField = 'TYPE'
        DataSource = dmardata.dsTaxAdj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'Credit Memo'
          'Debit Memo')
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          'C'
          'D')
      end
      object dbeAdjNo: TDBEdit
        Left = 335
        Top = 16
        Width = 121
        Height = 21
        DataField = 'ADJNO'
        DataSource = dmardata.dsTaxAdj
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 8
        Top = 79
        Width = 559
        Height = 89
        DataField = 'REMARK'
        DataSource = dmardata.dsTaxAdj
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 56
        Top = 174
        Width = 121
        Height = 21
        DataField = 'AMTPAID'
        DataSource = dmardata.dsTaxAdj
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 56
        Top = 199
        Width = 511
        Height = 21
        DataField = 'WORDAMT'
        DataSource = dmardata.dsTaxAdj
        TabOrder = 4
      end
    end
    object DBEdit1: TDBEdit
      Left = 78
      Top = 315
      Width = 275
      Height = 21
      DataField = 'PREPARED'
      DataSource = dmardata.dsTaxAdj
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 78
      Top = 340
      Width = 275
      Height = 21
      DataField = 'APPROVED'
      DataSource = dmardata.dsTaxAdj
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 411
    Width = 597
    Height = 41
    Align = alBottom
    Color = clActiveCaption
    TabOrder = 2
    object NextBtn: TButton
      Left = 64
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Next '
      TabOrder = 0
      OnClick = NextBtnClick
    end
    object PrevBtn: TButton
      Left = 7
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Prior'
      TabOrder = 1
      OnClick = PrevBtnClick
    end
    object AddBtn: TButton
      Left = 164
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Add'
      TabOrder = 2
      OnClick = AddBtnClick
    end
    object EditBtn: TButton
      Left = 220
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Edit'
      TabOrder = 3
      OnClick = EditBtnClick
    end
    object DelBtn: TButton
      Left = 276
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Delete'
      TabOrder = 4
      OnClick = DelBtnClick
    end
    object BrowseBtn: TButton
      Left = 377
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Browse'
      TabOrder = 5
      OnClick = BrowseBtnClick
    end
    object CloseBtn: TButton
      Left = 548
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Close'
      ModalResult = 1
      TabOrder = 6
    end
    object cancelbtn: TButton
      Left = 432
      Top = 8
      Width = 50
      Height = 25
      Caption = '&Cancel'
      Enabled = False
      TabOrder = 7
      OnClick = cancelbtnClick
    end
  end
end
