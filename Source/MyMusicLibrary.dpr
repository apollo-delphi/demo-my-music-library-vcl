program MyMusicLibrary;

uses
  Vcl.Forms,
  Apollo_MVC_VCL in '..\Vendors\Apollo_MVC_VCL\Apollo_MVC_VCL.pas' {ViewVCLBase},
  Apollo_DB_SQLite in '..\Vendors\Apollo_DB_SQLite\Apollo_DB_SQLite.pas',
  Apollo_DB_Core in '..\Vendors\Apollo_DB_Core\Apollo_DB_Core.pas',
  Apollo_DB_Utils in '..\Vendors\Apollo_DB_Core\Apollo_DB_Utils.pas',
  Apollo_ORM in '..\Vendors\Apollo_ORM\Apollo_ORM.pas',
  Apollo_ORM_Exception in '..\Vendors\Apollo_ORM\Apollo_ORM_Exception.pas',
  Apollo_ORM_Service in '..\Vendors\Apollo_ORM\Apollo_ORM_Service.pas',
  Apollo_Types in '..\Vendors\Apollo_Types\Apollo_Types.pas',
  cController in 'cController.pas',
  vMain in 'vMain.pas' {ViewMain},
  eCommon in 'eCommon.pas',
  eArtist in 'eArtist.pas',
  fLibraryBrowser in 'fLibraryBrowser.pas' {frmLibraryBrowser: TFrame},
  Apollo_MVC_Core in '..\Vendors\Apollo_MVC_Core\Apollo_MVC_Core.pas',
  Apollo_Helpers in '..\Vendors\Apollo_Helpers\Apollo_Helpers.pas',
  Apollo_HelpersVCL in '..\Vendors\Apollo_Helpers_VCL\Apollo_HelpersVCL.pas',
  cArtist in 'cArtist.pas',
  Apollo_BindingVCL in '..\Vendors\Apollo_Binding_VCL\Apollo_BindingVCL.pas',
  Apollo_Binding_Core in '..\Vendors\Apollo_Binding_Core\Apollo_Binding_Core.pas',
  fArtist in 'fArtist.pas' {frmArtist: TFrame},
  eRelease in 'eRelease.pas';

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
