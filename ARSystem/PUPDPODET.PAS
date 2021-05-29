unit pUpdPODet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TUpdPODet = class(TForm)
    Panel1: TPanel;
    PODet: TPanel;
    Panel3: TPanel;
    dblprodname: TDBLookupComboBox;
    dbeunitprice: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    dbeprodcode: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    okbtn: TButton;
    cancelbtn: TButton;
    gbhd: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbepono: TDBEdit;
    dblterms: TDBEdit;
    cbMultiple: TCheckBox;
    Label5: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    TranType: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    PrevBtn: TButton;
    NextBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    CloseBtn: TButton;
    DBLookupComboBox3: TDBLookupComboBox;
    Label14: TLabel;
    procedure FindPrice(Sender: TObject);
    procedure CompPrice(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure okbtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure cancelbtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdPODet: TUpdPODet;

implementation

uses pardata; 

{$R *.dfm}

procedure TUpdPODet.FindPrice(Sender: TObject);
begin
    dmardata.qrypodet.fieldbyname('UnitPrice').asfloat := dmardata.qrystock.fieldbyname('SalePrice').asfloat;
end;

procedure TUpdPODet.CompPrice(Sender: TObject);
begin
    with dmardata do
    begin
         qrypodet.fieldbyname('NetAmt').asfloat    := qrypodet.fieldbyname('UnitPrice').asfloat
                                                    * qrypodet.fieldbyname('orderqty').asfloat;
         qrypodet.fieldbyname('TaxAmt').asfloat    := qrypodet.fieldbyname('NetAmt').asfloat*0.12;
         qrypodet.fieldbyname('GrossAmt').asfloat  := qrypodet.fieldbyname('netAmt').asfloat;
         qryPODet.fieldbyname('LastQty').asfloat   := qryPOdet.fieldbyname('Orderqty').asfloat - qryPODet.fieldbyname('DeliverQty').asfloat;
    end;
end;

procedure TUpdPODet.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryPODet.Bof then
         showmessage('First Record')
    else
         dmardata.qryPODet.Prior;
end;

procedure TUpdPODet.NextBtnClick(Sender: TObject);
begin
    if dmardata.qryPODet.Eof then
        showmessage('Last Record')
    else
        dmardata.qryPODet.next;

end;

procedure TUpdPODet.AddBtnClick(Sender: TObject);
begin
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    OkBtn.Enabled        := true;
    CancelBtn.enabled    := true;

    OkBtn.Caption := '&Ok';
    CancelBtn.Caption    := '&Cancel';

    PODet.Enabled := true;
    dmardata.qryPODet.append;
    dmardata.qryPODet.fieldbyname('PurchNo').asstring := dmardata.qryPOHd.fieldbyname('PurchNo').asstring;
    dbeProdCode.SetFocus;

end;

procedure TUpdPODet.okbtnClick(Sender: TObject);
begin
    dmardata.qryPODet.post;

    NextBtn.Enabled  := true;
    PrevBtn.Enabled  := true;

    AddBtn.Enabled   := true;
    DelBtn.Enabled   := true;
    EditBtn.enabled  := true;

    CloseBtn.enabled := true;

    OkBtn.Enabled     := false;
    CancelBtn.enabled := false;

    PODet.Enabled := false;

end;

procedure TUpdPODet.EditBtnClick(Sender: TObject);
begin
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    CancelBtn.Enabled := true;
    OkBtn.enabled     := true;

    PODet.Enabled := true;
    dmardata.qryPODet.edit;
    dbeprodcode.readonly := true;
    dblprodname.enabled  := false;

    dbeUnitPrice.SetFocus;

end;

procedure TUpdPODet.cancelbtnClick(Sender: TObject);
begin
    dmardata.qryPODet.cancel;

    NextBtn.Enabled  := true;
    PrevBtn.Enabled  := true;

    AddBtn.Enabled   := true;
    DelBtn.Enabled   := true;
    EditBtn.enabled  := true;

    CloseBtn.enabled := true;

    OkBtn.Enabled := true;
    CancelBtn.enabled    := true;

    PODet.Enabled := false;

end;

procedure TUpdPODet.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryPODet.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qryPODet.delete;
    end;
end;

end.
