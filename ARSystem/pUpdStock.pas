unit pUpdStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask,db; 

type
  TUpdStock = class(TForm)
    Panel1: TPanel;
    stockpanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbestockcode: TDBEdit;
    DBEdit2: TDBEdit;
    dbesellingprice: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    Label8: TLabel;
    edkey: TEdit;
    Panel4: TPanel;
    BrowseBtn: TButton;
    CancelBtn: TButton;
    PrevBtn: TButton;
    NextBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    closebtn: TButton;
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
  UpdStock: TUpdStock;

implementation

uses pARData, pListRec;

{$R *.dfm}

procedure TUpdStock.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryStock.Bof then
         showmessage('First Record')
    else
         dmardata.qryStock.Prior;
end;

procedure TUpdStock.NextBtnClick(Sender: TObject);
begin
    if dmardata.qrystock.Eof then
        showmessage('Last Record')
    else
        dmardata.qrystock.next;
end;

procedure TUpdStock.AddBtnClick(Sender: TObject);
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

    StockPanel.Enabled := true;
    dmardata.qrystock.append;
    dbestockcode.SetFocus;


end;

procedure TUpdStock.EditBtnClick(Sender: TObject);
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

    StockPanel.Enabled := true;
    dmardata.qrystock.edit;
    dbestockcode.readonly := true;
    dbesellingprice.SetFocus;

end;

procedure TUpdStock.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qrystock.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qrystock.delete;

    end;
end;

procedure TUpdStock.BrowseBtnClick(Sender: TObject);
begin
  with dmardata do
  begin
    if BrowseBtn.Caption = '&Ok' then
    begin
         qrystock.post;

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

         StockPanel.Enabled := false;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         qryStock.close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from product order by prodname');
         qryStock.open;

         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF STOCK';
         ListRec.dbgrid1.DataSource := dmardata.dsStock;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'pRODNAME';
         ListRec.showmodal;
         ListRec.free;

         qryStock.close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from product order by prodcode');
         qryStock.open;

    end;
  end;
end;

procedure TUpdStock.CancelBtnClick(Sender: TObject);
begin
         dmardata.qrystock.cancel;

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

         StockPanel.Enabled := false;

end;

procedure TUpdStock.edkeyChange(Sender: TObject);
begin
    dmardata.qryStock.Locate('prodcode',edkey.text,[locaseinsensitive]);
end;


end.
