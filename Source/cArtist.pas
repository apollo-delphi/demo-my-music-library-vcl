unit cArtist;

interface

uses
  Apollo_MVC_Core,
  fArtist,
  fLibraryBrowser,
  vMain;

type
{$M+}
  TControllerArtist = class(TControllerAbstract)
  published
    procedure DeleteArtist(aView: TfrmArtist);
    procedure GetArtistList(aView: TViewMain);
    procedure NewArtist(aView: TfrmLibraryBrowser);
    procedure RevertArtist(aView: TfrmArtist);
    procedure SaveArtist(aView: TfrmArtist);
  end;
{$M-}

implementation

uses
  Apollo_BindingVCL,
  Apollo_DB_Utils,
  cController,
  eArtist;

{ TControllerArtist }

procedure TControllerArtist.DeleteArtist(aView: TfrmArtist);
var
  Artist: TArtist;
  View: TfrmLibraryBrowser;
begin
  Artist := aView.GetArtist;

  if TryGetView<TfrmLibraryBrowser>({out}View) then
    View.RemoveNodeBySource(Artist);

  GetFromStorage<TArtistList>('ArtistList').Delete(Artist);
end;

procedure TControllerArtist.GetArtistList(aView: TViewMain);
var
  ArtistList: TArtistList;
begin
  ArtistList := TArtistList.CreateAndGetAll(TOrder.New.Add('NAME'));
  PutToStorage('ArtistList', ArtistList);

  aView.RenderArtistList(ArtistList);
end;

procedure TControllerArtist.NewArtist(aView: TfrmLibraryBrowser);
var
  Artist: TArtist;
begin
  Artist := TArtist.Create;
  Artist.Name := 'New Artist';
  Artist.StoreAll;
  GetFromStorage<TArtistList>('ArtistList').Add(Artist);

  aView.RenderArtist(Artist, True{aSelect});
end;

procedure TControllerArtist.RevertArtist(aView: TfrmArtist);
var
  Artist: TArtist;
begin
  Artist := aView.GetArtist;

  Artist.Revert;
  TBind.Notify(Artist);
end;

procedure TControllerArtist.SaveArtist(aView: TfrmArtist);
var
  Artist: TArtist;
begin
  Artist := aView.GetArtist;

  Artist.StoreAll;
  TBind.Notify(Artist);
end;

initialization
  gController.RegisterChildController(TControllerArtist);

end.
