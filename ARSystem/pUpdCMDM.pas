unit pUpdCMDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TUpdCMDM = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    DBText2: TDBText;
    gbHead: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbedrdate: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    NextBtn: TButton;
    PrevBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    BrowseBtn: TButton;
    CloseBtn: TButton;
    gbadjdet: TGroupBox;
    dbradjtype: TDBRadioGroup;
    Label15: TLabel;
    dbeAdjNo: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    cancelbtn: TButton;
    Label1: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure cancelbtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdCMDM: TUpdCMDM;
  oAmtPaid : real;

implementation

uses pardata, pListRec, pRptHold;

{$R *.dfm}

procedure TUpdCMDM.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryAdJDet.Bof then
         showmessage('First Record')
    else
         dmardata.qryAdjDet.Prior;
end;

procedure TUpdCMDM.NextBtnClick(Sender: TObject);
begin
    if dmardata.qryAdjDet.Eof then
        showmessage('Last Record')
    else
        dmardata.qryAdjDet.next;
end;

procedure TUpdCMDM.AddBtnClick(Sender: TObject);
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

    gbAdjDet.Enabled := true;
    dbradjtype.SetFocus;

    with dmardata do
    begin
         qryAdjDet.append;
         qryAdjDet.fieldbyname('CustCode').asstring  := qryPayCusHd.fieldbyname('CustCode').asstring;
         qryAdjdet.fieldbyname('AdjDate').asdatetime := qryPayCusHd.fieldbyname('PayDate').asdatetime;
         qryAdjDet.FieldByName('Type').asstring      := 'C';
    end;
end;

procedure TUpdCMDM.BrowseBtnClick(Sender: TObject);
begin
    if BrowseBtn.Caption = '&Ok' then
    begin

         NextBtn.Enabled  := true;
         PrevBtn.Enabled  := true;

         AddBtn.Enabled   := true;
         DelBtn.Enabled   := true;
         EditBtn.enabled  := true;

         CloseBtn.enabled := true;

         BrowseBtn.Enabled := true;
         CancelBtn.enabled := false;

         BrowseBtn.Caption := '&Browse';

         gbAdjDet.Enabled := false;

         with dmardata do
         begin
              qryAdjDet.Post;

              qryPayCusHd.Edit;
              if qryAdjDet.fieldbyname('Type').asstring = 'C' then
              begin
                   qryPayCusHd.FieldByName('AdjAmt').asfloat   := qrypaycushd.fieldbyname('AdjAmt').asfloat +
                                                                  qryAdjDet.fieldbyname('AmtPaid').asfloat - oAmtPaid;
                   qryPayCusHd.fieldbyname('CheckAmt').asfloat := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                                 (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                                + qryPayCusHd.fieldbyname('TaxAmt').asfloat);
              end
              else
              begin
                   qryPayCusHd.FieldByName('AdjAmt').asfloat   := qrypaycushd.fieldbyname('AdjAmt').asfloat -
                                                                  qryAdjDet.fieldbyname('AmtPaid').asfloat + oAmtPaid;
                   qryPayCusHd.fieldbyname('CheckAmt').asfloat := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                                 (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                                + qryPayCusHd.fieldbyname('TaxAmt').asfloat);

              end;
              qryPayCusHd.post;

         end;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF CM/DM NO.';
         ListRec.dbgrid1.DataSource := dmardata.dsAdjDet;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'AdjNo';
         ListRec.showmodal;
         ListRec.free;
    end;

end;

procedure TUpdCMDM.EditBtnClick(Sender: TObject);
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

    gbAdjDet.enabled := true;
    dmardata.qryAdjDet.edit;
    dbradjtype.readonly := true;
    dbeadjno.readonly   := true;

    oAmtPaid:= dmardata.qryAdjDet.fieldbyname('AmtPaid').asfloat;

end;

procedure TUpdCMDM.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qryAdjDet.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qryPayCusHd.Edit;
              if qryAdjDet.fieldbyname('Type').asstring = 'C' then
                   qryPayCusHd.FieldByName('AdjAmt').asfloat   := qrypaycushd.fieldbyname('AdjAmt').asfloat -
                                                                  qryAdjDet.fieldbyname('AmtPaid').asfloat
              else
                   qryPayCusHd.fieldbyname('AdjAmt').asfloat   := qryPayCusHd.fieldbyname('AdjAmt').asfloat +
                                                                  qryadjdet.fieldbyname('Amtpaid').asfloat;
              qryPayCusHd.fieldbyname('CheckAmt').asfloat      := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                                 (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                                + qryPayCusHd.fieldbyname('TaxAmt').asfloat);
              qryPayCusHd.post;
              qryAdjDet.delete;
         end;

    end;

end;

procedure TUpdCMDM.cancelbtnClick(Sender: TObject);
begin
    dmardata.qryadjdet.cancel;

    NextBtn.Enabled  := true;
    PrevBtn.Enabled  := true;

    AddBtn.Enabled   := true;
    DelBtn.Enabled   := true;
    EditBtn.enabled  := true;

    CloseBtn.enabled := true;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled := false;

    BrowseBtn.Caption := '&Browse';

    gbAdjDet.Enabled := false;


end;

procedure TUpdCMDM.Button1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryreusable1.Close;
         qryreusable1.sql.clear;
         qryreusable1.sql.add('Select a.adjno,a.adjdate,a.remark,a.wordamt,a.amtpaid,a.approved,a.prepared, ' +
                   ' b.custcode,b.custname ' +
                   ' from AdjDet a ' +
                   '   left outer join customer b on (b.custcode=a.custcode)' +
                   ' Where (a.Adjno = ''' + qryAdjDet.fieldbyname('AdjNo').asstring + ''')');
         qryreusable1.open;
         rpthold := trpthold.create(application);
         rpthold.CMDMForm.preview;
         rpthold.cmdmform.free;
         qryreusable1.close;
    end;
end;

end.
