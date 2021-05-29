unit pBrowStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls,db; 

type
  TBrowStock = class(TForm)
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
    procedure rgKeyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowStock: TBrowStock;

implementation

uses pARData, pUpdStock;

{$R *.dfm}

procedure TBrowStock.Button1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryStock.append;
         UpdStock := tUpdStock.create(application);
         UpdStock.showmodal;
         if UpdStock.modalresult = mrok then qryStock.post
         else qryStock.Cancel;
         UpdStock.free;
    end;
end;

procedure TBrowStock.Button2Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryStock.edit;
         UpdStock := tUpdStock.create(application);
         UpdStock.dbeStockcode.ReadOnly := true;
         UpdStock.showmodal;
         if UpdStock.modalresult = mrok then qryStock.post
         else qryStock.Cancel;
         UpdStock.free;
    end;

end;

procedure TBrowStock.edKeyChange(Sender: TObject);
begin
    with dmardata do
    begin
         if rgkey.ItemIndex = 0 then
              qryStock.locate('prodcode',edKey.text,[locaseinsensitive])
         else
              qryStock.locate('prodname',edKey.text,[locaseinsensitive]);
    end;
end;

procedure TBrowStock.Button3Click(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryStock.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qryStock.delete;

    end;
end;

procedure TBrowStock.rgKeyClick(Sender: TObject);
begin
    with dmardata do
    begin
         qrystock.Close; 
         if rgkey.ItemIndex = 0 then
              qryStock.sql[1] := 'order by prodcode'
         else
              qrystock.sql[1] := 'order by prodname';
         qrystock.Open;
    end;

end;

end.
