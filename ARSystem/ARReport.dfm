object DlgReportParameter16: TDlgReportParameter16
  Left = 299
  Top = 237
  Width = 306
  Height = 155
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rgRegList: TRadioGroup
    Left = 16
    Top = 16
    Width = 169
    Height = 89
    ItemIndex = 0
    Items.Strings = (
      'Alphabetical'
      'Per Department')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 208
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 208
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
