unit pUpdPOHd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TUpdPOHd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnok: TButton;
    btncancel: TButton;
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
    DBLookupComboBox1: TDBLookupComboBox;
    Label14: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure btnokClick(Sender: TObject);
    procedure FindPrice(Sender: TObject);
    procedure CompPrice(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure dbeponoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdPOHd: TUpdPOHd;

implementation

uses pardata; 

{$R *.dfm}

procedure TUpdPOHd.btnokClick(Sender: TObject);
begin

    with dmardata do
    begin
         qrypodet.fieldbyname('purchno').asstring := qrypohd.fieldbyname('purchno').asstring;
         qrypohd.post;
         qrypodet.post;
         if messageDlg('Add another PO ? ',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qrypohd.append;
              qrypodet.append;
         end
         else
         begin
              UpdPOHd.btnok.modalresult := mrOk;
              UPDPOHD.close;
         end;
    end
end;

procedure TUpdPOHd.FindPrice(Sender: TObject);
begin
    dmardata.qryPODet.fieldbyname('UnitPrice').asfloat := dmardata.qrystock.fieldbyname('SalePrice').asfloat;
end;

procedure TUpdPOHd.CompPrice(Sender: TObject);
begin
    with dmardata do
    begin
         qrypodet.fieldbyname('NetAmt').asfloat    := qrypodet.fieldbyname('UnitPrice').asfloat
                                                   *  qrypodet.fieldbyname('orderqty').asfloat;
         qrypodet.fieldbyname('TaxAmt').asfloat    := qrypodet.fieldbyname('NetAmt').asfloat*0.12;
         qrypodet.fieldbyname('GrossAmt').asfloat  := qrypodet.fieldbyname('netAmt').asfloat;
         qryPODet.fieldbyname('LastQty').asfloat   := qryPOdet.fieldbyname('Orderqty').asfloat - qryPODet.fieldbyname('DeliverQty').asfloat;
    end;
end;

procedure TUpdPOHd.btncancelClick(Sender: TObject);
begin
    dmardata.qrypohd.cancel;
    dmardata.qrypodet.cancel;
end;

procedure TUpdPOHd.DBLookupComboBox1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qrystock.close;
         qrystock.sql.clear;
         qrystock.sql.add('select * from Product where (custcode = ''' + qryPOhd.fieldbyname('custcode').asstring + ''')');
         qryStock.open;
    end;
end;

procedure TUpdPOHd.dbeponoExit(Sender: TObject);
begin
    with dmardata do
    begin
         if (dbepono.ReadOnly = false) then
         begin
              if (qryPOHd.FieldByName('PurchNo').asstring <> '') then
              begin
                   qryKey.close;
                   qryKey.sql.clear;
                   qryKey.sql.add('select * from PurchHd where (PurchNo = ''' + qryPOHd.fieldbyname('PurchNo').asstring + ''')');
                   qryKey.open;
                   if (qrykey.RecordCount > 0) then
                        showmessage('Record already exist...');
                   qryKey.Close;
              end;
         end;
    end;
end;

end.
