object dlgparam2: Tdlgparam2
  Left = 177
  Top = 140
  BorderStyle = bsDialog
  ClientHeight = 340
  ClientWidth = 401
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
    Width = 401
    Height = 340
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 17
      Top = 102
      Width = 375
      Height = 199
      DataSource = dmardata.dslistrec
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'custcode'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'custname'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Width = 274
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 377
      Height = 89
      Caption = 'Search Customer'
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 25
        Height = 13
        Caption = 'Code'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 28
        Height = 13
        Caption = 'Name'
      end
      object edCode: TEdit
        Left = 48
        Top = 21
        Width = 177
        Height = 21
        TabOrder = 0
        OnChange = edCodeChange
        OnClick = edCodeClick
      end
      object edName: TEdit
        Left = 49
        Top = 48
        Width = 312
        Height = 21
        TabOrder = 1
        OnChange = edNameChange
        OnClick = edNameClick
      end
    end
    object Button1: TButton
      Left = 237
      Top = 309
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 2
    end
    object Button2: TButton
      Left = 317
      Top = 309
      Width = 75
      Height = 25
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 3
    end
  end
end
