unit vMain;

interface

uses
  Apollo_MVC_Core,
  Apollo_MVC_VCL,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  Winapi.Messages,
  Winapi.Windows;

type
  TViewMain = class(TViewVCLMain)
  private
  protected
    procedure LinkToController(out aController: TControllerAbstract); override;
  public
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses
  cController;

{ TViewMain }

procedure TViewMain.LinkToController(out aController: TControllerAbstract);
begin
  aController := gController;
end;

end.
