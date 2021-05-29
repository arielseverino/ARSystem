object CompSetup: TCompSetup
  Left = 301
  Top = 196
  Width = 507
  Height = 253
  Caption = 'Company Setup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Company Name'
  end
  object DBEdit1: TDBEdit
    Left = 96
    Top = 8
    Width = 385
    Height = 21
    DataField = 'CompName'
    DataSource = dmardata.dsCompany
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 40
    Width = 465
    Height = 105
    Caption = 'Directory'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Source'
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Target'
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 61
      Height = 13
      Caption = 'Printing Style'
    end
    object DBEdit2: TDBEdit
      Left = 64
      Top = 24
      Width = 385
      Height = 21
      DataField = 'SourceDir'
      DataSource = dmardata.dsCompany
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 64
      Top = 48
      Width = 385
      Height = 21
      DataField = 'TargetDir'
      DataSource = dmardata.dsCompany
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 88
      Top = 75
      Width = 41
      Height = 21
      DataField = 'PrintingType'
      DataSource = dmardata.dsCompany
      TabOrder = 2
    end
  end
  object btnOk: TButton
    Left = 320
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 400
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
