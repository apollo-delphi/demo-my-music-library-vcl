unit cController;

interface

uses
  Apollo_MVC_Core;

type
{$M+}
  TController = class(TControllerAbstract)
  end;
{$M-}

var
  gController: TController;

implementation

initialization
  gController := TController.Create;

finalization
  gController.Free;

end.
