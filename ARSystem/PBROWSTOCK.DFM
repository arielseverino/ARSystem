object BrowStock: TBrowStock
  Left = 51
  Top = 56
  HorzScrollBar.Color = clBtnFace
  HorzScrollBar.ParentColor = False
  HorzScrollBar.Style = ssFlat
  VertScrollBar.Color = clSkyBlue
  VertScrollBar.ParentColor = False
  BorderStyle = bsSingle
  ClientHeight = 406
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
    Caption = 'STOCK LIST'
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
    Height = 365
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clHotLight
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 671
      Height = 278
      Align = alClient
      Color = clInactiveCaptionText
      DataSource = dmardata.dsStock
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
      Columns = <
        item
          Expanded = False
          FieldName = 'prodcode'
          Title.Alignment = taCenter
          Title.Caption = 'Product Code'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'prodname'
          Title.Alignment = taCenter
          Title.Caption = 'Product Name'
          Width = 233
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saleprice'
          Title.Alignment = taCenter
          Title.Caption = 'Selling Price'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unitmeas'
          Title.Alignment = taCenter
          Title.Caption = 'Unit of Measurement'
          Width = 132
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 2
      Top = 280
      Width = 671
      Height = 83
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clHotLight
      TabOrder = 1
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Add'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Edit'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 168
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Delete'
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
        Left = 120
        Top = 48
        Width = 537
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
      object rgKey: TRadioGroup
        Left = 8
        Top = 40
        Width = 109
        Height = 31
        Caption = '&Search'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Code '
          'Name')
        ParentFont = False
        TabOrder = 5
        OnClick = rgKeyClick
      end
    end
  end
end
