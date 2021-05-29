unit pDlgParam2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,db;

type
  Tdlgparam2 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edCode: TEdit;
    edName: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure edCodeClick(Sender: TObject);
    procedure edNameClick(Sender: TObject);
    procedure edCodeChange(Sender: TObject);
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgparam2: Tdlgparam2;

implementation

uses pardata;

{$R *.dfm}


procedure Tdlgparam2.edCodeClick(Sender: TObject);
begin
    with dmardata do
    begin
         qrylistrec.close;
         qrylistrec.SQL[1] := 'order by custcode';
         qrylistrec.Open;
    end;
    edName.text := ''; 
end;


procedure Tdlgparam2.edNameClick(Sender: TObject);
begin
    with dmardata do
    begin
         qrylistrec.close;
         qrylistrec.SQL[1] := 'order by custname';
         qrylistrec.Open;
    end;
    edcode.text := '';
end;

procedure Tdlgparam2.edCodeChange(Sender: TObject);
begin
    dmardata.qrylistrec.locate('custcode',edcode.text,[locaseinsensitive]);
end;

procedure Tdlgparam2.edNameChange(Sender: TObject);
begin
    dmardata.qrylistrec.locate('custname',edname.text,[locaseinsensitive]);
end;

end.
