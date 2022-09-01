program YourProjectName;

uses
  Vcl.Forms,
  cController in 'cController.pas',
  vMain in 'vMain.pas' {ViewMain},
  Apollo_MVC_VCL in '..\Vendors\Apollo_MVC_VCL\Apollo_MVC_VCL.pas' {ViewVCLBase},
  Apollo_MVC_Core in '..\Vendors\Apollo_MVC_Core\Apollo_MVC_Core.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF DEBUG}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
