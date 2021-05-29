unit pBrowCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls,db; 

type
  TBrowCust = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    edKey: TEdit;
    rgKey: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edKeyChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowCust: TBrowCust;

implementation

uses pARData, pUpdCust;

{$R *.dfm}

procedure TBrowCust.Button1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qrycustomer.append;
         qryCustomer.FieldByName('Vat').asstring := 'Y';
         UpdCust := tUpdCust.create(application);
         UpdCust.showmodal;
         if UpdCust.modalresult = mrok then qrycustomer.post
         else qrycustomer.Cancel;
         UpdCust.free;
    end;
end;

procedure TBrowCust.Button2Click(Sender: TObject);
begin
    with dmardata do
    begin
         qrycustomer.edit;
         UpdCust := tUpdCust.create(application);
         Updcust.dbecustcode.ReadOnly := true; 
         UpdCust.showmodal;
         if UpdCust.modalresult = mrok then qrycustomer.post
         else qrycustomer.Cancel;
         UpdCust.free;
    end;

end;

procedure TBrowCust.edKeyChange(Sender: TObject);
begin
    with dmardata do
    begin
         if rgkey.ItemIndex = 0 then
              qrycustomer.locate('custcode',edKey.text,[locaseinsensitive])
         else
              qrycustomer.locate('custname',edKey.text,[locaseinsensitive]); 
    end;
end;

procedure TBrowCust.Button3Click(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryCustomer.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qrycustomer.delete;

    end;
end;

end.
 