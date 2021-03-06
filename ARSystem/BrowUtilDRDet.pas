unit BrowUtilDRDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, StdCtrls, Grids, DBGrids;

type
  TBrowUtilDRDetail = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    edODRNo: TEdit;
    Button1: TButton;
    Label2: TLabel;
    edNDRNo: TEdit;
    Button2: TButton;
    dsOld: TDataSource;
    dsNew: TDataSource;
    qryOld: TQuery;
    qryNew: TQuery;
    tOld: TTable;
    tNew: TTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edODRNoExit(Sender: TObject);
    procedure edNDRNoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowUtilDRDetail: TBrowUtilDRDetail;

implementation

{$R *.dfm}

procedure TBrowUtilDRDetail.Button1Click(Sender: TObject);
begin
  if edNDRNo.text = '' then
     showmessage('Empty Old DR No.')
  else
  begin
    tOld.open;
    tOld.First;
    if tOld.locate('DRNo;ProdCode',Vararrayof([qryOld.fieldbyname('drno').asstring,qryOld.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
    begin
            tOld.edit;
            tOld.FieldByName('oDRNo').asstring := tOld.fieldbyname('DRNo').asstring;
            tOld.FieldByName('DRNo').asstring  := ednDRNo.text;
            if tOld.fieldbyname('saleInv').asstring <'' then
            begin
                tOld.fieldbyname('oSaleInv').asstring := tOld.fieldbyname('saleInv').asstring;
                tOld.fieldbyname('SaleInv').asstring := tOld.fieldbyname('saleInv').asstring + 'A';
            end;
            tOld.Post;
    end;
    tOld.close;
    qryOld.close;
    qryOld.Open;
    qryNew.close;
    qrynew.Open;
  end;
end;

procedure TBrowUtilDRDetail.Button2Click(Sender: TObject);
begin
  if edODRNo.text <> '' then
    showmessage('New DR no is empty !!!')
  else 
  begin
    tNew.open;
    tNew.First;
    if tNew.locate('DRNo;ProdCode',Vararrayof([qryNew.fieldbyname('drno').asstring,qryNew.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
    begin
            tNew.edit;
            tNew.FieldByName('oDRNo').asstring := '';
            tNew.FieldByName('DRNo').asstring  := edoDRNo.text;
            if tNew.FieldByName('SaleInv').asstring < '' then
            begin
               tNew.FieldByName('oSaleInv').asstring := ''
            end;
            tNew.Post;
    end;
    tNew.close;
    qryOld.close;
    qryOld.Open;
    qryNew.close;
    qrynew.Open;
  end;
end;

procedure TBrowUtilDRDetail.edODRNoExit(Sender: TObject);
begin
    qryOld.close;
    qryOld.sql.clear;
    qryOld.sql.add('select * from SaleDet where (DRNo = ''' + edODRNo.Text + ''')');
    qryOld.Open;

end;

procedure TBrowUtilDRDetail.edNDRNoExit(Sender: TObject);
begin
    qryNew.close;
    qryNew.sql.clear;
    qryNew.sql.add('select * from SaleDet where (DRNo = ''' + edNDRNo.Text + ''')');
    qryNew.Open;
end;

end.
