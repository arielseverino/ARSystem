object Dlgparam1: TDlgparam1
  Left = 309
  Top = 243
  BorderStyle = bsDialog
  ClientHeight = 161
  ClientWidth = 468
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
    Top = 120
    Width = 468
    Height = 41
    Align = alBottom
    TabOrder = 4
  end
  object rgDRFormType: TRadioGroup
    Left = 0
    Top = 0
    Width = 468
    Height = 57
    Align = alTop
    Color = clWhite
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Sales Invoice'
      'Delivery Receipt')
    ParentColor = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 304
    Top = 128
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 384
    Top = 128
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object rgDecimal: TRadioGroup
    Left = 0
    Top = 57
    Width = 468
    Height = 57
    Align = alTop
    Color = clWhite
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '3 Decimal'
      '2 Decimal')
    ParentColor = False
    TabOrder = 3
  end
end
