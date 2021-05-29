unit pUpdPayDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TUpdPayDet = class(TForm)
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
    dbedrno: TDBEdit;
    dbedrdate: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Panel3: TPanel;
    PrevBtn: TButton;
    NextBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    BrowseBtn: TButton;
    CancelBtn: TButton;
    CloseBtn: TButton;
    gbDet: TGroupBox;
    Label12: TLabel;
    DBText4: TDBText;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    Label17: TLabel;
    dblInvno: TDBLookupComboBox;
    Label20: TLabel;
    DBText6: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBText5: TDBText;
    Label14: TLabel;
    cbVat: TDBCheckBox;
    Label15: TLabel;
    DBText7: TDBText;
    procedure AddBtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure dblInvnoClick(Sender: TObject);
    procedure CompTax(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdPayDet: TUpdPayDet;
  oAmtPaid : real;
  oTaxAmt:real;

implementation

uses pardata, pListRec;

{$R *.dfm}

procedure TUpdPayDet.AddBtnClick(Sender: TObject);
begin
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
    dmardata.qryPayCust.append;
    dmardata.qryPayCust.fieldbyname('ORNo').asstring    := dmardata.qryPayCusHd.fieldbyname('ORNo').asstring;
    dmardata.qryPayCust.FieldByName('vat').asstring     := dmardata.qrycustomer.fieldbyname('vat').asstring;
    dblinvno.SetFocus;

    oAmtPaid   := 0;
    oTaxAmt:=0;

end;

procedure TUpdPayDet.BrowseBtnClick(Sender: TObject);
begin

    if BrowseBtn.Caption = '&Ok' then
    begin

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
              qrySalehd.edit;
              qrySaleHd.fieldbyname('LastBal').asfloat  := qrySaleHd.fieldbyname('LastBal').asfloat
                                                         - qryPayCust.fieldbyname('AmtPaid').asfloat + oAmtPaid;
              qrySalehd.fieldbyname('TotPaid').asfloat  := qrySalehd.fieldbyname('TotPaid').asfloat
                                                         + qryPayCust.fieldbyname('AmtPaid').asfloat - oAmtPaid;
              qrySaleHd.post;

              qryPayCust.fieldbyname('LastBal').asfloat := qrySalehd.fieldbyname('LastBal').asfloat;
              qryPayCust.post;

              qryPayCusHd.Edit;
              qryPayCusHd.FieldByName('Invamt').asfloat   := qrypaycushd.fieldbyname('Invamt').asfloat +
                                                             qrypaycust.fieldbyname('AmtPaid').asfloat - oAmtPaid;
              qryPayCusHd.FieldByName('TaxAmt').asfloat   := qryPayCusHd.fieldbyname('TaxAmt').asfloat  +
                                                             qryPayCust.fieldbyname('TaxAmt').asfloat-oTaxAmt;
              qryPayCusHd.fieldbyname('CheckAmt').asfloat := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                            (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                           + qryPayCusHd.fieldbyname('TaxAmt').asfloat);
              qryPayCusHd.post;

         end;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF SALES INV.';
         ListRec.dbgrid1.DataSource := dmardata.dsPayCust;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'SaleInv';
         ListRec.showmodal;
         ListRec.free;
    end;


end;

procedure TUpdPayDet.CancelBtnClick(Sender: TObject);
begin
    dmardata.qryPayCust.cancel;

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

{
procedure TUpdPayDet.findpo(Sender: TObject);
begin
    with dmardata do
    begin
         qrypohd.close;
         qrypohd.sql.clear;
         qrypohd.sql.add('select * from purchhd,purchdet where (custcode = ''' + tsaleshd.fieldbyname('custcode').asstring + ''')' +
         ' and (prodcode = ''' + tsaledet.fieldbyname('prodcode').asstring + ''')' +
         ' and (purchhd.purchno = purchdet.purchno) ' +
         ' and (lastqty > 0 )');
         qrypohd.Open;
         if qrypohd.RecordCount > 0 then
         begin
              tsaledet.Edit;
              tsaledet.FieldByName('unitprice').asfloat := qrypohd.fieldbyname('unitprice').asfloat;
              tsaledet.fieldbyname('purchno').asstring  := qrypohd.fieldbyname('purchno').asstring;
         end
         else
              showmessage('PO not available...');
    end;
end;}

{
procedure TUpdPayDet.CompPrice(Sender: TObject);
begin
    with dmardata do
    begin
         tsaledet.edit;
         tsaledet.fieldbyname('NetAmt').asfloat := tsaledet.fieldbyname('unitprice').asfloat *
                                                   tsaledet.fieldbyname('deliverqty').asfloat;
         tsaledet.fieldbyname('Taxamt').asfloat   := tsaledet.fieldbyname('NetAmt').asfloat * 0.12;
         tsaledet.fieldbyname('Grossamt').asfloat := tsaledet.fieldbyname('NetAmt').asfloat;
    end;
end;}

procedure TUpdPayDet.EditBtnClick(Sender: TObject);
begin

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
    dblinvno.readonly := true;

    oAmtPaid:= dmardata.qryPayCust.fieldbyname('AmtPaid').asfloat;
    oTaxAmt:=dmardata.qryPayCust.fieldbyname('TaxAmt').asfloat;
    dmardata.qrypaycust.edit;
end;

procedure TUpdPayDet.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryPayCust.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qrySaleHd.Edit;
              qrysalehd.fieldbyname('LastBal').asfloat  := qrySalehd.fieldbyname('LastBal').asfloat
                                                         + qryPayCust.fieldbyname('AmtPaid').asfloat;
              qrysalehd.fieldbyname('TotPaid').asfloat  := qrySalehd.fieldbyname('TotPaid').asfloat
                                                         - qryPayCust.fieldbyname('AmtPaid').asfloat;
              qrySaleHd.post;

              qryPayCusHd.Edit;
              qryPayCusHd.FieldByName('Invamt').asfloat   := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                             qrypaycust.fieldbyname('AmtPaid').asfloat;
              qryPayCusHd.FieldByName('Taxamt').asfloat   := qrypaycushd.fieldbyname('TaxAmt').asfloat -
                                                             qrypaycust.fieldbyname('TaxAmt').asfloat;


              qryPayCusHd.fieldbyname('CheckAmt').asfloat := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                            (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                           + qryPayCusHd.fieldbyname('TaxAmt').asfloat);
              qryPayCusHd.post;


              qryPayCust.delete;
         end;

    end;
end;

procedure TUpdPayDet.dblInvnoClick(Sender: TObject);
begin
    with dmardata do
    begin
         qryPayCust.fieldbyname('PrevBal').asfloat  := qrySaleHd.fieldbyname('LastBal').asfloat;
         qryPayCust.fieldbyname('AmtPaid').asfloat  := qrySaleHd.fieldbyname('LastBal').asfloat;
         qryPayCust.fieldbyname('PayPerc').asfloat  := 0.01;
         if cbvat.checked=true then
         begin
            qryPayCust.fieldbyname('TaxAmt').asfloat  := ((qrySalehd.fieldbyname('LastBal').asfloat/1.12)*0.01);
            qryPayCust.fieldbyname('NetAmt').asfloat     :=qrySaleHd.fieldbyname('LastBal').asfloat -  ((qrySalehd.fieldbyname('LastBal').asfloat/1.12)*0.01);
         end
         else
         begin
            qryPayCust.fieldbyname('TaxAmt').asfloat  := qrySalehd.fieldbyname('LastBal').asfloat*0.01;
            qryPayCust.fieldbyname('NetAmt').asfloat   :=qrySaleHd.fieldbyname('LastBal').asfloat -   (qrySalehd.fieldbyname('LastBal').asfloat*0.01);
         end;

   end;
end;

procedure TUpdPayDet.CompTax(Sender: TObject);
begin
  if Cancelbtn.enabled then
  begin
    with dmardata do
    begin
         if cbVat.checked=true then
         begin
             qryPayCust.fieldbyname('TaxAmt').asfloat   := (qryPayCust.fieldbyname('AmtPaid').asfloat/1.12)*qryPaycust.fieldbyname('PayPerc').asfloat;
             qryPayCust.fieldbyname('NetAmt').asfloat   :=  qryPayCust.fieldbyname('AmtPaid').asfloat -  ((qryPayCust.fieldbyname('AmtPaid').asfloat/1.12)*qryPaycust.fieldbyname('PayPerc').asfloat)
         end
         else
         begin
             qryPayCust.fieldbyname('TaxAmt').asfloat   := qryPayCust.fieldbyname('AmtPaid').asfloat*qryPaycust.fieldbyname('PayPerc').asfloat;
             qryPayCust.fieldbyname('NetAmt').asfloat   := qryPayCust.fieldbyname('AmtPaid').asfloat - (qryPayCust.fieldbyname('AmtPaid').asfloat*qryPaycust.fieldbyname('Payperc').asfloat);
         end;
    end;
  end;
end;



procedure TUpdPayDet.PrevBtnClick(Sender: TObject);
begin
   if dmardata.qryPayCust.Bof then
         showmessage('First Record')
    else
         dmardata.qryPayCust.Prior;
end;

procedure TUpdPayDet.NextBtnClick(Sender: TObject);
begin
     if dmardata.qryPayCust.Eof then
        showmessage('Last Record')
    else
        dmardata.qryPayCust.next;
end;

end.
