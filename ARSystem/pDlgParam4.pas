unit pDlgParam4;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  Tdlgparam4 = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    edPONo: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgparam4: Tdlgparam4;

implementation

uses pARData, pListRec;

{$R *.dfm}

procedure Tdlgparam4.Button1Click(Sender: TObject);
begin
    with dmardata do
    begin
         qryPOHD.close;
         qryPOHd.sql.clear;
         qryPOHD.sql.add('select * from Purchhd');
         qryPOHD.open;
         ListRec := tListRec.create(application);
         ListRec.Panel1.Caption := 'LIST OF PURCHASE NO.';
         ListRec.dbgrid1.DataSource := dmardata.dsPOHd;
         ListRec.dbGrid1.Columns[0].Title.caption := '';
         ListRec.DBGrid1.Columns[0].Fieldname := 'PurchNo';
         ListRec.showmodal;
         if ListRec.modalresult = mrok then
         begin
              edPONO.Text := qryPOHD.fieldbyname('PurchNo').asstring;
         end;
         ListRec.free;
         qryPOHd.close;
    end;
end;

end.
