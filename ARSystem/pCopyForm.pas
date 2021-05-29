unit pCopyForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileCtrl, StdCtrls, DB, DBTables, ComCtrls, FastCopy;

type
  TFastCopyFileThread = class;
  TCopyForm = class(TForm)
    btnCopy: TButton;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    GroupBox2: TGroupBox;
    Button4: TButton;
    edTarget: TEdit;
    GroupBox1: TGroupBox;
    edSource: TEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    dsreusable1: TDataSource;
    qryreusable1: TQuery;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    procedure btnCopyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fFastCopyFileThread: TFastCopyFileThread;
    fFastCopyFileThreadCanceled: Boolean;
    procedure ChangeControlsState(State: Boolean);
    procedure FastCopyFileProgress(Sender: TObject; FileName: TFileName;
      Value: Integer; var CanContinue: Boolean);
    procedure FastCopyFileTerminate(Sender: TObject);

  public
    { Public declarations }
    procedure StartFastCopyThread2;
  end;

    TFastCopyFileProgressEvent = procedure(Sender: TObject; FileName: TFileName;
    Value: Integer; var CanContinue: Boolean) of object;
  TFastCopyFileThread = class(TThread)
  private
    fSourceFileName: TFileName;
    fDestinationFileName: TFileName;
    fProgress: TFastCopyFileProgressEvent;
    fCopyMode: TFastCopyFileMode;
    procedure FastCopyFileCallback(const FileName: TFileName;
      const CurrentSize, TotalSize: LongWord; var CanContinue: Boolean);
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
    property SourceFileName: TFileName
      read fSourceFileName write fSourceFileName;
    property DestinationFileName: TFileName
      read fDestinationFileName write fDestinationFileName;
    property CopyMode: TFastCopyFileMode read fCopyMode write fCopyMode;
    property OnProgress: TFastCopyFileProgressEvent
      read fProgress write fProgress;

  end;



var
  CopyForm: TCopyForm;
  cSource,cTarget:string;
implementation

uses pARData;

{$R *.dfm}

procedure TCopyForm.btnCopyClick(Sender: TObject);
var nctr : integer;
begin

  for  nctr := 0 to FileListBox1.Count-1 do
  begin
      edSource.text  := cSource + FileListBox1.Items[nctr];
      edTarget.Text := cTarget + FileListBox1.Items[nctr];
      showmessage(filelistbox1.FileName);
      StartFastCopyThread2;
  end;

end;

procedure TCopyForm.StartFastCopyThread2;
begin
  ChangeControlsState(False);
  fFastCopyFileThread := TFastCopyFileThread.Create;
  with fFastCopyFileThread do
  begin
    SourceFileName := edSource.Text;
    DestinationFileName := edTarget.Text;
    CopyMode := TFastCopyFileMode(0);
    OnProgress := FastCopyFileProgress;
    OnTerminate := FastCopyFileTerminate;
    Resume;
  end;
end;

procedure tCopyForm.ChangeControlsState(State: Boolean);
begin
  {Button1.Enabled := State;
  Button2.Enabled := not State;}
  if State then
  begin
    if fFastCopyFileThreadCanceled then
      lblStatus.caption := 'Aborted !!!'
    else
      lblStatus.caption := 'Competed...';
    fFastCopyFileThreadCanceled := False;
  end;
end;

procedure TCopyForm.FastCopyFileProgress(Sender: TObject; FileName: TFileName;
  Value: Integer; var CanContinue: Boolean);
begin
  {StatusText := ExtractFileName(FileName);}
  ProgressBar1.Position := Value;
end;

procedure TCopyForm.FastCopyFileTerminate(Sender: TObject);
begin
  ChangeControlsState(True);
end;


{ TFastCopyFileThread }

constructor TFastCopyFileThread.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TFastCopyFileThread.Execute;
begin
  FastCopyFile(SourceFileName, DestinationFileName, CopyMode,
    FastCopyFileCallback);
end;

procedure TFastCopyFileThread.FastCopyFileCallback(const FileName: TFileName;
  const CurrentSize, TotalSize: LongWord; var CanContinue: Boolean);
var
  ProgressValue: Integer;

begin
  CanContinue := not Terminated;
  ProgressValue := Round((CurrentSize / TotalSize) * 100);
  if Assigned(OnProgress) then
    OnProgress(Self, FileName, ProgressValue, CanContinue);
end;


procedure TCopyForm.FormActivate(Sender: TObject);
begin
  with dmardata do
  begin
    qryCompany.close;
    qryCompany.sql.clear;
    qryCompany.sql.add('select * from Setup');
    qrycompany.open;

    edSource.text := qryCompany.fieldbyname('SourceDir').asstring;
    edTarget.Text := qryCompany.fieldbyname('TargetDir').asstring;
    DirectoryListBox1.Directory:= edSource.text;

    qryCompany.close;
  end;
end;

procedure TCopyForm.Button1Click(Sender: TObject);
begin
  qryreusable1.Close;
  qryreusable1.SQL.Clear;
  qryreusable1.SQL.ADD('ALTER TABLE "CUSTOMER.DB" ADD CurrencyCode CHAR(2) ');
  qryreusable1.EXECSQL;

  {
Query1.Close;
Query1.SQL.Clear;
Query1.SQL.ADD('ALTER TABLE "MYDB.DB" DROP Myfield');
Query1.EXECSQL;
   }

end;


end.
