unit pDlgParam1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TDlgparam1 = class(TForm)
    rgDRFormType: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    rgDecimal: TRadioGroup;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dlgparam1: TDlgparam1;

implementation

{$R *.dfm}

end.
