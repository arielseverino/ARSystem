object dmardata: Tdmardata
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 155
  Height = 506
  Width = 682
  object dsCustomer: TDataSource
    DataSet = qryCustomer
    Left = 24
    Top = 16
  end
  object dsStock: TDataSource
    DataSet = qryStock
    Left = 264
    Top = 8
  end
  object dsreusable1: TDataSource
    DataSet = qryreusable1
    Left = 16
    Top = 152
  end
  object qryreusable1a: TQuery
    DatabaseName = 'ARDB'
    RequestLive = True
    Left = 48
    Top = 168
  end
  object dspodet: TDataSource
    DataSet = qryPODet
    Left = 136
    Top = 8
  end
  object dspohd: TDataSource
    DataSet = qryPOhd
    Left = 96
    Top = 8
  end
  object dssaledet: TDataSource
    DataSet = qrySaledet
    Left = 160
    Top = 88
  end
  object dsPayCusHd: TDataSource
    DataSet = qryPayCusHd
    Left = 96
    Top = 160
  end
  object dssalehd: TDataSource
    DataSet = qrySalehd
    Left = 96
    Top = 80
  end
  object dsAdjDet: TDataSource
    DataSet = qryAdjDet
    Left = 344
    Top = 160
  end
  object dsTaxAdj: TDataSource
    DataSet = qryTaxAdj
    Left = 264
    Top = 160
  end
  object dslistrec: TDataSource
    DataSet = qryListRec
    Left = 160
    Top = 232
  end
  object qryListRec1: TQuery
    DatabaseName = 'ARDB'
    Left = 248
    Top = 240
  end
  object tcustomer: TTable
    DatabaseName = 'ARDB'
    TableName = 'CUSTOMER.db'
    Left = 8
    Top = 8
  end
  object dsKey: TDataSource
    DataSet = qryKey
    Left = 160
    Top = 304
  end
  object tCurrency: TTable
    DatabaseName = 'ARDB'
    TableName = 'CURRENCY.db'
    Left = 16
    Top = 88
  end
  object dsCurrency: TDataSource
    DataSet = qryCurrency
    Left = 16
    Top = 88
  end
  object dsTraNType: TDataSource
    DataSet = qryTranType
    Left = 40
    Top = 272
  end
  object dsCompany: TDataSource
    DataSet = qryCompany
    Left = 296
    Top = 88
  end
  object dsSource: TDataSource
    DataSet = qrySource
    Left = 328
    Top = 272
  end
  object qrySource1: TQuery
    DatabaseName = 'ARSERVER'
    Left = 504
    Top = 72
  end
  object dsFormSettings: TDataSource
    DataSet = qryFormSettings
    Left = 400
    Top = 32
  end
  object dsSrcDet: TDataSource
    DataSet = qrySrcDet
    Left = 488
    Top = 120
  end
  object qrySrcDet: TQuery
    DatabaseName = 'ARSERVER'
    Left = 504
    Top = 128
  end
  object ARServer1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=ARServer5;Initial Catalog=ARDB;'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 592
    Top = 16
  end
  object qryEmployee: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 592
    Top = 80
  end
  object dsEmployee: TDataSource
    DataSet = qryEmployee
    Left = 600
    Top = 80
  end
  object dsDest1: TDataSource
    DataSet = qryDest1
    Left = 608
    Top = 144
  end
  object qryDest1: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 592
    Top = 144
  end
  object qryCompany1: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 592
    Top = 192
  end
  object drCompany1: TDataSource
    DataSet = qryCompany1
    Left = 608
    Top = 192
  end
  object qryFormSettings1: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 592
    Top = 248
  end
  object dsFormSettings1: TDataSource
    DataSet = qryFormSettings1
    Left = 608
    Top = 248
  end
  object qryForm: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 480
    Top = 240
  end
  object dsForm: TDataSource
    DataSet = qryForm
    Left = 496
    Top = 240
  end
  object qrySaleDet1: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 480
    Top = 192
  end
  object dsSaleDet1: TDataSource
    DataSet = qrySaleDet1
    Left = 496
    Top = 192
  end
  object qrySalehd1: TADOQuery
    Connection = ARServer1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select idnum,lastname,firstname,hireddate,RatePerDay from employ' +
        'ee')
    Left = 416
    Top = 160
  end
  object dsSaleHd1: TDataSource
    DataSet = qrySalehd1
    Left = 432
    Top = 160
  end
  object dsUsable1: TDataSource
    DataSet = qryUsable1
    Left = 72
    Top = 392
  end
  object MSSQLDatabase1: TMSSQLDatabase
    Host = 'SPC\SqlExpress'
    Database = 'ARDb'
    Encoding = etNone
    Login = 'sa'
    Password = 'metal@2018'
    LoginPrompt = False
    Connected = True
    Left = 24
    Top = 392
  end
  object qryUsable1: TMSSQLQuery
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = False
    Left = 80
    Top = 400
  end
  object ARServer: TMSSQLDatabase
    Host = '192.168.0.147'
    Database = 'ARDB'
    Encoding = etNone
    Login = 'sa'
    Password = 'metal@2021'
    LoginPrompt = False
    Connected = True
    Left = 600
    Top = 352
  end
  object MSSQLTransact1: TMSSQLTransact
    Options = [toHourGlass]
    AutoCommit = True
    Database = ARServer
    TransactSafe = True
    Left = 592
    Top = 392
  end
  object qryDest: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 464
    Top = 384
  end
  object dsDest: TDataSource
    DataSet = qryDest
    Left = 472
    Top = 400
  end
  object qryPODet: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 144
    Top = 16
  end
  object qryProduct: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 216
    Top = 368
  end
  object qryCustomer: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 8
    Top = 16
  end
  object qryPOhd: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 96
    Top = 24
  end
  object qryStock: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 256
    Top = 16
  end
  object qryCurrency: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 16
    Top = 80
  end
  object qryKey: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 152
    Top = 296
  end
  object qryTranType: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 32
    Top = 272
  end
  object qryFormSettings: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 368
    Top = 40
  end
  object qryCompany: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 312
    Top = 88
  end
  object qrySalehd: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 104
    Top = 80
  end
  object qrySaledet: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 152
    Top = 80
  end
  object qryPayCusHd: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 104
    Top = 160
  end
  object qryPayCust: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 168
    Top = 168
  end
  object dsPayCust: TDataSource
    DataSet = qryPayCust
    Left = 160
    Top = 160
  end
  object qryAdjDet: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 344
    Top = 168
  end
  object qryTaxAdj: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 272
    Top = 176
  end
  object qryreusable1: TMSSQLQuery
    Database = ARServer
    Transaction = MSSQLTransact1
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    SQL.Strings = (
      
        'select Customer.CustName, SaleHd.SaleDate, Customer.Addr1,SaleHd' +
        '.DRDate,Customer.Addr2,'
      
        '                    SaleDet.DeliverQty, Product.UnitMeas, SaleDe' +
        't.ProdCode, Product.ProdName, SaleDet.TaxAmt, SaleDet.Purchno,'
      
        '                    Customer.TinNo, Customer.BusinessStyle, Sale' +
        'Det.DRNo, SaleHd.Remark1, SaleHd.Remark2, SaleHd.Remark3, SaleHd' +
        '.Remark4, SaleDet.RemarkDet, Currency.CurrencySign,Customer.Vat,'
      
        '                    SaleDet.UnitPrice, SaleDet.GrossAmt, saleHd.' +
        'PONO, customer.draddr1,customer.draddr2,Customer.drcustname, Cus' +
        'tomer.DRBusinessStyle'
      
        '                    from SaleHd,SaleDet,Customer,Product,Currenc' +
        'y'
      '                    where (SaleHd.DRNo=SaleDet.DRNo)'
      '                    and (salehd.custcode = customer.custcode)'
      '                    and (saledet.prodcode = product.prodcode)'
      
        '                    and (SaleDet.CurrencyCode=Currency.CurrencyC' +
        'ode)'
      '                    and (SaleDet.Drno = '#39'06911A'#39')')
    RequestLive = True
    Left = 16
    Top = 152
  end
  object qrySource: TQuery
    DatabaseName = 'ARDB'
    SQL.Strings = (
      'Select * '
      'from Salehd'
      'where (DRNo='#39'23321A'#39')')
    Left = 304
    Top = 272
  end
  object qryListRec: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 184
    Top = 240
  end
  object qryListForm: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 320
    Top = 384
  end
  object dsListform: TDataSource
    DataSet = qryListForm
    Left = 328
    Top = 392
  end
  object qryreusable2: TMSSQLQuery
    Database = ARServer
    CachedUpdates = False
    ShowRecordTypes = [tModified, tInserted, tUnmodified]
    Options = [doHourGlass, doAutoFillDefs, doUseRowId]
    LinkOptions = [loAlwaysResync]
    Constraints = <>
    ExtraOptions = [soStoreResult]
    RequestLive = True
    Left = 152
    Top = 368
  end
  object dsReusable2: TDataSource
    DataSet = qryreusable2
    Left = 160
    Top = 376
  end
end
