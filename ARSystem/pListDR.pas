unit pListDR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, DB, Grids, DBGrids, ComCtrls;

type
  TListDR = class(TForm)
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    dbgOld: TDBGrid;
    dsDRHd: TDataSource;
    qryDRHd: TQuery;
    dsDRDet: TDataSource;
    btnDR: TButton;
    DBGrid1: TDBGrid;
    qryDRDet: TQuery;
    procedure btnDRClick(Sender: TObject);
    procedure dbgOldDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListDR: TListDR;

implementation

{$R *.dfm}

procedure TListDR.btnDRClick(Sender: TObject);
begin
    qryDRHd.close;
    qryDRHd.sql.clear;
    qryDRHd.sql.add('select * from SaleHd ' +
      ' where (DRDate >= ''' + datetostr(dtStart.date) + ''')' +
      ' and (DRDate <= ''' + datetostr(dtEnd.date) + ''')' +
      ' order by drno');
    qryDRHd.Open;

    qryDRDet.close;
    qryDRDet.sql.clear;
    qryDRDet.sql.add('select * from SaleDet where (DRNo= ''' + qryDRHd.fieldbyname('drno').asstring + ''')');
    qryDRDet.open;

end;

procedure TListDR.dbgOldDblClick(Sender: TObject);
begin

    qryDRDet.close;
    qryDRDet.sql.clear;
    qryDRDet.sql.add('select * from SaleDet where (DRNo= ''' + qryDRHd.fieldbyname('drno').asstring + ''')');
    qryDRDet.open;


end;

end.
