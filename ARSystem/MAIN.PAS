unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, db, DBTables, Grids, DBGrids;

type
  TARMenu = class(TForm)
    MainMenu1: TMainMenu;
    FILE1: TMenuItem;
    ransaction1: TMenuItem;
    Report1: TMenuItem;
    System1: TMenuItem;
    Cleanup1: TMenuItem;
    Exit1: TMenuItem;
    Customer1: TMenuItem;
    Stock1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Import1: TMenuItem;
    Customer2: TMenuItem;
    Stock2: TMenuItem;
    PurchaseOrder1: TMenuItem;
    Delivery1: TMenuItem;
    Payments1: TMenuItem;
    PO1: TMenuItem;
    Sales1: TMenuItem;
    PerProduct1: TMenuItem;
    PerBatch1: TMenuItem;
    PurchaseOrderBalance1: TMenuItem;
    Deliveries1: TMenuItem;
    SalesInvoice1: TMenuItem;
    Payments2: TMenuItem;
    MasterList1: TMenuItem;
    SalesSummary1: TMenuItem;
    MasterList2: TMenuItem;
    Product1: TMenuItem;
    Customer3: TMenuItem;
    PerDate1: TMenuItem;
    PerPONo1: TMenuItem;
    Sales2: TMenuItem;
    Payments3: TMenuItem;
    Adjustment1: TMenuItem;
    StaticText2: TStaticText;
    Label3: TLabel;
    Utility1: TMenuItem;
    UpdatePaymenthd1: TMenuItem;
    POSIDR1: TMenuItem;
    CopyDatabase1: TMenuItem;
    ImportDatabase1: TMenuItem;
    CompanySetup1: TMenuItem;
    UpdatePayment1: TMenuItem;
    AddSIandDRwithA1: TMenuItem;
    ransferDetailTransaction1: TMenuItem;
    ransferHeaderTransaction1: TMenuItem;
    ListDR1: TMenuItem;
    CompareDR1: TMenuItem;
    DatabaseImport1: TMenuItem;
    MySQL1: TMenuItem;
    MSSQL1: TMenuItem;
    procedure Customer1Click(Sender: TObject);
    procedure Stock1Click(Sender: TObject);
    procedure Customer2Click(Sender: TObject); 
    procedure Stock2Click(Sender: TObject);
    procedure PurchaseOrder1Click(Sender: TObject);
    procedure Delivery1Click(Sender: TObject);
    procedure PO1Click(Sender: TObject);
    procedure Payments1Click(Sender: TObject);
    procedure Sales1Click(Sender: TObject);
    procedure PerProduct1Click(Sender: TObject);
    procedure PerBatch1Click(Sender: TObject);
    procedure PurchaseOrderBalance1Click(Sender: TObject);
    procedure PerDate1Click(Sender: TObject);
    procedure Sales2Click(Sender: TObject);
    procedure PerPONo1Click(Sender: TObject);
    procedure SalesInvoice1Click(Sender: TObject);
    procedure Payments2Click(Sender: TObject);
    procedure Payments3Click(Sender: TObject);
    procedure Adjustment1Click(Sender: TObject);
    procedure MasterList1Click(Sender: TObject);
    procedure SalesSummary1Click(Sender: TObject);
    procedure Product1Click(Sender: TObject);
    procedure Customer3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure UpdatePaymenthd1Click(Sender: TObject);
    procedure POSIDR1Click(Sender: TObject);
    procedure CopyDatabase1Click(Sender: TObject);
    procedure CompanySetup1Click(Sender: TObject);
    procedure UpdatePayment1Click(Sender: TObject);
    procedure AddSIandDRwithA1Click(Sender: TObject);
    procedure ransferDetailTransaction1Click(Sender: TObject);
    procedure ransferHeaderTransaction1Click(Sender: TObject);
    procedure ListDR1Click(Sender: TObject);
    procedure CompareDR1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure MySQL1Click(Sender: TObject);
    procedure MSSQL1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ARMenu: TARMenu;
  aSysLog:tStringlist;
  cLogFile:string;

implementation

uses pARData, pUPDDRHd, pUPDPayHd,
  pUpdCust, pUpdStock, pUpdPOHd, pUpdPOHd1, pDlgParam2, pRptHold,
  pDlgParam3, pDlgParam4, pDlgParam5, pCopyForm, pCompSetup, BrowUtilDRDet,
  pBrowUtilDRHd, pListDR, pBrowCompare, pARForm;

{$R *.dfm}

procedure TARMenu.Customer1Click(Sender: TObject);
begin
    with dmardata do
    begin
          qryCustomer.close;
          qryCustomer.sql.clear;
          qryCustomer.sql.add('select * from customer');
          qryCustomer.open;

          qryCurrency.close;
          qryCurrency.sql.clear;
          qryCurrency.sql.add('select * from Currency');
          qryCurrency.Open;

          qryListForm.close;
          qryListForm.sql.clear;
          qryListForm.sql.add('select formCode from tblRepSetUp ' +
          ' group by formcode '+
          ' order by formcode ');
          qryListForm.open;


          UpdCust := tUpdCust.Create(application);
          UpdCust.showmodal;
          UpdCust.free;

          qryCustomer.close;
          qryCurrency.close;
          qryListform.Close;

    end;
end;

procedure TARMenu.Stock1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryCustomer.close;
         qryCustomer.sql.clear;
         qryCustomer.sql.add('select * from customer');
         qryCustomer.open;

         qryStock.close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from Product');
         qryStock.open;

         UpdStock := tUpdStock.Create(application);
         UpdStock.showmodal;
         UpdStock.free;

         qrycustomer.close;
         qrystock.close;

    end;
end;

procedure TARMenu.Customer2Click(Sender: TObject);
begin
   {
    with dmardata do
    begin
         tCustomer.EmptyTable;
         tcustomer.Open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from customer.dbf');
         qryreusable1.open;
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tcustomer.first;
              tcustomer.append;
              tcustomer.fieldbyname('custcode').asstring := qryreusable1.fieldbyname('custcode').asstring;
              tcustomer.fieldbyname('custname').asstring  := qryreusable1.fieldbyname('custname').asstring;
              tcustomer.fieldbyname('phoneno').asstring   := qryreusable1.fieldbyname('phoneno').asstring;
              tcustomer.fieldbyname('addr1').asstring     := qryreusable1.fieldbyname('addr1').asstring;
              tcustomer.fieldbyname('addr2').asstring     := qryreusable1.fieldbyname('addr2').asstring;
              tcustomer.fieldbyname('addr3').asstring     := qryreusable1.fieldbyname('addr3').asstring;
              tcustomer.fieldbyname('contperson').asstring:= qryreusable1.fieldbyname('contperson').asstring;
              tcustomer.fieldbyname('vat').asstring       := qryreusable1.fieldbyname('vat').asstring;
              tcustomer.post;
              qryreusable1.Next;
         end;
         tcustomer.close;
         qryreusable1.close;
         showmessage('Importing completed...');
    end;
    }
end;

procedure TARMenu.Stock2Click(Sender: TObject);
begin
  {
   with dmardata do
    begin
         tStock.EmptyTable;
         tStock.Close;
         tStock.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from product.dbf');
         qryreusable1.open;
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tstock.append;
              tstock.fieldbyname('prodcode').asstring:=qryreusable1.fieldbyname('prodcode').asstring;
              tstock.fieldbyname('prodname').asstring   := qryreusable1.fieldbyname('prodname').asstring;
              tstock.fieldbyname('saleprice').asstring  := qryreusable1.fieldbyname('salepri').asstring;
              tstock.fieldbyname('custcode').asstring   := qryreusable1.fieldbyname('custcode').asstring;
              tstock.fieldbyname('unitmeas').asstring   := qryreusable1.fieldbyname('unitmeas').asstring;
              tstock.post;
              qryreusable1.Next;
         end;
         tStock.close;
         qryreusable1.close;
         showmessage('Importing completed...');
    end;
   }
end;

procedure TARMenu.PurchaseOrder1Click(Sender: TObject);
begin
    {
    with dmardata do
    begin
         qryListPOHd.close;
         qryListPOHd.sql.clear;
         qryListPOHd.sql.add('select * from purchhd,customer where purchhd.custcode=customer.custcode');
         qryListPOHd.sql.add('order by purchhd.purchno');
         qryListPOHd.open;
         qrylistpohd.Last;

         qrylistpodet.close;
         qrylistpodet.sql.clear;
         qrylistpodet.sql.add('select * from purchdet,product where (purchdet.prodcode=product.prodcode)');
         qrylistpodet.sql.add('and (purchdet.purchno=''' + qrylistpohd.fieldbyname('purchno').asstring + ''')');
         qrylistpodet.open;

         BrowPO := tBrowPO.Create(application);
         BrowPO.showmodal;
         BrowPO.free;
         qryListPOHd.close;
    end;}
end;

procedure TARMenu.Delivery1Click(Sender: TObject);
begin
    with dmardata do
    begin
         aSyslog  := tstringlist.create;
         cLogFile := 'Log'+FormatdateTime('YYYYMMDDhhnn',Date+time)+'.txt';

         qryCustomer.close;
         qryCustomer.sql.clear;
         qryCustomer.sql.add('select * from Customer order by custname');
         qrycustomer.open;

         qryTranType.close;
         qryTrantype.sql.clear;
         qryTrantype.sql.add('select * from Trantype');
         qryTranType.Open;

         qrySaleHd.close;
         qrySaleHd.sql.clear;
         qrySalehd.sql.add('select * from salehd');
         qrySalehd.Open;
         qrySaleHd.Last;

         qryCurrency.close;
         qryCurrency.sql.clear;
         qryCurrency.sql.Add('select * from Currency');
         qryCurrency.Open;

         UpdDRHd := tUpdDRHd.create(application);
         UpdDRHd.showmodal;
         UpdDRHd.free;

         qrycustomer.close;
         qryTranType.close;
         qrySaleHd.close;
         qryCurrency.close;

         aSysLog.free;

    end;
end;

procedure TARMenu.PO1Click(Sender: TObject);
begin
   {
    with dmardata do
    begin
         tPOHd.EmptyTable;
         tpohd.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from purchhd.dbf');
         qryreusable1.open;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tpohd.first;
              tpohd.append;
              tpohd.fieldbyname('purchno').asstring:=qryreusable1.fieldbyname('purchno').asstring;
              tpohd.fieldbyname('purchno').asstring    := qryreusable1.fieldbyname('purchno').asstring;
              tpohd.fieldbyname('purchdate').asstring  := qryreusable1.fieldbyname('purchdate').asstring;
              tpohd.fieldbyname('custcode').asstring   := qryreusable1.fieldbyname('custcode').asstring;
              tpohd.fieldbyname('termcode').asstring   := qryreusable1.fieldbyname('termcode').asstring;
              tpohd.fieldbyname('drdate').asdatetime   := qryreusable1.fieldbyname('drdate').asdatetime;
              tpohd.fieldbyname('status').asstring     := qryreusable1.fieldbyname('status').asstring;
              tpohd.post;
              statictext2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.Next;
         end;
         tpohd.close;
         qryreusable1.close;

         tPODet.EmptyTable;
         tpodet.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from purchdet.dbf');
         qryreusable1.open;
         qryreusable1.first;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));
         while not qryreusable1.Eof do
         begin
              tpodet.append;
              tpodet.fieldbyname('purchno').asstring :=qryreusable1.fieldbyname('purchno').asstring;
              tpodet.fieldbyname('prodcode').asstring:=qryreusable1.fieldbyname('prodcode').asstring;
              tpodet.fieldbyname('unitprice').asfloat  := qryreusable1.fieldbyname('unitprice').asfloat;
              tpodet.fieldbyname('grossamt').asfloat   := qryreusable1.fieldbyname('grossamt').asfloat;
              tpodet.fieldbyname('taxamt').asfloat     := qryreusable1.fieldbyname('taxamt').asfloat;
              tpodet.fieldbyname('netamt').asfloat     := qryreusable1.fieldbyname('netamt').asfloat;
              tpodet.fieldbyname('orderqty').asfloat   := qryreusable1.fieldbyname('orderqty').asfloat;
              tpodet.fieldbyname('deliverqty').asfloat:= qryreusable1.fieldbyname('deliverqty').asfloat;
              tpodet.fieldbyname('lastqty').asfloat    := qryreusable1.fieldbyname('lastqty').asfloat;
              tpodet.post;
              statictext2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.Next;
         end;
         tpodet.close;
         qryreusable1.close;
         showmessage('Importing completed...');
    end;
    }
end;

procedure TARMenu.Payments1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryCustomer.close;
         qryCustomer.sql.clear;
         qryCustomer.sql.add('select * from Customer order by custname');
         qryCustomer.Open;

         qryPayCusHd.close;
         qryPayCusHd.sql.clear;
         qryPayCusHd.sql.add('select * from PayCusHd');
         qryPayCusHd.Open;
         qryPayCusHd.Last;

         qryCurrency.Close;
         qryCurrency.sql.clear;
         qryCurrency.sql.add('select * from Currency');
         qryCurrency.Open;

         UpdPayHd := tUpdPayHd.create(application);
         UpdPayHd.showmodal;
         UpdPayHd.free;

         qryPayCusHd.close;
         qrycustomer.close;
         qryCurrency.close;
         
    end;
end;

procedure TARMenu.Sales1Click(Sender: TObject);
begin
    {
    dmardata.tSaleHd.open;
    dmardata.tSaleHd.close;
    }
end;

procedure TARMenu.PerProduct1Click(Sender: TObject);
begin
   with dmardata do
   begin
      qryPOHd.close;
      qryPOHd.sql.Clear;
      qryPOHd.sql.add('select * from PurchHd');
      qryPOhd.Open;
      qryPOHd.last;

      qryCustomer.close;
      qryCustomer.sql.clear;
      qryCustomer.sql.add('select * from Customer order by custname');
      qryCustomer.Open;

      qryCurrency.close;
      qryCurrency.sql.clear;
      qryCurrency.sql.add('select * from Currency');
      qryCurrency.open;

      UpdPOHd1 := tUpdPOHd1.create(application);
      UpdPOHd1.showmodal;
      UpdPOHD1.free;

      qryPOHd.close;
      qrycustomer.close;
      qrycurrency.close;
   end;
end;

procedure TARMenu.PerBatch1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryPOhd.sql.clear;
         qryPOHd.sql.add('select * from PurchHd ');
         qryPOHd.Open;

         qryCustomer.close;
         qryCustomer.sql.clear;
         qryCustomer.sql.add('Select * from Customer order by custname');
         qryCustomer.Open;

         qryPOdet.close;
         qryPODet.sql.add('select * from PurchDet');
         qryPODet.Open;

         qryStock.Close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from Product where (Custcode = ''' + qryCustomer.fieldbyname('custcode').asstring + ''') order by prodname');
         qryStock.Open;

         qryCurrency.close;
         qryCurrency.SQL.add('select * from Currency');
         qryCurrency.Open;

         qryPOHd.append;
         qryPODet.append;
         UpdPOHd := tUpdPOHd.create(application);
         UpdPOHd.showmodal;
         UpdPOHD.free;

         qryPOHd.close;
         qrycustomer.close;
         qryPODet.close;
         qrySTock.close;
         qryCurrency.close;
    end;
end;

procedure TARMenu.PurchaseOrderBalance1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qrylistrec.close;
         qrylistrec.sql.clear;
         qrylistrec.sql.add('select CustCode, CustName from customer');
         qrylistrec.sql.add('order by custcode');
         qrylistrec.open;
         dlgparam2 := tDlgParam2.create(application);
         dlgparam2.showmodal;
         if dlgparam2.ModalResult = mrok then
         begin
              qryreusable1.close;
              qryreusable1.SQL.clear;
              qryreusable1.sql.add('select * From PurchHd,PurchDet,Customer,Product ' +
                   ' Where (PurchHd.PurchNo=PurchDet.PurchNo) ' +
                   ' and (Purchhd.custcode = customer.custcode) ' +
                   ' and (PurchHd.CustCode = ''' + qryListRec.fieldbyname('CustCode').asstring + ''')' +
                   ' and (PurchDet.prodcode= product.prodcode) ' +
                   ' and (PurchDet.lastqty > 0)');
              qryreusable1.SQL.add('order by purchdet.prodcode');
              qryreusable1.Open;
              rpthold := trpthold.create(application);

              qryCompany.close;
              qryCompany.sql.clear;
              qryCompany.sql.add('select * from setup');
              qryCompany.open;

              rpthold.qrlCompname.caption := qryCompany.fieldbyname('CompName').asstring;
              qryCompany.close;
              RptHold.POBal.preview;
              rpthold.free;
              qryreusable1.close;
              qryCompany.close;
         end;
         dlgparam2.free;
         qrylistrec.Close;
    end;
end;

procedure TARMenu.PerDate1Click(Sender: TObject);
begin
    dlgparam3 := tdlgparam3.create(application);
    dlgparam3.showmodal;
    if dlgparam3.modalresult = mrok then
    begin
         with dmardata do
         begin
              qrylistrec.close;
              qrylistrec.sql.clear;
              qrylistrec.sql.add('select CustCode, CustName from customer');
              qrylistrec.sql.add('order by custcode');
              qrylistrec.open;
              dlgparam2 := tDlgParam2.create(application);
              dlgparam2.showmodal;
              if dlgparam2.ModalResult = mrok then
              begin
                   qryCompany.close;
                   qryCompany.sql.clear;
                   qryCompany.sql.add('select * from Setup');
                   qryCompany.Open;
                   qryreusable1.close;
                   qryreusable1.sql.clear;
                   qryreusable1.sql.add('select SaleDet.Prodcode,Product.prodname, SaleDet.DeliverQty,SaleHd.Drno,SaleHd.DRDate ' +
                        ' from Product,SaleHd,SaleDet ' +
                        ' Where (SaleHd.DRNo=SaleDet.DRNo) ' +
                        ' and (SaleDet.ProdCode=Product.ProdCode)');
                   qryreusable1.sql.add(' and (SaleHd.custcode = ''' + qrylistrec.fieldbyname('custcode').asstring + ''')');
                   qryreusable1.sql.add(' and (Salehd.DRDate >= ''' +  datetostr(dlgparam3.dStartDate.date) + ''')');
                   qryreusable1.sql.add(' and (SaleHd.DRDate <= ''' + datetostr(dlgparam3.dEndDate.date) + ''')');
                   qryreusable1.SQL.add('order by saledet.prodcode, product.prodname ');
                   qryreusable1.Open;
                   rpthold:= tRptHOld.create(application);
                   rpthold.QRLabel29.caption := qrylistrec.fieldbyname('custname').asstring;
                   rptHold.CompDelivery.Caption := qryCompany.fieldbyname('CompName').asstring;
                   rpthold.DeliveriesPerDate.preview;
                   rpthold.free;
                   qryreusable1.close;
                   qryCompany.close;
              end;
              qrylistrec.close;
              dlgparam2.free;
         end;
    end;
    dlgparam3.free;
end;

procedure TARMenu.Sales2Click(Sender: TObject);
begin
   {
   with dmardata do
    begin
         tSalehd.emptytable;
         tSaleHd.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from SaleHd.dbf');
         qryreusable1.open;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tSalehd.first;
              tSalehd.append;
              tSalehd.fieldbyname('DRNo').asstring:=qryreusable1.fieldbyname('DRno').asstring;
              tSalehd.fieldbyname('SaleDate').asDateTime := qryreusable1.fieldbyname('SaleDate').asdatetime;
              tSalehd.fieldbyname('SaleInv').asstring    := qryreusable1.fieldbyname('SaleInv').asstring;
              tSalehd.fieldbyname('TotGross').asfloat    := qryreusable1.fieldbyname('TotGross').asfloat;
              tSalehd.fieldbyname('TotPaid').asfloat     := qryreusable1.fieldbyname('TotPaid').asfloat;
              tSalehd.fieldbyname('LastBal').asfloat     := qryreusable1.fieldbyname('LastBal').asfloat;
              tSalehd.fieldbyname('LastPay').asdatetime  := qryreusable1.fieldbyname('LastPay').asdatetime;
              tSaleHd.fieldbyname('TermCode').asfloat    := qryreusable1.fieldbyname('TermCode').asfloat;
              tSaleHd.fieldbyname('custcode').asstring   := qryreusable1.fieldbyname('custcode').asstring;
              tSalehd.fieldbyname('TotTax').asfloat      := qryreusable1.fieldbyname('TotTax').asfloat;
              tSaleHd.fieldbyname('TotNet').asfloat      := qryreusable1.fieldbyname('TotNet').asfloat;
              tSaleHd.fieldbyname('ORNo').asstring       := qryreusable1.fieldbyname('ORNo').asstring;
              tSaleHd.fieldbyname('Status').asstring    := qryreusable1.fieldbyname('Status').asstring;
              tSaleHd.fieldbyname('DueDate').asdatetime  := qryreusable1.fieldbyname('DueDate').asdatetime;
              tSaleHd.fieldbyname('DRDate').asdatetime   := qryreusable1.fieldbyname('DRDate').asdatetime;
              tSaleHd.fieldbyname('AdjAmt').asfloat      := qryreusable1.fieldbyname('AdjAmt').asfloat;
              tSalehd.post;
              StaticText2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.Next;
         end;
         tSalehd.close;
         qryreusable1.close;

         tSaleDet.emptytable;
         tSaleDet.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from SaleDet.dbf');
         qryreusable1.open;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tSaleDet.first;
              tSaleDet.append;
              tSaleDet.fieldbyname('DRNo').asstring    :=qryreusable1.fieldbyname('DRNo').asstring;
              tSaleDet.fieldbyname('prodcode').asstring:=qryreusable1.fieldbyname('prodcode').asstring;
              tSaleDet.fieldbyname('SaleInv').asstring   := qryreusable1.fieldbyname('SaleInv').asstring;
              tSaleDet.fieldbyname('DeliverQty').asfloat := qryreusable1.fieldbyname('DeliverQty').asfloat;
              tSaleDet.fieldbyname('NetAmt').asfloat     := qryreusable1.fieldbyname('NetAmt').asfloat;
              tSaleDet.fieldbyname('TaxAmt').asfloat     := qryreusable1.fieldbyname('TaxAmt').asfloat;
              tSaleDet.fieldbyname('GrossAmt').asfloat   := qryreusable1.fieldbyname('GrossAmt').asfloat;
              tSaleDet.fieldbyname('UnitPrice').asfloat  := qryreusable1.fieldbyname('UnitPrice').asfloat;
              tSaleDet.fieldbyname('UnitMeas').asstring  := qryreusable1.fieldbyname('UnitMeas').asstring;
              tSaleDet.fieldbyname('PurchNo').asstring   := qryreusable1.fieldbyname('Purchno').asstring;
              tSaleDet.post;
              StaticText2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.Next;
         end;
         tSaleDet.close;
         qryreusable1.close;
         showmessage('Importing completed...');
    end;
    }

end;

procedure TARMenu.PerPONo1Click(Sender: TObject);
begin
    dlgparam4 := tdlgparam4.create(application);
    dlgparam4.showmodal;
    if dlgparam4.modalresult = mrok then
    begin
         with dmardata do
         begin
                   qryreusable1.close;
                   qryreusable1.sql.clear;
                   qryreusable1.sql.add('select * from PurchHd,Customer ' +
                        ' Where (PurchNo = ''' + dlgparam4.edPONo.text + ''')' +
                        ' and (PurchHd.custcode=Customer.custcode)');
                   qryreusable1.Open;
                   if qryreusable1.RecordCount > 0 then
                   begin
                        qryCompany.close;
                        qryCompany.sql.clear;
                        qryCompany.sql.add('select * from setup');
                        qryCompany.open;

                        rpthold := trpthold.Create(application);
                        rpthold.c1HD03.caption  := qryCompany.fieldbyname('compname').asstring;
                        rpthold.c2HD03.caption  := 'DELIVERIES PER PO SUMMARY REPORT';
                        rpthold.c3HD03.caption  := 'as of ' + datetostr(date);
                        rpthold.c4HD03.caption  := 'LO Number : ' + dlgparam4.edPONo.text + '     Customer : ' + qryreusable1.fieldbyname('custcode').asstring + ' - ' + qryreusable1.fieldbyname('CustName').asstring;
                        rpthold.c5HD03.caption  := 'LO Date   : ' + datetostr(qryreusable1.fieldbyname('purchdate').asdatetime);
                        qryreusable1.close;
                        qryreusable1.sql.clear;
                        qryreusable1.sql.add('Select PurchDet.ProdCode, Product.ProdName,PurchDet.OrderQty, ' +
                             ' SaleHd.DRNo, SaleHd.DRDate, SaleDet.DeliverQty ' +
                             ' From PurchDet,SaleDet,Product,SaleHd ' +
                             ' Where (PurchDet.prodcode=Product.Prodcode) ' +
                             ' and (SaleDet.prodcode=PurchDet.prodcode) ' +
                             ' and (SaleHd.DRNo = SaleDet.DRNo) ' +
                             ' and (PurchDet.PurchNo=SaleDet.PurchNo) ' +
                             ' and (PurchDet.PurchNo = ''' + dlgparam4.edPONo.Text + ''')' +
                             ' Order by prodname');
                        qryreusable1.Open;
                        rpthold.DeliveriesPerPO.preview;
                        rpthold.free;
                        qryreusable1.close;
                        qryCompany.close;
                   end;
         end;
    end;
    dlgparam4.free;

end;

procedure TARMenu.SalesInvoice1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qrylistrec.close;
         qrylistrec.sql.clear;
         qrylistrec.sql.add('select CustCode, CustName from customer');
         qrylistrec.sql.add('order by custcode');
         qrylistrec.open;
         dlgparam2 := tDlgParam2.create(application);
         dlgparam2.showmodal;
         if dlgparam2.ModalResult = mrok then
         begin
              dlgparam3 := tdlgparam3.Create(application);
              dlgparam3.cbIncDR.Enabled := true;
              dlgparam3.ShowModal;
              if dlgparam3.ModalResult = mrok then
              begin
                   qryCompany.close;
                   qryCompany.sql.clear;
                   qryCompany.sql.add('select * from setup');
                   qryCompany.open;

                   qryCompany.Open;
                   qryreusable1.close;
                   qryreusable1.SQL.clear;
                   qryreusable1.sql.add('select * From SaleHd ' +
                        ' Where (SaleHd.CustCode = ''' + qryListRec.fieldbyname('CustCode').asstring + ''')');
                   qryreusable1.sql.add(' and (Salehd.SaleDate >= ''' +  datetostr(dlgparam3.dStartDate.date) + ''')');
                   qryreusable1.sql.add(' and (SaleHd.SaleDate <= ''' + datetostr(dlgparam3.dEndDate.date) + ''')');

                   qryreusable1.Open;
                   if qryreusable1.RecordCount > 0 then
                   begin
                        rpthold := trpthold.Create(application);
                        if dlgparam3.cbIncDR.Checked = false then
                        begin
                            rpthold.QRLabel30.Caption := '';
                            rpthold.qrexpr54.Expression := '';
                        end;
                        rpthold.c1HD04.caption  := qryListRec.fieldbyname('CustName').asstring;
                        rpthold.C2HD04.Caption  := datetostr(date());
                        rpthold.c3HD04.caption  := 'RECEIVED FROM ' + trim(qryCompany.FieldByName('compname').asstring) +  ' THE ';
                        rpthold.c4HD04.caption  := 'FOLLOWING ORIG'''+'L. INVOICES: ';
                        rpthold.c5HD04.caption  := 'FOR COUNTER... ';
                        rpthold.c6HD04.caption  := 'page ';
                        RptHold.RPTSalesInv.preview;
                        rpthold.free;
                   end;
                   qryreusable1.close;
                   qryCompany.close;
              end;
         end;
         dlgparam2.free;
         qrylistrec.Close;
    end;
end;


procedure TARMenu.Payments2Click(Sender: TObject);
begin
    dlgparam3 := tdlgparam3.create(application);
    dlgparam3.showmodal;
    if dlgparam3.modalresult = mrok then
    begin
         with dmardata do
         begin
                   qryreusable1.close;
                   qryreusable1.sql.clear;
                   qryreusable1.sql.add('select PayDate,ORNo,CheckNo,Invamt,AdjAmt,Taxamt,CheckAmt,CustName,Bank ' +
                        ' from PayCusHd,Customer ' +
                        ' Where (PayCusHd.CustCode=Customer.CustCode)');
                   qryreusable1.sql.add(' and (PayDate >= ''' +  datetostr(dlgparam3.dStartDate.date) + ''')');
                   qryreusable1.sql.add(' and (PayDate <= ''' + datetostr(dlgparam3.dEndDate.date) + ''')');
                   qryreusable1.SQL.add('order by CustName ');
                   qryreusable1.Open;
                   if qryreusable1.RecordCount > 0 then
                   begin
                        qryCompany.close;
                        qryCompany.sql.clear;
                        qryCompany.sql.add('select * from setup');
                        qryCompany.open;
                        rpthold:= tRptHOld.create(application);
                        rpthold.c1HD05.caption  := 'Page : ';
                        rpthold.C2HD05.Caption  := qryCompany.fieldbyname('CompName').asstring;
                        rpthold.c3HD05.caption  := 'CUSTOMER PAYMENTS ';
                        rpthold.c4HD05.caption  := 'From: ' + datetostr(dlgparam3.dStartDate.date) + ' - To: ' + datetostr(dlgparam3.dEndDate.date);
                        rpthold.RptPayments.preview;
                        rpthold.free;
                        qryCompany.close;
                   end
                   else
                      showmessage('No records found.');
                   qryreusable1.close;
         end;
    end;
    dlgparam3.free;
end;



procedure TARMenu.Payments3Click(Sender: TObject);
begin
   {
   with dmardata do
    begin
         qrypayCushd.EmptyTable;
         tPayCusHd.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from PayCusHd.dbf');
         qryreusable1.open;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tPayCusHd.append;
              tPayCusHd.fieldbyname('ORNo').asstring     := qryreusable1.fieldbyname('Orno').asstring;
              tPayCusHd.fieldbyname('PayDate').asdatetime:= qryreusable1.fieldbyname('Paydate').asdatetime;
              tPayCusHd.fieldbyname('CheckNo').asstring  := qryreusable1.fieldbyname('checkno').asstring;
              tPayCusHd.fieldbyname('PayCode').asstring  := qryreusable1.fieldbyname('paycode').asstring;
              tPayCusHd.fieldbyname('CheckAmt').asfloat  := qryreusable1.fieldbyname('checkamt').asfloat;
              tPayCusHd.fieldbyname('Status').asstring   := qryreusable1.fieldbyname('status').asstring;
              tPayCusHd.fieldbyname('PRNo').asstring     := qryreusable1.fieldbyname('prno').asstring;
              tPayCusHd.fieldbyname('custcode').asstring := qryreusable1.fieldbyname('custcode').asstring;
              tPayCusHd.fieldbyname('Bank').asstring     := qryreusable1.fieldbyname('bank').asstring;
              tPayCusHd.fieldbyname('InvAmt').asfloat    := qryreusable1.fieldbyname('invamt').asfloat;
              tPayCusHd.fieldbyname('TaxAmt').asfloat    := qryreusable1.fieldbyname('taxamt').asfloat;
              tPayCusHd.fieldbyname('AdjAmt').asfloat    := qryreusable1.fieldbyname('adjamt').asfloat;
              tPayCusHd.post;
              StaticText2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.Next;
         end;
         tPayCusHd.close;
         qryreusable1.close;

         tpaycust.emptytable;
         tPayCust.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from PayCust.dbf');
         qryreusable1.open;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));
         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tpaycust.append;
              tpaycust.fieldbyname('orno').asstring    := qryreusable1.fieldbyname('orno').asstring;
              tpaycust.fieldbyname('saleinv').asstring := qryreusable1.fieldbyname('saleinv').asstring;
              tpaycust.fieldbyname('amtpaid').asfloat  := qryreusable1.fieldbyname('amtpaid').asfloat;
              tpaycust.fieldbyname('prevbal').asfloat  := qryreusable1.fieldbyname('prevbal').asfloat;
              tpaycust.fieldbyname('lastbal').asfloat  := qryreusable1.fieldbyname('lastbal').asfloat;
              tpaycust.post;
              StaticText2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.next;
         end;
         tPayCust.close;
         qryreusable1.close;
         showmessage('Importing completed...');
    end;
    }
end;

procedure TARMenu.Adjustment1Click(Sender: TObject);
begin
   with dmardata do
    begin
         {
         tAdjDet.EmptyTable;
         tAdjDet.open;

         qryreusable1.DatabaseName := 'ARDBF';
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from AdjDet.dbf');
         qryreusable1.open;
         Label3.caption := trim(Inttostr(qryreusable1.RecordCount));

         qryreusable1.first;
         while not qryreusable1.Eof do
         begin
              tAdjDet.append;
              tAdjDet.fieldbyname('AdjNo').asstring     := qryreusable1.fieldbyname('adjno').asstring;
              tAdjDet.fieldbyname('AdjDate').asdatetime := qryreusable1.fieldbyname('adjdate').asdatetime;
              tAdjDet.fieldbyname('AmtPaid').asfloat    := qryreusable1.fieldbyname('amtpaid').asfloat;
              tAdjDet.fieldbyname('Remark').asstring    := qryreusable1.fieldbyname('remark').asstring;
              tAdjDet.fieldbyname('Type').asstring      := qryreusable1.fieldbyname('type').asstring;
              tAdjDet.fieldbyname('CustCode').asstring  := qryreusable1.fieldbyname('custcode').asstring;
              tAdjdet.fieldbyname('Status').asstring    := qryreusable1.fieldbyname('status').asstring;
              tadjdet.FieldByName('wordamt').asstring   := qryreusable1.fieldbyname('wordamt').asstring;
              tadjdet.fieldbyname('Prepared').asstring  := qryreusable1.fieldbyname('prepared').asstring;
              tadjdet.fieldbyname('approved').asstring  := qryreusable1.fieldbyname('approved').asstring;
              tAdjDet.post;
              StaticText2.caption := trim(Inttostr(qryreusable1.Recno));
              qryreusable1.Next;
         end;
         tAdjDet.close;
         qryreusable1.close;

         showmessage('Importing completed...');
         }
    end;



end;

procedure TARMenu.MasterList1Click(Sender: TObject);
begin
    dlgparam3 := tdlgparam3.create(application);
    dlgparam3.showmodal;
    if dlgparam3.modalresult = mrok then
    begin
         with dmardata do
         begin
                   qryreusable1.close;
                   qryreusable1.sql.clear;
                   qryreusable1.sql.add('select * From AdjDet,Customer ' +
                        ' Where (AdjDet.CustCode=Customer.CustCode)');
                   qryreusable1.sql.add(' and (AdjDate >= ''' +  datetostr(dlgparam3.dStartDate.date) + ''')');
                   qryreusable1.sql.add(' and (AdjDate <= ''' + datetostr(dlgparam3.dEndDate.date) + ''')');
                   qryreusable1.SQL.add('order by CustName ');
                   qryreusable1.Open;
                   if qryreusable1.RecordCount > 0 then
                   begin
                        qryCompany.close;
                        qryCompany.sql.clear;
                        qryCompany.sql.add('select * from setup');
                        qryCompany.open;
                        rpthold:= tRptHOld.create(application);
                        rpthold.c1HD06.caption  := 'Page : ';
                        rpthold.C2HD06.Caption  := qryCompany.fieldbyname('CompName').asstring;
                        rpthold.c3HD06.caption  := 'PAYMENTS ADJUSTMENT REPORT';
                        rpthold.c4HD06.caption  := 'From: ' + datetostr(dlgparam3.dStartDate.date) + ' - To: ' + datetostr(dlgparam3.dEndDate.date);
                        rpthold.RptAdjRep.preview;
                        rpthold.free;
                        qryCompany.close;
                   end
                   else
                      showmessage('No records found.');
                   qryreusable1.close;
         end;
    end;
    dlgparam3.free;
end;


procedure TARMenu.SalesSummary1Click(Sender: TObject);
begin
    with dmardata do
    begin
              dlgparam3 := tdlgparam3.Create(application);
              dlgparam3.ShowModal;
              if dlgparam3.ModalResult = mrok then
              begin
                   qryCompany.close;
                   qryCompany.sql.clear;
                   qryCompany.sql.add('select * from setup');
                   qryCompany.open;

                   qryreusable1.close;
                   qryreusable1.SQL.clear;
                   qryreusable1.sql.add('select custname,salehd.custcode,sum(TotGross) as TotGross ' +
                        ' From SaleHd,Customer ');
                   qryreusable1.sql.add(' Where(Salehd.SaleDate >= ''' +  datetostr(dlgparam3.dStartDate.date) + ''')');
                   qryreusable1.sql.add(' and (SaleHd.SaleDate <= ''' + datetostr(dlgparam3.dEndDate.date) + ''')');
                   qryreusable1.sql.add(' and (salehd.custcode=customer.custcode) ');
                   qryreusable1.sql.add(' Group by Custname,salehd.custcode ');
                   qryreusable1.sql.add(' order by custname,salehd.custcode ');
                   qryreusable1.Open;
                   if qryreusable1.RecordCount > 0 then
                   begin
                        rpthold := trpthold.Create(application);
                        if dlgparam3.cbIncDR.Checked = false then
                        begin
                            rpthold.QRLabel30.Caption := '';
                            rpthold.qrexpr54.Expression := '';
                        end;
                        rpthold.c1HD07.caption  := 'Page : ';
                        rpthold.C2HD07.Caption  := qryCompany.fieldbyname('Compname').asstring;
                        rpthold.c3HD07.caption  := 'SALES SUMMARY';
                        rpthold.c4HD07.caption  := 'From: ' + datetostr(dlgparam3.dStartDate.date) + ' - To: ' + datetostr(dlgparam3.dEndDate.date);
                        RptHold.rptSalesSummary.preview;
                        rpthold.free;
                   end;
                   qryreusable1.close;
                   qryCompany.close;
              end;
              dlgparam3.free;
    end;
end;


procedure TARMenu.Product1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryreusable1.close;
         qryreusable1.SQL.clear;
         qryreusable1.sql.add('select * from Product,customer ' +
             ' where (product.custcode=customer.custcode) ' +
             ' order by prodname');
         qryreusable1.Open;
         if qryreusable1.RecordCount > 0 then
         begin
              qryCompany.close;
              qryCompany.sql.clear;
              qryCompany.sql.add('select * from setup');
              qryCompany.open;

              rpthold := trpthold.Create(application);
              rpthold.c1HD08.caption  := 'Page : ';
              rpthold.C2HD08.Caption  := qryCompany.fieldbyname('CompName').asstring;
              rpthold.c3HD08.caption  := 'STOCK MASTER LIST';
              rpthold.c4HD08.caption  := 'as of ' + datetostr(date());
              RptHold.rptProdList.preview;
              rpthold.free;
              qryCompany.close;
         end;
         qryreusable1.close;
    end;
end;



procedure TARMenu.Customer3Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryreusable1.close;
         qryreusable1.SQL.clear;
         qryreusable1.sql.add('select * from customer ' +
             ' order by custname');
         qryreusable1.Open;
         if qryreusable1.RecordCount > 0 then
         begin
              qryCompany.close;
              qryCompany.sql.clear;
              qryCompany.sql.add('select * from setup');
              qryCompany.open;

              rpthold := trpthold.Create(application);
              rpthold.c1HD09.caption  := 'Page : ';
              rpthold.C2HD09.Caption  := qryCompany.fieldbyname('CompName').asstring;
              rpthold.c3HD09.caption  := 'CUSTOMER MASTER LIST';
              rpthold.c4HD09.caption  := 'as of ' + datetostr(date());
              RptHold.rptCustList.preview;
              rpthold.free;
              qryCompany.close;
         end;
         qryreusable1.close;
    end;
end;

procedure TARMenu.Button1Click(Sender: TObject);
begin
  {
  with dmardata do
  begin
    qryreusable1.DatabaseName := 'ARDB';
    qryreusable1.close;
    qryreusable1.sql.clear;
    qryreusable1.sql.add('select * from DupOR.db');
    qryreusable1.open;
    qryreusable1.first;

    tPayCusHd.open;
    tPayCusHd.First; 
    while not tPayCusHd.eof do
    begin
         if not (qryreusable1.locate('orno',tpaycushd.fieldbyname('orno').asstring,[lopartialkey])) then
         begin
              qryreusable1.append;
              qryreusable1.fieldbyname('orno').asstring := tpaycushd.fieldbyname('orno').asstring;
              qryreusable1.post;
         end
         else
              showmessage(tPayCushd.fieldbyname('orno').asstring);
         tpaycushd.next;
    end;
  end;
  showmessage('Processing completed...');
  }
end;

procedure TARMenu.UpdatePaymenthd1Click(Sender: TObject);
begin
   {
   with dmardata do
   begin
      tsalehd.open;
      tsalehd.first;
      while not tSalehd.eof do
      begin
          if (tsalehd.fieldbyname('trancode').asstring='') or (tsalehd.fieldbyname('trancode').IsNull) then
          begin
            tSalehd.edit;
            tSalehd.fieldbyname('trancode').asstring := '01';
            tSalehd.Post;
          end;
          tSalehd.next;
      end;

      tcustomer.Open;
      tsaledet.open;
      tsaledet.first;
      while not tSaledet.eof do
      begin
          if (tsaledet.fieldbyname('perproduct').asstring='') or (tsaledet.fieldbyname('perproduct').IsNull) then
          begin
              tSaledet.edit;
              tSaledet.fieldbyname('perproduct').asstring := '01';
              tSaleDet.Post;
          end;
          if (tsaledet.fieldbyname('currencycode').asstring='') or (tsaledet.fieldbyname('currencycode').IsNull) then
          begin
              if tSaleHd.Locate('drno',tsaledet.fieldbyname('drno').asstring,[locaseinsensitive]) then
              begin
                 if tCustomer.Locate('CustCode',tSalehd.fieldbyname('custcode').asstring,[locaseinsensitive]) then
                 begin
                   tSaledet.edit;
                   tSaledet.fieldbyname('currencycode').asstring := '01';
                   tSaleDet.Post;
                 end;
              end;
          end;
          tSaledet.next;
      end;
      tsaledet.close;
      tcustomer.close;
      tsalehd.Close;
      showmessage('End of processing...');
   end;
   }
end;

procedure TARMenu.POSIDR1Click(Sender: TObject);
var nctr,nFound : integer;
begin
   {
   dlgparam5 := tDlgparam5.create(application);
   dlgparam5.showmodal;
   if dlgparam5.modalresult=mrok then
   begin
      with dmardata do
      begin
         nFound := 0;
         qrySaleHd.Open;
         qrySource.Close;
         qrySource.sql.Clear;
         qrySource.sql.add('select * from  SaleHd where (SaleDate >= ''' + datetostr(dlgparam5.dStart.Date) + ''') and (SaleDate <= + ''' + datetostr(dlgparam5.dEnd.date) + ''')');
         qrysource.Open;
         qrysource.first;
         while not qrysource.eof do
         begin
           if not qrySaleHd.FindKey([qrySource.fieldbyname('DRNo').asstring]) then
           begin
             tSaleHd.Append;
             tSaleHd.fieldbyname('DRNo').asstring         := qrySource.fieldbyname('DRNo').asstring;
             tSaleHd.fieldbyname('SaleDate').asdatetime   := qrySource.fieldbyname('SaleDate').asdatetime;
             tSaleHd.fieldbyname('SaleInv').asstring      := qrySource.fieldbyname('SaleInv').asstring;
             tSaleHd.fieldbyname('TotGross').asfloat      := qrySource.fieldbyname('TotGross').asfloat;
             tSaleHd.fieldbyname('TotPaid').asfloat       := qrySource.fieldbyname('TotPaid').asfloat;
             tSaleHd.fieldbyname('LastBal').asfloat       := qrySource.fieldbyname('LastBal').asfloat;
             tSaleHd.fieldbyname('LastPay').asdatetime    := qrySource.fieldbyname('LastPay').asdatetime;
             tSaleHd.fieldbyname('TermCode').asfloat      := qrySource.fieldbyname('TermCode').asfloat;
             tSaleHd.fieldbyname('CustCode').asstring     := qrySource.fieldbyname('CustCode').asstring;
             tSaleHd.fieldbyname('TotTax').asfloat        := qrySource.fieldbyname('TotTax').asfloat;
             tSaleHd.fieldbyname('TotNet').asfloat        := qrySource.fieldbyname('TotNet').asfloat;
             tSaleHd.fieldbyname('ORNo').asstring         := qrySource.fieldbyname('ORNo').asstring;
             tSaleHd.fieldbyname('Status').asstring       := qrySource.fieldbyname('Status').asstring;
             tSaleHd.fieldbyname('DueDate').asdatetime    := qrySource.fieldbyname('DueDate').asdatetime;
             tSaleHd.fieldbyname('DRDate').asdatetime     := qrySource.fieldbyname('DRDate').asdatetime;
             tSaleHd.fieldbyname('AdjAmt').asfloat        := qrySource.fieldbyname('AdjAmt').asfloat;
             tSaleHd.fieldbyname('Remark1').asstring      := qrySource.fieldbyname('Remark1').asstring;
             tSaleHd.fieldbyname('Remark2').asstring      := qrySource.fieldbyname('Remark2').asstring;
             tSaleHd.fieldbyname('Remark3').asstring      := qrySource.fieldbyname('Remark3').asstring;
             tSaleHd.fieldbyname('Remark4').asstring      := qrySource.fieldbyname('Remark4').asstring;
             tSaleHd.fieldbyname('Trancode').asstring     := qrySource.fieldbyname('TranCode').asstring;
             tsaleHd.post;

             tSaleDet.Open;
             qrySrcDet.Close;
             qrySrcDet.sql.Clear;
             qrySrcDet.sql.add('select a.* from SaleDet a , SaleHd b where (a.DRNO=b.DRNO) and (SaleDate >= ''' + datetostr(dlgparam5.dStart.Date) + ''') and (SaleDate <= + ''' + datetostr(dlgparam5.dEnd.date) + ''')');
             qrySrcDet.Open;
             qrySrcDet.first;
             while not qrySrcDet.eof do
             begin
               tSaleDet.Append;
               tSaleDet.fieldbyname('SaleInv').asstring      := qrySrcDet.fieldbyname('SaleInv').asstring;
               tSaleDet.fieldbyname('DeliverQty').asfloat    := qrySrcDet.fieldbyname('DeliverQty').asfloat;
               tSaleDet.fieldbyname('Netamt').asfloat        := qrySrcDet.fieldbyname('NetAmt').asfloat;
               tSaleDet.fieldbyname('TaxAmt').asfloat        := qrySrcDet.fieldbyname('TaxAmt').asfloat;
               tSaleDet.fieldbyname('GrossAmt').asfloat      := qrySrcDet.fieldbyname('GrossAmt').asfloat;
               tSaleDet.fieldbyname('ProdCode').asstring     := qrySrcDet.fieldbyname('ProdCode').asstring;
               tSaleDet.fieldbyname('UnitPrice').asfloat     := qrySrcDet.fieldbyname('UnitPrice').asfloat;
               tSaleDet.fieldbyname('UnitMeas').asstring     := qrySrcDet.fieldbyname('UnitMeas').asstring;
               tSaleDet.fieldbyname('DRNo').asstring         := qrySrcDet.fieldbyname('DRNo').asstring;
               tSaleDet.fieldbyname('PurchNo').asstring      := qrySrcDet.fieldbyname('PurchNo').asstring;
               tSaleDet.fieldbyname('Posted').asstring       := qrySrcDet.fieldbyname('Posted').asstring;
               tSaleDet.fieldbyname('CurrencyCode').asstring := qrySrcDet.fieldbyname('CurrencyCode').asstring;
               tSaleDet.fieldbyname('RemarkDet').asstring    := qrySrcDet.fieldbyname('RemarkDet').asstring;
               tSaleDet.fieldbyname('PerProduct').asstring   := qrySrcDet.fieldbyname('PerProduct').asstring;
               tSaleDet.fieldbyname('ProdRemark').asstring   := qrySrcDet.fieldbyname('ProdRemark').asstring;
               tsaleDet.post;
               qrySrcDet.next;
             end;
             qrySrcDet.close;
             tSaleDet.close;
             nFound := nFound + 1;
           end;
           qrysource.next;
           nctr := nctr + 1;
           statictext2.Caption := 'Counter : ' + inttostr(nctr) + ' / ' + inttostr(qrySource.RecordCount)
         end;
         qrysource.close;
         tSaleHd.Close;
         qrysource.close;
         showmessage('Total number of records imported - ' + inttostr(nFound) + '/' + inttostr(nctr) + '');
      end;
   end;
   dlgparam5.free;
   }
end;

procedure TARMenu.CopyDatabase1Click(Sender: TObject);
begin
     CopyForm := tCopyForm.create(application);
     CopyForm.showmodal;
     CopyForm.free;
end;


procedure TARMenu.CompanySetup1Click(Sender: TObject);
begin
  with dmardata do
  begin
    qryCompany.close;
    qryCompany.sql.clear;
    qryCompany.sql.add('select * from Setup');
    qryCompany.open;

    qryCompany.edit;
    CompSetup := tCompSetup.create(application);
    CompSetup.showmodal;
    if compsetup.modalresult=mrok then
      qryCompany.Post
    else
      qryCompany.Cancel;
    qryCompany.Close;
    CompSetup.free;
  end;
end;



procedure TARMenu.UpdatePayment1Click(Sender: TObject);
var nctr,nFound : integer;
begin
   {
   dlgparam5 := tDlgparam5.create(application);
   dlgparam5.showmodal;
   if dlgparam5.modalresult=mrok then
   begin
      with dmardata do
      begin
         tsaleHd.open;
         tSaleHd.first;
         while not tSalehd.eof do
         begin
             if (tSalehd.fieldbyname('SaleDate').asdatetime >= dlgparam5.dStart.Date)
             and (tSalehd.fieldbyname('SaleDate').asdatetime <= dlgparam5.dEnd.Date) then
             begin
                tSalehd.edit;
                tSalehd.fieldbyname('TotPaid').asfloat := tSalehd.fieldbyname('lastbal').asfloat;
                tSalehd.fieldbyname('LastBal').asfloat := 0;
                tSalehd.Post;
                nctr := nctr + 1;
             end;
             tsalehd.Next;
         end;
         tSaleHd.Close;
         showmessage('Total number of records close - ' + inttostr(nctr));
      end;
   end;
   dlgparam5.free;
   }
end;


procedure TARMenu.AddSIandDRwithA1Click(Sender: TObject);
var nctr,ndetctr : integer;
begin
   {
   dlgparam5 := tdlgparam5.create(application);
   dlgparam5.showmodal;
   if dlgparam5.modalresult=mrok then
   begin
      with dmardata do
      begin
          nctr := 0;
          ndetctr := 0;
          tSalehd.open;
          tsalehd.first;
          while not tsalehd.eof do
          begin
               if (tsalehd.fieldbyname('Posted').asstring = '') and
                  (tSaleHd.FieldByName('saledate').AsDateTime >= dlgparam5.dstart.Date) and
                  (tsalehd.fieldbyname('saledate').asdatetime <= dlgparam5.dEnd.date) then
               begin
                  tsalehd.edit;
                  tsalehd.fieldbyname('OSaleInv').asstring := tsalehd.fieldbyname('saleinv').asstring;
                  tsalehd.fieldbyname('SaleInv').asstring  := tsalehd.fieldbyname('saleinv').asstring + 'A';
                  tsalehd.fieldbyname('ODRNo').asstring    := tsalehd.fieldbyname('DRNo').asstring;
                  tsalehd.fieldbyname('DRNo').asstring     := tsalehd.fieldbyname('DRNo').asstring + 'A';
                  tsalehd.fieldbyname('Posted').asstring   := 'Y';
                  tSalehd.post;

                  tSaleDet.Filtered := true;
                  tSaleDet.Filter := 'DRNo = ''' + tsalehd.fieldbyname('odrno').asstring + '''';
                  tSaleDet.Open;
                  tsaleDet.first;
                  while not tsaleDet.eof do
                  begin
                    if (tsaleDet.fieldbyname('Post').asstring = '')  then
                    begin
                        tsaledet.edit;
                        tsaledet.fieldbyname('OSaleInv').asstring := tsaledet.fieldbyname('saleinv').asstring;
                        tsaledet.fieldbyname('SaleInv').asstring  := tsaledet.fieldbyname('saleinv').asstring + 'A';
                        tsaledet.fieldbyname('ODRNo').asstring    := tsaledet.fieldbyname('DRNo').asstring;
                        tsaledet.fieldbyname('DRNo').asstring     := tsaledet.fieldbyname('DRno').asstring + 'A';
                        tsaledet.fieldbyname('Post').asstring   := 'Y';
                        tSaledet.post;
                        nDetctr := nDetctr + 1;
                    end;
                    tsaledet.next;
                  end;
                  tsaledet.close;
                  nctr := nctr + 1;
               end;
               tsalehd.next;
          end;
          tsalehd.close;
          showmessage('Total number of record process ...' + inttostr(nctr)+'/'+inttostr(ndetctr));
      end
   end;
   dlgparam5.free;
   }
end;

procedure TARMenu.ransferDetailTransaction1Click(Sender: TObject);
begin
   BrowUtilDRDetail := tBrowUtilDRDetail.create(application);
   BrowUtilDRDetail.showmodal;
   BrowUtilDRDetail.free;
end;

procedure TARMenu.ransferHeaderTransaction1Click(Sender: TObject);
begin
   BrowUtilDRHd := tBrowUtilDRHd.create(application);
   BrowUtilDRHd.showmodal;
   BrowUtilDRHd.free
end;

procedure TARMenu.ListDR1Click(Sender: TObject);
begin
    ListDR := tListDR.create(application);
    ListDR.showmodal;
    ListDR.free;
end;

procedure TARMenu.CompareDR1Click(Sender: TObject);
begin
   BrowCompare := tBrowCompare.create(application);
   BrowCompare.showmodal;
   BrowCompare.free;
end;

procedure TARMenu.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TARMenu.MySQL1Click(Sender: TObject);
begin
  with dmardata do
  begin
      ARServer.Connected := true;

      qryEmployee.close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Create Table If Not Exists SaleHD (' +
      ' DRNo      nvarchar(15)   not null       , ' +
      ' SaleDate  Date           not null       , ' +
      ' SaleInv   nvarchar(15)   not null       , ' +
      ' TotGross  decimal(18,2)  not null       , ' +
      ' TotPaid   decimal(18,2)  not null       , ' +
      ' LastBal   decimal(18,2)  not null       , ' +
      ' LastPay   date           not null       , ' +
      ' TermCode  integer(5)     not null       , ' +
      ' CustCode  nvarchar(10)   not null       , ' +
      ' TotTax    decimal(18,2)  not null       , ' +
      ' TotNet    decimal(18,2)  not null       , ' +
      ' ORNo      nvarchar(10)   not null       , ' +
      ' Status    nvarchar(1)    not null       , ' +
      ' DueDate   date           not null       , ' +
      ' DRDate    date           not null       , ' +
      ' AdjAmt    decimal(18,2)  not null       , ' +
      ' Remark1   nvarchar(50)   not null       , ' +
      ' Remark2   nvarchar(50)   not null       , ' +
      ' Remark3   nvarchar(50)   not null       , ' +
      ' Remark4   nvarchar(50)   not null       , ' +
      ' TranCode  nvarchar(2)    not null       , ' +
      ' PONo      nvarchar(30)   not null       , ' +
      ' ODRNo     nvarchar(15)   not null       , ' +
      ' OSaleInv  nvarchar(15)   not null       , ' +
      ' Posted    nvarchar(1)    not null       , ' +
      ' Primary key (DRNo)                        ' +
      ' );');
      qryEmployee.ExecSQL;


      qryEmployee.close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Create Table If Not Exists SaleDet (' +
      ' SaleInv      nvarchar(15)  null        , ' +
      ' DeliverQty   decimal(18,2) null        , ' +
      ' NetAmt       decimal(18,2) null        , ' +
      ' TaxAmt       decimal(18,2) null        , ' +
      ' GrossAmt     decimal(18,2) null        , ' +
      ' ProdCode     nvarchar(20)  null        , ' +
      ' ProdDesc     nvarchar(50)  null        , ' +
      ' UnitPrice    decimal(18,2) null        , ' +
      ' UnitMeas     nvarchar(15)  null        , ' +
      ' DRNo         nvarchar(15)  null        , ' +
      ' PurchNo      nvarchar(10)  null        , ' +
      ' Posted       nvarchar(1)   null        , ' +
      ' CurrencyCode nvarchar(2)   null        , ' +
      ' RemarkDet    nvarchar(100) null        , ' +
      ' PerProduct   nvarchar(1)   null        , ' +
      ' ProdRemark   nvarchar(50)  null        , ' +
      ' OSaleInv     nvarchar(15)  null        , ' +
      ' ODRNo        nvarchar(15)  null        , ' +
      ' Post         nvarchar(1)   null          ' +
      ' );');
      qryEmployee.ExecSQL;

      qryEmployee.close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Create Table If Not Exists Customer (' +
      ' CustCode          nvarchar(10)  not null , ' +
      ' CustName          nvarchar(50)  not null , ' +
      ' PhoneNo           nvarchar(15)  not null, ' +
      ' Addr1             nvarchar(70)  not null, ' +
      ' Addr2             nvarchar(40)  not null, ' +
      ' Addr3             nvarchar(75)  not null, ' +
      ' ContPerson        nvarchar(30)  not null, ' +
      ' Vat               nvarchar(1)   not null, ' +
      ' TinNo             nvarchar(15)  not null, ' +
      ' BusinessStyle     nvarchar(30)  not null, ' +
      ' CurrencyCode      nvarchar(2)   not null, ' +
      ' Primary key (CustCode)                    ' +
      ' );');
      qryEmployee.ExecSQL;


      qryEmployee.close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Create Table If Not Exists Product (' +
      ' ProdCode     nvarchar(20)  not null , ' +
      ' ProdName     nvarchar(50)  not null , ' +
      ' SalePrice    decimal(18,2) not null, ' +
      ' CustCode     nvarchar(10)  not null, ' +
      ' UnitMeas     nvarchar(15)  not null, ' +
      ' Primary key (ProdCode)               ' +
      ' );');
      qryEmployee.ExecSQL;


      qryEmployee.close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Create Table If Not Exists Setup (' +
      ' CompName          nvarchar(100) not null , ' +
      ' SIHeight          integer       not null , ' +
      ' DRHeight          integer       not null , ' +
      ' SIHdHeight        integer       not null , ' +
      ' DRHdHeight        integer       not null , ' +
      ' SILeftMargin      integer       not null , ' +
      ' DRLeftMargin      integer       not null , ' +
      ' SourceDir         nvarchar(200) not null , ' +
      ' TargetDir         nvarchar(200) not null , ' +
      ' PrintingType      nvarchar(1)   not null   ' +
      ' );');
      qryEmployee.ExecSQL;

      qryEmployee.close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Create Table If Not Exists RepSetup (' +
      ' RepCode           nvarchar(5)   not null , ' +
      ' FieldCode         nvarchar(2)   not null , ' +
      ' FieldName         nvarchar(15)  not null , ' +
      ' RepRow            integer       not null , ' +
      ' RepCol            integer       not null   ' +
      ' );');
      qryEmployee.ExecSQL;

      qryemployee.Close;
      qryEmployee.sql.clear;
      qryEmployee.sql.add('Select * from SaleHd');
      {
      qryEmployee.sql.add('select idnum,lastname,firstname,RatePerDay from Employee order by lastname,firstname');
      }
      qryEmployee.open;


      ARForm := tARForm.create(application);
      ARForm.showmodal;
      ARForm.free;

      qryEmployee.close;
      ARServer.Connected := false;

  end;
end;

procedure TARMenu.MSSQL1Click(Sender: TObject);
begin
  with dmardata do
  begin
      ARServer.Connected := true;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.PurchHd'+''')) ' +
      ' begin ' +
      'Create Table PurchHd (' +
      ' PurchNo      nvarchar(10)  not null , ' +
      ' PurchDate    datetime          null , ' +
      ' CustCode     nvarchar(10)      null, ' +
      ' TermCode     decimal(18,2)     null, ' +
      ' DRDate       datetime          null, ' +
      ' Status       nvarchar(1)       null, ' +
      ' Primary key (PurchNo)               ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.PurchDet'+''')) ' +
      ' begin ' +
      'Create Table PurchDet (' +
      ' PurchNo      nvarchar(10)  not null , ' +
      ' ProdCode     nvarchar(20)  not null , ' +
      ' UnitPrice    nvarchar(10)      null, ' +
      ' GrossAmt     decimal(18,2)     null, ' +
      ' TaxAmt       decimal(18,2)     null, ' +
      ' NetAmt       decimal(18,2)     null, ' +
      ' OrderQty     decimal(18,2)     null, ' +
      ' DeliverQty   decimal(18,2)     null, ' +
      ' LastQty      decimal(18,2)     null, ' +
      ' CurrencyCode nvarchar(2)       null, ' +
      ' Primary key (PurchNo,ProdCode)      ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.SaleHd'+''')) ' +
      ' begin ' +
      ' Create Table SaleHD (' +
      ' DRNo      nvarchar(15)   not null       , ' +
      ' SaleDate  Datetime         null         , ' +
      ' SaleInv   nvarchar(15)     null         , ' +
      ' TotGross  decimal(18,2)    null         , ' +
      ' TotPaid   decimal(18,2)    null         , ' +
      ' LastBal   decimal(18,2)    null         , ' +
      ' LastPay   datetime         null         , ' +
      ' TermCode  integer          null         , ' +
      ' CustCode  nvarchar(10)     null         , ' +
      ' TotTax    decimal(18,2)    null         , ' +
      ' TotNet    decimal(18,2)    null         , ' +
      ' ORNo      nvarchar(10)     null         , ' +
      ' Status    nvarchar(1)      null         , ' +
      ' DueDate   datetime         null         , ' +
      ' DRDate    datetime         null         , ' +
      ' AdjAmt    decimal(18,2)    null         , ' +
      ' Remark1   nvarchar(50)     null         , ' +
      ' Remark2   nvarchar(50)     null         , ' +
      ' Remark3   nvarchar(50)     null         , ' +
      ' Remark4   nvarchar(50)     null         , ' +
      ' TranCode  nvarchar(2)      null         , ' +
      ' PONo      nvarchar(30)     null         , ' +
      ' ODRNo     nvarchar(15)     null         , ' +
      ' OSaleInv  nvarchar(15)     null         , ' +
      ' Posted    nvarchar(1)      null         , ' +
      ' Primary key (DRNo)                        ' +
      ' ) ' +
      ' end ;');
      qryDest.ExecSQL;


      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.SaleDet'+''')) ' +
      ' begin ' +
      ' Create Table SaleDet (' +
      ' SaleInv      nvarchar(15)  null        , ' +
      ' DeliverQty   decimal(18,2) null        , ' +
      ' NetAmt       decimal(18,2) null        , ' +
      ' TaxAmt       decimal(18,2) null        , ' +
      ' GrossAmt     decimal(18,2) null        , ' +
      ' ProdCode     nvarchar(20)  null        , ' +
      ' ProdDesc     nvarchar(50)  null        , ' +
      ' UnitPrice    decimal(18,2) null        , ' +
      ' UnitMeas     nvarchar(15)  null        , ' +
      ' DRNo         nvarchar(15)  null        , ' +
      ' PurchNo      nvarchar(10)  null        , ' +
      ' Posted       nvarchar(1)   null        , ' +
      ' CurrencyCode nvarchar(2)   null        , ' +
      ' RemarkDet    nvarchar(100) null        , ' +
      ' PerProduct   nvarchar(1)   null        , ' +
      ' ProdRemark   nvarchar(50)  null        , ' +
      ' OSaleInv     nvarchar(15)  null        , ' +
      ' ODRNo        nvarchar(15)  null        , ' +
      ' Post         nvarchar(1)   null          ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.Customer'+''')) ' +
      ' begin ' +
      ' Create Table Customer (' +
      ' CustCode          nvarchar(10)   not null , ' +
      ' CustName          nvarchar(50)   null , ' +
      ' PhoneNo           nvarchar(15)   null, ' +
      ' Addr1             nvarchar(70)   null, ' +
      ' Addr2             nvarchar(40)   null, ' +
      ' Addr3             nvarchar(75)   null, ' +
      ' ContPerson        nvarchar(30)   null, ' +
      ' Vat               nvarchar(1)    null, ' +
      ' TinNo             nvarchar(15)   null, ' +
      ' BusinessStyle     nvarchar(30)   null, ' +
      ' CurrencyCode      nvarchar(2)    null, ' +
      ' Primary key (CustCode)                    ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;


      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.Product'+''')) ' +
      ' begin ' +
      'Create Table Product (' +
      ' ProdCode     nvarchar(20)   not null , ' +
      ' ProdName     nvarchar(50)   null , ' +
      ' SalePrice    decimal(18,2)  null, ' +
      ' CustCode     nvarchar(10)   null, ' +
      ' UnitMeas     nvarchar(15)   null, ' +
      ' Primary key (ProdCode)               ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;


      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.Setup'+''')) ' +
      ' begin ' +
      ' Create Table Setup (' +
      ' CompName          nvarchar(100) not null , ' +
      ' SIHeight          integer       not null , ' +
      ' DRHeight          integer       not null , ' +
      ' SIHdHeight        integer       not null , ' +
      ' DRHdHeight        integer       not null , ' +
      ' SILeftMargin      integer       not null , ' +
      ' DRLeftMargin      integer       not null , ' +
      ' SourceDir         nvarchar(200) not null , ' +
      ' TargetDir         nvarchar(200) not null , ' +
      ' PrintingType      nvarchar(1)   not null   ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.tblRepSetup'+''')) ' +
      ' begin ' +
      'Create Table  tblRepSetup (' +
      ' RepCode           nvarchar(5)   not null , ' +
      ' FieldCode         nvarchar(2)   not null , ' +
      ' FieldName         nvarchar(15)  not null , ' +
      ' RepRow            decimal(18,2) not null , ' +
      ' RepCol            decimal(18,2) not null   ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.Currency'+''')) ' +
      ' begin ' +
      'Create Table  Currency (' +
      ' CurrencyCode      nvarchar(2)   not null , ' +
      ' CurrencyName      nvarchar(30)  not null , ' +
      ' CurrencyRate      decimal(18,2) not null , ' +
      ' CurrencySign      nvarchar(5)   not null , ' +
      ' Primary key (CurrencyCode)                 ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.TranType'+''')) ' +
      ' begin ' +
      'Create Table  TranType (' +
      ' TranCode      nvarchar(2)   not null , ' +
      ' TranName      nvarchar(30)  not null , ' +
      ' Primary key (TranCode)               ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.PayCusHd'+''')) ' +
      ' begin ' +
      ' Create Table  PayCusHd (' +
      ' ORNo      nvarchar(15)   not null , ' +
      ' CustCode  nvarchar(10)   not null , ' +
      ' Bank      nvarchar(30)   null , ' +
      ' CheckNo   nvarchar(20)   null , ' +
      ' Paydate   datetime       not null , ' +
      ' InvAmt    decimal(18,2)  null , ' +
      ' AdjAmt    decimal(18,2)  null , ' +
      ' TaxAmt    decimal(18,2)  null , ' +
      ' CheckAmt  decimal(18,2)  null   ' +
      ' Primary key (ORNo)               ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.PayCust'+''')) ' +
      ' begin ' +
      ' Create Table  PayCust (' +
      ' ORNo      nvarchar(15)   not null , ' +
      ' CustCode  nvarchar(10)   not null , ' +
      ' SaleInv   nvarchar(15)   null     , ' +
      ' AmtPaid   decimal(18,2)  null     , ' +
      ' PayPerc   decimal(18,2)  null     , ' +
      ' Vat       nvarchar(1)    null     , ' +
      ' TaxAmt    decimal(18,2)  null     , ' +
      ' PrevBal   decimal(18,2)  null     , ' +
      ' LastBal   decimal(18,2)  null , ' +
      ' NetAmt    decimal(18,2)  null       ' +
      ' Primary key (ORNo,CustCode)               ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.AdjDet'+''')) ' +
      ' begin ' +
      ' Create Table  AdjDet (' +
      ' AdjNo     nvarchar(15)   not null , ' +
      ' CustCode  nvarchar(10)   not null , ' +
      ' AdjDate   datetime       not null , ' +
      ' Type      nvarchar(1)    not null , ' +
      ' Remark    nvarchar(200)  null     , ' +
      ' AmtPaid   decimal(18,2)  null     , ' +
      ' WordAmt   nvarchar(200)  null     , ' +
      ' Prepared  nvarchar(100)  null     , ' +
      ' Approved  nvarchar(100)  null       ' +
      ' Primary key (AdjNo)                       ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;

      qryDest.close;
      qryDest.sql.clear;
      qryDest.sql.add('If Not Exists(Select * from SysObjects Where id = object_id('''+ 'dbo.TaxAdj'+''')) ' +
      ' begin ' +
      ' Create Table  TaxAdj (' +
      ' AdjNo     nvarchar(15)   not null , ' +
      ' CustCode  nvarchar(10)   not null , ' +
      ' AdjDate   datetime       not null , ' +
      ' Type      nvarchar(1)    not null , ' +
      ' Remark    nvarchar(200)  null     , ' +
      ' AmtPaid   decimal(18,2)  null     , ' +
      ' WordAmt   nvarchar(200)  null     , ' +
      ' Prepared  nvarchar(100)  null     , ' +
      ' Approved  nvarchar(100)  null       ' +
      ' Primary key (AdjNo)                       ' +
      ' ) ' +
      ' end;');
      qryDest.ExecSQL;


//         ' Percent   decimal(18,2)  null     , ' +


      ARForm := tARForm.create(application);
      ARForm.showmodal;
      ARForm.free;

      qryDest.close;
      ARServer.Connected := false;

  end;
end;


end.
