unit fArtist;

interface

uses
  Apollo_MVC_Core,
  eArtist,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TfrmArtist = class(TFrame)
    leArtistName: TLabeledEdit;
  private
    FArtist: TArtist;
    FViewBase: IViewBase;
  public
    function GetArtist: TArtist;
    procedure AfterConstruction; override;
    procedure RenderArtist(aArtist: TArtist);
    procedure DeleteEvent;
    procedure RevertEvent;
    procedure SaveEvent;
  end;

implementation

{$R *.dfm}

uses
  Apollo_BindingVCL,
  Apollo_MVC_VCL;

{ TfrmArtist }

procedure TfrmArtist.AfterConstruction;
begin
  inherited;

  RegisterFrame(FViewBase);
end;

procedure TfrmArtist.DeleteEvent;
begin
  FireEvent(FViewBase, 'DeleteArtist');
end;

function TfrmArtist.GetArtist: TArtist;
begin
  Result := FArtist;
end;

procedure TfrmArtist.RenderArtist(aArtist: TArtist);
begin
  TBind.RemoveBind(Self);

  FArtist := aArtist;
  TBind.Bind(FArtist, Self, 'Artist');
end;

procedure TfrmArtist.RevertEvent;
begin
  FireEvent(FViewBase, 'RevertArtist');
end;

procedure TfrmArtist.SaveEvent;
begin
  FireEvent(FViewBase, 'SaveArtist');
end;

end.
