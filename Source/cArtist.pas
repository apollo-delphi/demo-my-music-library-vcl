unit cArtist;

interface

uses
  Apollo_MVC_Core,
  vMain;

type
{$M+}
  TControllerArtist = class(TControllerAbstract)
  published
    procedure GetArtistList(aView: TViewMain);
  end;
{$M-}

implementation

uses
  Apollo_DB_Utils,
  cController,
  eArtist;

{ TControllerArtist }

procedure TControllerArtist.GetArtistList(aView: TViewMain);
var
  ArtistList: TArtistList;
begin
  ArtistList := TArtistList.CreateAndGetAll(TOrder.New.Add('NAME'));
  PutToStorage('ArtistList', ArtistList);

  aView.RenderArtistList(ArtistList);
end;

initialization
  gController.RegisterChildController(TControllerArtist);

end.
