unit vMain;

interface

uses
  Apollo_MVC_Core,
  Apollo_MVC_VCL,
  eArtist,
  fLibraryBrowser,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TViewMain = class(TViewVCLMain)
    pnlLibraryBrowser: TPanel;
    btnTest: TButton;
    procedure btnTestClick(Sender: TObject);
  private
    FLibraryBrowser: TfrmLibraryBrowser;
  protected
    procedure InitControls; override;
    procedure LinkToController(out aController: TControllerAbstract); override;
  public
    procedure RenderArtistList(aArtistList: TArtistList);
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses
  Apollo_HelpersVCL,
  cController;

{ TViewMain }

procedure TViewMain.btnTestClick(Sender: TObject);
begin
  FireEvent('Test');
end;

procedure TViewMain.InitControls;
begin
  inherited;

  FLibraryBrowser := TfrmLibraryBrowser.Create(Self);
  ShowFrame(pnlLibraryBrowser, FLibraryBrowser);

  FireEvent('GetArtistList');
end;

procedure TViewMain.LinkToController(out aController: TControllerAbstract);
begin
  aController := gController;
end;

procedure TViewMain.RenderArtistList(aArtistList: TArtistList);
begin
  FLibraryBrowser.RenderArtistList(aArtistList);
end;

end.
