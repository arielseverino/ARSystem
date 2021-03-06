unit pARForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RpDefine, RpRave, RpBase, RpSystem, RpConBDE,
  RpConDS, RpCon, Grids, DBGrids, Buttons, QRCtrls, QuickRpt, DB, DBTables;

type
  TARForm = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    BitBtn11: TBitBtn;
    qrySource: TQuery;
    dsSource: TDataSource;
    ListBox1: TListBox;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function has3Dec(cAmt:string):boolean;
  end;

var
  ARForm: TARForm;

implementation

uses pARData, pDlgParam1, pRptHold, PRPTHOLD2;

{$R *.DFM}

procedure TARForm.BitBtn1Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from Currency');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from currency');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('CurrencyCode').asstring  := qrySource.fieldbyname('CurrencyCode').asstring;
        qryDest.fieldbyname('CurrencyName').asstring  := qrySource.fieldbyname('CurrencyName').asstring;
        qryDest.fieldbyname('CurrencyRate').asfloat   := qrySource.fieldbyname('CurrencyRate').asfloat;
        qryDest.fieldbyname('CurrencySign').asstring  := qrySource.fieldbyname('CurrencySign').asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;

     ARServer.Connected := false;

     showmessage('End of processing...');
  end;
end;

procedure TARForm.BitBtn2Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from Customer');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from Customer');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('CustCode'     ).asstring  := qrySource.fieldbyname('CustCode'     ).asstring;
        qryDest.fieldbyname('CustName'     ).asstring  := qrySource.fieldbyname('CustName'     ).asstring;
        qryDest.fieldbyname('PhoneNo'      ).asstring  := qrySource.fieldbyname('PhoneNo'      ).asstring;
        qryDest.fieldbyname('Addr1'        ).asstring  := qrySource.fieldbyname('Addr1'        ).asstring;
        qryDest.fieldbyname('Addr2'        ).asstring  := qrySource.fieldbyname('Addr2'        ).asstring;
        qryDest.fieldbyname('Addr3'        ).asstring  := qrySource.fieldbyname('Addr3'        ).asstring;
        qryDest.fieldbyname('ContPerson'   ).asstring  := qrySource.fieldbyname('ContPerson'   ).asstring;
        qryDest.fieldbyname('Vat'          ).asstring  := qrySource.fieldbyname('Vat'          ).asstring;
        qryDest.fieldbyname('TinNo'        ).asstring  := qrySource.fieldbyname('TinNo'        ).asstring;
        qryDest.fieldbyname('BusinessStyle').asstring  := qrySource.fieldbyname('BusinessStyle').asstring;
        qryDest.fieldbyname('CurrencyCode' ).asstring  := qrySource.fieldbyname('CurrencyCode' ).asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;

     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;

procedure TARForm.BitBtn3Click(Sender: TObject);
begin
  with dmardata do
  begin
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('DRNo'         ).asstring  := qrySource.fieldbyname('DRNo'         ).asstring;
        qryDest.fieldbyname('SaleDate'     ).asstring  := qrySource.fieldbyname('SaleDate'     ).asstring;
        qryDest.fieldbyname('SaleInv'      ).asstring  := qrySource.fieldbyname('SaleInv'      ).asstring;
        qryDest.fieldbyname('TotGross'     ).asfloat   := qrySource.fieldbyname('TotGross'     ).asfloat;
        qryDest.fieldbyname('TotPaid'      ).asfloat   := qrySource.fieldbyname('TotPaid'      ).asfloat;
        qryDest.fieldbyname('LastBal'      ).asfloat   := qrySource.fieldbyname('LastBal'      ).asfloat;
        qryDest.fieldbyname('LastPay'      ).asstring  := qrySource.fieldbyname('LastPay'      ).asstring;
        qryDest.fieldbyname('TermCode'     ).asstring  := qrySource.fieldbyname('TermCode'     ).asstring;
        qryDest.fieldbyname('CustCode'     ).asstring  := qrySource.fieldbyname('CustCode'     ).asstring;
        qryDest.fieldbyname('TotTax'       ).asfloat   := qrySource.fieldbyname('TotTax'       ).asfloat;
        qryDest.fieldbyname('TotNet'       ).asfloat   := qrySource.fieldbyname('TotNet'       ).asfloat;
        qryDest.fieldbyname('ORNo'         ).asstring  := qrySource.fieldbyname('ORNo'         ).asstring;
        qryDest.fieldbyname('Status'       ).asstring  := qrySource.fieldbyname('Status'       ).asstring;
        qryDest.fieldbyname('DueDate'      ).asstring  := qrySource.fieldbyname('DueDate'      ).asstring;
        qryDest.fieldbyname('DRDate'       ).asfloat   := qrySource.fieldbyname('DRDate'       ).asfloat;
        qryDest.fieldbyname('AdjAmt'       ).asfloat   := qrySource.fieldbyname('AdjAmt'       ).asfloat;
        qryDest.fieldbyname('Remark1'      ).asstring  := qrySource.fieldbyname('Remark1'      ).asstring;
        qryDest.fieldbyname('Remark2'      ).asstring  := qrySource.fieldbyname('Remark2'      ).asstring;
        qryDest.fieldbyname('Remark3'      ).asstring  := qrySource.fieldbyname('Remark3'      ).asstring;
        qryDest.fieldbyname('Remark4'      ).asstring  := qrySource.fieldbyname('Remark4'      ).asstring;
        qryDest.fieldbyname('TranCode'     ).asstring  := qrySource.fieldbyname('TranCode'     ).asstring;
        qryDest.fieldbyname('PONo'         ).asstring  := qrySource.fieldbyname('PONo'         ).asstring;
        qryDest.fieldbyname('oDRNo'        ).asstring  := qrySource.fieldbyname('oDRNo'        ).asstring;
        qryDest.fieldbyname('oSaleInv'     ).asstring  := qrySource.fieldbyname('oSaleInv'     ).asstring;
        qryDest.fieldbyname('Posted'       ).asstring  := qrySource.fieldbyname('Posted'       ).asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;

     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;

procedure TARForm.BitBtn5Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from SaleHd where (Custcode=''' + '12' + ''')');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from SaleHd');
     qrySource.Open;
  end;
end;

procedure TARForm.BitBtn4Click(Sender: TObject);
begin
  with dmardata do
  begin
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('SaleInv'      ).asstring  := qrySource.fieldbyname('SaleInv'      ).asstring;
        qryDest.fieldbyname('DeliverQty'  ).asfloat   := qrySource.fieldbyname('DeliverQty'  ).asfloat;
        qryDest.fieldbyname('NetAmt'       ).asfloat   := qrySource.fieldbyname('NetAmt'       ).asfloat;
        qryDest.fieldbyname('TaxAmt'       ).asfloat   := qrySource.fieldbyname('TaxAmt'       ).asfloat;
        qryDest.fieldbyname('GrossAmt'     ).asfloat   := qrySource.fieldbyname('GrossAmt'     ).asfloat;
        qryDest.fieldbyname('ProdCode'     ).asstring  := qrySource.fieldbyname('ProdCode'     ).asstring;
        qryDest.fieldbyname('ProdDesc'     ).asstring  := qrySource.fieldbyname('ProdDesc'     ).asstring;
        qryDest.fieldbyname('UnitPrice'    ).asfloat   := qrySource.fieldbyname('UnitPrice'    ).asfloat;
        qryDest.fieldbyname('UnitMeas'     ).asstring  := qrySource.fieldbyname('UnitMeas'     ).asstring;
        qryDest.fieldbyname('DRNo'         ).asstring  := qrySource.fieldbyname('DRNo'         ).asstring;
        qryDest.fieldbyname('PurchNo'      ).asstring  := qrySource.fieldbyname('PurchNo'      ).asstring;
        qryDest.fieldbyname('Posted'       ).asstring  := qrySource.fieldbyname('Posted'       ).asstring;
        qryDest.fieldbyname('CurrencyCode' ).asstring  := qrySource.fieldbyname('CurrencyCode' ).asstring;
        qryDest.fieldbyname('RemarkDet'    ).asstring  := qrySource.fieldbyname('RemarkDet'    ).asstring;
        qryDest.fieldbyname('PerProduct'   ).asstring  := qrySource.fieldbyname('PerProduct'   ).asstring;
        qryDest.fieldbyname('ProdRemark'   ).asstring  := qrySource.fieldbyname('ProdRemark'   ).asstring;
        qryDest.fieldbyname('oSaleInv'     ).asstring  := qrySource.fieldbyname('oSaleInv'     ).asstring;
        qryDest.fieldbyname('oDRNo'        ).asstring  := qrySource.fieldbyname('oDRNo'        ).asstring;
        qryDest.fieldbyname('Post'         ).asstring  := qrySource.fieldbyname('Post'         ).asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;

     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;

procedure TARForm.BitBtn6Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select a.* ' +
     ' from SaleDet a ' +
     '   left outer join salehd b on (b.drno=a.drno) ' +
     ' where (a.custcode=''' + '12' + ''')');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from SaleDet');
     qrySource.Open;
  end;


end;

procedure TARForm.BitBtn7Click(Sender: TObject);
begin
  {
  dlgparam1 := tDlgparam1.create(application);
  dlgParam1.showmodal;
  if dlgparam1.ModalResult = mrok then
  begin
     with dmardata do
     begin
        qryCompany.close;
        qryCompany.sql.clear;
        qryCompany.sql.add('select * from Setup');
        qryCompany.Open;

        qryForm.close;
        qryForm.sql.clear;
        if qryDest.fieldbyname('TranCode').asstring='01'then
        begin
                   qryForm.sql.add('select Customer.CustName, SaleHd.SaleDate, Customer.Addr1,SaleHd.DRDate,Customer.Addr2, ' +
                   ' SaleDet.DeliverQty, Product.UnitMeas, SaleDet.ProdCode, Product.ProdName, SaleDet.TaxAmt, SaleDet.Purchno, ' +
                   ' Customer.TinNo, Customer.BusinessStyle, SaleDet.DRNo, SaleHd.Remark1, SaleHd.Remark2, SaleHd.Remark3, SaleHd.Remark4, SaleDet.RemarkDet, Currency.CurrencySign,Customer.Vat, ' +
                   ' SaleDet.UnitPrice, SaleDet.GrossAmt, saleHd.PONO ' +
                   ' from SaleHd,SaleDet,Customer,Product,Currency  ' +
                   ' where (SaleHd.DRNo=SaleDet.DRNo) ' +
                   ' and (salehd.custcode = customer.custcode) ' +
                   ' and (saledet.prodcode = product.prodcode) ' +
                   ' and (SaleDet.CurrencyCode=Currency.CurrencyCode) ' +
                   ' and (trim(SaleDet.Drno) = ''' + qryDest.fieldbyname('drno').asstring + ''')');
        end
        else
        begin
                  qryForm.sql.add('select Customer.CustName, SaleHd.SaleDate, Customer.Addr1,SaleHd.DRDate,Customer.Addr2, ' +
                   ' SaleDet.DeliverQty, SaleDet.ProdCode, SaleDet.TaxAmt, SaleDet.Purchno, ' +
                   ' Customer.TinNo, Customer.BusinessStyle, SaleDet.DRNo, SaleHd.Remark1, SaleHd.Remark2, SaleHd.Remark3, SaleHd.Remark4, SaleDet.RemarkDet, Currency.CurrencySign,Customer.Vat, ' +
                   ' SaleDet.UnitPrice, SaleDet.GrossAmt, saleHd.PONO, ''' +  'pcs' + ''' as UnitMeas '+
                   ' from SaleHd,SaleDet,Customer,Currency  ' +
                   ' where (SaleHd.DRNo=SaleDet.DRNo) ' +
                   ' and (salehd.custcode = customer.custcode) ' +
                   ' and (SaleDet.CurrencyCode=Currency.CurrencyCode) ' +
                   ' and (trim(SaleDet.Drno) = ''' + qryDest.fieldbyname('drno').asstring + ''')');
        end;
        if qryCompany.FieldByName('PrintingType').asstring='1' then
        begin
              rpthold2 := trpthold2.create(application);
              qryForm.open;
              if dlgparam1.rgDRFormType.ItemIndex = 0 then
              begin
                   qryFormSettings.close;
                   qryFormSettings.SQL.clear;
                   qryFormSettings.sql.add('select * from RepSetup ' +
                   ' where (RepCode = ''' + '00001' + ''')');
                   qryFormSettings.Open;

                   if qryDest.FieldByName('Trancode').asstring = '01' then
                   begin
                      rptHold2.SIForm.Page.LeftMargin := qryCompany.fieldbyname('SILeftMargin').asinteger;
                      rptHold2.PageHeaderBand1.Height := qryCompany.fieldbyname('SIHDHeight').asinteger;
                      rptHold2.DetailBand1.Height     := qryCompany.fieldbyname('SIHeight').asinteger;

                      qryFormSettings.First;
                      while not qryFormSettings.eof do
                      begin
                         if (qryFormSettings.FieldByName('fieldcode').asstring='01') then
                         begin
                            rptHold2.qreCustName.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCustName.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='02') then
                         begin
                            rptHold2.qreAdd1.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreAdd1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='03') then
                         begin
                            rptHold2.qreTinNo.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTinNo.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='04') then
                         begin
                            rptHold2.qreSIDate.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreSIDate.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (tFormSettings.FieldByName('fieldcode').asstring='05') then
                         begin
                            rptHold2.qreDRNo.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRNo.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='06') then
                         begin
                            rptHold2.qreDeliverQty.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDeliverQty.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
                         begin
                            rptHold2.qreUnit.Top := qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreUnit.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='08') then
                         begin
                            rptHold2.qreProdCode.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreProdCode.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='09') then
                         begin
                            rptHold2.qreProdName.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreProdName.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='10') then
                         begin
                            rptHold2.qreUnitPrice.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreUnitPrice.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='11') then
                         begin
                            rptHold2.qreGross.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreGross.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='12') then
                         begin
                            rptHold2.qreTotGross1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotGross1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='13') then
                         begin
                            rptHold2.qreTotGross2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotGross2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='14') then
                         begin
                            rptHold2.qreTotTax.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotTax.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='15') then
                         begin
                            rptHold2.qreTotNet.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotNet.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='16') then
                         begin
                            rptHold2.qreAdd2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreAdd2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
                         begin
                            rptHold2.qreBussStyle.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreBussStyle.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='18') then
                         begin
                            rptHold2.qreRemark1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreRemark1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='19') then
                         begin
                            rptHold2.qreRemark2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreRemark2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='20') then
                         begin
                            rptHold2.qreTotSales.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotSales.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='21') then
                         begin
                            rptHold2.qreLessVat.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreLessVat.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='22') then
                         begin
                            rptHold2.qreZeroRatedSales.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreZeroRatedSales.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='23') then
                         begin
                            rptHold2.qreVatSales.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreVatSales.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='24') then
                         begin
                            rptHold2.qreZeroRated.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreZeroRated.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='25') then
                         begin
                            rptHold2.qreVatAmt.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreVatAmt.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='26') then
                         begin
                            rptHold2.qreCurrencya1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCurrencya1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='27') then
                         begin
                            rptHold2.qreCurrencya2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCurrencya2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='28') then
                         begin
                            rptHold2.qreCurrencya3.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCurrencya3.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='29') then
                         begin
                            rptHold2.qrePO.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qrePO.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;

                         if dlgparam1.rgDecimal.itemindex=1 then
                         begin

                            rptHold2.qreUnitPrice.Expression := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''',UnitPrice*1.12), FormatNumeric(''' + '#,##0.00' +''',UnitPrice))';
                            rptHold2.qreGross.Expression     := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''', GrossAmt*1.12), FormatNumeric(''' + '#,##0.00' +''',GrossAmt ))';

                            rptHold2.qreTotSales.Expression  := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt+qrySource.taxamt))';
                            rptHold2.qreLessVat.Expression   := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.taxamt))';
                            rptHold2.qreTotGross1.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt))';
                            rptHold2.qreTotGross2.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt))';
                            rptHold2.qreTotTax.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.taxamt))';
                            rptHold2.qreTotNet.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt+qrySource.taxamt))';

                            rptHold2.qreVatSales.Expression       := 'IF(qrySource.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt)),''' + '' + ''')';
                            rptHold2.qreZeroRated.Expression      := 'IF(qrySource.TaxAmt=0,formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt)),''' + '' + ''')';
                            rptHold2.qreVatAmt.Expression         := 'IF(qrySource.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.TaxAmt)  ),''' + '' + ''')';
                         end;
                         qryFormSettings.next;
                      end;
                      rpthold2.SIForm.preview;
                   end
                   else
                   begin
                      rptHold2.SIForm2.Page.LeftMargin  := qryCompany.fieldbyname('SILeftMargin').asinteger;
                      rptHold2.PageHeaderBand2.Height   := qryCompany.fieldbyname('SIHDHeight').asinteger;
                      rptHold2.DetailBand2.Height       := qryCompany.fieldbyname('SIHeight').asinteger;

                      qryFormSettings.First;
                      while not qryFormSettings.eof do
                      begin
                         if (qryFormSettings.FieldByName('fieldcode').asstring='01') then
                         begin
                            rptHold2.qreCustName2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCustName2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='02') then
                         begin
                            rptHold2.qreAdd12.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreAdd12.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='03') then
                         begin
                            rptHold2.qreTinNo2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTinNo2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='04') then
                         begin
                            rptHold2.qreSIDate2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreSIDate2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='05') then
                         begin
                            rptHold2.qreDRNo2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRNo2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='06') then
                         begin
                            rptHold2.qreSIDRQty2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreSIDRQty2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
                         begin
                            rptHold2.qreUnit2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreUnit2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='08') then
                         begin
                            rptHold2.qreRemarkDet2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreRemarkDet2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='10') then
                         begin
                            rptHold2.qreUnitPrice2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreUnitPrice2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='11') then
                         begin
                            rptHold2.qreGross2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreGross2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='12') then
                         begin
                            rptHold2.qreTotGross12.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotGross12.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='13') then
                         begin
                            rptHold2.qreTotGross22.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotGross22.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='14') then
                         begin
                            rptHold2.qreTotTax2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotTax2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='15') then
                         begin
                            rptHold2.qreTotNet2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotNet2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='16') then
                         begin
                            rptHold2.qreAdd22.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreAdd22.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
                         begin
                            rptHold2.qreBussStyle2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreBussStyle2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='18') then
                         begin
                            rptHold2.qreRemark12.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreRemark12.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='19') then
                         begin
                            rptHold2.qreRemark22.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreRemark22.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='20') then
                         begin
                            rptHold2.qreTotSales2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreTotSales2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='21') then
                         begin
                            rptHold2.qreLessVat2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreLessVat2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='22') then
                         begin
                            rptHold2.qreZeroRatedSales2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreZeroRatedSales2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='23') then
                         begin
                            rptHold2.qreVatSales2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreVatSales2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='24') then
                         begin
                            rptHold2.qreZeroRated2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreZeroRated2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='25') then
                         begin
                            rptHold2.qreVatAmt2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreVatAmt2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='26') then
                         begin
                            rptHold2.qreCurrencyb1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCurrencyb1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='27') then
                         begin
                            rptHold2.qreCurrencyb2.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCurrencyb2.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='28') then
                         begin
                            rptHold2.qreCurrencyb3.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreCurrencyb3.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if dlgparam1.rgDecimal.itemindex=1 then
                         begin

                            rptHold2.qreUnitPrice2.Expression := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''',UnitPrice*1.12), FormatNumeric(''' + '#,##0.00' +''',UnitPrice))';
                            rptHold2.qreGross2.Expression     := 'IF(VAT=''' + 'Y' + ''',FormatNumeric(''' + '#,##0.00' + ''', GrossAmt*1.12), FormatNumeric(''' + '#,##0.00' +''',GrossAmt ))';

                            rptHold2.qreTotSales2.Expression  := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt+qrySource.taxamt))';
                            rptHold2.qreLessVat2.Expression   := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.taxamt))';
                            rptHold2.qreTotGross12.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt))';
                            rptHold2.qreTotGross22.Expression := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt))';
                            rptHold2.qreTotTax2.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.taxamt))';
                            rptHold2.qreTotNet2.Expression    := 'formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt+qrySource.taxamt))';

                            rptHold2.qreVatSales2.Expression       := 'IF(qrySource.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt)),''' + '' + ''')';
                            rptHold2.qreZeroRated2.Expression      := 'IF(qrySource.TaxAmt=0,formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.grossamt)),''' + '' + ''')';
                            rptHold2.qreVatAmt2.Expression         := 'IF(qrySource.TaxAmt>0,formatnumeric(''' + '#,##0.00' + ''',sum(qrySource.TaxAmt)  ),''' + '' + ''')';
                         end;

                         qryFormSettings.next;
                      end;
                      rptHold.SIForm2.preview;
                   end;
                   qryFormSettings.Close;
              end
              else if dlgparam1.rgDRFormType.ItemIndex = 1 then
              begin
                  qryFormSettings.close;
                  qryFormSettings.SQL.clear;
                  qryFormSettings.sql.add('select * from RepSetup ' +
                      ' where (RepCode = ''' + '00002' + ''')');
                  qryFormSettings.Open;

                  if qryDest.FieldByName('Trancode').asstring = '01' then
                  begin
                      rpthold2.qreDRProdCode1.enabled := true;
                      rpthold2.qreDRProdName1.enabled := true;
                      rpthold2.qreDRRemarkDet1.enabled:= false;
                  end
                  else
                  begin
                      rpthold2.qreDRProdCode1.enabled := false;
                      rpthold2.qreDRProdName1.enabled := false;
                      rpthold2.qreDRREmarkDet1.enabled:= true;
                  end;
                  rptHold2.SIForm2.Page.LeftMargin  := qryCompany.fieldbyname('SILeftMargin').asinteger;
                  rptHold2.PageHeaderBand2.Height   := qryCompany.fieldbyname('SIHDHeight').asinteger;
                  rptHold2.DetailBand2.Height       := qryCompany.fieldbyname('SIHeight').asinteger;

                  qryFormSettings.First;
                  while not qryFormSettings.eof do
                  begin
                         if (qryFormSettings.FieldByName('fieldcode').asstring='01') then
                         begin
                            rptHold2.qreDRCustName1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDrCustName1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='02') then
                         begin
                            rptHold2.qreDRAdd11.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRAdd11.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='03') then
                         begin
                            rptHold2.qreDRTinNo1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRTinNo1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='04') then
                         begin
                            rptHold2.qreDRDRDate1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRDRDate1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='05') then
                         begin
                            rptHold2.qreDRQty1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRQty1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='06') then
                         begin
                            rptHold2.qreDRUnit1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRUnit1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
                         begin
                            rptHold2.qreDRProdCode1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRProdCode1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='07') then
                         begin
                            rptHold2.qreDRRemarkDet1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRRemarkDet1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                        if (qryFormSettings.FieldByName('fieldcode').asstring='08') then
                         begin
                            rptHold2.qreDRProdName1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRProdName1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='09') then
                         begin
                            rptHold2.qreDRPONo1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRPONo1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
                         begin
                            rptHold2.qreDRBussStyle1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDrBussStyle1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='16') then
                         begin
                            rptHold2.qreDRAdd21.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRAdd21.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='17') then
                         begin
                            rptHold2.qreDRBussStyle1.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRBussStyle1.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='18') then
                         begin
                            rptHold2.qreDRRem11.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRRem11.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         if (qryFormSettings.FieldByName('fieldcode').asstring='19') then
                         begin
                            rptHold2.qreDRRem21.Top:= qryFormSettings.fieldbyname('Reprow').asinteger;
                            rptHold2.qreDRRem21.left:= qryFormSettings.fieldbyname('Repcol').asinteger;
                         end;
                         qryFormSettings.next;
                  end;
                  rptHold.DRForm.Preview;
                  qryFormSettings.Close;
              end;
              rptHold2.free;
        end
        else
        begin
           showmessage('AJS');
        end;
        qryForm.close;
        qrycompany.close;
     end;
  end;
  dlgparam1.free;
  }
end;

procedure TARForm.BitBtn8Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     {
     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from Setup');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from Setup');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('CompName'    ).asstring  := qrySource.fieldbyname('CompName'    ).asstring;
        qryDest.fieldbyname('SIHeight'    ).asinteger := qrySource.fieldbyname('SIHeight'    ).asinteger;
        qryDest.fieldbyname('DRHeight'    ).asinteger := qrySource.fieldbyname('DRHeight'    ).asinteger;
        qryDest.fieldbyname('SIHDHeight'  ).asinteger := qrySource.fieldbyname('SIHDHeight'  ).asinteger;
        qryDest.fieldbyname('DRHdHeight'  ).asinteger := qrySource.fieldbyname('DRHDHeight'  ).asinteger;
        qryDest.fieldbyname('SILeftMargin').asinteger := qrySource.fieldbyname('SILeftMargin').asinteger;
        qryDest.fieldbyname('DRLeftMargin').asinteger := qrySource.fieldbyname('DRLeftMargin').asinteger;
        qryDest.fieldbyname('SourceDir'   ).asstring  := qrySource.fieldbyname('SourceDir'   ).asstring;
        qryDest.fieldbyname('TargetDir'   ).asstring  := qrySource.fieldbyname('TargetDir'   ).asstring;
        qryDest.fieldbyname('PrintingType').asstring  := qrySource.fieldbyname('PrintingType').asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;
      }

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from RepSetup');
     qryDest.Open;


     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from tblRepSetup');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('RepCode'     ).asstring  := qrySource.fieldbyname('RepCode'     ).asstring;
        qryDest.fieldbyname('FieldCode'   ).asstring  := qrySource.fieldbyname('FieldCode'   ).asstring;
        qryDest.fieldbyname('FieldName'   ).asstring  := qrySource.fieldbyname('FieldName'   ).asstring;
        qryDest.fieldbyname('RepRow'      ).asinteger := qrySource.fieldbyname('RepRow'      ).asinteger;
        qryDest.fieldbyname('RepCol'      ).asinteger := qrySource.fieldbyname('RepCol'      ).asinteger;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;


     ARServer.Connected := false;

     showmessage('End of processing...');
  end;


end;

procedure TARForm.BitBtn9Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from Product');
     qryDest.Open;


     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from Product');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('prodcode'    ).asstring  := qrySource.fieldbyname('prodcode'    ).asstring;
        qryDest.fieldbyname('prodname'    ).asstring  := qrySource.fieldbyname('prodname'    ).asstring;
        qryDest.fieldbyname('saleprice'   ).asfloat   := qrySource.fieldbyname('saleprice'   ).asfloat;
        qryDest.fieldbyname('custcode'    ).asstring  := qrySource.fieldbyname('custcode'    ).asstring;
        qryDest.fieldbyname('unitmeas'    ).asstring  := qrySource.fieldbyname('unitmeas'    ).asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;


     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;

procedure TARForm.BitBtn10Click(Sender: TObject);
begin
  with dmardata do
  begin
     qryForm.close;
     qryForm.sql.Clear;
                       qryForm.sql.add('select Customer.CustName, SaleHd.SaleDate, Customer.Addr1,SaleHd.DRDate,Customer.Addr2, ' +
                   ' SaleDet.DeliverQty, Product.UnitMeas, SaleDet.ProdCode, Product.ProdName, SaleDet.TaxAmt, SaleDet.Purchno, ' +
                   ' Customer.TinNo, Customer.BusinessStyle, SaleDet.DRNo, SaleHd.Remark1, SaleHd.Remark2, SaleHd.Remark3, SaleHd.Remark4, SaleDet.RemarkDet, Currency.CurrencySign,Customer.Vat, ' +
                   ' SaleDet.UnitPrice, SaleDet.GrossAmt, saleHd.PONO ' +
                   ' from SaleHd,SaleDet,Customer,Product,Currency  ' +
                   ' where (SaleHd.DRNo=SaleDet.DRNo) ' +
                   ' and (salehd.custcode = customer.custcode) ' +
                   ' and (saledet.prodcode = product.prodcode) ' +
                   ' and (SaleDet.CurrencyCode=Currency.CurrencyCode) ' +
                   ' and (trim(SaleDet.Drno) = ''' + qryDest.fieldbyname('drno').asstring + ''')');
     qryForm.Open;
  end;
end;

procedure TARForm.Button1Click(Sender: TObject);
begin
   with dmardata do
   begin
     ARServer.Connected := true;

     // Header
     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from PurchHd');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from PurchHd');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('purchno').asstring    := qrySource.fieldbyname('purchno').asstring;
        qryDest.fieldbyname('purchdate').asdatetime:= qrySource.fieldbyname('purchdate').asdatetime;
        qryDest.fieldbyname('custcode').asstring   := qrySource.fieldbyname('custcode').asstring;
        qryDest.fieldbyname('termcode').asstring   := qrySource.fieldbyname('termcode').asstring;
        qryDest.fieldbyname('drdate').asdatetime   := qrySource.fieldbyname('drdate').asdatetime;
        qryDest.fieldbyname('status').asstring     := qrySource.fieldbyname('status').asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;

     // Detail
     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from PurchDet');
     qryDest.Open;

     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from PurchDet');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('purchno').asstring     := qrySource.fieldbyname('purchno').asstring;
        qryDest.fieldbyname('prodcode').asstring    := qrySource.fieldbyname('prodcode').asstring;
        qryDest.fieldbyname('unitprice').asfloat    := qrySource.fieldbyname('unitprice').asfloat;
        qryDest.fieldbyname('grossamt').asfloat     := qrySource.fieldbyname('grossamt').asfloat;
        qryDest.fieldbyname('taxamt').asfloat       := qrySource.fieldbyname('taxamt').asfloat;
        qryDest.fieldbyname('netamt').asfloat       := qrySource.fieldbyname('netamt').asfloat;

        qryDest.fieldbyname('orderqty').asfloat     := qrySource.fieldbyname('orderqty').asfloat;
        qryDest.fieldbyname('deliverqty').asfloat   := qrySource.fieldbyname('deliverqty').asfloat;
        qryDest.fieldbyname('lastqty').asfloat      := qrySource.fieldbyname('lastqty').asfloat;
        qryDest.fieldbyname('currencycode').asstring:= qrySource.fieldbyname('currencycode').asstring;
        qryDest.fieldbyname('taxamt').asfloat       := qrySource.fieldbyname('taxamt').asfloat;
        qryDest.fieldbyname('netamt').asfloat       := qrySource.fieldbyname('netamt').asfloat;


        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;


     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;

procedure TARForm.Button2Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from TranType');
     qryDest.Open;


     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from TranType');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('trancode'    ).asstring  := qrySource.fieldbyname('trancode'    ).asstring;
        qryDest.fieldbyname('tranname'    ).asstring  := qrySource.fieldbyname('tranname'    ).asstring;
        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;


     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;

procedure TARForm.Button3Click(Sender: TObject);
begin
  with dmardata do
  begin
     ARServer.Connected := true;

     qryDest.close;
     qryDest.sql.clear;
     qryDest.sql.add('select * from Setup');
     qryDest.Open;


     qrySource.Close;
     qrySource.sql.clear;
     qrySource.sql.add('select * from Setup');
     qrySource.Open;
     while not qrySource.eof do
     begin
        qryDest.append;
        qryDest.fieldbyname('Compname'     ).asstring  := qrySource.fieldbyname('Compname'    ).asstring;
        qryDest.fieldbyname('SIHeight'     ).asinteger := qrySource.fieldbyname('SIheight'    ).asinteger;
        qryDest.fieldbyname('DRHeight'     ).asinteger := qrySource.fieldbyname('DRHeight'    ).asinteger;
        qryDest.fieldbyname('SIHDHeight'   ).asinteger := qrySource.fieldbyname('SIHDHeight'  ).asinteger;
        qryDest.fieldbyname('DRHDHeight'   ).asinteger := qrySource.fieldbyname('DRHDHeight'  ).asinteger;
        qryDest.fieldbyname('SILeftMargin' ).asinteger := qrySource.fieldbyname('SILeftMargin').asinteger;
        qryDest.fieldbyname('DRLeftMargin' ).asinteger := qrySource.fieldbyname('DRLeftMargin').asinteger;
        qryDest.fieldbyname('SourceDir'    ).asstring  := qrySource.fieldbyname('SourceDir'   ).asstring;
        qryDest.fieldbyname('TargetDir'    ).asstring  := qrySource.fieldbyname('TargetDir'   ).asstring;
        qryDest.fieldbyname('PrintingType' ).asstring  := qrySource.fieldbyname('PrintingType').asstring;

        qryDest.post;
        qrySource.Next;
     end;
     qrySource.close;
     qryDest.close;


     ARServer.Connected := false;

     showmessage('End of processing...');
  end;

end;


procedure TARForm.BitBtn11Click(Sender: TObject);
var cAmt : string;
    nctr : integer;
begin
     nctr := 0;
     qrysource.close;
     qrysource.sql.clear;
     qrysource.sql.add('Select * from product');
     qrysource.open;
     qrysource.first;
     while not qrysource.eof do
     begin
         cAmt := floattostr(qrysource.fieldbyname('saleprice').asfloat);
         if (pos('.',cAmt) > 0) then
         begin
            cAmt := copy(cAmt,pos('.',camt)+3,1);
            if (cAmt<>'') then
            begin
                nctr := nctr +1;
                listbox1.Items.Add(qrysource.fieldbyname('custcode').asstring + ' - ' + qrysource.fieldbyname('prodcode').asstring+ ' - ' + floattostr(qrysource.fieldbyname('saleprice').asfloat));
            end;
         end;
         qrysource.next;
     end;
     showmessage(inttostr(nctr)+ '/' + inttostr(qrysource.RecordCount));
end;

procedure TARForm.BitBtn12Click(Sender: TObject);
var cAmt : string;
begin
         cAmt := floattostr(500.123);
         cAmt := copy(cAmt,pos('.',camt)+3,1);
         showmessage(cAMt);

end;

procedure TARForm.BitBtn13Click(Sender: TObject);
var  nctr : integer;
    // tottax,totnet
begin
     nctr := 0;
     qrysource.close;
     qrysource.sql.clear;
     qrysource.sql.add('Select * from salehd order by saledate');
     qrysource.open;
     qrysource.first;
     while not qrysource.eof do
     begin
         if (Has3Dec(qrySource.fieldbyname('TotGross').asstring)) or (has3Dec(qrysource.fieldbyname('TotNet').asstring)) or (has3Dec(qrysource.fieldbyname('TotTax').asstring)) then
         begin
            listbox1.Items.Add(qrysource.fieldbyname('DRNo').asstring+','+qrysource.fieldbyname('custcode').asstring + ',' + floattostr(qrysource.fieldbyname('totgross').asfloat)+','+qrysource.fieldbyname('totnet').asstring+','+qrysource.fieldbyname('tottax').asstring);
            nctr := nctr +1 ;
         end;
         qrysource.next;
     end;
     showmessage(inttostr(nctr)+ '/' + inttostr(qrysource.RecordCount));
     listbox1.Items.SaveToFile('c:\AS\Metal\Doc\salehd.txt');
end;

procedure TARForm.BitBtn14Click(Sender: TObject);
var cAmt : string;
    nctr : integer;
    // netamt,taxamt,grossamt,unitprice
begin
     nctr := 0;
     qrysource.close;
     qrysource.sql.clear;
     qrysource.sql.add('Select * from saledet drno');
     qrysource.open;
     qrysource.first;
     while not qrysource.eof do
     begin
         if (Has3Dec(qrySource.fieldbyname('netamt').asstring)) or (has3Dec(qrysource.fieldbyname('taxamt').asstring)) or (has3Dec(qrysource.fieldbyname('grossamt').asstring)) or (has3dec(qrysource.fieldbyname('unitprice').asstring)) then
         begin
            listbox1.Items.Add(qrysource.fieldbyname('DRNo').asstring+','+qrysource.fieldbyname('prodcode').asstring + ',' + floattostr(qrysource.fieldbyname('netamt').asfloat)+','+qrysource.fieldbyname('grossamt').asstring+','+qrysource.fieldbyname('taxamt').asstring + ',' + qrysource.fieldbyname('unitprice').asstring);
            nctr := nctr +1 ;
         end;
         qrysource.next;
     end;
     showmessage(inttostr(nctr)+ '/' + inttostr(qrysource.RecordCount));
     listbox1.Items.SaveToFile('c:\AS\Metal\Doc\saledet.txt');
end;


function TARForm.has3Dec(cAmt:string):boolean;
var lhas3dec: boolean;
begin
       lhas3dec:=false;
       if (pos('.',cAmt) > 0) then
       begin
            cAmt := copy(cAmt,pos('.',camt)+3,1);
            if (cAmt<>'') then
              lhas3dec:=true;
       end;
       result := lhas3dec;
end;

procedure TARForm.BitBtn15Click(Sender: TObject);
begin
  {
  with dmardata do
  begin
     qryCustPayHd.close;
     qryCustPayHd.sql.add('select * from PayCustHd');
     qryCustPayHd.open;
  end;
  }
end;

end.
