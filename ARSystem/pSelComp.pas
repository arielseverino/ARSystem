unit pSelComp;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs;

type

  TSelComp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cLogDir: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    cbSelComp: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cServer:string;
    cDatabase:string;
    cPassword:string;
    cDataFile:string;
  end;

var
  SelComp: TSelComp;
  cCompName,cUserName,cLogDir,cLogIn,cApplicationPath : string;

  aComp,aConfig : tSTringList;

implementation

//uses Dlglog;

{$R *.dfm}

procedure TSelComp.FormActivate(Sender: TObject);
var
  i: Integer;

begin
    cApplicationPath :=  ExtractFilePath(Application.ExeName);

    cbSelComp.items.clear;
    aComp := TStringList.Create;
    aComp.LoadFromFile(cApplicationpath+'Company.lst');
    For I := 0 to (aComp.Count-1) do
    Begin
         cbSelComp.items.add(copy(aComp[i],1,Pos(';',aComp[i])-1));
    end;
    cbSelComp.itemindex := 0;
end;
procedure TSelComp.CancelBtnClick(Sender: TObject);
begin
    close;
end;

procedure TSelComp.OKBtnClick(Sender: TObject);
var cConfigFile :String;
    I           :integer;
begin

    cdatafile   :=  '\'+ copy(aComp[cbSelComp.itemindex],pos(';',aComp[cbSelComp.itemindex])+1,length(aComp[cbSelComp.itemindex]));

    cCompname   := cbSelComp.items[cbSelComp.itemindex];

    cConfigFile := cApplicationPath + '\'+ copy(aComp[cbSelComp.itemindex],pos(';',aComp[cbSelComp.itemindex])+1,length(aComp[cbSelComp.itemindex]));
    aConfig := tStringlist.create;
    aConfig.LoadFromFile(cConfigFile);

    For I := 0 to (aConfig.Count-1) do
    Begin
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'SQLDB' then
         begin
              cDatabase := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'SQLSRV' then
         begin
              cServer := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'PASSWORD' then
         begin
              cPassWord := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'DIR' then
         begin
              cLogDir.caption := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;
         if copy(aConfig[i],1,pos('=',aConfig[i])-1) = 'LOGIN' then
         begin
              cLogIn := copy(aConfig[i],pos('=',aConfig[i])+1,length(aConfig[i]));
         end;

    end;



    {
    dlgLogOn := tDlgLogOn.create(application);
    dlgLogOn.showmodal;
    dlgLogOn.free;}


end;

end.
