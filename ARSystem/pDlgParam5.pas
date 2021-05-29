unit pDlgParam5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TdlgParam5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dStart: TDateTimePicker;
    dEnd: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgParam5: TdlgParam5;

implementation

{$R *.dfm}


end.
