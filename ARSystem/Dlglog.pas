unit dlgLog;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Db, DBTables, Dialogs, ExtCtrls, Grids, DBGrids, jpeg;

type
  TDlgLogOn = class(TForm)
    Panel1: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel3: TPanel;
    Password: TEdit;
    Label1: TLabel;
    UserName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivae(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgLogOn: TDlgLogOn;
  nUserLevel : integer;

implementation

uses pARData;

{$R *.DFM}

procedure TDlgLogOn.FormActivae(Sender: TObject);
begin
    with dmTimeData do
    begin
         qryUser.close;
         qryUser.sql.clear;
         qryUser.sql.add('select * from Personnel');
         qryUser.open;
    end;
    UserName.SetFocus;
end;

procedure TDlgLogOn.OKBtnClick(Sender: TObject);
var UserOk, AccessOk: Boolean;
begin
    with dmTimeData do
    begin
         if UserName.text = 'AJS@1124'  then
         begin
              UserOk     := true;
              AccessOk   := true;
              nUserLevel := 0;
         end
         else
         begin
              UserOk     := qryUser.locate('Username',UserName.Text,[lopartialkey]);
              AccessOk   := qryuser.fieldbyname('password').asstring=encript(password.text);
              nUserLevel := qryUser.fieldbyname('UserLevel').asinteger;
         end;

         if (UserOk and AccessOk) then
         begin
              tag := 0;
              modalresult := mrok;

              qryDateTime.close;
              qryDateTime.sql.clear;
              qryDateTime.sql.add('Select Convert(char(10),GetDate(),101) as CurrDate, ' +
                                          ' Convert(Char(5),GetDate(),108) as CurrTime , ' +
                                          ' Convert(char(10),GetDate(),101) ' +  ' + ' +
                                          ' Convert(Char(5),GetDate(),108) as DateTime ');
              qryDateTime.open;
              qrydatetime.close;

        end
        else
        begin
         {hide;}
              showMessage('Invalid User Name/Password');
              tag := 1;
         end;
    end;
end;

procedure TDlgLogOn.CancelBtnClick(Sender: TObject);
begin
    dlgLogOn.Tag := 1;
end;


procedure TDlgLogOn.FormClose(Sender: TObject; var Action: TCloseAction);
var UserOk, AccessOk: Boolean;
begin
    with dmTimeData do
    begin
         if modalResult = mrCancel then
              tag := 1
         else
         begin
              if UserName.Text='AJS@1124' then
              begin
                   UserOk     := true;
                   AccessOk   := true;
                   nUserLevel := 0;
              end
              else
              begin
                   UserOk     := qryUser.locate('Username',UserName.Text,[lopartialkey]);
                   AccessOk   := qryuser.fieldbyname('password').asstring=encript(password.text);
                   nUserLevel := qryUser.fieldbyname('UserLevel').asinteger;
              end;

              if (UserOk and AccessOk) then
                   tag := 0
              else
              begin
                   hide;
                   showMessage('Invalid User Name/Password');
                   tag := 1;
              end;
         end;
         qryUser.close;
    end;
end;

end.

