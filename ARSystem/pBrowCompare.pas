unit pBrowCompare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ComCtrls, Grids, DBGrids;

type
  TBrowCompare = class(TForm)
    dbgOld: TDBGrid;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    btnDR: TButton;
    dsDRDet: TDataSource;
    qryDRDet: TQuery;
    Button1: TButton;
    tNew: TTable;
    procedure btnDRClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowCompare: TBrowCompare;

implementation

{$R *.dfm}

procedure TBrowCompare.btnDRClick(Sender: TObject);
begin
   qryDRDet.close;
   qryDRDet.sql.clear;
   qryDRDet.sql.add('select a.drno, a.TotGross, a.TotNet, sum(b.GrossAmt+b.TaxAmt) as Gross1, sum(b.Netamt) as Net1, ' +
   ' a.totgross-sum(b.grossamt+b.taxamt) as DiffGross, a.totnet-sum(b.netamt) as diffnet ' +
   ' from SaleHd  a ' +
   '    left outer join SaleDet b on (b.drno=a.drno) ' +
   ' where (a.DRDate >= ''' + datetostr(dtStart.date) + ''')' +
   ' and (a.DRDate <= ''' + datetostr(dtEnd.date) + ''')' +
   ' group by a.drno,a.totgross,a.totnet ' +
   ' order by a.drno');
   qryDRDet.open;
end;

procedure TBrowCompare.Button1Click(Sender: TObject);
begin
   qrydrDet.Close;
   qrydrDet.sql.clear;
   qrydrDet.sql.add('select * from saledet where taxamt is null');
   qrydrDet.Open;
   qrydrDet.first;
   while not qrydrDet.eof do
   begin
      tNew.Open;
      tNew.First;
      if tNew.locate('DRNo;ProdCode',Vararrayof([qryDRDet.fieldbyname('drno').asstring,qryDRDet.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
      begin
         tNew.edit;
         if tNew.fieldbyname('taxamt').asstring = '' then
         begin
            tNew.fieldbyname('taxamt').asfloat :=0;
            tNew.Post;
         end;
      end;
      qrydrdet.next;
   end;
   qrydrdet.Close;
   showmessage('End of Processing !!!');
end;

end.
