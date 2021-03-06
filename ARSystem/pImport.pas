unit pImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, FMTBcd,
  DBXpress, DB, SqlExpr, DBClient, Provider, Buttons;

type
  TBrowLoan = class(TForm)
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbPayGroup: TCheckBox;
    dblPayGroup: TDBLookupComboBox;
    dblDepartment: TDBLookupComboBox;
    Panel2: TPanel;
    Panel4: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel5: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    lblUserLevel: TLabel;
    lblUserName: TLabel;
    Panel1: TPanel;
    Button2: TButton;
    Button4: TButton;
    sdsPayGroup: TSQLDataSet;
    dspPayGroup: TDataSetProvider;
    cdsPayGroup: TClientDataSet;
    dsPayGroup: TDataSource;
    dsDepartment: TDataSource;
    cdsDepartment: TClientDataSet;
    dspDepartment: TDataSetProvider;
    sdsDepartment: TSQLDataSet;
    sdsDedConst: TSQLDataSet;
    dspDedConst: TDataSetProvider;
    cdsDedConst: TClientDataSet;
    dsDedConst: TDataSource;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    sdsLoan: TSQLDataSet;
    dspLoan: TDataSetProvider;
    cdsLoan: TClientDataSet;
    dsLoan: TDataSource;
    sdsTotal: TSQLDataSet;
    dspTotal: TDataSetProvider;
    cdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    sdsReusable1: TSQLDataSet;
    dspReusable1: TDataSetProvider;
    cdsReusable1: TClientDataSet;
    dsReusable1: TDataSource;
    BitBtn2: TBitBtn;
    DelBtn: TBitBtn;
    sdsEmployee: TSQLDataSet;
    dspEmployee: TDataSetProvider;
    cdsEmployee: TClientDataSet;
    dsEmployee: TDataSource;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ListLoan(Sender: TObject);
    procedure Save(Sender: TObject);
    procedure Delete(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      AllGroup : string;

  end;

var
  BrowLoan: TBrowLoan;
  procedure CompTotals();

implementation

{$R *.dfm}

procedure TBrowLoan.FormActivate(Sender: TObject);
var nCtr : integer;

begin

    cdsPayGroup.close;
    cdsDepartment.close;
    cdsLoan.close;

    sdsDedConst.commandtype:=ctquery;
    sdsDedConst.commandtext:='select * from Dedconst order by profile';
    sdsDedConst.open;
    cdsDedConst.open;
    sdsDedConst.close;

    sdsPayGroup.commandtype:=ctquery;
    if lblUserLevel.caption<>'1' then
        sdsPayGroup.commandtext:='select * from msp order by mspname'
    else
        sdsPayGroup.commandtext:='select * from msp where (taxclass<>3) order by mspname';
    sdsPayGroup.open;
    cdsPayGroup.open;
    sdsPayGroup.close;


    sdsDepartment.commandtype:=ctquery;
    sdsDepartment.commandtext:='select * from Department order by deptname';
    sdsDepartment.open;
    cdsDepartment.open;
    cdsDepartment.Locate('deptcode','000',[lopartialkey]);
    sdsDepartment.close;

    sdsLoan.CommandType:=ctQuery;
    sdsLoan.commandtext := 'execute usp_ListLoan ' +
                             ' ''' + 'N'  + ''', ' +
                             ' ''' + cdsPayGroup.fieldbyname('mspcode').asstring+''', ' +
                             ' ''' + cdsDepartment.fieldbyname('deptcode').asstring+ ''', '+
                             ' ''' + cdsDedconst.fieldbyname('code').asstring+ ''' ';

    cdsLoan.Open;
    sdsLoan.close;

    {
    dbgDeduct.Columns.clear;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[0].Title.caption := 'ID No.';
    dbgdeduct.columns[0].FieldName := 'idnum';
    dbgdeduct.Columns[0].Width:=50;
    dbgdeduct.Columns[0].ReadOnly:=true;
    dbgDeduct.Columns[0].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[1].Title.caption := 'N a m e';
    dbgdeduct.columns[1].FieldName := 'empname';
    dbgdeduct.Columns[1].Width:=150;
    dbgdeduct.columns[1].readonly:=true;
    dbgDeduct.Columns[1].Title.alignment := tacenter;


    dbgdeduct.Columns.add;
    dbgdeduct.Columns[2].Title.caption := 'Loan Date';
    dbgdeduct.columns[2].FieldName := 'loandate';
    dbgdeduct.Columns[2].Width:=130;
    dbgdeduct.columns[2].readonly:=false;
    dbgDeduct.Columns[2].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[3].Title.caption := 'Loan Amt.';
    dbgdeduct.columns[3].FieldName := 'loanamt';
    dbgdeduct.Columns[3].Width:=50;
    dbgdeduct.columns[3].readonly:=false;
    dbgDeduct.Columns[3].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[4].Title.caption := 'Loan Paid';
    dbgdeduct.columns[4].FieldName := 'loanpaid';
    dbgdeduct.Columns[4].Width:=50;
    dbgdeduct.columns[4].readonly:=false;
    dbgDeduct.Columns[4].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[5].Title.caption := 'Loan Bal.';
    dbgdeduct.columns[5].FieldName := 'loanbal';
    dbgdeduct.Columns[5].Width:=50;
    dbgdeduct.columns[5].readonly:=false;
    dbgDeduct.Columns[5].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[6].Title.caption := 'Amortization';
    dbgdeduct.columns[6].FieldName := 'Amount';
    dbgdeduct.Columns[6].Width:=70;
    dbgdeduct.columns[6].readonly:=false;
    dbgDeduct.Columns[6].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[7].Title.caption := 'Reference No';
    dbgdeduct.columns[7].FieldName := 'ReferenceNo';
    dbgdeduct.Columns[7].Width:=100;
    dbgdeduct.columns[7].readonly:=false;
    dbgDeduct.Columns[7].Title.alignment := tacenter;

    dbgdeduct.Columns.add;
    dbgdeduct.Columns[8].Title.caption := 'Active';
    dbgdeduct.columns[8].FieldName := 'Active';
    dbgdeduct.Columns[8].Width:=50;
    dbgdeduct.columns[8].readonly:=false;
    dbgDeduct.Columns[8].Title.alignment := tacenter;


    dbgDeduct.FixedCols := 2;
     }
    CompTotals();


end;



procedure TBrowLoan.ListLoan(Sender: TObject);
var    nctr : integer;
begin

    if cbPayGroup.Checked then AllGroup:='Y' else AllGroup:='N';

    cdsLoan.close;

    sdsLoan.CommandType:=ctQuery;
    sdsLoan.commandtext := 'execute usp_ListLoan ' +
                             ' ''' + AllGroup  + ''', ' +
                             ' ''' + cdsPayGroup.fieldbyname('mspcode').asstring+''', ' +
                             ' ''' + cdsDepartment.fieldbyname('deptcode').asstring+ ''', ' +
                             ' ''' + cdsDedconst.fieldbyname('code').asstring+ ''' ';


    cdsLoan.Open;
    sdsLoan.close;

    CompTotals();

    {
    cdsTotal.Close;
    sdsTotal.commandtype:=ctquery;
    sdsTotal.commandtext:='execute usp_ListTotalDeductions ' +
                             ' ''' + 'N'  + ''', ' +
                             ' ''' + cdsPayGroup.fieldbyname('mspcode').asstring+''', ' +
                             ' ''' + cdsDepartment.fieldbyname('deptcode').asstring+ ''' ';
    sdsTotal.open;
    cdsTotal.open;
    sdsTotal.close;


    dbgDeduct.Columns[0].FooterText := 'Total : ';
    dbgDeduct.Columns[1].FooterText := inttostr(cdsDeduct.RecordCount);
    }

end;

procedure TBrowLoan.Save(Sender: TObject);
var nctr,nError : integer;
    cAmt : string;
begin
    sdsLoan.CommandType:=ctQuery;
    cdsLoan.First;
    while not cdsLoan.Eof do
    begin
         sdsLoan.CommandText := 'execute usp_SaveLoan ' +
              ' ''' + cdsDedConst.fieldbyname('code').asstring     + ''', ' +
              ' ''' + cdsLoan.fieldbyname('IdNum').asstring        + ''', ' +
              ' ''' + cdsLoan.fieldbyname('LoanDate').asstring     + ''', ' +
              '   ' + cdsLoan.fieldbyname('LoanAmt').asstring      +   ', ' +
              '   ' + cdsLoan.fieldbyname('LoanPaid').asstring     +   ', ' +
              '   ' + cdsLoan.fieldbyname('LoanBal').asstring      +   ', ' +
              '   ' + cdsLoan.fieldbyname('Amount').asstring       +   ', ' +
              ' ''' + cdsLoan.fieldbyname('ReferenceNo').asstring  + ''', ' +
              ' ''' + cdsLoan.fieldbyname('Active').asstring       + '''  ';
         sdsLoan.ExecSQL();
         cdsLoan.next;
    end;

    sdsLoan.CommandType:=ctStoredProc;
    sdsLoan.CommandText:= 'usp_ListTranDed ' +
                             ' ''' + 'N'  + ''', ' +
                             ' ''' + cdsPayGroup.fieldbyname('mspcode').asstring+''', ' +
                             ' ''' + cdsDepartment.fieldbyname('deptcode').asstring+ ''' ';
    CompTotals();

    {
    dbgDeduct.SetFocus;
    }

    showmessage('Saving completed...');

end;


procedure CompTotals();
var nctr,nDedCtr : integer;

begin
    with browLoan do
    begin

         if cbPayGroup.Checked then AllGroup:='Y' else AllGroup:='N';

         cdsTotal.close;
         sdsTotal.close;

         sdsTotal.CommandType:=ctQuery;
         sdsTotal.commandtext := 'execute usp_ListLoanTotal' +
                             ' ''' + AllGroup  + ''', ' +
                             ' ''' + cdsPayGroup.fieldbyname('mspcode').asstring+''', ' +
                             ' ''' + cdsDepartment.fieldbyname('deptcode').asstring+ ''', '+
                             ' ''' + cdsDedconst.fieldbyname('code').asstring+ ''' ';
         cdsTotal.Open;
         sdsTotal.close;

         {
         dbgDeduct.columns[0].FooterText := cdsTotal.fieldbyname('Ctr').asstring;
         dbgDeduct.columns[3].FooterText := cdsTotal.fieldbyname('LoanAmt').asstring;
         dbgDeduct.columns[4].FooterText := cdsTotal.fieldbyname('LoanPaid').asstring;
         dbgDeduct.columns[5].FooterText := cdsTotal.fieldbyname('LoanBal').asstring;
         dbgDeduct.columns[6].FooterText := cdsTotal.fieldbyname('Amount').asstring;
          }
    end;
end;


procedure TBrowLoan.Delete(Sender: TObject);
begin
    if Messagedlg('Are you sure you want to delete this loan ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
         sdsReusable1.commandtype:=ctQuery;
         sdsReusable1.commandtext := ' Delete from PayDet where (PayCode='''+cdsDedConst.fieldbyname('code').asstring+''')'+
         ' and (idnum='''+cdsLoan.fieldbyname('idnum').asstring+''')';
         sdsReusable1.execsql;

         cdsLoan.Delete;

         cdsLoan.MergeChangeLog;

         {
         dbgDeduct.Columns[1].FooterText := inttostr(cdsPayroll.RecordCount);
         }
         CompTotals();

    end;

end;

procedure TBrowLoan.BitBtn2Click(Sender: TObject);
begin

    sdsEmployee.commandtype:=ctquery;
    sdsEmployee.commandtext := 'Select idnum, lastname + ''' + ', ' + '''+ firstname as Empname ' +
           ' ,lastname,firstname,middlename,payclass,deptcode,statuscode,resigndate ' +
           ' From Personnel ' +
           ' order by lastname,firstname,middlename';
    cdsEmployee.Filter := '(Payclass = ''' + cdsPayGroup.fieldbyname('MSPCode').asstring+''')' +
           ' and (Resigndate is null) and (Statuscode<>'''+'3'+''')';
    cdsEmployee.Filtered := true;
    cdsEmployee.open;
    sdsEmployee.close;

    cdsLoan.append;
    cdsloan.fieldbyname('paycode').asstring   := cdsDedconst.fieldbyname('code').asstring;
    cdsloan.fieldbyname('paytype').asstring   := 'L';
    cdsLoan.fieldbyname('active').asstring    := 'Y';
    cdsLoan.fieldbyname('idnum').asstring     := cdsEmployee.fieldbyname('idnum').asstring;
    cdsLoan.fieldbyname('empname').asstring   := cdsEmployee.fieldbyname('empname').AsString;
    cdsLoan.fieldbyname('loandate').asdatetime:= date();

    cdsLoan.fieldbyname('LoanAmt').asfloat    := 0;
    cdsLoan.fieldbyname('LoanPaid').asfloat   := 0;
    cdsLoan.fieldbyname('LoanBal').asfloat    := 0;
    cdsLoan.fieldbyname('Amount').asfloat     := 0;

    {
    UpdLoan := tUpdLoan.create(application);
    UpdLoan.showmodal;
    if updloan.modalresult=mrok then
    begin
    end;
    UpdLoan.free;

    cdsEmployee.close;
    }
end;

end.
