unit pBrowPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls,db; 

type
  TBrowPO = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    AddDetBtn: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    edKey: TEdit;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    AddHdBtn: TButton;
    Button6: TButton;
    Button7: TButton;
    TRANTYPE: TLabel;
    procedure AddDetBtnClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edKeyChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure AddHdBtnClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowPO: TBrowPO;

implementation

uses pARData, pUpdPOHd, pUpdPOHd1, pUpdPODet;

{$R *.dfm}

procedure TBrowPO.AddDetBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         tStock.close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from Product order by prodname');
         qryStock.open;

         qryPODet.Close;
         qryPODet.sql.clear;
         qryPODet.sql.add('select * from PurchDet where (PurchNo = ''' + qryListPOHd.fieldbyname('purchno').asstring + ''')');
         qryPODet.open;

         qryPODet.append;
         qryPODet.fieldbyname('purchno').asstring := qryListPOHd.fieldbyname('PurchNo').asstring;

         UpdPODet := tUpdPODet.create(application);
         UpdPODet.showmodal;
         if UpdPODet.modalresult = mrok then qryPODet.post
         else qryPODet.Cancel;
         UpdPODet.free;

         qryListPODet.Close;
         qryListPODet.Open;

    end;
end;

procedure TBrowPO.Button2Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryStock.close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from Product order by prodname');
         qryStock.open;

         qryPODet.Close;
         qryPODet.sql.clear;
         qryPODet.sql.add('select * from PurchDet where (PurchNo = ''' + qryListPOHd.fieldbyname('purchno').asstring + ''')' +
                ' and (purchdet.prodcode = ''' + qrylistpodet.fieldbyname('prodcode').asstring + ''')');
         qryPODet.open;

         qryPODet.edit;

         TranType.Caption := 'EDIT';
         UpdPODet := tUpdPODet.create(application);
         UpdPODet.dbeprodcode.ReadOnly := true;
         UpdPoDet.dbeprodcode.enabled  := false;
         UpdPODet.dblprodname.enabled  := false;
         UpdPODet.showmodal;
         if UpdPODet.modalresult = mrok then
         begin
              qryPODet.fieldbyname('LastQty').asfloat     := qryPOdet.fieldbyname('Orderqty').asfloat - qryPODet.fieldbyname('DeliveryQty').asfloat;
              qryPODet.post
         end
         else qryPODet.Cancel;
         UpdPODet.free;

         qryListPODet.Close;
         qryListPODet.Open;
         qrylistPODet.Locate('prodcode',qrypodet.fieldbyname('prodcode').asstring,[locaseinsensitive]); 
         TranType.Caption := 'ADD';
    end;


end;

procedure TBrowPO.edKeyChange(Sender: TObject);
begin
    dmardata.qryListPOHd.locate('PurchNo',edKey.text,[locaseinsensitive])
end;

procedure TBrowPO.Button3Click(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryListPODet.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qrypodet.Close;
              qrypodet.sql.clear;
              qrypodet.sql.Add('Delete from PurchDet Where (PurchNO = ''' + qryListPODet.fieldbyname('PurchNo').asstring + ''')' +
                   ' and (prodcode = ''' + qryListPODet.fieldbyname('ProdCode').asstring + ''')');
              qrypodet.execsql;
              qryListPODet.close;
              qryListPODet.open;
         end;

    end;
end;

procedure TBrowPO.AddHdBtnClick(Sender: TObject);
var lexit : string;
begin
    with dmardata do
    begin
         qryCustomer.Close;
         qrycustomer.sql.clear;
         qrycustomer.sql.add('select * from customer order by custname');
         qrycustomer.open;

         qrystock.close;
         qrystock.sql.clear;
         qrystock.sql.add('select * from product order by prodname');
         qrystock.open;

         qrypohd.close;
         qrypohd.sql.clear;
         qrypohd.sql.add('select * from PurchHd');
         qryPohd.open;

         qrypodet.close;
         qrypodet.sql.clear;
         qrypodet.sql.add('select * from purchdet');
         qrypodet.open;

         qrypohd.append;
         qrypodet.append;
         UpdPOHd := tUpdPOHd.create(application);
         UpdPOHd.showmodal;
         UpdPOHd.free;
         qrycustomer.close;
         qrypohd.close;
         qrypodet.close;
         qrylistpohd.close;
         qrylistpohd.open;
         qrylistpohd.Last;
         qrylistpodet.close;
         qrylistpodet.sql[1] := 'and (purchdet.purchno=''' + qrylistpohd.fieldbyname('purchno').asstring + ''')';
         qrylistpodet.open;
    end;
end;

procedure TBrowPO.DBGrid1CellClick(Column: TColumn);
begin
    with dmardata do
    begin
         qrylistpodet.close;
         qrylistpodet.sql[1] := 'and (purchdet.purchno=''' + qrylistpohd.fieldbyname('purchno').asstring + ''')';
         qrylistpodet.open;
    end;
end;

procedure TBrowPO.DBGrid1DblClick(Sender: TObject);
begin
    with dmardata do
    begin
         qrylistpodet.close;
         qrylistpodet.sql[1] := 'and (purchdet.purchno=''' + qrylistpohd.fieldbyname('purchno').asstring + ''')';
         qrylistpodet.open;
    end;
end;

procedure TBrowPO.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    with dmardata do
    begin
         qrylistpodet.close;
         qrylistpodet.sql[1] := 'and (purchdet.purchno=''' + qrylistpohd.fieldbyname('purchno').asstring + ''')';
         qrylistpodet.open;
    end;
end;

procedure TBrowPO.Button6Click(Sender: TObject);
begin
    with dmardata do
    begin
         qrycustomer.close;
         qrycustomer.sql.clear;
         qrycustomer.sql.add('select * from customer order by custname');
         qrycustomer.open;

         qrypohd.close;
         qrypohd.sql.clear;
         qrypohd.sql.add('select * from purchhd where (purchno = ''' + qrylistpohd.fieldbyname('purchno').asstring + ''')');
         qrypohd.open;
         if qrypohd.recordcount > 0 then
         begin
              qrypohd.edit;
              UpdPOHd1 := tUpdPOHd1.create(application);
              UpdPOHd1.showmodal;
              if UpdPohd1.ModalResult = mrok then qrypohd.post
              else qrypohd.cancel;
              UpdPOHd1.free;
              qrylistpohd.close;
              qrylistpohd.open;
              qrylistpohd.locate('purchno',qrypohd.fieldbyname('purchno').asstring,[locaseinsensitive]);
         end;
         qrypohd.close;
         qrycustomer.close;
    end;
end;

procedure TBrowPO.Button7Click(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryListPOHd.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if (qryListPODet.recordcount > 0) then
              showmessage('Record has detail, delete detail first')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qrypohd.Close;
              qrypohd.sql.clear;
              qrypoHd.sql.Add('Delete from PurchHd Where (PurchNO = ''' + qryListPOHd.fieldbyname('PurchNo').asstring + ''')');
              qrypoHd.execsql;
              qryListPOHd.close;
              qryListPOHd.open;
              qrylistpohd.last;
         end;

    end;
end;

end.
