unit eCommon;

interface

uses
  Apollo_DB_Utils,
  Apollo_ORM;

type
  [SkipStructure]
  TEntity = class(TEntityFeatID)
  public
    constructor Create(const aID: Integer = 0);
  end;

  TEntityList<T: TEntity> = class(TEntityListBase<T>)
  public
    constructor CreateAndGetAll(const aOrderBy: POrder = nil);
  end;

implementation

uses
  cController;

{ TEntity }

constructor TEntity.Create(const aID: Integer);
begin
  inherited Create(gController.DBEngine, aID);
end;

{ TEntityList<T> }

constructor TEntityList<T>.CreateAndGetAll(const aOrderBy: POrder);
begin
  inherited CreateAndGetAll(gController.DBEngine, aOrderBy);
end;

end.
