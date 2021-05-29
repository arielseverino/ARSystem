program WINARSYS;

uses
  Forms,
  Controls,
  main in 'MAIN.PAS' {ARMenu},
  pUpdStock in 'pUpdStock.pas' {UpdStock},
  pARData in 'PARDATA.PAS' {dmardata: TDataModule},
  pUpdCust in 'PUPDCUST.PAS' {UpdCust},
  pUpdPOHd1 in 'pUpdPOHd1.pas' {UpdPOHd1},
  pUpdPODet in 'pUpdPODet.pas' {UpdPODet},
  pUpdPOHd in 'pUpdPOHd.pas' {UpdPOHd},
  pUPDPayHd in 'pUPDPayHd.pas' {UPDPAYHD},
  pUpdPayDet in 'pUpdPayDet.pas' {UpdPayDet},
  pUPDDRHd in 'pUPDDRHd.pas' {UPDDRHD},
  pUpdDRDet in 'pUpdDRDet.pas' {UpdDrDet},
  pUpdCMDM in 'pUpdCMDM.pas' {UpdCMDM},
  pUpdEWT in 'pUpdEWT.pas' {UpdEWT},
  pListRec in 'PLISTREC.PAS' {ListRec},
  pDlgParam1 in 'pDlgParam1.pas' {Dlgparam1},
  PRPTHOLD2 in 'PRPTHOLD2.PAS' {RptHold2},
  pDlgParam2 in 'pDlgParam2.pas' {dlgparam2},
  pDlgParam3 in 'pDlgParam3.pas' {dlgparam3},
  pDlgParam4 in 'pDlgParam4.pas' {dlgparam4},
  pDlgParam5 in 'pDlgParam5.pas' {dlgParam5},
  pFormSetup in 'pFormSetup.pas' {FormSetup},
  pStandard in 'pStandard.pas',
  pCopyForm in 'pCopyForm.pas' {CopyForm},
  FastCopy in 'FastCopy.pas',
  pCompSetup in 'pCompSetup.pas' {CompSetup},
  pBrowUtilDRHd in 'pBrowUtilDRHd.pas' {BrowUtilDRHd},
  BrowUtilDRDet in 'BrowUtilDRDet.pas' {BrowUtilDRDetail},
  pListDR in 'pListDR.pas' {ListDR},
  pBrowCompare in 'pBrowCompare.pas' {BrowCompare},
  pARForm in 'pARForm.pas' {ARForm},
  pImport in 'pImport.pas' {BrowLoan},
  pRptHold in 'PRPTHOLD.PAS' {RptHold},
  pSelComp in 'pSelComp.pas' {SelComp};

{$R *.res}

begin
  //Application.CreateForm(TARForm, ARForm);
  //ARForm.ShowModal;
  //ARForm.free;
  SelComp := tSelComp.create(application);
  SelComp.showmodal;
  if (SelComp.modalresult=mrOk) then
  begin
      Application.CreateForm(TdmARData, dmARData);
      if (dmARData.ARServer.connected=true) then
      begin
        //dlgLogOn := TDlgLogOn.create(application);
        //dlgLogOn.ShowModal;
        //if dlgLogOn.tag = 0 then
        //begin
           Application.Initialize;
           Application.CreateForm(TARMenu, ARMenu);
           Application.Run;
        //end;
      end;
  end;
  SelComp.free;
end.
