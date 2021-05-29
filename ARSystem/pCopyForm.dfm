object CopyForm: TCopyForm
  Left = 116
  Top = 186
  Width = 979
  Height = 247
  Caption = 'Copy Database'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblStatus: TLabel
    Left = 304
    Top = 144
    Width = 22
    Height = 13
    Caption = 'Start'
  end
  object btnCopy: TButton
    Left = 16
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 0
    OnClick = btnCopyClick
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 140
    Width = 273
    Height = 17
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 80
    Width = 537
    Height = 49
    Caption = 'Destination'
    TabOrder = 2
    object Button4: TButton
      Left = 448
      Top = 16
      Width = 75
      Height = 25
      Caption = '...'
      TabOrder = 0
    end
    object edTarget: TEdit
      Left = 8
      Top = 20
      Width = 433
      Height = 21
      TabOrder = 1
      Text = 'D:\WINARSYS\SERVER\'
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 537
    Height = 57
    Caption = 'Source'
    TabOrder = 3
    object edSource: TEdit
      Left = 8
      Top = 20
      Width = 433
      Height = 21
      TabOrder = 0
      Text = '\\Edv\ARData2\'
    end
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 584
    Top = 24
    Width = 145
    Height = 97
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 4
  end
  object FileListBox1: TFileListBox
    Left = 744
    Top = 24
    Width = 145
    Height = 97
    ItemHeight = 13
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 528
    Top = 128
  end
  object SaveDialog1: TSaveDialog
    Left = 624
    Top = 136
  end
  object dsreusable1: TDataSource
    DataSet = qryreusable1
    Left = 728
    Top = 136
  end
  object qryreusable1: TQuery
    DatabaseName = 'ARDB'
    Left = 752
    Top = 136
  end
end
