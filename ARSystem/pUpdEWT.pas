unit pUpdEWT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls;

type
  TUpdEWT = class(TForm)
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
    gbewtdet: TGroupBox;
    Label15: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbradjtype: TDBRadioGroup;
    dbeAdjNo: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel3: TPanel;
    NextBtn: TButton;
    PrevBtn: TButton;
    AddBtn: TButton;
    EditBtn: TButton;
    DelBtn: TButton;
    BrowseBtn: TButton;
    CloseBtn: TButton;
    cancelbtn: TButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure cancelbtnClick(Sender: TObject);
    procedure BrowseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdEWT: TUpdEWT;
  oAmtPaid : real;

implementation

uses pARData, pListRec;

{$R *.dfm}

procedure TUpdEWT.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qryTaxAdj.Bof then
         showmessage('First Record')
    else
         dmardata.qryTaxAdj.Prior;
end;

procedure TUpdEWT.NextBtnClick(Sender: TObject);
begin
    if dmardata.qryTaxAdj.Eof then
        showmessage('Last Record')
    else
        dmardata.qryTaxAdj.next;
end;

procedure TUpdEWT.AddBtnClick(Sender: TObject);
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

    gbEWTDet.Enabled := true;
    dbradjtype.SetFocus;

    with dmardata do
    begin
         qryTaxAdj.append;
         qryTaxAdj.fieldbyname('CustCode').asstring  := qryPayCusHd.fieldbyname('CustCode').asstring;
         qryTaxAdj.fieldbyname('AdjDate').asdatetime := qryPayCusHd.fieldbyname('PayDate').asdatetime;
         qryTaxAdj.fieldByName('Type').asstring      := 'C';
    end;

end;

procedure TUpdEWT.EditBtnClick(Sender: TObject);
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

    gbEWTDet.enabled := true;
    dmardata.qryTaxAdj.edit;
    dbradjtype.readonly := true;
    dbeadjno.readonly   := true;

    oAmtPaid:= dmardata.qryTaxAdj.fieldbyname('AmtPaid').asfloat;

end;

procedure TUpdEWT.DelBtnClick(Sender: TObject);
begin
   with dmardata do
    begin
         if ( qryTaxAdj.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
         begin
              qryPayCusHd.Edit;
              if qryTaxAdj.fieldbyname('Type').asstring = 'C' then
                   qryPayCusHd.FieldByName('TaxAmt').asfloat   := qrypaycushd.fieldbyname('AdjAmt').asfloat -
                                                                  qryTaxAdj.fieldbyname('AmtPaid').asfloat
              else
                   qryPayCusHd.fieldbyname('TaxAmt').asfloat   := qryPayCusHd.fieldbyname('TaxAmt').asfloat +
                                                                  qryTaxAdj.fieldbyname('Amtpaid').asfloat;
              qryPayCusHd.fieldbyname('CheckAmt').asfloat := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                          (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                         + qryPayCusHd.fieldbyname('TaxAmt').asfloat);
              qryPayCusHd.post;


              qryTaxAdj.delete;
         end;

    end;

end;

procedure TUpdEWT.cancelbtnClick(Sender: TObject);
begin
    dmardata.qryTaxAdj.cancel;

    NextBtn.Enabled  := true;
    PrevBtn.Enabled  := true;

    AddBtn.Enabled   := true;
    DelBtn.Enabled   := true;
    EditBtn.enabled  := true;

    CloseBtn.enabled := true;

    BrowseBtn.Enabled := true;
    CancelBtn.enabled := false;

    BrowseBtn.Caption := '&Browse';

    gbEWTDet.Enabled := false;

end;

procedure TUpdEWT.BrowseBtnClick(Sender: TObject);
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

         gbewtDet.Enabled := false;

         with dmardata do
         begin
              qryTaxAdj.Post;

              qryPayCusHd.Edit;
              if qryTaxAdj.fieldbyname('Type').asstring = 'C' then
              begin
                   qryPayCusHd.FieldByName('TaxAmt').asfloat   := qrypaycushd.fieldbyname('TaxAmt').asfloat +
                                                                  qryTaxAdj.fieldbyname('AmtPaid').asfloat - oAmtPaid;
                   qryPayCusHd.fieldbyname('CheckAmt').asfloat := qrypaycushd.fieldbyname('Invamt').asfloat -
                                                                 (qryPaycusHd.fieldbyname('AdjAmt').asfloat
                                                                + qryPayCusHd.fieldbyname('TaxAmt').asfloat);
              end
              else
              begin
                   qryPayCusHd.FieldByName('TaxAmt').asfloat   := qrypaycushd.fieldbyname('TaxAmt').asfloat -
                                                                  qryTaxAdj.fieldbyname('AmtPaid').asfloat + oAmtPaid;
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
         ListRec.dbgrid1.DataSource := dmardata.dsTaxAdj;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'AdjNo';
         ListRec.showmodal;
         ListRec.free;
    end;


end;

end.
