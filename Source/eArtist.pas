unit eArtist;

interface

uses
  Apollo_ORM,
  eCommon;

type
  [ORMUniqueID('e08e66341fad4996e6babe83c94f51a2')]
  TArtist = class(TEntity)
  private
    FName: string;
  public
    class function GetStructure: TStructure; override;
  published
    [ORMUniqueID('5786aa765e4456f81950f7a0b37f1f70')][Text][NotNull]
    property Name: string read FName write FName;
  end;

  TArtistList = TEntityList<TArtist>;

implementation

{ TArtist }

class function TArtist.GetStructure: TStructure;
begin
  Result.TableName := 'ARTIST';
end;


initialization
  TArtist.RegisterForService;

end.
