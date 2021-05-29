unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, QuickRpt, QRCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TReport = class(TForm)
    ADOConnection1: TADOConnection;
    dsCompany: TDataSource;
    qryCompany: TADOQuery;
    SI1: TButton;
    qryreusable1: TADOQuery;
    dsreusable1: TDataSource;
    DRForm: TQuickRep;
    DRPgHeader: TQRBand;
    qreDRCustName1: TQRExpr;
    qreDRDRDate1: TQRExpr;
    qreDRAdd11: TQRExpr;
    qreDRTinNo1: TQRExpr;
    qreDRAdd21: TQRExpr;
    qreDRBussStyle1: TQRExpr;
    DRColHd: TQRBand;
    DRDetail: TQRBand;
    qreDRQty1: TQRExpr;
    qreDRUnit1: TQRExpr;
    qreDRProdCode1: TQRExpr;
    qreDRProdName1: TQRExpr;
    qreDRPONo1: TQRExpr;
    qreDRRemarkDet1: TQRExpr;
    DRFooter: TQRBand;
    DRSummary: TQRBand;
    qreDRRem11: TQRExpr;
    qreDRRem21: TQRExpr;
    SIForm2: TQuickRep;
    pageheaderband2: TQRBand;
    qreCustName2: TQRExpr;
    qreSIDate2: TQRExpr;
    qreTinNo2: TQRExpr;
    qreDRNo2: TQRExpr;
    qrebussstyle2: TQRExpr;
    qreAdd22: TQRExpr;
    qreAdd12: TQRExpr;
    SIColHd2: TQRBand;
    Detailband2: TQRBand;
    qreSIDRQty2: TQRExpr;
    qreUnit2: TQRExpr;
    qreRemarkDet2: TQRExpr;
    qreUnitPrice2: TQRExpr;
    qreGross2: TQRExpr;
    qreCurrencyb1: TQRExpr;
    SIFooter2: TQRBand;
    qreTotGross12: TQRExpr;
    qreTotGross22: TQRExpr;
    qretotTax2: TQRExpr;
    qreTotNet2: TQRExpr;
    qrezerorated2: TQRExpr;
    qrezeroratedsales2: TQRExpr;
    qrevatsales2: TQRExpr;
    qreVatAmt2: TQRExpr;
    qreremark12: TQRExpr;
    qreremark22: TQRExpr;
    qrelessvat2: TQRExpr;
    qretotsales2: TQRExpr;
    qreCurrencyb2: TQRExpr;
    qreCurrencyb3: TQRExpr;
    QRBand48: TQRBand;
    qryFormSettings: TADOQuery;
    dsFormSettings: TDataSource;
    dsCustomer: TDataSource;
    qryCustomer: TADOQuery;
    SIForm: TQuickRep;
    PageHeaderBand1: TQRBand;
    qreCustName: TQRExpr;
    qreSIDate: TQRExpr;
    qreTinNo: TQRExpr;
    qreDRNo: TQRExpr;
    qreAdd1: TQRExpr;
    qreAdd2: TQRExpr;
    qreBussStyle: TQRExpr;
    qrePO: TQRExpr;
    SIColHD1: TQRBand;
    DetailBand1: TQRBand;
    qreDeliverQty: TQRExpr;
    qreUnit: TQRExpr;
    qreProdCode: TQRExpr;
    qreProdname: TQRExpr;
    qreUnitPrice: TQRExpr;
    qreGross: TQRExpr;
    qreCurrencya1: TQRExpr;
    SIFooter1: TQRBand;
    qreTotGross1: TQRExpr;
    qreTotGross2: TQRExpr;
    qreTotTax: TQRExpr;
    qreTotNet: TQRExpr;
    qreZeroRated: TQRExpr;
    qreVatSales: TQRExpr;
    qreVatAmt: TQRExpr;
    qreTotsales: TQRExpr;
    qreLessVat: TQRExpr;
    qreZeroRatedSales: TQRExpr;
    qreCurrencya2: TQRExpr;
    qreCurrencya3: TQRExpr;
    SummaryBand3: TQRBand;
    qreRemark1: TQRExpr;
    qreRemark2: TQRExpr;
    procedure ARForm(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GenReports();
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    aSyslog:tStringlist;
    cLogFile:string;

  end;

var
  Report: TReport;
  cdatabase,cServer,cpassword,cLogin :string;
  nWidth : integer;
  pHol    : array of char;
  nCtr : integer;
  cUserName : string;


implementation

//uses  pPayFunctions;


{$R *.dfm}


procedure TReport.FormActivate(Sender: TObject);
var i : integer;
begin
    for i := 0 to ParamCount do
end;

procedure TReport.GenReports;
var sender:TObject;
    cConfigFile,cApplicationPath :String;
    I           :integer;
    aConfig : tstringlist;

begin

    for i := 0 to ParamCount do
       //showmessage(paramstr(i));

    cApplicationPath :=  ExtractFilePath(Application.ExeName);
     {cConfigFile := cLogDir.caption + copy(aComp[cbSelComp.itemindex],pos(';',aComp[cbSelComp.itemindex])+1,length(aComp[cbSelComp.itemindex]));}
    if paramstr(1)<>'' then
        cConfigfile := cApplicationpath + '\' + paramstr(1)
    else
        cConfigfile := cApplicationpath +  'local.ini';
    aConfig := tStringlist.create;
    aConfig.LoadFromFile(cConfigFile);
    For I := 0 to (aConfig.Count-1) do
    Begin
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'SQLDB' then
         begin
              cDatabase := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'SQLSRV' then
         begin
              cServer := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'PASSWORD' then
         begin
              cPassWord := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'LOGIN' then
         begin
              cLogIn := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
    end;

    //sqlServer.connected := false;
    //sqlServer.Database  := cDatabase;
    //sqlServer.Host      := cServer;
    //sqlServer.password  := cPassWord;
    //sqlServer.connected := true;

    adoConnection1.close;
    adoConnection1.connectionstring := 'Provider=SQLNCLI11.1;' +
                                       'Persist Security Info=False;' +
                                       'User ID=sa;' +
                                       'password=' + cPassword + ';' +
                                       'Initial Catalog=' + cDatabase + ';' +
                                       'Data Source=' + cServer + ';' +
                                       'Use Procedure for Prepare=1;' +
                                       'Auto Translate=True;' +
                                       'Packet Size=4096;' +
                                 //      'Workstation ID=PAYROLL_SERVER;' +
                                       'Initial File Name="";' +
                                       'Use Encryption for Data=False;' +
                                       'Tag with column collation when possible=False;' +
                                       'MARS Connection=False;' +
                                       'DataTypeCompatibility=0;' +
                                       'Trust Server Certificate=False;' +
                                       'Server SPN="' + '";' +
                                       'Application Intent=READWRITE';

    adoConnection1.Connected := true;


    ARForm(sender);


    {
    if paramstr(1)='SI-1' then
       ARForm(sender)
    else
       if paramstr(1)='SI-2' then
          ARForm(sender)
    else
       if paramstr(1)='DR' then
          ARForm(sender)
    }
end;



procedure TReport.ARForm(Sender: TObject);
var cDRNo,cTranCode : string;
    nFormType,nDecimal : integer;
begin
  try
     //adoConnection1.close;
     //adoConnection1.connectionstring := 'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;password=payroll;' +
     //                                   'Initial Catalog=ARDB;Data Source=PAYROLL_SERVER\SMARTGUARD;Use Procedure for Prepare=1;Auto Translate=True;' +
     //                                   'Packet Size=4096;Workstation ID=PAYROLL_SERVER;Initial File Name="";Use Encryption for Data=False;Tag with column collation when possible=False;MARS Connection=False;DataTypeCompatibility=0;Trust Server Certificate=False;Server SPN="' + '";Application Intent=READWRITE';

     //adoConnection1.Connected := true;

     nFormType := 0; nDecimal := 0;

     cDRNo     := paramstr(2);
     cTranCode := paramstr(3);
     nFormType := strtoInt(paramstr(4));
     nDecimal  := strtoint(paramstr(5));

     if cdrno ='' then cDRNO := '07113';
     if cTranCode = '' then cTranCode:='01';
     if paramstr(4) = '' then nFormType:=0;
     if paramstr(5) = '' then nDecimal:=0;

     //showmessage('Printing TranCode ' + cTranCode);

     Application.icon.LoadFromFile('Compicon.ico');

     qryCompany.close;
     qryCompany.sql.clear;
     qryCompany.sql.add('select * from Setup');
     qryCompany.Open;

     qryreusable1.Close;
     qryreusable1.sql.clear;
     if (cTranCode='01') then
     begin
                  qryreusable1.sql.add('select salehd.custcode, Customer.CustName, SaleHd.SaleDate, Customer.Addr1,SaleHd.DRDate,Customer.Addr2, ' +
                   ' SaleDet.DeliverQty, Product.UnitMeas, SaleDet.ProdCode, Product.ProdName, SaleDet.TaxAmt, SaleDet.Purchno, ' +
                   ' Customer.TinNo, Customer.BusinessStyle, SaleDet.DRNo, SaleHd.Remark1, SaleHd.Remark2, SaleHd.Remark3, SaleHd.Remark4, SaleDet.RemarkDet, Currency.CurrencySign,Customer.Vat, ' +
                   ' SaleDet.UnitPrice, SaleDet.GrossAmt, saleHd.PONO, customer.draddr1,customer.draddr2,Customer.drcustname, Customer.DRBusinessStyle ' +
                   ' from SaleHd,SaleDet,Customer,Product,Currency  ' +
                   ' where (SaleHd.DRNo=SaleDet.DRNo) ' +
                   ' and (salehd.custcode = customer.custcode) ' +
                   ' and (saledet.prodcode = product.prodcode) ' +
                   ' and (SaleDet.CurrencyCode=Currency.CurrencyCode) ' +
                   ' and (SaleDet.Drno = ''' + cDRNo + ''')');
     end
     else
     begin

                  qryreusable1.sql.add('select saleHd.custcode, Customer.CustName, SaleHd.SaleDate, Customer.Addr1,SaleHd.DRDate,Customer.Addr2, ' +
                   ' SaleDet.DeliverQty, SaleDet.ProdCode, SaleDet.TaxAmt, SaleDet.Purchno, ' +
                   ' Customer.TinNo, Customer.BusinessStyle, SaleDet.DRNo, SaleHd.Remark1, SaleHd.Remark2, SaleHd.Remark3, SaleHd.Remark4, SaleDet.RemarkDet, Currency.CurrencySign,Customer.Vat, ' +
                   ' SaleDet.UnitPrice, SaleDet.GrossAmt, saleHd.PONO, ''' +  'pcs' + ''' as UnitMeas '+
                   ' from SaleHd,SaleDet,Customer,Currency,customer.draddr1,customer.draddr2,customer.drcustname,Customer.BusinessStyle ' +
                   ' where (SaleHd.DRNo=SaleDet.DRNo) ' +
                   ' and (salehd.custcode = customer.custcode) ' +
                   ' and (SaleDet.CurrencyCode=Currency.CurrencyCode) ' +
                   ' and (SaleDet.Drno = ''' + cDRNo + ''')');
     end ;

     if qryCompany.FieldByName('PrintingType').asstring='1' then
     begin
        qryreusable1.open;

        qryCustomer.close;
        qryCustomer.sql.clear;
        qryCustomer.sql.add('select * from Customer where (custcode = ''' + qryreusable1.fieldbyname('custcode').asstring+''')');
        qryCustomer.open;

        //SI
        if (nFormType = 0) then
        begin
           //showmessage('SI');
           //SysLog(aSyslog,cLogFile,'SI No : ' + qryreusable1.fieldbyname('SaleInv').asstring + ' printing.');

           if (cTranCode = '01') then
           begin
              SIForm.Page.LeftMargin := qryCompany.fieldbyname('SILeftMargin').asinteger;
              PageHeaderBand1.Height := qryCompany.fieldbyname('SIHDHeight').asinteger;
              DetailBand1.Height     := qryCompany.fieldbyname('SIHeight').asinteger;
              SIColHd1.Height        := qryCompany.fieldbyname('SIColHdHeight').asinteger;
              SIFooter1.Height       := qryCompany.fieldbyname('SIFooterHeight').asinteger;

              qryFormSettings.close;
              qryFormSettings.sql.clear;
              qryFormSettings.sql.add('select * from tblRepSetup ' +
                      ' where (RepCode = ''' + '00001' + ''')' +
                      ' and (FormCode = ''' + qryCustomer.fieldbyname('FormCode').asstring + ''')');
              qryFormSettings.open;
              qryFormSettings.First;
              while not qryFormSettings.eof do
              begin
                 if (qryFormSettings.FieldByName('fieldcode').asstring='01') then
                 begin
                    qreCustName.font.size:= qryFormSettings.fieldbyname('Fontsize').asinteger;
                    qreCustName.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                    qreCustName.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='02') then
                 begin
                    qreAdd1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                    qreAdd1.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                    qreAdd1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='03') then
                 begin
                    qreTinNo.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                    qreTinNo.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                    qreTinNo.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='04') then
                 begin
                    qreSIDate.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                    qreSIDate.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                    qreSIDate.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='05') then
                 begin
                    qreDRNo.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                    qreDRNo.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                    qreDRNo.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='06') then
                 begin
                    qreDeliverQty.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                    qreDeliverQty.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                    qreDeliverQty.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
                 begin
                            qreUnit.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreUnit.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreUnit.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='08') then
                 begin
                            qreProdCode.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreProdCode.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreProdCode.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='09') then
                 begin
                            qreprodname.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreProdName.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreProdName.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='10') then
                 begin
                             qreUnitPrice.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreUnitPrice.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreUnitPrice.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='11') then
                 begin
                            qreGross.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreGross.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreGross.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='12') then
                 begin
                            qreTotGross1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotGross1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotGross1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='13') then
                 begin
                         qreTotGross2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotGross2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotGross2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='14') then
                 begin
                            qreTotTax.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotTax.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotTax.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='15') then
                 begin
                            qreTotNet.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotNet.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotNet.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='16') then
                 begin
                            qreAdd2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreAdd2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreAdd2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
                 begin
                            qreBussStyle.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreBussStyle.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreBussStyle.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='18') then
                 begin
                            qreRemark1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreRemark1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreRemark1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='19') then
                 begin
                            qreRemark2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreRemark2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreRemark2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='20') then
                 begin
                            qreTotSales.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotSales.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotSales.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='21') then
                 begin
                            qreLessVat.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreLessVat.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreLessVat.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='22') then
                 begin
                            qreZeroRatedSales.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreZeroRatedSales.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreZeroRatedSales.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='23') then
                 begin
                            qreVatSales.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreVatSales.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreVatSales.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='24') then
                 begin
                            qreZeroRated.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreZeroRated.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreZeroRated.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='25') then
                 begin
                            qreVatAmt.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreVatAmt.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreVatAmt.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='26') then
                 begin
                            qreCurrencya1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCurrencya1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCurrencya1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='27') then
                 begin
                            qreCurrencya2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCurrencya2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCurrencya2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='28') then
                 begin
                            qreCurrencya3.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCurrencya3.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCurrencya3.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='29') then
                 begin
                           qrePO.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qrePO.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qrePO.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;

                 if nDecimal=1 then
                 begin

                            qreUnitPrice.Expression := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''',UnitPrice*1.12), FormatNumeric(''' + '#,##0.00' +''',UnitPrice))';
                            qreGross.Expression     := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''', GrossAmt*1.12), FormatNumeric(''' + '#,##0.00' +''',GrossAmt ))';

                            qreTotSales.Expression  := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt+qryreusable1.taxamt))';
                            qreLessVat.Expression   := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.taxamt))';
                            qreTotGross1.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt))';
                            qreTotGross2.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt))';
                            qreTotTax.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.taxamt))';
                            qreTotNet.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt+qryreusable1.taxamt))';

                            qreVatSales.Expression       := 'IF(qryreusable1.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt)),''' + '' + ''')';
                            qreZeroRated.Expression      := 'IF(qryreusable1.TaxAmt=0,formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt)),''' + '' + ''')';
                            qreVatAmt.Expression         := 'IF(qryreusable1.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.TaxAmt)  ),''' + '' + ''')';
                 end;
                 qryFormSettings.next;
              end;
              SIForm.preview;
           end
           else
           begin
              qryCompany.close;
              qryCompany.sql.clear;
              qryCompany.sql.add('select * from Setuo');
              qryCompany.open;

              SIForm2.Page.LeftMargin  := qryCompany.fieldbyname('SILeftMargin').asinteger;
              PageHeaderBand2.Height   := qryCompany.fieldbyname('SIHDHeight').asinteger;
              DetailBand2.Height       := qryCompany.fieldbyname('SIHeight').asinteger;
              //SIColHd2.Height        := qryCompany.fieldbyname('SIColHdHeight').asinteger;
              SIColHd2.Height        := qryCompany.fieldbyname('SIColHdHeight').asinteger;
              SIFooter2.Height       := qryCompany.fieldbyname('SIFooterHeight').asinteger;


              qrycompany.close;

              qryFormSettings.close;
              qryFormSettings.SQL.clear;
              qryFormsettings.sql.add('select * from tblRepSetup where (repcode=''' + '00001' + ''')' +
                      ' and (FormCode = ''' + qryCustomer.fieldbyname('FormCode').asstring + ''')');
              qryFormSettings.open;
              qryFormSettings.First;
              while not qryFormSettings.eof do
              begin
                 if (qryFormSettings.FieldByName('fieldcode').asstring='01') then
                 begin
                            qreCustName2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCustName2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCustName2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='02') then
                 begin
                            qreAdd12.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreAdd12.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreAdd12.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='03') then
                 begin
                            qreTinNo2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTinNo2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTinNo2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='04') then
                 begin
                            qreSIDate2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreSIDate2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreSIDate2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='05') then
                 begin
                            qreDRNo2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRNo2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRNo2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='06') then
                 begin
                            qreSIDRQty2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreSIDRQty2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreSIDRQty2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
                 begin
                            qreUnit2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreUnit2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreUnit2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='08') then
                 begin
                            qreRemarkDet2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreRemarkDet2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreRemarkDet2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='10') then
                 begin
                            qreUnitPrice2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreUnitPrice2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreUnitPrice2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='11') then
                 begin
                            qreGross2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreGross2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreGross2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='12') then
                 begin
                            qreTotGross12.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotGross12.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotGross12.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='13') then
                 begin
                            qreTotGross22.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotGross22.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotGross22.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='14') then
                 begin
                            qreTotTax2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotTax2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotTax2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='15') then
                 begin
                            qreTotNet2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotNet2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotNet2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='16') then
                 begin
                            qreAdd22.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreAdd22.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreAdd22.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
                 begin
                            qreBussStyle2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreBussStyle2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreBussStyle2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='18') then
                 begin
                            qreRemark12.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreRemark12.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreRemark12.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='19') then
                 begin
                            qreRemark22.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreRemark22.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreRemark22.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='20') then
                 begin
                            qreTotSales2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreTotSales2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreTotSales2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='21') then
                 begin
                            qreLessVat2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreLessVat2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreLessVat2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='22') then
                 begin
                            qreZeroRatedSales2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreZeroRatedSales2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreZeroRatedSales2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='23') then
                 begin
                            qreVatSales2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreVatSales2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreVatSales2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='24') then
                 begin
                            qreZeroRated2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreZeroRated2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreZeroRated2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='25') then
                 begin
                            qreVatAmt2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreVatAmt2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreVatAmt2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='26') then
                 begin
                            qreCurrencyb1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCurrencyb1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCurrencyb1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='27') then
                 begin
                            qreCurrencyb2.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCurrencyb2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCurrencyb2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if (qryFormSettings.FieldByName('fieldcode').asstring='28') then
                 begin
                            qreCurrencyb3.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreCurrencyb3.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreCurrencyb3.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                 end;
                 if nDecimal=1 then
                 begin

                            qreUnitPrice2.Expression := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''',UnitPrice*1.12), FormatNumeric(''' + '#,##0.00' +''',UnitPrice))';
                            qreGross2.Expression     := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''', GrossAmt*1.12), FormatNumeric(''' + '#,##0.00' +''',GrossAmt ))';

                            qreTotSales2.Expression  := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt+qryreusable1.taxamt))';
                            qreLessVat2.Expression   := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.taxamt))';
                            qreTotGross12.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt))';
                            qreTotGross22.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt))';
                            qreTotTax2.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.taxamt))';
                            qreTotNet2.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt+qryreusable1.taxamt))';

                            qreVatSales2.Expression       := 'IF(qryreusable1.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt)),''' + '' + ''')';
                            qreZeroRated2.Expression      := 'IF(qryreusable1.TaxAmt=0,formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.grossamt)),''' + '' + ''')';
                            qreVatAmt2.Expression         := 'IF(qryreusable1.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qryreusable1.TaxAmt)  ),''' + '' + ''')';
                 end;

                 qryFormSettings.next;
              end;
              qryFormSettings.close;
              SIForm2.preview;
           end;
        end
        //DR
        else if nFormType = 1 then  {DR FORM}
        begin
           //SysLog(aSyslog,cLogFile,'DR No ' + qryreusable1.fieldbyname('DRNo').asstring + ' printing.');
           //showmessage('DR');
           if cTrancode = '01' then
           begin
                      qreDRProdCode1.enabled := true;
                      qreDRProdName1.enabled := true;
                      qreDRRemarkDet1.enabled:= false;
           end
           else
           begin
                      qreDRProdCode1.enabled := false;
                      qreDRProdName1.enabled := false;
                      qreDRREmarkDet1.enabled:= true;
           end;
           qryCompany.close;
           qryCompany.sql.clear;
           qryCompany.sql.add('select * from Setup');
           qryCompany.Open;

           DRForm.Page.LeftMargin  := qryCompany.fieldbyname('DRLeftMargin').asinteger;
           DRPgHeader.Height       := qryCompany.fieldbyname('DRHDHeight').asinteger;
           DRDetail.Height         := qryCompany.fieldbyname('DRHeight').asinteger;
           //DRColHd.Height        := qryCompany.fieldbyname('DRColHdHeight').asinteger;
           DRColHd.Height        := qryCompany.fieldbyname('DRColHdHeight').asinteger;
           DRFooter.Height       := qryCompany.fieldbyname('DRFooterHeight').asinteger;

           qrycompany.close;

           qryFormsettings.close;
           qryFormSettings.SQL.clear;
           qryFormsettings.sql.add('select * from tblRepSetup where (repcode='''+'00002' + ''')' +
                  ' and (FormCode = ''' + qryCustomer.fieldbyname('FormCode').asstring + ''')');
           qryFormSettings.open;
           qryFormSettings.First;
           while not qryFormSettings.eof do
           begin
              if (qryFormSettings.FieldByName('fieldcode').asstring='01') then
              begin
                            qreDRCustName1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRCustName1.Top  := qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDrCustName1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='02') then
              begin
                            qreDRAdd11.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRAdd11.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRAdd11.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='03') then
              begin
                            qreDRTinNo1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRTinNo1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRTinNo1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='04') then
              begin
                            qreDRDRDate1.font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRDRDate1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRDRDate1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='05') then
              begin
                            qreDRQty1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRQty1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRQty1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='06') then
              begin
                            qreDRUnit1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRUnit1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRUnit1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
              begin
                            qreDRProdCode1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRProdCode1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRProdCode1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
              begin
                            qreDRRemarkDet1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRRemarkDet1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRRemarkDet1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='08') then
              begin
                            qreDRprodname1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRProdName1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRProdName1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='09') then
              begin
                            qreDRPONo1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRPONo1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRPONo1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
              begin
                            qreDRBussSTyle1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRBussStyle1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDrBussStyle1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='16') then
              begin
                            qreDRAdd21.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRAdd21.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRAdd21.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
              begin
                            qreDRBussStyle1.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRBussStyle1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRBussStyle1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='18') then
              begin
                            qreDRRem11.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRRem11.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRRem11.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              if (qryFormSettings.FieldByName('fieldcode').asstring='19') then
              begin
                            qreDRRem21.Font.size := qryFormSettings.fieldbyname('FontSize').asinteger;
                            qreDRRem21.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            qreDRRem21.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
              end;
              qryFormSettings.next;
           end;
           DRForm.Preview;
        end;
        qryreusable1.Close;
        qrycustomer.close;
     end
     else
     begin
           showmessage('AJS');
     end;
     qrycompany.close;
  //end;
  except
     on E : Exception do
       begin
         //syslog(aSyslog,cLogFile,qrySaleHd.fieldbyname('DRNo').asstring + ' Exception message = ' + e.Message);
     end
  end;
end;

procedure TReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Adoconnection1.Close;
end;


end.
