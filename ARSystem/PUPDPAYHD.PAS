unit pUPDPayHd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, db; 

type
  TUPDPAYHD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    gbHead: TGroupBox;
    Label1: TLabel;
    dbeORno: TDBEdit;
    Label2: TLabel;
    dbedrdate: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    NextBtn: TButton;
    PrevBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    BrowseBtn: TButton;
    DetBtn: TButton;
    Label15: TLabel;
    edkey: TEdit;
    CloseBtn: TButton;
    Shape1: TShape;
    cmdmbtn: TButton;
    ewtbtn: TButton;
    procedure NextBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure DetBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure edkeyChange(Sender: TObject);
    procedure CompDueDate(Sender: TObject);
    procedure NextRec(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PrevBtnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmdmbtnClick(Sender: TObject);
    procedure ewtbtnClick(Sender: TObject);
    procedure dbeORnoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UPDPAYHD: TUPDPAYHD;

implementation

uses pardata, pUpdPayDet, pUpdCMDM, pUpdEWT, pListRec;

{$R *.dfm}

procedure TUPDPAYHD.NextBtnClick(Sender: TObject);
begin
    if dmardata.qryPayCusHd.Eof then
        showmessage('Last Record')
    else
        dmardata.qryPayCusHd.next;
end;

procedure TUPDPAYHD.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryPayCushd.Bof then
         showmessage('First Record')
    else
         dmardata.qryPayCusHd.Prior;
end;

procedure TUPDPAYHD.AddBtnClick(Sender: TObject);
begin
    dbeORNo.ReadOnly := false;

    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    cmdmbtn.enabled  := false;
    ewtbtn.enabled   := false;

    BrowseBtn.Enabled := true;
    DetBtn.enabled    := true;

    BrowseBtn.Caption := '&Ok';
    DetBtn.Caption    := '&Cancel';

    gbHead.Enabled := true;
    dmardata.qryPayCusHd.append;
    dmardata.qryPayCushd.fieldbyname('PayDate').asdatetime := date();
    dbeORNo.SetFocus;

end;

procedure TUPDPAYHD.BrowseBtnClick(Sender: TObject);
begin
    if BrowseBtn.Caption = '&Ok' then
    begin
         dmardata.qryPayCusHd.post;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         DetBtn.enabled    := true;

         cmdmbtn.enabled  := true;
         ewtbtn.enabled   := true;


         BrowseBtn.Caption := '&Browse';
         DetBtn.Caption    := 'De&tail';

         gbHead.Enabled := false;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF OR NO.';
         ListRec.dbgrid1.DataSource := dmardata.dsPayCusHd;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'ORNO';
         ListRec.showmodal;
         ListRec.free;
    end;
end;

procedure TUPDPAYHD.DetBtnClick(Sender: TObject);
begin
    if DetBtn.Caption = '&Cancel' then
    begin
         dmardata.qryPayCusHd.cancel;

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         DetBtn.enabled    := true;

         cmdmbtn.enabled  := true;
         ewtbtn.enabled   := true;

         BrowseBtn.Caption := '&Browse';
         DetBtn.Caption    := 'De&tail';

         gbHead.Enabled := false;
    end
    else
    begin
         with dmardata do
         begin
              qrySaleHd.close;
              qrySaleHd.sql.clear;
              qrySaleHd.sql.add('select * from SaleHd '  +
                                ' where (SaleHd.custcode = ''' + qryPayCusHd.fieldbyname('custcode').asstring + ''') ' +
                                ' and (SaleHd.lastbal > 0) ' +
                                ' and (SaleInv <> ''' + '' + ''')');
              qrySaleHd.Open;

              qrySaleDet.Close;
              qrySaleDet.sql.clear;
              qrySaleDet.sql.add('select * from SaleDet ' +
              ' where (DRNo = ''' + qrySaleHd.fieldbyname('DRNo').asstring + ''')');
              qrySaleDet.open;

              qryPaycust.close;
              qryPayCust.sql.clear;
              qryPayCust.sql.add('select * from PayCust ' +
              ' where (ORNo = ''' + qryPayCushd.fieldbyname('orno').asstring   + ''')');
              qryPayCust.Open;

              qryStock.close;
              qryStock.sql.clear;
              qryStock.sql.add('select * from product where (Custcode = ''' + qrySaleHd.fieldbyname('custcode').asstring + ''')');
              qryStock.Open;

              UpdPayDet := tUpdPayDet.create(application);
              UpdPayDet.showmodal;
              UpdPayDet.free;

              qryStock.close;
              qrySalehd.close;
              qrySaleDet.close;

         end;
    end;
end;

procedure TUPDPAYHD.EditBtnClick(Sender: TObject);
begin
    NextBtn.Enabled  := false;
    PrevBtn.Enabled  := false;

    AddBtn.Enabled   := false;
    DelBtn.Enabled   := false;
    EditBtn.enabled  := false;

    CloseBtn.enabled := false;

    cmdmbtn.enabled  := false;
    ewtbtn.enabled   := false;

    BrowseBtn.Enabled := true;
    DetBtn.enabled    := true;

    BrowseBtn.Caption := '&Ok';
    DetBtn.Caption    := '&Cancel';

    gbHead.Enabled := true;
    dmardata.qryPayCusHd.edit;
    dbeOrno.readonly := true;
    dbedrdate.SetFocus;

end;

procedure TUPDPAYHD.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryPayCusHd.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if (qryPayCushd.fieldbyname('checkamt').asfloat <> 0) then
              showmessage('This has balance...cannot be deleted')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qryPayCusHd.delete;

    end;

end;

procedure TUPDPAYHD.edkeyChange(Sender: TObject);
begin
    dmardata.qryPayCusHd.Locate('ORNo',edkey.text,[locaseinsensitive]);
end;

procedure TUPDPAYHD.CompDueDate(Sender: TObject);
begin
    {
    dmardata.tPayCusHd.edit;
    dmardata.tPayCusHd.fieldbyname('DueDate').asdatetime := dmardata.tsalehd.fieldbyname('saledate').asdatetime + dmardata.tsalehd.fieldbyname('termcode').asinteger;}
end;

procedure TUPDPAYHD.NextRec(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if dmardata.qryPayCusHd.eof=true then
         showmessage('Last Record')
    else
         dmardata.qryPayCusHd.next;
end;

procedure TUPDPAYHD.PrevBtnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if dmardata.qryPayCusHd.bof then
        showmessage('First Record')
    else
        dmardata.qryPayCusHd.prior;
end;

procedure TUPDPAYHD.cmdmbtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         qryAdjdet.close;
         qryAdjdet.sql.clear;
         qryAdjDet.sql.add('select * from AdjDet');
         qryAdjDet.Open;
         qryAdjDet.last;

         UpdCMDM := tUpdCMDM.create(application);
         UpdCMDM.showmodal;
         UpdCMDM.free;

         qryAdjDet.close;
         
    end

end;

procedure TUPDPAYHD.ewtbtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         qryTaxAdj.close;
         qryTaxAdj.sql.clear;
         qryTaxAdj.sql.add('select * from taxAdj');
         qryTaxAdj.Open;

         UpdEWT := tUpdEWT.create(application);
         UpdEWT.showmodal;
         UpdEWT.free;

         qryTaxAdj.close;
    end
end;

procedure TUPDPAYHD.dbeORnoExit(Sender: TObject);
begin
    with dmardata do
    begin
         if (dbeORNo.ReadOnly = false) then
         begin
              if (qryPayCusHd.FieldByName('ORNo').asstring <> '') then
              begin
                   qryKey.close;
                   qryKey.sql.clear;
                   qryKey.sql.add('select * from PayCusHd where (ORNo = ''' + qryPayCusHd.fieldbyname('ORNo').asstring + ''')');
                   qryKey.open;
                   if (qrykey.RecordCount > 0) then
                        showmessage('Record already exist...');
                   qryKey.Close;
              end;
         end;
    end;
end;


end.
