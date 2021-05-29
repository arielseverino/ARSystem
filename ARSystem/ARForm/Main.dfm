object Report: TReport
  Left = 0
  Top = 0
  Caption = 'SN05292021'
  ClientHeight = 486
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SI1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'SI-1'
    TabOrder = 0
    OnClick = ARForm
  end
  object DRForm: TQuickRep
    Left = 287
    Top = 24
    Width = 794
    Height = 1123
    ShowingPreview = False
    DataSet = qryreusable1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      25.400000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object DRPgHeader: TQRBand
      Left = 10
      Top = 48
      Width = 736
      Height = 208
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        550.333333333333300000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qreDRCustName1: TQRExpr
        Left = 84
        Top = 136
        Width = 152
        Height = 20
        Size.Values = (
          52.916666666666670000
          222.250000000000000000
          359.833333333333300000
          402.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.drcustname'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRDRDate1: TQRExpr
        Left = 548
        Top = 125
        Width = 122
        Height = 20
        Size.Values = (
          52.916666666666670000
          1449.916666666667000000
          330.729166666666700000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.drdate'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRAdd11: TQRExpr
        Left = 84
        Top = 163
        Width = 120
        Height = 20
        Size.Values = (
          52.916666666666670000
          222.250000000000000000
          431.270833333333300000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.draddr1  '
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreDRTinNo1: TQRExpr
        Left = 340
        Top = 125
        Width = 137
        Height = 20
        Size.Values = (
          52.916666666666700000
          899.583333333333000000
          330.729166666667000000
          362.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.tinno'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRAdd21: TQRExpr
        Left = 84
        Top = 185
        Width = 114
        Height = 20
        Size.Values = (
          52.916666666666670000
          222.250000000000000000
          489.479166666666700000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.draddr2'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreDRBussStyle1: TQRExpr
        Left = 328
        Top = 185
        Width = 173
        Height = 20
        Size.Values = (
          52.916666666666670000
          867.833333333333300000
          489.479166666666700000
          457.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.drbusinessstyle'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object DRColHd: TQRBand
      Left = 10
      Top = 256
      Width = 736
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
    end
    object DRDetail: TQRBand
      Left = 10
      Top = 256
      Width = 736
      Height = 26
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qreDRQty1: TQRExpr
        Left = 3
        Top = 0
        Width = 74
        Height = 20
        Size.Values = (
          52.916666666666670000
          7.937500000000000000
          0.000000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0'#39',qryreusable1.deliverqty) '
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRUnit1: TQRExpr
        Left = 86
        Top = 0
        Width = 73
        Height = 20
        Size.Values = (
          52.916666666666670000
          227.541666666666700000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.unitmeas'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRProdCode1: TQRExpr
        Left = 171
        Top = 1
        Width = 142
        Height = 20
        Size.Values = (
          52.916666666666670000
          452.437500000000000000
          2.645833333333333000
          375.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.prodcode'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRProdName1: TQRExpr
        Left = 289
        Top = 1
        Width = 144
        Height = 20
        Size.Values = (
          52.916666666666670000
          764.645833333333300000
          2.645833333333333000
          381.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.prodname'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRPONo1: TQRExpr
        Left = 580
        Top = 1
        Width = 132
        Height = 20
        Size.Values = (
          52.916666666666670000
          1534.583333333333000000
          2.645833333333333000
          349.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.purchno'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRRemarkDet1: TQRExpr
        Left = 171
        Top = 1
        Width = 398
        Height = 20
        Size.Values = (
          52.916666666666670000
          452.437500000000000000
          2.645833333333333000
          1053.041666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.remarkdet'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object DRFooter: TQRBand
      Left = 10
      Top = 360
      Width = 736
      Height = 266
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        703.791666666666700000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
    end
    object DRSummary: TQRBand
      Left = 10
      Top = 282
      Width = 736
      Height = 78
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        206.375000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object qreDRRem11: TQRExpr
        Left = 173
        Top = 16
        Width = 392
        Height = 20
        Size.Values = (
          52.916666666666700000
          457.729166666667000000
          42.333333333333300000
          1037.166666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.remark1'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRRem21: TQRExpr
        Left = 174
        Top = 40
        Width = 392
        Height = 20
        Size.Values = (
          52.916666666666700000
          460.375000000000000000
          105.833333333333000000
          1037.166666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.remark2'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
  end
  object SIForm2: TQuickRep
    Left = 172
    Top = 111
    Width = 816
    Height = 1056
    ShowingPreview = False
    DataSet = qryreusable1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2794.000000000000000000
      127.000000000000000000
      2159.000000000000000000
      63.500000000000000000
      63.500000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object pageheaderband2: TQRBand
      Left = 24
      Top = 48
      Width = 768
      Height = 222
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        587.375000000000000000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qreCustName2: TQRExpr
        Left = 104
        Top = 91
        Width = 139
        Height = 20
        Size.Values = (
          52.916666666666670000
          275.166666666666700000
          240.770833333333300000
          367.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.custname'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreSIDate2: TQRExpr
        Left = 604
        Top = 87
        Width = 132
        Height = 20
        Size.Values = (
          52.916666666666670000
          1598.083333333333000000
          230.187500000000000000
          349.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.saledate'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTinNo2: TQRExpr
        Left = 105
        Top = 114
        Width = 112
        Height = 20
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          301.625000000000000000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.tinno'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreDRNo2: TQRExpr
        Left = 604
        Top = 110
        Width = 111
        Height = 20
        Size.Values = (
          52.916666666666670000
          1598.083333333333000000
          291.041666666666700000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.drno'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qrebussstyle2: TQRExpr
        Left = 105
        Top = 191
        Width = 168
        Height = 20
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          505.354166666666700000
          444.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.businessstyle2'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreAdd22: TQRExpr
        Left = 105
        Top = 167
        Width = 119
        Height = 20
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          441.854166666666700000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.addr2'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreAdd12: TQRExpr
        Left = 105
        Top = 145
        Width = 119
        Height = 20
        Size.Values = (
          52.916666666666670000
          277.812500000000000000
          383.645833333333300000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.addr1'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object SIColHd2: TQRBand
      Left = 24
      Top = 270
      Width = 768
      Height = 140
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        370.416666666666700000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
    end
    object Detailband2: TQRBand
      Left = 24
      Top = 410
      Width = 768
      Height = 25
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qreSIDRQty2: TQRExpr
        Left = 3
        Top = 0
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          7.937500000000000000
          0.000000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'IF(DeliverQty<>0,FormatNumeric('#39'#,##0'#39',DeliverQty),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreUnit2: TQRExpr
        Left = 101
        Top = 0
        Width = 62
        Height = 20
        Size.Values = (
          52.916666666666670000
          267.229166666666700000
          0.000000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'IF(DeliverQty<>0,qryreusable1.unitmeas,'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreRemarkDet2: TQRExpr
        Left = 179
        Top = 0
        Width = 125
        Height = 20
        Size.Values = (
          52.916666666666670000
          473.604166666666700000
          0.000000000000000000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.remarkdet'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreUnitPrice2: TQRExpr
        Left = 544
        Top = 0
        Width = 73
        Height = 20
        Size.Values = (
          52.916666666666670000
          1439.333333333333000000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(UnitPrice<>0,formatnumeric('#39'#,##0.000'#39',If(VAT='#39'Y'#39',unitprice*1' +
          '.12,UnitPrice)),'#39#39') '
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreGross2: TQRExpr
        Left = 655
        Top = 0
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666670000
          1733.020833333333000000
          0.000000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(GrossAmt<>0,formatnumeric('#39'#,##0.000'#39',If(VAT='#39'Y'#39',GrossAmt*1.1' +
          '2,GrossAmt)),'#39#39') '
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreCurrencyb1: TQRExpr
        Left = 459
        Top = 0
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          1214.437500000000000000
          0.000000000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'If(DeliverQty<>0,CurrencySign,'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object SIFooter2: TQRBand
      Left = 24
      Top = 435
      Width = 768
      Height = 410
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1084.791666666667000000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qreTotGross12: TQRExpr
        Left = 656
        Top = 84
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1735.666666666670000000
          222.250000000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.grossamt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTotGross22: TQRExpr
        Left = 656
        Top = 135
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1735.666666666670000000
          357.187500000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.Grossamt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qretotTax2: TQRExpr
        Left = 656
        Top = 166
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1735.666666666670000000
          439.208333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTotNet2: TQRExpr
        Left = 656
        Top = 190
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1735.666666666670000000
          502.708333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'formatnumeric('#39'#,##0.00'#39',sum(qryreusable1.Grossamt+qryreusable1.' +
          'TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qrezerorated2: TQRExpr
        Left = 240
        Top = 135
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          635.000000000000000000
          357.187500000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(qryreusable1.TaxAmt=0,formatnumeric('#39'#,##0.000'#39',sum(qryreusab' +
          'le1.grossamt) ),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qrezeroratedsales2: TQRExpr
        Left = 248
        Top = 54
        Width = 345
        Height = 33
        Size.Values = (
          87.312500000000000000
          656.166666666667000000
          142.875000000000000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'IF(qryreusable1.TaxAmt=0,'#39'ZERO-RATED SALES'#39','#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object qrevatsales2: TQRExpr
        Left = 240
        Top = 84
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          635.000000000000000000
          222.250000000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(qryreusable1.TaxAmt>0,formatnumeric('#39'#,##0.000'#39',sum(qryreusab' +
          'le1.grossamt) ),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreVatAmt2: TQRExpr
        Left = 240
        Top = 166
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          635.000000000000000000
          439.208333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(qryreusable1.TaxAmt>0,formatnumeric('#39'#,##0.000'#39',sum(qryreusab' +
          'le1.TaxAmt) ),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreremark12: TQRExpr
        Left = 177
        Top = 4
        Width = 352
        Height = 20
        Size.Values = (
          52.916666666666700000
          468.312500000000000000
          10.583333333333300000
          931.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.Remark3'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreremark22: TQRExpr
        Left = 177
        Top = 28
        Width = 352
        Height = 20
        Size.Values = (
          52.916666666666700000
          468.312500000000000000
          74.083333333333300000
          931.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.Remark4'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qrelessvat2: TQRExpr
        Left = 656
        Top = 46
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1735.666666666670000000
          121.708333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qretotsales2: TQRExpr
        Left = 656
        Top = 14
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1735.666666666670000000
          37.041666666666700000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.Grossamt+qryreusable1' +
          '.TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreCurrencyb2: TQRExpr
        Left = 584
        Top = 14
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666700000
          1545.166666666670000000
          37.041666666666700000
          92.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'CurrencySign'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreCurrencyb3: TQRExpr
        Left = 592
        Top = 190
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666700000
          1566.333333333330000000
          502.708333333333000000
          92.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'CurrencySign'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRBand48: TQRBand
      Left = 24
      Top = 435
      Width = 768
      Height = 0
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
    end
  end
  object SIForm: TQuickRep
    Left = 212
    Top = 52
    Width = 816
    Height = 1056
    ShowingPreview = False
    DataSet = qryreusable1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2794.000000000000000000
      113.770833333333300000
      2159.000000000000000000
      63.500000000000000000
      63.500000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'SI - 1'
    SnapToGrid = True
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToWidth
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 24
      Top = 43
      Width = 768
      Height = 250
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        661.458333333333300000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qreCustName: TQRExpr
        Left = 173
        Top = 127
        Width = 139
        Height = 20
        Size.Values = (
          52.916666666666670000
          457.729166666666700000
          336.020833333333300000
          367.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.custname'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreSIDate: TQRExpr
        Left = 623
        Top = 129
        Width = 117
        Height = 16
        Size.Values = (
          42.333333333333330000
          1648.354166666667000000
          341.312500000000000000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.saledate'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreTinNo: TQRExpr
        Left = 174
        Top = 147
        Width = 101
        Height = 16
        Size.Values = (
          42.333333333333330000
          460.375000000000000000
          388.937500000000000000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.tinno'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreDRNo: TQRExpr
        Left = 623
        Top = 146
        Width = 98
        Height = 16
        Size.Values = (
          42.333333333333330000
          1648.354166666667000000
          386.291666666666700000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.drno'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreAdd1: TQRExpr
        Left = 174
        Top = 165
        Width = 103
        Height = 16
        Size.Values = (
          42.333333333333330000
          460.375000000000000000
          436.562500000000000000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.addr1'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreAdd2: TQRExpr
        Left = 174
        Top = 180
        Width = 103
        Height = 16
        Size.Values = (
          42.333333333333330000
          460.375000000000000000
          476.250000000000000000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.addr2'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreBussStyle: TQRExpr
        Left = 174
        Top = 195
        Width = 147
        Height = 16
        Size.Values = (
          42.333333333333330000
          460.375000000000000000
          515.937500000000000000
          388.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.businessstyle'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrePO: TQRExpr
        Left = 624
        Top = 165
        Width = 117
        Height = 17
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          436.562500000000000000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.PONO'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object SIColHD1: TQRBand
      Left = 24
      Top = 293
      Width = 768
      Height = 59
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        156.104166666666700000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
    end
    object DetailBand1: TQRBand
      Left = 24
      Top = 352
      Width = 768
      Height = 50
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        132.291666666666700000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qreDeliverQty: TQRExpr
        Left = 19
        Top = 0
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          50.270833333333330000
          0.000000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0'#39',qryreusable1.deliverqty) '
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreUnit: TQRExpr
        Left = 134
        Top = 0
        Width = 50
        Height = 20
        Size.Values = (
          52.916666666666670000
          354.541666666666700000
          0.000000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.unitmeas'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreProdCode: TQRExpr
        Left = 200
        Top = 0
        Width = 124
        Height = 20
        Size.Values = (
          52.916666666666670000
          529.166666666666700000
          0.000000000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.prodcode'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreProdname: TQRExpr
        Left = 302
        Top = 0
        Width = 126
        Height = 20
        Size.Values = (
          52.916666666666670000
          799.041666666666700000
          0.000000000000000000
          333.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.prodname'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qreUnitPrice: TQRExpr
        Left = 564
        Top = 0
        Width = 73
        Height = 20
        Size.Values = (
          52.916666666666670000
          1492.250000000000000000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(VAT='#39'Y'#39',FormatNumeric('#39'#,##0.000'#39',UnitPrice*1.12), FormatNume' +
          'ric('#39'#,##0.000'#39',UnitPrice))'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreGross: TQRExpr
        Left = 663
        Top = 0
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666670000
          1754.187500000000000000
          0.000000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(VAT='#39'Y'#39',FormatNumeric('#39'#,##0.000'#39',GrossAmt*1.12),FormatNumeri' +
          'c('#39'#,##0.000'#39',GrossAmt))'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreCurrencya1: TQRExpr
        Left = 482
        Top = 0
        Width = 75
        Height = 20
        Size.Values = (
          52.916666666666670000
          1275.291666666667000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        Expression = 'currencysign'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object SIFooter1: TQRBand
      Left = 24
      Top = 457
      Width = 768
      Height = 300
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        793.750000000000000000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qreTotGross1: TQRExpr
        Left = 665
        Top = 84
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1759.479166666670000000
          222.250000000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.grossamt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTotGross2: TQRExpr
        Left = 665
        Top = 135
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1759.479166666670000000
          357.187500000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.Grossamt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTotTax: TQRExpr
        Left = 665
        Top = 162
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1759.479166666670000000
          428.625000000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTotNet: TQRExpr
        Left = 665
        Top = 186
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1759.479166666670000000
          492.125000000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'formatnumeric('#39'#,##0.00'#39',sum(qryreusable1.Grossamt+qryreusable1.' +
          'TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreZeroRated: TQRExpr
        Left = 295
        Top = 135
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          780.520833333333000000
          357.187500000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(qryreusable1.TaxAmt=0,formatnumeric('#39'#,##0.000'#39',sum(qryreusab' +
          'le1.grossamt) ),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreVatSales: TQRExpr
        Left = 295
        Top = 84
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          780.520833333333000000
          222.250000000000000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(qryreusable1.TaxAmt>0,formatnumeric('#39'#,##0.000'#39',sum(qryreusab' +
          'le1.grossamt) ),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreVatAmt: TQRExpr
        Left = 295
        Top = 166
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          780.520833333333000000
          439.208333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'IF(qryreusable1.TaxAmt>0,formatnumeric('#39'#,##0.000'#39',sum(qryreusab' +
          'le1.TaxAmt) ),'#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreTotsales: TQRExpr
        Left = 665
        Top = 34
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1759.479166666670000000
          89.958333333333300000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 
          'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.Grossamt+qryreusable1' +
          '.TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreLessVat: TQRExpr
        Left = 665
        Top = 58
        Width = 100
        Height = 20
        Size.Values = (
          52.916666666666700000
          1759.479166666670000000
          153.458333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'formatnumeric('#39'#,##0.000'#39',sum(qryreusable1.TaxAmt) )'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreZeroRatedSales: TQRExpr
        Left = 24
        Top = 17
        Width = 345
        Height = 33
        Size.Values = (
          87.312500000000000000
          63.500000000000000000
          44.979166666666670000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'IF(qryreusable1.TaxAmt=0,'#39'ZERO-RATED SALES'#39','#39#39')'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object qreCurrencya2: TQRExpr
        Left = 584
        Top = 34
        Width = 76
        Height = 20
        Size.Values = (
          52.916666666666670000
          1545.166666666667000000
          89.958333333333330000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'currencysign'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreCurrencya3: TQRExpr
        Left = 584
        Top = 186
        Width = 76
        Height = 20
        Size.Values = (
          52.916666666666670000
          1545.166666666667000000
          492.125000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'currencysign'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object SummaryBand3: TQRBand
      Left = 24
      Top = 402
      Width = 768
      Height = 55
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        145.520833333333300000
        2032.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object qreRemark1: TQRExpr
        Left = 177
        Top = 6
        Width = 352
        Height = 20
        Size.Values = (
          52.916666666666670000
          468.312500000000000000
          15.875000000000000000
          931.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.Remark3'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qreRemark2: TQRExpr
        Left = 177
        Top = 30
        Width = 352
        Height = 20
        Size.Values = (
          52.916666666666670000
          468.312500000000000000
          79.375000000000000000
          931.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'qryreusable1.Remark4'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=ARDB;Data Source=PAYROLL_SERVER\SMARTGUARD;Use Proce' +
      'dure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstat' +
      'ion ID=PAYROLL_SERVER;Initial File Name="";Use Encryption for Da' +
      'ta=False;Tag with column collation when possible=False;MARS Conn' +
      'ection=False;DataTypeCompatibility=0;Trust Server Certificate=Fa' +
      'lse;Server SPN="";Application Intent=READWRITE'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 568
    Top = 24
  end
  object dsCompany: TDataSource
    DataSet = qryCompany
    Left = 608
    Top = 72
  end
  object qryCompany: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Customer')
    Left = 632
    Top = 72
  end
  object qryreusable1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Customer')
    Left = 632
    Top = 136
  end
  object dsreusable1: TDataSource
    DataSet = qryreusable1
    Left = 608
    Top = 136
  end
  object qryFormSettings: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Customer')
    Left = 600
    Top = 216
  end
  object dsFormSettings: TDataSource
    DataSet = qryFormSettings
    Left = 632
    Top = 208
  end
  object dsCustomer: TDataSource
    DataSet = qryCustomer
    Left = 632
    Top = 280
  end
  object qryCustomer: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Customer')
    Left = 600
    Top = 288
  end
end
