unit eRelease;

interface

uses
  Apollo_ORM,
  eCommon;

type
  [ORMUniqueID('399b16724cc633512ab16ff1595171f9')]
  TRelease = class(TEntity)
  private
    FArtistID: Integer;
  public
    class function GetStructure: TStructure; override;
  published
    [ORMUniqueID('44fd857c1eda6f3102542e679d59f202')][NotNull]
    property ArtistID: Integer read FArtistID write FArtistID;
  end;

implementation

uses
  eArtist;

{ TRelease }

class function TRelease.GetStructure: TStructure;
begin
  Result.TableName := 'RELEASE';

  Result.FKeys.Add('ArtistID', TArtist, 'ID');
end;

initialization
  TRelease.RegisterForService;

end.
