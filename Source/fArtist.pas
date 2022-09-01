unit fArtist;

interface

uses
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
  public
    procedure RenderArtist(aArtist: TArtist);
  end;

implementation

{$R *.dfm}

uses
  Apollo_BindingVCL;

{ TfrmArtist }

procedure TfrmArtist.RenderArtist(aArtist: TArtist);
begin
  TBind.RemoveBind(Self);

  TBind.Bind(aArtist, Self, 'Artist');
end;

end.
