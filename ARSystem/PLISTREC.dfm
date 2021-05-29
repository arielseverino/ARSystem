object ListRec: TListRec
  Left = 35
  Top = 100
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 359
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 287
    Height = 297
    Align = alClient
    Color = clWhite
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
        Width = 211
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 322
    Width = 287
    Height = 37
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clHotLight
    TabOrder = 1
    object Button1: TButton
      Left = 175
      Top = 6
      Width = 50
      Height = 25
      Caption = '&Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object Button2: TButton
      Left = 231
      Top = 6
      Width = 50
      Height = 25
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 287
    Height = 25
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'STOCK LIST'
    Color = clHotLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
