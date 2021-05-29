unit pBrowUser;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ExtCtrls, DBCtrls,
  jpeg;

type
  TBrowUser = class(TForm)
    Panel1: TPanel;
    DBGrid: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel3: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    DBNavigator1: TDBNavigator;
    btnClose: TButton;
    Button1: TButton;
    RegListHD: TPanel;
    Image1: TImage;
    Image9: TImage;
    rgLevel: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rgLevelClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowUser: TBrowUser;

implementation

{$R *.DFM}
uses Updusr, pTimeData, pBrowAccess, Dlglog;

procedure TBrowUser.FormActivate(Sender: TObject);
begin
    with dmTimeData do
    begin
         qryUser.close;
         qryUser.sql.clear;
         qryUser.close;
         qryUser.sql.clear;
         qryUser.sql.add('Select idnum, lastname + ''' + ', ' + '''+ firstname as Empname, ' +
         ' Lastname, Firstname, Middlename, BirthDate,Address1,Address2, TelNo, TaxCode, ' +
         ' ContactPerson, ContPersRelationship, SSSNo, TinNo, PagibigNo, PhicNo, BankCode, BankAccountNo, ' +
         '  DeptCode, SectCode,  StatusCode, HiredDate, RegularizationDate, ResignDate,  ' +
         ' Rate, HrsPerMonth, RatePerDay, PayClass, ' +
         ' OTApproved1, OTApproved2, OTApprovedBy1, OTApprovedBy2, ' +
         ' LeaveApproved1, LeaveApproved2, LeaveApprovedby1, LeaveApprovedby2, ' +
         ' YTDSL, YTDVL, AccumSL, AccumVL, RemSL, RemVL,  ' +
         ' YTDGross, YTDTax,JanNovTax,Dectax,YTDPRem, Tax13th, Notax13th, ' +
         ' MonEarned,MonGross,MonYeeSSS,MonYeePhic,MonYeeIbig,MonYerSSS,MonYerEC,MonYerPhic,MonYerIbig,  ' +
         ' CompSSS, CompPhic,  CompIbig, CompTax, ' +
         ' edYeeSSS, edYeePhic, edYeeIbig, edTax, edYerSSS, edYerEC, edYerPhic, edYerIbig,EmpType,FixedSchedule,' +
         ' UserName,Password,UserLevel ' +
         ' From Personnel');
         qryUser.sql.add('where (userlevel=0)'); 
         qryUser.sql.add('order by empname');
         qryUser.open;

         qryUser.open;
    end;
    DBGrid.SetFocus;
    Edit1.Text:='';
end;

procedure TBrowUser.Edit1Change(Sender: TObject);
begin
    if (Edit1.Text <> '') then
        dmTimeData.qryuser.Locate('Username',Edit1.Text,[lopartialkey]);
end;

procedure TBrowUser.btnAddClick(Sender: TObject);
begin
    dmTimeData.qryUser.append;
    UpdUser := tUpdUser.create(application);
    UpdUser.Caption := 'Add User';
    UpdUser.ShowModal;
    UpdUser.free;
end;

procedure TBrowUser.btnEditClick(Sender: TObject);
begin
    {
    if (dmhcptidata.qryUser.fieldbyname('UserName').asstring = 'SUPERVISOR') then
         showMessage('Cannot edit this record')
    else
         begin}
              dmTimeData.qryUser.Edit;
              UpdUser := tUpdUser.create(application);
              UpdUser.Caption := 'Edit User';
              UpdUser.ShowModal;
              UpdUser.free;
    {     end;}
end;

procedure TBrowUser.btnDeleteClick(Sender: TObject);
begin
    if (dmTimeData.qryUser.FieldByName('UserName').asstring = 'SUPERVISOR') or
       (dmTimeData.qryUser.fieldbyname('UserName').asstring = DlgLogOn.UserName.text) then
         showmessage('Cannot delete this record')
    else
         if MessageDlg('Delete record?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            dmTimeData.qryUser.delete;
end;

procedure TBrowUser.btnCloseClick(Sender: TObject);
begin
    dmTimeData.qryuser.close;
    Close;
end;

procedure TBrowUser.Button1Click(Sender: TObject);
begin
    BrowAccess := tBrowAccess.create(application);
    BrowAccess.showmodal;
    BrowAccess.free;
end;

procedure TBrowUser.rgLevelClick(Sender: TObject);
begin
    with dmTimeData do
    begin
         qryUser.close;
         if rgLevel.ItemIndex = 0 then
              qryUser.sql[1] := ' where (Userlevel = 0)'
         else if rglevel.itemindex = 1 then
              qryUser.sql[1] := ' where (Userlevel = 1)'
         else if rglevel.itemindex = 2 then
              qryUser.sql[1] := ' where (Userlevel = 2)'
         else if rglevel.itemindex = 3 then
              qryUser.sql[1] := ' where (Userlevel = 3)'
         else if rglevel.ItemIndex = 4 then
              qryUser.sql[1] := ' where (Userlevel = 4)'
         else if rglevel.ItemIndex = 5 then
              qryUser.sql[1] := ' where (Userlevel = 5)';
         qryUser.open;
         qryUser.last;
    end;
end;

procedure TBrowUser.Button2Click(Sender: TObject);
begin
    {
    dmTimeData.qryUser.Edit;
    nUpdUser := tnUpdUser.create(application);
    nUpdUser.Caption := 'Edit User';
    nUpdUser.ShowModal;
    nUpdUser.free;
    }
end;

end.
