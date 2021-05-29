unit pFormSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Mask, DBCtrls;

type
  TFormSetup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    rgFormOpt: TRadioGroup;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Button3: TButton;
    Button4: TButton;
    gbForm: TGroupBox;
    Button5: TButton;
    Label10: TLabel;
    Button6: TButton;
    Button7: TButton;
    edFormCode: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    procedure rgFormOptClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSetup: TFormSetup;

implementation

{$R *.dfm}

uses pArData;

procedure TFormSetup.rgFormOptClick(Sender: TObject);
begin
 with dmardata do
 begin
     qryFormSettings.Close;
     qryFormSettings.SQL.clear;
     qryFormSettings.SQL.add('select * from tblRepSetup');
     if rgFormOpt.ItemIndex =0 then
       qryFormSettings.SQL.add(' where (Repcode  = ''' + '00001' +  ''') ')
     else if rgFormOpt.itemindex=1 then
       qryFormSettings.sql.add(' where (Repcode  = ''' + '00002' +  ''') ');
     qryFormSettings.sql.add(' and (FormCode = ''' + qryListForm.fieldbyname('FormCode').asstring + ''')');
     qryFormSettings.Open;
     qryFormSettings.edit;
 end;
end;

procedure TFormSetup.Button4Click(Sender: TObject);
begin
  edFormcode.Clear;
  gbForm.Visible:= true;
end;

procedure TFormSetup.Button3Click(Sender: TObject);
begin
  with dmardata do
  begin
      qryCustomer.edit;
      qryCustomer.fieldbyname('formcode').asstring;
      qryCustomer.post;
  end;

end;

procedure TFormSetup.Button7Click(Sender: TObject);
begin
  dmardata.qrycustomer.cancel;
  gbForm.visible:=false;
end;

procedure TFormSetup.Button6Click(Sender: TObject);
begin
  with dmARData do
  begin
     qryreusable1.close;
     qryreusable1.sql.clear;
     qryreusable1.sql.add('insert into tblRepSetup(Formcode,repcode,fieldcode,fieldname,reprow,repcol,fontsize) ' +
     ' Select ''' + edFormCode.text + ''',repcode,fieldcode,fieldname,reprow,repcol,fontsize ' +
     ' From tblRepSetup ' +
     ' where (FormCode = ''' + 'Standard' + ''')');
     qryreusable1.execsql;
     gbForm.visible:=false;
     qryListform.Refresh; 
  end;
end;

procedure TFormSetup.Button5Click(Sender: TObject);
begin
  with dmardata do
  begin
     if (qryListForm.fieldbyname('FormCode').asstring = 'Standard') then
        showmessage('Cannot delete system default form standard.')
     else if messageDlg('Are you sure you want to delete form ' + qrylistform.fieldbyname('formcode').asstring +  ' ?',mtconfirmation,[mbYes,mbNo],0) = mrYes then
     begin
        qryreusable1.close;
        qryreusable1.sql.clear;
        qryreusable1.sql.add('delete from tblRepsetup where (Formcode = ''' + qryListform.fieldbyname('formcode').asstring + ''')');
        qryreusable1.execsql;
        
        qrylistform.Refresh;
     end;

  end;
end;

procedure TFormSetup.DBLookupComboBox1Click(Sender: TObject);
begin
  with dmardata do
  begin
     qryFormSettings.close;
     qryFormSettings.sql.clear;
     if rgFormOpt.ItemIndex = 0 then
        qryFormSettings.SQL.add('select * from tblRepSetup where (RepCode = ''' + '00001' + ''') and (FormCode=''' + qryCustomer.fieldbyname('FormCode').asstring + ''')')
     else
        qryFormSettings.SQL.add('select * from tblRepSetup where (RepCode = ''' + '00002' + ''') and (FormCode=''' + qryCustomer.fieldbyname('FormCode').asstring + ''')');
     qryFormSettings.open;
     qryFormSettings.edit;
  end;
end;

end.
