 unit pUpdCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, db, Buttons;

type
  TUpdCust = class(TForm)
    Panel1: TPanel;
    CustPanel: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbecustcode: TDBEdit;
    DBEdit2: TDBEdit;
    dbephoneno: TDBEdit;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    BrowseBtn: TButton;
    CancelBtn: TButton;
    PrevBtn: TButton;
    NextBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    closebtn: TButton;
    Panel2: TPanel;
    Label8: TLabel;
    edkey: TEdit;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    Label7: TLabel;
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure edkeyChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdCust: TUpdCust;

implementation

uses pARData, pListRec;

{$R *.dfm}

procedure TUpdCust.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryCustomer.Bof then
         showmessage('First Record')
    else
         dmardata.qryCustomer.Prior;
end;

procedure TUpdCust.NextBtnClick(Sender: TObject);
begin
    if dmardata.qryCustomer.Eof then
        showmessage('Last Record')
    else
        dmardata.qryCustomer.next;
end;

procedure TUpdCust.AddBtnClick(Sender: TObject);
begin
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled := true;

    BrowseBtn.Caption := '&Ok';
    CancelBtn.Caption    := '&Cancel';

    CustPanel.Enabled := true;
    dmardata.qryCustomer.append;
    dbecustcode.SetFocus;

end;

procedure TUpdCust.EditBtnClick(Sender: TObject);
begin
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled    := true;

    BrowseBtn.Caption := '&Ok';
    CancelBtn.Caption    := '&Cancel';

    CustPanel.Enabled := true;
    dmardata.qryCustomer.edit;
    dbecustcode.readonly := true;
    dbephoneno.SetFocus;

end;

procedure TUpdCust.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryCustomer.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qryCustomer.delete;
    end;
end;

procedure TUpdCust.BrowseBtnClick(Sender: TObject);
begin
    if BrowseBtn.Caption = '&Ok' then
    begin
         dmardata.qryCustomer.post;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         CancelBtn.enabled    := true;

         BrowseBtn.Caption := '&Browse';
         CancelBtn.Caption := '&Cancel';

         CustPanel.Enabled := false;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         dmardata.qryCustomer.indexname := 'byname';
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF CUSTOMER.';
         ListRec.dbgrid1.DataSource := dmardata.dsCustomer;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'Custname';
         ListRec.showmodal;
         ListRec.free;
         dmardata.qryCustomer.indexname := '';
    end;

end;

procedure TUpdCust.CancelBtnClick(Sender: TObject);
begin
         dmardata.qryCustomer.cancel;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         CancelBtn.enabled    := true;

         BrowseBtn.Caption := '&Browse';
         CancelBtn.Caption := '&Cancel';

         CustPanel.Enabled := false;
end;

procedure TUpdCust.edkeyChange(Sender: TObject);
begin
    dmardata.qryCustomer.Locate('CustCode',edkey.text,[locaseinsensitive]);
end;

end.
