unit pCompSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TCompSetup = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CompSetup: TCompSetup;

implementation

uses pARData;


{$R *.dfm}

end.
