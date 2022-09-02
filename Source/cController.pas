unit cController;

interface

uses
  Apollo_DB_SQLite,
  Apollo_MVC_Core,
  vMain;

type
{$M+}
  TController = class(TControllerAbstract)
  private
    FDBEngine: TSQLiteEngine;
  protected
    procedure AfterCreate; override;
    procedure BeforeDestroy; override;
  public
    property DBEngine: TSQLiteEngine read FDBEngine;
  published
    procedure Migrate(aView: TViewMain);
    procedure Test(aView: TViewMain);
  end;
{$M-}

var
  gController: TController;

implementation

uses
  Apollo_DB_Core,
  Apollo_ORM_Service,
  System.IOUtils,
  System.SysUtils,
  Winapi.Windows;

{ TController }

procedure TController.AfterCreate;
var
  ConnectParams: TDBConnectParams;
  Service: TORMService;
begin
  inherited;

  ConnectParams.DataBase := TPath.Combine(TDirectory.GetCurrentDirectory, 'local.db');
  FDBEngine := TSQLiteEngine.Create(ConnectParams);
  FDBEngine.OpenConnection;

  Service := TORMService.Create;
  try
    if Service.NeedToMigrate(FDBEngine) then
      Service.Migrate(FDBEngine);
  finally
    Service.Free;
  end;
end;

procedure TController.BeforeDestroy;
begin
  inherited;

  FDBEngine.CloseConnection;
  FDBEngine.Free;
end;

procedure TController.Migrate(aView: TViewMain);
var
  Service: TORMService;
begin
  Service := TORMService.Create;
  try
    Service.Migrate(FDBEngine);
  finally
    Service.Free;
  end;
end;

procedure TController.Test(aView: TViewMain);
begin
end;

initialization
  gController := TController.Create;

finalization
  gController.Free;

end.
