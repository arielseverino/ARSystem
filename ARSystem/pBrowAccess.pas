unit pBrowAccess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, db, jpeg, ExtCtrls;

type
  TBrowAccess = class(TForm)
    RegListHD: TPanel;
    Image9: TImage;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    UserAccessGrid: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    rgSelect: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Include(Sender: TObject);
    procedure Exclude(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowAccess: TBrowAccess;

implementation

uses pTimeData;

{$R *.dfm}

procedure TBrowAccess.FormActivate(Sender: TObject);
begin
    with dmTimeData do
    begin
         qrySysMenu.close;
         qrySysmenu.sql.clear;
         qrySysmenu.sql.add('Update SysMenu');
         qrySysmenu.sql.add('Set Access = ''' + 'N' + '''');
         qrySysmenu.execsql;
         qrySysmenu.SQL.clear;
         qrySysmenu.sql.add('select * from Sysmenu order by rank');
         qrysysmenu.open;

         qryUserAccess.close;
         qryUserAccess.SQL.clear;
         qryUserAccess.sql.add('select * from UserAccess Where (UserName = ''' + qryUser.fieldbyname('UserName').asstring + ''')');
         qryUserAccess.Open;
         qryUserAccess.first;
         while not qryUserAccess.eof do
         begin
              if qrySysmenu.locate('menucode',qryUserAccess.fieldbyname('menucode').asstring,[lopartialkey]) then
              begin
                   qrySysmenu.edit;
                   qrySysMenu.fieldbyname('Access').asstring := 'Y';
                   qrySysmenu.post;
              end;
              qryUserAccess.Next;
         end;
         qrySysmenu.first;
    end;
end;

procedure TBrowAccess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    with  dmTimeData do
    begin
         qryUserAccess.close;
         qrySysmenu.close;
    end;
end;

procedure TBrowAccess.Include(Sender: TObject);
begin
    with dmTimeData do
    begin
         if rgSElect.itemindex = 0 then
         begin
              if (qrySysmenu.FieldByName('Access').asstring = 'N') then
              begin
                   if not (qryUserAccess.locate('Menucode',qrySysmenu.fieldbyname('Menucode').asstring,[lopartialkey])) then
                   begin
                        qryUserAccess.append;
                        qryUserAccess.fieldbyname('username').asstring := qryUser.fieldbyname('username').asstring;
                        qryUserAccess.fieldbyname('menucode').asstring := qrySysmenu.fieldbyname('menucode').asstring;
                        qryUserAccess.post;
                   end;
                   qrySysmenu.edit;
                   qrySysmenu.fieldbyname('Access').asstring := 'Y';
                   qrySysmenu.post;
              end
              else
                   showmessage('Already has access to the menu...');
         end
         else if rgSelect.itemindex = 1 then
         begin
              qrysysmenu.first;
              while not qrySysmenu.Eof do
              begin
                   if qrySysmenu.fieldbyname('type').asinteger = 2 then
                   begin
                        if not (qryUserAccess.locate('Menucode',qrySysmenu.fieldbyname('Menucode').asstring,[lopartialkey])) then
                        begin
                             qryUserAccess.append;
                             qryUserAccess.fieldbyname('username').asstring := qryUser.fieldbyname('username').asstring;
                             qryUserAccess.fieldbyname('menucode').asstring := qrySysmenu.fieldbyname('menucode').asstring;
                             qryUserAccess.post;
                        end;
                        qrySysmenu.edit;
                        qrySysmenu.fieldbyname('Access').asstring := 'Y';
                        qrySysmenu.post;
                   end;
                   qrySysmenu.Next;
              end;
         end
         else if rgSelect.itemindex = 2 then
         begin
              qrysysmenu.first;
              while not qrySysmenu.eof do
              begin
                        if not (qryUserAccess.locate('Menucode',qrySysmenu.fieldbyname('Menucode').asstring,[lopartialkey])) then
                        begin
                             qryUserAccess.append;
                             qryUserAccess.fieldbyname('username').asstring := qryUser.fieldbyname('username').asstring;
                             qryUserAccess.fieldbyname('menucode').asstring := qrySysmenu.fieldbyname('menucode').asstring;
                             qryUserAccess.post;
                        end;
                        qrySysmenu.edit;
                        qrySysmenu.fieldbyname('Access').asstring := 'Y';
                        qrySysmenu.post;
                        qrySysmenu.Next;
              end;
         end;
    end;
    UserAccessGrid.SetFocus;
end;

procedure TBrowAccess.Exclude(Sender: TObject);
begin
    with dmTimeData do
    begin
         if (qrySysmenu.FieldByName('Access').asstring = 'Y') then
         begin
              if (qryUserAccess.locate('Menucode',qrySysmenu.fieldbyname('Menucode').asstring,[lopartialkey])) then
                   qryUserAccess.delete;
              qrySysmenu.edit;
              qrySysmenu.fieldbyname('Access').asstring := 'N';
              qrySysmenu.post;
         end;
    end;
    UserAccessGrid.SetFocus;
end;

end.
