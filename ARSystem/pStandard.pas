unit pStandard;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, db, DBTables, Grids, DBGrids;



Function SysLog(aSysLog:tStringlist;cLogFile:string;cRemark: string):Boolean;

implementation

Function SysLog(aSysLog:tStringlist;cLogFile:string;cRemark: string):Boolean;
var cPath : string;
begin
   cPath := ExtractFilePath(Application.ExeName);
   aSysLog.Add(FormatdateTime('YYYYMMDDhhnn',Date+time)+','+cRemark);
   aSysLog.SaveToFile(cPath+'\Log\'+cLogFile);
   result:=true;

end;


end.
