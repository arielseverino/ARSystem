object BrowPO: TBrowPO
  Left = 46
  Top = 24
  HorzScrollBar.Color = clBtnFace
  HorzScrollBar.ParentColor = False
  HorzScrollBar.Style = ssFlat
  VertScrollBar.Color = clSkyBlue
  VertScrollBar.ParentColor = False
  BorderStyle = bsSingle
  ClientHeight = 479
  ClientWidth = 675
  Color = clGreen
  TransparentColorValue = clOlive
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clLime
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'PO LIST'
    Color = clHotLight
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
    Width = 675
    Height = 438
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clHotLight
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 671
      Height = 215
      Align = alTop
      Color = clInactiveCaptionText
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnKeyUp = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'purchno'
          Title.Alignment = taCenter
          Title.Caption = 'PO No.'
          Width = 184
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'purchdate'
          Title.Alignment = taCenter
          Title.Caption = 'PO Date'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'custname'
          Title.Alignment = taCenter
          Title.Caption = 'Customer'
          Width = 268
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 2
      Top = 395
      Width = 671
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clActiveCaption
      TabOrder = 1
      object Label1: TLabel
        Left = 248
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Search PO No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object AddDetBtn: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'A&dd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = AddDetBtnClick
      end
      object Button2: TButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Ed&it'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 168
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Dele&te'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 584
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Close'
        ModalResult = 1
        TabOrder = 3
      end
      object edKey: TEdit
        Left = 328
        Top = 8
        Width = 249
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = edKeyChange
        OnExit = edKeyChange
      end
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 258
      Width = 671
      Height = 137
      Align = alClient
      Color = clInactiveCaptionText
      FixedColor = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlue
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ProdCode'
          Title.Alignment = taCenter
          Title.Caption = 'Stock Code'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'prodname'
          Title.Alignment = taCenter
          Title.Caption = 'Stock Name'
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'orderqty'
          Title.Alignment = taCenter
          Title.Caption = 'Ordered Qty.'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'netamt'
          Title.Alignment = taCenter
          Title.Caption = 'Total Price'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'taxamt'
          Title.Alignment = taCenter
          Title.Caption = 'Tax Amt.'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'grossamt'
          Title.Alignment = taCenter
          Title.Caption = 'Gross Amt.'
          Width = 109
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 2
      Top = 217
      Width = 671
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clActiveCaption
      TabOrder = 3
      object TRANTYPE: TLabel
        Left = 256
        Top = 16
        Width = 23
        Height = 13
        Caption = 'ADD'
        Visible = False
      end
      object AddHdBtn: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Add'
        TabOrder = 0
        OnClick = AddHdBtnClick
      end
      object Button6: TButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 168
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Delete'
        TabOrder = 2
        OnClick = Button7Click
      end
    end
  end
end
