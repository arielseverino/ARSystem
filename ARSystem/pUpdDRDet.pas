unit pUpdDRDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls,db;

type
  TUpdDrDet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    gbHead: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedrno: TDBEdit;
    dbedrdate: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Panel3: TPanel;
    NextBtn: TButton;
    PrevBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    BrowseBtn: TButton;
    CancelBtn: TButton;
    CloseBtn: TButton;
    gbDet: TGroupBox;
    Label16: TLabel;
    dbeprodcode: TDBEdit;
    Label12: TLabel;
    DBText4: TDBText;
    dbePO: TDBText;
    Label14: TLabel;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    Label17: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    dblprodname: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    DBText6: TDBText;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label21: TLabel;
    cbPerProduct: TDBCheckBox;
    dbeProdname: TDBEdit;
    dblPO: TDBLookupComboBox;
    procedure AddBtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure findpo(Sender: TObject);
    procedure CompPrice(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NextBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure cbPerProductClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SetRecDet():boolean;
    //function POBalance():boolean;
    function ValidatePOBal():boolean;
  end;

var
  UpdDrDet: TUpdDrDet;
  oNetAmt,oTaxAmt,oGrossAmt,oQty : real;
  cInitialize : string;


implementation

uses pardata, pListRec;

{$R *.dfm}

procedure TUpdDrDet.AddBtnClick(Sender: TObject);
begin
    dblPO.Visible:=true;
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled    := true;

    BrowseBtn.Caption := '&Ok';
    CancelBtn.Caption    := '&Cancel';

    gbDet.Enabled := true;
    if cbPerProduct.checked=true then
        dblProdName.Enabled:=true;
    dmardata.qrySaleDet.append;
    dmardata.qrySaleDet.FieldByName('PerProduct').asstring:= 'Y';
    dmardata.qrysaledet.fieldbyname('DRNo').asstring    := dmardata.qrySaleHd.fieldbyname('drno').asstring;
    dmardata.qrysaledet.fieldbyname('SaleInv').asstring := dmardata.qrysalehd.fieldbyname('saleinv').asstring;
    dmardata.qrySaleDet.fieldbyname('currencyCode').asstring := dmardata.qrycustomer.fieldbyname('currencycode').asstring;
    dmardata.qrysaleDet.fieldbyname('taxamt').asfloat   := 0;
    dbeprodcode.SetFocus;

    oNetAmt    := 0;
    oTaxAmt    := 0;
    oGrossAmt  := 0;
    oQty       := 0;


end;

procedure TUpdDrDet.BrowseBtnClick(Sender: TObject);
begin
    if BrowseBtn.Caption = '&Ok' then
    begin
      if ValidatePOBal() then
      begin
         dblPO.visible:=false;
         dmardata.qrysaledet.post;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         CancelBtn.enabled := false;

         BrowseBtn.Caption := '&Browse';

         gbDet.Enabled := false;

         with dmardata do
         begin
            qryPODet.close;
            qryPODet.sql.clear;
            qryPODet.sql.add('select * from PurchDet order by purchno,prodcode');
            qryPODet.open;
            if qryPODet.Locate('PurchNo;ProdCode',Vararrayof([qrySaleDet.FieldByName('PurchNo').asstring,qrySaleDet.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
            begin
              qryreusable2.Close;
              qryreusable2.sql.clear;
              qryreusable2.sql.add('select sum(netamt) as TotNet, sum(taxamt) as TotTax, sum(netamt+taxamt) as TotGross from SaleDet a ' +
              ' where (a.DRNo = ''' + qrysaleHd.fieldbyname('drno').asstring + ''')');
              qryreusable2.Open;

              qrySalehd.edit;
              qrysalehd.fieldbyname('TotNet').asfloat   := qryreusable2.fieldbyname('TotNet').asfloat;
              qrysalehd.fieldbyname('TotTax').asfloat   := qryreusable2.fieldbyname('TotTax').asfloat;
              qrysalehd.fieldbyname('TotGross').asfloat := qryreusable2.fieldbyname('TotGross').asfloat;

              qrysalehd.fieldbyname('LastBal').asfloat  := qryreusable2.fieldbyname('TotGross').asfloat
                                                           - (qrysalehd.fieldbyname('TotPaid').asfloat
                                                           +  qrysalehd.fieldbyname('Adjamt').asfloat);

              {
              qrysalehd.fieldbyname('TotNet').asfloat   := qrysalehd.fieldbyname('totnet').asfloat   + qrysaledet.fieldbyname('netamt').asfloat - oNetAmt;
              qrysalehd.fieldbyname('TotTax').asfloat   := qrysalehd.fieldbyname('tottax').asfloat   + qrysaledet.fieldbyname('TaxAmt').asfloat - oTaxAmt;
              qrysalehd.fieldbyname('TotGross').asfloat := qrysalehd.fieldbyname('Totgross').asfloat + qrysaledet.fieldbyname('NetAmt').asfloat
                                                         + qrysaledet.fieldbyname('TaxAmt').asfloat - (oTaxAmt+oNetAmt);
              qrysalehd.fieldbyname('LastBal').asfloat  := qrySalehd.fieldbyname('TotGross').asfloat
                                                         - (qrysalehd.fieldbyname('TotPaid').asfloat
                                                         +  qrysalehd.fieldbyname('Adjamt').asfloat);
              }
              qrysalehd.post;
              qryreusable2.close;

              if cbPerProduct.checked=true then
              begin
                 qryPODet.close;
                 qryPODet.sql.clear;
                 qryPODet.sql.add('select * from PurchDet order by purchno,prodcode');
                 qryPODet.open;
                 if qryPODet.Locate('PurchNo;ProdCode',Vararrayof([qrySaleDet.FieldByName('PurchNo').asstring,qrySaleDet.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
                 begin
                    qryPODet.edit;
                    qryPODet.fieldbyname('DeliverQty').asfloat := qryPODet.fieldbyname('DeliverQty').asfloat + qrySaleDet.fieldbyname('DeliverQty').asfloat - oQty;
                    qryPODet.fieldbyname('LastQty').asfloat    := qryPODet.fieldbyname('OrderQty').asfloat - qryPODet.fieldbyname('DeliverQty').asfloat;
                    qryPODet.post;
                 end
                 else
                    showmessage('Entered delivery did not post !!!');
                 qryPODet.Close;

                 qryreusable1.close;
                 qryreusable1.sql.clear;
                 qryreusable1.sql.add('select * from purchhd,purchdet where (custcode = ''' + qrysalehd.fieldbyname('custcode').asstring + ''')' +
                 ' and (prodcode = ''' + qrysaledet.fieldbyname('prodcode').asstring + ''')' +
                 ' and (purchhd.purchno = purchdet.purchno) ' +
                 ' and (lastqty > 0 )');
                 qryReusable1.Open;
              end;
            end
            else
                showmessage('PO not found !!!');
         end;
      end;
    end
    else if browsebtn.caption = '&Browse' then
    begin
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF STOCK NAME ';
         ListRec.dbgrid1.DataSource := dmardata.dsSaleDet;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'ProdName';
         ListRec.showmodal;
         ListRec.free;
    end;
end;

procedure TUpdDrDet.CancelBtnClick(Sender: TObject);
begin
    dmardata.qrysaledet.cancel;
    dblPO.visible:=false;
    NextBtn.Enabled  := true;
    PrevBtn.Enabled  := true;

    AddBtn.Enabled   := true;
    DelBtn.Enabled   := true;
    EditBtn.enabled  := true;

    CloseBtn.enabled := true;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled := false;

    BrowseBtn.Caption := '&Browse';

    gbDet.Enabled := false;

end;

procedure TUpdDrDet.findpo(Sender: TObject);
begin
    with dmardata do
    begin
         if qrySaleDet.fieldbyname('ProdCode').asstring <> '' then
         begin
              qryreusable1.close;
              qryreusable1.sql.clear;
              qryreusable1.sql.add('select * from purchhd,purchdet where (custcode = ''' + qrysalehd.fieldbyname('custcode').asstring + ''')' +
              ' and (prodcode = ''' + qrysaledet.fieldbyname('prodcode').asstring + ''')' +
              ' and (purchhd.purchno = purchdet.purchno) ' +
              ' and (purchdet.lastqty > 0)');
              qryReusable1.Open;

              {
              qryreusable1.close;
              qryreusable1.sql.clear;
              qryreusable1.sql.add('select * from purchdet ' +
                   '                            left outer join Purchhd on (purchhd.purchno=purchdet.purchno)' +
                   '                where (purchhd.custcode = ''' + qrySalehd.fieldbyname('custcode').asstring + ''')' +
                   '                and (purchdet.prodcode = ''' + qrySaleDet.fieldbyname('prodcode').asstring + ''')' +
                   ' where (purchdet.lastqty > 0');
              qryReusable1.Open;
              }
              if qryReusable1.RecordCount > 0 then
              begin
                   {tsaledet.Edit;}
                   qrysaledet.FieldByName('unitprice').asfloat := qryReusable1.fieldbyname('unitprice').asfloat;
                   qrysaledet.fieldbyname('purchno').asstring  := qryReusable1.fieldbyname('purchno').asstring;
              end
              else
                   showmessage('PO not available...');
         end;
    end;
end;

procedure TUpdDrDet.CompPrice(Sender: TObject);
begin
    with dmardata do
    begin
         {tsaledet.edit;}
         if ValidatePOBal() then
         begin
            qrysaledet.fieldbyname('NetAmt').asfloat := qrysaledet.fieldbyname('unitprice').asfloat *
                                                        qrysaledet.fieldbyname('deliverqty').asfloat;
            if (qryCustomer.FieldByName('Vat').asstring='Y') then
                qrysaledet.fieldbyname('Taxamt').asfloat   := qrysaledet.fieldbyname('NetAmt').asfloat * 0.12;
            qrysaledet.fieldbyname('Grossamt').asfloat     := qrysaledet.fieldbyname('NetAmt').asfloat;
         end;
    end;
end;

procedure TUpdDrDet.EditBtnClick(Sender: TObject);
begin
    dblPO.visible:=true;
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled := true;

    BrowseBtn.Caption := '&Ok';

    gbDet.Enabled := true;
    dmardata.qrySaleDet.edit;
    dbeprodcode.readonly := true;
    dbeprodcode.enabled  := false;
    dblprodname.enabled := false;

    oNetAmt    := dmardata.qrysaledet.fieldbyname('netamt').asfloat;
    oTaxAmt    := dmardata.qrysaledet.fieldbyname('taxamt').asfloat;
    oGrossAmt  := dmardata.qrysaledet.fieldbyname('Grossamt').asfloat;
    oQty       := dmardata.qrysaledet.fieldbyname('deliverqty').asfloat;

end;

procedure TUpdDrDet.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qrySaleDet.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qrySaleHd.Edit;
              qrySaleHd.FieldByName('TotNet').asfloat   := qrySalehd.fieldbyname('TotNet').asfloat - qrySaleDet.fieldbyname('NetAmt').asfloat;
              qrySalehd.fieldbyname('TotTax').asfloat   := qrySaleHd.fieldbyname('TotTax').asfloat - qrySaleDet.fieldbyname('TaxAmt').asfloat;
              qrySaleHd.fieldbyname('TotGross').asfloat := qrySaleHd.fieldbyname('TotGross').asfloat - (qrySaleDet.fieldbyname('netAmt').asfloat + qrySaledet.fieldbyname('Taxamt').asfloat);
              qrysalehd.fieldbyname('LastBal').asfloat  := qrySalehd.fieldbyname('TotGross').asfloat
                                                        - (qrysalehd.fieldbyname('TotPaid').asfloat
                                                        +  qrysalehd.fieldbyname('Adjamt').asfloat);
              qrySaleHd.Post;

              qryPODet.close;
              qryPODet.sql.clear;
              qryPODet.sql.add('select * from PurchDet order by purchno,prodcode');
              qryPODet.open;
              if qryPODet.Locate('PurchNo;ProdCode',Vararrayof([qrySaleDet.FieldByName('PurchNo').asstring,qrySaleDet.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
              begin
                  qryPODet.edit;
                  qryPODet.fieldbyname('DeliverQty').asfloat := qryPODet.fieldbyname('DeliverQty').asfloat - qrySaleDet.fieldbyname('DeliverQty').asfloat;
                  qryPODet.fieldbyname('LastQty').asfloat    := qryPODet.fieldbyname('OrderQty').asfloat - qryPODet.fieldbyname('DeliverQty').asfloat;
                  qryPODet.post;
              end;
              qrySaleDet.delete;
              qryPODet.close;
         end;

    end;
end;

procedure TUpdDrDet.FormActivate(Sender: TObject);
begin

    with dmardata do
    begin
         qryreusable1.close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('select * from purchhd,purchdet where (custcode = ''' + qrysalehd.fieldbyname('custcode').asstring + ''')' +
         ' and (prodcode = ''' + qrysaledet.fieldbyname('prodcode').asstring + ''')' +
         ' and (purchhd.purchno = purchdet.purchno) ' +
         ' and (lastqty > 0 )');
         qryReusable1.Open;
    end;
    cInitialize:='Y' ;

    UpdDrDet.SetRecDet();

end;

procedure TUpdDrDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmardata.qryreusable1.close;
end;

procedure TUpdDrDet.NextBtnClick(Sender: TObject);
begin
   dmardata.qrysaledet.next;
   SetRecDet();
end;

procedure TUpdDrDet.PrevBtnClick(Sender: TObject);
begin
   dmardata.qrysaledet.prior;
   SetRecDet();
end;

 procedure TUpdDrDet.cbPerProductClick(Sender: TObject);
begin
  if (cInitialize='Y') and (BrowseBtn.Caption='&Ok') then
  begin
     with dmardata do
     begin
        if cbPerProduct.checked=false then
        begin
           dbeProdcode.Enabled:=false;
           qrySaleDet.fieldbyname('Prodcode').asstring := '00000';
           dbeProdName.visible := true;
           dblProdName.Visible := false;
        end
        else
        begin
           dbeProdCode.enabled:=true;
           dbeProdName.visible := false;
           dblProdName.visible := true;
        end;
     end;
  end;
end;

Function tUpdDRDet.SetRecDet():boolean;
begin
  if cbPerProduct.checked=false then
  begin
     dbeProdcode.Enabled:=false;
     dbeProdName.visible := true;
     dblProdName.Visible := false;
  end
  else
  begin
     dbeProdCode.enabled:=true;
     dbeProdName.visible := false;
     dblProdName.visible := true;
  end;
end;

Function tUpdDRDet.ValidatePOBal():boolean;
var return : boolean;
begin
  return := false;
  with dmardata do
  begin
     if (qryreusable1.FieldByName('LastQty').asfloat < qrySaleDet.fieldbyname('DeliverQty').asfloat) then
     begin
         showmessage('Cannot allow delivery more than PO balance ...');
         return := false;
     end
     else
         return := true;
  end;
  result := return;
end;
end.
