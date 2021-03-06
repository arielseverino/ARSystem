unit pBrowUtilDRHd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ComCtrls, Grids, DBGrids;

type
  TBrowUtilDRHd = class(TForm)
    dbgOld: TDBGrid;
    Button1: TButton;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dsTranDR: TDataSource;
    qryTranDR: TQuery;
    tTranDR: TTable;
    Button2: TButton;
    tHd: TTable;
    dsHead: TDataSource;
    dsDet: TDataSource;
    tDet: TTable;
    Button3: TButton;
    lblCtr: TLabel;
    dsReusable1: TDataSource;
    qryReusable1: TQuery;
    cbDetail: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowUtilDRHd: TBrowUtilDRHd;

implementation

{$R *.dfm}

procedure TBrowUtilDRHd.Button1Click(Sender: TObject);
var nctr : integer;
begin
   nctr := 0;

   tTranDR.Close;
   tTranDR.EmptyTable;

   tTranDR.open;

   qryTranDR.close;
   qryTranDR.sql.clear;
   qryTranDR.sql.add('select * from SaleHd ' +
      ' where (DRDate >= ''' + datetostr(dtStart.date) + ''')' +
      ' and (DRDate <= ''' + datetostr(dtEnd.date) + ''')');
   qryTranDR.Open;

   qryTranDR.first;
   while not qryTranDR.eof do
   begin
       if Pos('A',qryTranDR.fieldbyname('DRNo').asstring) = 0 then
       begin
          tTranDR.append;
          tTranDR.fieldbyname('DRNo').asstring     := qryTranDR.fieldbyname('DRNo').asstring;
          tTranDR.fieldbyname('DRDate').asstring := qryTranDR.fieldbyname('DRDate').asstring;
          tTranDR.post;
          nctr := nctr + 1;
       end;
       qryTranDr.next;
   end;
   qryTranDR.close;

   qryTranDR.close;
   qryTranDR.sql.clear;
   qryTranDR.sql.add('select * from TranDR');
   qryTranDR.open;

   lblCtr.Caption := inttostr(nCtr);

end;

procedure TBrowUtilDRHd.Button2Click(Sender: TObject);
begin
         tHd.Open;
         tDet.Open;

         if tHd.Locate('DRNo',qryTranDR.fieldbyname('DRNo').asstring,[lopartialkey]) then
         begin
             tHd.Edit;
             tHd.FieldByName('ODRNo').asstring := tHd.fieldbyname('DRNo').asstring;
             tHd.fieldbyname('DRNo').asstring := tHd.fieldbyname('DRNo').asstring + 'A';
             tHd.FieldByName('OSaleInv').asstring := tHd.fieldbyname('SaleInv').asstring;
             tHd.fieldbyname('SaleInv').asstring := tHd.fieldbyname('SaLeInv').asstring + 'A';
             tHd.Post;

             tDet.Filtered := true;
             tDet.Filter := 'DRNo = ''' + qryTranDR.fieldbyname('drno').asstring + '''';
             tDet.Open;
             tDet.first;
             while not tDet.eof do
             begin
                  tDet.edit;
                  tDet.fieldbyname('OSaleInv').asstring := tDet.fieldbyname('saleinv').asstring;
                  tDet.fieldbyname('SaleInv').asstring  := tDet.fieldbyname('saleinv').asstring + 'A';
                  tDet.fieldbyname('ODRNo').asstring    := tDet.fieldbyname('DRNo').asstring;
                  tDet.fieldbyname('DRNo').asstring     := tDet.fieldbyname('DRno').asstring + 'A';
                  tDet.post;
                  tDet.next;
             end;
             tDet.close;
         end;
        showmessage('End of Processing...');

end;

procedure TBrowUtilDRHd.Button3Click(Sender: TObject);
begin
    tHd.Open;
    tDet.Open;

    qryTranDR.first;
    while not qryTranDR.eof do
    begin
       if tHd.Locate('DRNo',qryTranDR.fieldbyname('DRNo').asstring,[locaseinsensitive])
          and (qryTranDR.fieldbyname('DRNo').asstring<>'') then
       begin
             tHd.Edit;
             tHd.FieldByName('ODRNo').asstring := tHd.fieldbyname('DRNo').asstring;
             tHd.fieldbyname('DRNo').asstring := tHd.fieldbyname('DRNo').asstring + 'A';
             tHd.FieldByName('OSaleInv').asstring := tHd.fieldbyname('SaleInv').asstring;
             tHd.fieldbyname('SaleInv').asstring := tHd.fieldbyname('SaLeInv').asstring + 'A';
             tHd.Post;

             qryreusable1.close;
             qryreusable1.sql.clear;
             qryreusable1.sql.add('select * from SaleDet where (DRNo=''' + qryTranDR.fieldbyname('DRNo').asstring + ''')');
             qryreusable1.open;
             qryreusable1.First;
             while not qryreusable1.eof do
             begin
               if tDet.locate('DRNo;ProdCode',Vararrayof([qryReusable1.fieldbyname('drno').asstring,qryReusable1.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
               begin
                  tDet.edit;
                  tDet.fieldbyname('OSaleInv').asstring := tDet.fieldbyname('saleinv').asstring;
                  tDet.fieldbyname('SaleInv').asstring  := tDet.fieldbyname('saleinv').asstring + 'A';
                  tDet.fieldbyname('ODRNo').asstring    := tDet.fieldbyname('DRNo').asstring;
                  tDet.fieldbyname('DRNo').asstring     := tDet.fieldbyname('DRno').asstring + 'A';
                  tDet.post;
               end;
               qryreusable1.next;
             end;
       end
       else
       begin
          if (cbDetail.checked=true) and (qryTranDR.fieldbyname('drno').asstring <>'') then
          begin
             qryreusable1.close;
             qryreusable1.sql.clear;
             qryreusable1.sql.add('select * from SaleDet where (DRNo=''' + qryTranDR.fieldbyname('DRNo').asstring + ''')');
             qryreusable1.open;
             qryreusable1.First;
             while not qryreusable1.eof do
             begin
               if tDet.locate('DRNo;ProdCode',Vararrayof([qryReusable1.fieldbyname('drno').asstring,qryReusable1.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
               begin
                  tDet.edit;
                  tDet.fieldbyname('OSaleInv').asstring := tDet.fieldbyname('saleinv').asstring;
                  tDet.fieldbyname('SaleInv').asstring  := tDet.fieldbyname('saleinv').asstring + 'A';
                  tDet.fieldbyname('ODRNo').asstring    := tDet.fieldbyname('DRNo').asstring;
                  tDet.fieldbyname('DRNo').asstring     := tDet.fieldbyname('DRno').asstring + 'A';
                  tDet.post;
               end;
               qryreusable1.next;
             end;
          end;
       end;
       qryTranDR.next;
    end;
    showmessage('End of Processing...');

end;

procedure TBrowUtilDRHd.Button5Click(Sender: TObject);
var nctr : integer;
begin
   nctr := 0;

   tTranDR.Close;
   tTranDR.EmptyTable;

   tTranDR.open;

   qryTranDR.close;
   qryTranDR.sql.clear;
   qryTranDR.sql.add('select a.DRNo, b.DRDate from SaleDet a ' +
      '    left outer join SaleHd b on (b.drno=a.drno)  ' +
      ' where (b.drno is null) and (a.drno is not null)');
   qryTranDR.Open;

   qryTranDR.first;
   while not qryTranDR.eof do
   begin
       if Pos('A',qryTranDR.fieldbyname('DRNo').asstring) = 0 then
       begin
          tTranDR.append;
          tTranDR.fieldbyname('DRNo').asstring   := qryTranDR.fieldbyname('DRNo').asstring;
          tTranDR.fieldbyname('DRDate').asstring := qryTranDR.fieldbyname('DRDate').asstring;
          tTranDR.post;
          nctr := nctr + 1;
       end;
       qryTranDr.next;
   end;
   qryTranDR.close;

   qryTranDR.close;
   qryTranDR.sql.clear;
   qryTranDR.sql.add('select * from TranDR');
   qryTranDR.open;

   lblCtr.Caption := inttostr(nCtr);

end;


procedure TBrowUtilDRHd.Button4Click(Sender: TObject);
var nctr,nactr : integer;
begin
    tHd.Open;
    tDet.Open;
    nctr := 0;
    nactr := 0;

    qryTranDR.first;
    while not qryTranDR.eof do
    begin
        tHd.First;
        if tHd.Locate('DRNo',qryTranDR.fieldbyname('DRNo').asstring,[locaseinsensitive]) then
            showmessage(qryTranDR.fieldbyname('DRNo').asstring + ' has header...')
        else
        begin
            if (pos('A',qryTranDR.fieldbyname('DRNo').asstring) > 0) then
                 showmessage(qryTranDR.fieldbyname('DRNo').asstring + ' - DR already have A')
            else
            begin
                qryreusable1.close;
                qryreusable1.sql.clear;
                qryreusable1.sql.add('select * from SaleDet where (DRNo=''' + qryTranDR.fieldbyname('DRNo').asstring + ''')');
                qryreusable1.open;
                qryreusable1.First;
                while not qryreusable1.eof do
                begin
                   if tDet.locate('DRNo;ProdCode',Vararrayof([qryReusable1.fieldbyname('drno').asstring,qryReusable1.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
                   begin
                      if (Pos('A',qryreusable1.fieldbyname('saleinv').asstring)  > 0) then
                      begin
                         if tDet.fieldbyname('OSaleInv').asstring <> '' then
                              nactr := nactr + 1;
                      end;

                      {
                      if (Pos('A',qryreusable1.fieldbyname('saleinv').asstring)  > 0) then
                         showmessage(qryreusable1.fieldbyname('saleinv').asstring + ' - SI already have A ')
                         nactr := nactr + 1;
                      if tDet.fieldbyname('OSaleInv').asstring <> '' then
                              showmessage('DR - ' + tDet.fieldbyname('DRNo').asstring + ' / oSI ' + tDet.fieldbyname('OSaleInv').asstring + ' OSI - is not empty.')
                      else
                      begin  }

                      tDet.edit;
                      if (Pos('A',tDet.FieldByName('SaleInv').asstring)=0) and (tDet.fieldbyname('oSaleInv').asstring='') then
                      begin
                                    tDet.fieldbyname('OSaleInv').asstring := tDet.fieldbyname('saleinv').asstring;
                                    tDet.fieldbyname('SaleInv').asstring  := tDet.fieldbyname('saleinv').asstring + 'A';
                      end;
                      tDet.fieldbyname('ODRNo').asstring    := tDet.fieldbyname('DRNo').asstring;
                      tDet.fieldbyname('DRNo').asstring     := tDet.fieldbyname('DRno').asstring + 'A';
                      tDet.post;
                      nctr := nctr + 1;
                   end;
                   qryreusable1.next;
                end;
            end;
        end;
        qryTranDR.next;
    end;
    showmessage(inttostr(nctr) + ' records processed...');
end;

procedure TBrowUtilDRHd.Button6Click(Sender: TObject);
var nctr : integer;
begin
    {Put blank on  SI with already have A and no A in DR}
    nctr := 0;
    tDet.Open;
    tDet.first;
    while not tDet.eof do
    begin
        if (tDet.fieldbyname('SaleInv').asstring = 'A') or
            (POS('A',tDet.fieldbyname('DRNo').asstring)= 0) then 
        begin
            tDet.edit;
            tDet.FieldByName('oSaleInv').asstring := '';
            tDet.fieldbyname('ODRNo').asstring := '';
            tDet.Post;
            nctr := nctr + 1;
        end;
        tDet.next;
    end;
    tDet.close;
    showmessage(inttostr(nctr) + ' records processed...');

end;

procedure TBrowUtilDRHd.Button7Click(Sender: TObject);
var nctr,nactr : integer;
begin
    tHd.Open;
    tDet.Open;
    nctr := 0;
    nactr := 0;

    qryTranDR.first;
    while not qryTranDR.eof do
    begin
        tHd.First;
        if tHd.Locate('DRNo',qryTranDR.fieldbyname('DRNo').asstring,[lopartialkey]) then
            showmessage(tHd.fieldbyname('DRNo').asstring + '/' + qryTranDR.fieldbyname('DRNo').asstring + ' has header...')
        else
        begin
            if (pos('A',qryTranDR.fieldbyname('DRNo').asstring) > 0) then
                 showmessage(qryTranDR.fieldbyname('DRNo').asstring + ' - DR already have A')
            else
            begin
                qryreusable1.close;
                qryreusable1.sql.clear;
                qryreusable1.sql.add('select * from SaleDet where (DRNo=''' + qryTranDR.fieldbyname('DRNo').asstring + ''')');
                qryreusable1.open;
                qryreusable1.First;
                while not qryreusable1.eof do
                begin
                   if tDet.locate('DRNo;ProdCode',Vararrayof([qryReusable1.fieldbyname('drno').asstring,qryReusable1.fieldbyname('ProdCode').asstring]),[lopartialkey]) then
                   begin
                      if (Pos('A',qryreusable1.fieldbyname('saleinv').asstring)  > 0) then
                      begin
                         if tDet.fieldbyname('OSaleInv').asstring <> '' then
                              nactr := nactr + 1;
                      end;

                      {
                      if (Pos('A',qryreusable1.fieldbyname('saleinv').asstring)  > 0) then
                         showmessage(qryreusable1.fieldbyname('saleinv').asstring + ' - SI already have A ')
                         nactr := nactr + 1;
                      if tDet.fieldbyname('OSaleInv').asstring <> '' then
                              showmessage('DR - ' + tDet.fieldbyname('DRNo').asstring + ' / oSI ' + tDet.fieldbyname('OSaleInv').asstring + ' OSI - is not empty.')
                      else
                      begin  }

                      tDet.edit;
                      if (Pos('A',tDet.FieldByName('SaleInv').asstring)=0) and (tDet.fieldbyname('oSaleInv').asstring='') then
                      begin
                                    tDet.fieldbyname('OSaleInv').asstring := tDet.fieldbyname('saleinv').asstring;
                                    tDet.fieldbyname('SaleInv').asstring  := tDet.fieldbyname('saleinv').asstring + 'A';
                      end;
                      tDet.fieldbyname('ODRNo').asstring    := tDet.fieldbyname('DRNo').asstring;
                      tDet.fieldbyname('DRNo').asstring     := Uppercase(tDet.fieldbyname('DRno').asstring); 
                      tDet.post;
                      nctr := nctr + 1;
                   end;
                   qryreusable1.next;
                end;
            end;
        end;
        qryTranDR.next;
    end;
    showmessage(inttostr(nctr) + ' records processed...');
end;

end.
