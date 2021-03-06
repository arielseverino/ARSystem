unit pUPDDRHd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, db, DBTables, Grids, DBGrids;

type
  TUPDDRHD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    gbHead: TGroupBox;
    Label1: TLabel;
    dbedrno: TDBEdit;
    Label2: TLabel;
    dbedrdate: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
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
    Button1: TButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    btnSetup: TButton;
    Label22: TLabel;
    DBEdit10: TDBEdit;
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
    procedure Button1Click(Sender: TObject);
    procedure dbedrnoExit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure btnSetupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecuteProcess(const FileName, Params: string; Folder: string; WaitUntilTerminated, WaitUntilIdle, RunMinimized: boolean;
    var ErrorCode: integer): boolean;


  end;

var
  UPDDRHD: TUPDDRHD;

implementation

uses pardata, pUpdDRDet, pListRec, pDlgParam1, pRptHold, pFormSetup, pStandard, pSelComp,
  main;

{$R *.dfm}

procedure TUPDDRHD.NextBtnClick(Sender: TObject);
begin
    if dmardata.qrysalehd.Eof then
        showmessage('Last Record')
    else
        dmardata.qrySaleHd.next;
end;

procedure TUPDDRHD.PrevBtnClick(Sender: TObject);
begin
    if dmardata.qrysalehd.Bof then
         showmessage('First Record')
    else
         dmardata.qrysalehd.Prior;
end;

procedure TUPDDRHD.AddBtnClick(Sender: TObject);
begin
    dbeDrNo.ReadOnly := false;
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

    gbHead.Enabled := true;
    dmardata.qrySaleHd.append;
    dmardata.qrysalehd.FieldByName('TranCode').asstring:='01';
    dbedrno.SetFocus;

end;

procedure TUPDDRHD.BrowseBtnClick(Sender: TObject);
begin
    if BrowseBtn.Caption = '&Ok' then
    begin
         dmardata.qrysalehd.post;

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

         gbHead.Enabled := false;

    end
    else if browsebtn.caption = '&Browse' then
    begin
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF DR NO.';
         ListRec.dbgrid1.DataSource := dmardata.dsSaleHd;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'DRNo';
         ListRec.showmodal;
         ListRec.free;
    end;

end;

procedure TUPDDRHD.DetBtnClick(Sender: TObject);
begin
    if DetBtn.Caption = '&Cancel' then
    begin
         dmardata.qrysalehd.cancel;

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

         gbHead.Enabled := false;


    end
    else
    begin
         with dmardata do
         begin
              qrySaleDet.close;
              qrySaleDet.sql.Clear;
              qrySaleDet.sql.add('select * from SaleDet ' +
              ' where (DRNo = ''' + qrySalehd.fieldbyname('DRNo').asstring + ''')');
              qrySaleDet.Open;

              qryStock.close;
              qryStock.sql.clear;
              if qrySalehd.FieldByName('TranCode').asstring = '01' then
                 qryStock.sql.add('Select * from Product where (custcode = ''' + qrySaleHd.fieldbyname('CustCode').asstring + ''') order by prodname')
              else
                 qryStock.sql.add('select * from Product order by prodname');
              qryStock.open;

              UpdDrDet := tUpdDRDet.create(application);
              UpdDRDet.showmodal;
              UpdDRDet.free;

              qryStock.close;
              qrySaleDet.close;

         end;
    end;
end;

procedure TUPDDRHD.EditBtnClick(Sender: TObject);
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

    gbHead.Enabled := true;
    dmardata.qrySaleHd.edit;
    dbedrno.readonly := true;
    dbedrdate.SetFocus;


end;

procedure TUPDDRHD.DelBtnClick(Sender: TObject);
begin
    with dmardata do
    begin
         if ( qrySaleHd.recordcount = 0 ) then
              showMessage('Operation not supported')
         else if messageDlg('Delete current record?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
              qrySaleHd.delete;

    end;

end;

procedure TUPDDRHD.edkeyChange(Sender: TObject);
begin
    dmardata.qrySaleHd.Locate('drno',edkey.text,[locaseinsensitive]);
end;

procedure TUPDDRHD.CompDueDate(Sender: TObject);
begin
    if dmardata.qrysalehd.fieldbyname('SaleDate').asstring <> '' then
    begin
         dmardata.qrysalehd.edit;
         dmardata.qrysalehd.fieldbyname('DueDate').asdatetime := dmardata.qrysalehd.fieldbyname('saledate').asdatetime + dmardata.qrySalehd.fieldbyname('termcode').asinteger;
    end;
end;

procedure TUPDDRHD.NextRec(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if dmardata.qrySaleHd.eof then
         showmessage('Last Record')
    else
         dmardata.qrySaleHd.next;
end;

procedure TUPDDRHD.PrevBtnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if dmardata.qrySaleHd.bof then
        showmessage('First Record')
    else
        dmardata.qrySaleHd.prior;
end;


procedure TUPDDRHD.Button1Click(Sender: TObject);
var cDRNo,Filename,WorkingFolder,Parameters : string;
    Error  : integer;
    Ok : boolean;
begin
 try
  cDRNo := dmardata.qrySaleHd.fieldbyname('DRNo').asstring;
  dlgparam1 := tDlgparam1.create(application);
  dlgParam1.showmodal;
  if dlgparam1.ModalResult = mrok then
  begin
    SysLog(aSyslog,cLogFile,'Form Printing : ' + dmardata.qrysalehd.fieldbyname('DRNo').asstring + ' printing.');
    FileName := 'ARForm.exe ';
    WorkingFolder := ''; // if empty function will extract path from FileName
    //Parameters := '-p'; // can be empty
    parameters := SelComp.cDataFile + ' ' + cDRNo + ' ' + dmardata.qrysalehd.fieldbyname('trancode').asstring + ' ' +   inttostr(dlgparam1.rgDRFormType.ItemIndex) + ' ' + inttostr(dlgparam1.rgDecimal.itemindex);

    OK := ExecuteProcess(FileName, Parameters, WorkingFolder, false, false, false, Error);
    if not OK then ShowMessage('Error: ' + IntToStr(Error));

  end;
  dlgparam1.free;
 except
    on E : Exception do
       begin
         //syslog(aSyslog,cLogFile,qrySaleHd.fieldbyname('DRNo').asstring + ' Exception message = ' + e.Message);
       end
 end;
end;

procedure TUPDDRHD.dbedrnoExit(Sender: TObject);
begin
    with dmardata do
    begin
         if (dbedrno.ReadOnly = false) then
         begin
              if (qrySaleHd.FieldByName('DRNo').asstring <> '') then
              begin
                   qryKey.close;
                   qryKey.sql.clear;
                   qryKey.sql.add('select * from SaleHd where (DRNo = ''' + qrySaleHd.fieldbyname('DRNo').asstring + ''')');
                   qryKey.open;
                   if (qrykey.RecordCount > 0) then
                        showmessage('Record already exist...');
                   qryKey.Close;
              end;
         end;
    end;

end;

procedure TUPDDRHD.DBEdit4Exit(Sender: TObject);
begin
    with dmardata do
    begin
         if (dbedrno.ReadOnly = false) then
         begin
              if (qrySaleHd.FieldByName('SaleInv').asstring <> '') then
              begin
                   qryKey.close;
                   qryKey.sql.clear;
                   qryKey.sql.add('select * from SaleHd where (SaleInv = ''' + qrySaleHd.fieldbyname('SaleInv').asstring + ''')');
                   qryKey.open;
                   if (qrykey.RecordCount > 0) then
                        showmessage('Record already exist...');
                   qryKey.Close;
              end;
         end;
    end;

end;

procedure TUPDDRHD.btnSetupClick(Sender: TObject);
begin
  with dmArData do
  begin
     qryCompany.close;
     qryCompany.sql.clear;
     qryCompany.sql.add('select * from setup');
     qryCompany.Open;
     qryCompany.edit;


     qryListForm.close;
     qryListForm.sql.clear;
     qryListForm.sql.add('select formCode from tblRepSetUp ' +
     ' group by formcode '+
     ' order by formcode ');
     qryListForm.open;

     qryFormSettings.close;
     qryFormSettings.sql.clear;
     qryFormSettings.SQL.add('select * from tblRepSetup where (RepCode = ''' + '00001' + ''') and (FormCode=''' + qryCustomer.fieldbyname('FormCode').asstring + ''')');
     qryFormSettings.open;
     qryFormSettings.edit;
     FormSetup := tFormSetup.create(application);
     FormSetup.showmodal;
     if FormSetup.modalresult=mrok then
     begin
        qryFormSettings.Post;
        qryCompany.post;
     end
     else
     begin
        qryFormSettings.Cancel;
        qryCompany.Post;
     end;
     FormSetup.free;

     qryFormSettings.close;
     qryCompany.close;
     qryListform.close;

  end;
end;

function tUpdDRHd.ExecuteProcess(const FileName, Params: string; Folder: string; WaitUntilTerminated, WaitUntilIdle, RunMinimized: boolean;
  var ErrorCode: integer): boolean;
var
  CmdLine: string;
  WorkingDirP: PChar;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  /// Reference: https://riptutorial.com/delphi/example/18340/createprocess

  Result := true;
  CmdLine := '"' + FileName + '" ' + Params;
  if Folder = '' then Folder := ExcludeTrailingPathDelimiter(ExtractFilePath(FileName));
  ZeroMemory(@StartupInfo, SizeOf(StartupInfo));
  StartupInfo.cb := SizeOf(StartupInfo);
  if RunMinimized then
    begin
      StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartupInfo.wShowWindow := SW_SHOWMINIMIZED;
    end;
  if Folder <> '' then WorkingDirP := PChar(Folder)
  else WorkingDirP := nil;
  if not CreateProcess(nil, PChar(CmdLine), nil, nil, false, 0, nil, WorkingDirP, StartupInfo, ProcessInfo) then
    begin
      Result := false;
      ErrorCode := GetLastError;
      exit;
    end;
  with ProcessInfo do
    begin
      CloseHandle(hThread);
      if WaitUntilIdle then WaitForInputIdle(hProcess, INFINITE);
      if WaitUntilTerminated then
        repeat
          Application.ProcessMessages;
        until MsgWaitForMultipleObjects(1, hProcess, false, INFINITE, QS_ALLINPUT) <> WAIT_OBJECT_0 + 1;
      CloseHandle(hProcess);
    end;
end;




end.
