program ARForm;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Report};

{$R *.res}

begin

  Application.Initialize;
  Report := tReport.create(application);
  Report.GenReports();
  Application.Run;

end.
