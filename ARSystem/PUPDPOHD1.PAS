unit pUpdPOHd1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, db;

type
  TUpdPOHd1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    browsebtn: TButton;
    detbtn: TButton;
    gbhd: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbepono: TDBEdit;
    dblterms: TDBEdit;
    cbMultiple: TCheckBox;
    Label5: TLabel;
    Label2: TLabel;
    dbepodate: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    PrevBtn: TButton;
    NextBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    CloseBtn: TButton;
    Label6: TLabel;
    edkey: TEdit;
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure browsebtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure detbtnClick(Sender: TObject);
    procedure FilterStock(Sender: TObject);
    procedure edkeyChange(Sender: TObject);
    procedure dbeponoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdPOHd1: TUpdPOHd1;

implementation

uses pardata, pUpdPOHd, pListRec, pUpdPODet;

{$R *.dfm}

procedure TUpdPOHd1.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryPOHd.Bof then
         showmessage('First Record')
    else
         dmardata.qryPOHD.Prior;
end;

procedure TUpdPOHd1.NextBtnClick(Sender: TObject);
begin
    if dmardata.qryPOHd.Eof then
        showmessage('Last Record')
    else
        dmardata.qryPOHd.next;
end;

procedure TUpdPOHd1.AddBtnClick(Sender: TObject);
begin
    dbePONo.ReadOnly := false;

    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    BrowseBtn.Enabled := true;
    DetBtn.enabled    := true;

    BrowseBtn.Caption := '&Ok';
    DetBtn.Caption    := '&Cancel';

    gbHd.Enabled := true;
    dmardata.qryPOHd.append;
    dbePONo.SetFocus;

end;

procedure TUpdPOHd1.browsebtnClick(Sender: TObject);
begin
    if BrowseBtn.Caption = '&Ok' then
    begin
         dmardata.qryPOHd.post;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         DetBtn.enabled    := true;

         BrowseBtn.Caption := '&Browse';
         DetBtn.Caption    := 'De&tail';

         gbHd.Enabled := false;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF PURCHASE NO.';
         ListRec.dbgrid1.DataSource := dmardata.dsPOHd;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'PurchNo';
         ListRec.showmodal;
         ListRec.free;
    end;

end;

procedure TUpdPOHd1.EditBtnClick(Sender: TObject);
begin
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    BrowseBtn.Enabled := true;
    DetBtn.enabled    := true;

    BrowseBtn.Caption := '&Ok';
    DetBtn.Caption    := '&Cancel';

    gbHd.Enabled := true;
    dmardata.qryPOHd.edit;
    dbepono.readonly := true;
    dbepodate.SetFocus;

end;

procedure TUpdPOHd1.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryPOHd.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qryPOHd.delete;
    end;
end;

procedure TUpdPOHd1.detbtnClick(Sender: TObject);
begin
    if DetBtn.Caption = '&Cancel' then
    begin
         dmardata.qryPOHd.cancel;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         DetBtn.enabled    := true;

         BrowseBtn.Caption := '&Browse';
         DetBtn.Caption    := 'De&tail';

         gbHd.Enabled := false;


    end
    else
    begin
         with dmardata do
         begin
              qryPODet.close;
              qryPODet.sql.clear;
              qryPODet.sql.add('select * from PurchDet where (Purchno = '''  + qryPOHd.fieldbyname('Purchno').asstring + ''')');
              qryPODet.Open;

              qryStock.Close;
              qryStock.sql.clear;
              qryStock.sql.add('select * from Product where (custcode = ''' + qryPoHd.fieldbyname('custcode').asstring + ''') order by prodname');
              qryStock.Open;


              UpdPODet := tUpdPODet.create(application);
              UpdPODet.showmodal;
              UpdPODet.free;

              qryStock.close;
              qryPODet.close;

         end;
    end;
end;

procedure TUpdPOHd1.FilterStock(Sender: TObject);
begin
    with dmardata do
    begin
         qrystock.close;
         qryStock.sql.clear;
         qryStock.sql.add('select * from product where (custcode=''' + qryPOHd.fieldbyname('custcode').asstring + ''') order by prodname');
         qryStock.open;
    end;

end;

procedure TUpdPOHd1.edkeyChange(Sender: TObject);
begin
    dmardata.qryPOHd.Locate('PurchNo',edkey.text,[locaseinsensitive]);
end;

procedure TUpdPOHd1.dbeponoExit(Sender: TObject);
begin
    with dmardata do
    begin
         if (dbepono.ReadOnly = false) then
         begin
              if (qryPOHd.FieldByName('PurchNo').asstring <> '') then
              begin
                   qryKey.close;
                   qryKey.sql.clear;
                   qryKey.sql.add('select * from PurchHd where (PurchNo = ''' + qryPOHd.fieldbyname('PurchNo').asstring + ''')');
                   qryKey.open;
                   if (qrykey.RecordCount > 0) then
                        showmessage('Record already exist...');
                   qryKey.Close;
              end;
         end;
    end;
end;

end.
