object dlgparam3: Tdlgparam3
  Left = 261
  Top = 252
  BorderStyle = bsDialog
  ClientHeight = 179
  ClientWidth = 384
  Color = clSkyBlue
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 40
    Top = 27
    Width = 48
    Height = 13
    Caption = 'Start Date'
  end
  object Label2: TLabel
    Left = 40
    Top = 79
    Width = 45
    Height = 13
    Caption = 'End Date'
  end
  object OKBtn: TButton
    Left = 300
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object CancelBtn: TButton
    Left = 300
    Top = 38
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object dStartDate: TDateTimePicker
    Left = 40
    Top = 43
    Width = 186
    Height = 21
    Date = 38778.942307743050000000
    Time = 38778.942307743050000000
    TabOrder = 0
  end
  object dEndDate: TDateTimePicker
    Left = 40
    Top = 95
    Width = 186
    Height = 21
    Date = 38778.942366875000000000
    Time = 38778.942366875000000000
    TabOrder = 1
  end
  object cbIncDR: TCheckBox
    Left = 40
    Top = 128
    Width = 97
    Height = 17
    Caption = 'Include DR ? '
    Enabled = False
    TabOrder = 2
  end
end
