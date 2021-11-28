unit uDataStructures;

interface

uses
  uArray;

type
  TDataStructure = class(TObject)
    class function NewArray<T>: IArray<T>; overload;
    class function NewArray<T>(const Items: TArray<T>): IArray<T>; overload;
  end;

implementation

{ TDataStructure }

class function TDataStructure.NewArray<T>: IArray<T>;
begin
  Result := TImmutableArray<T>.Create;
end;

class function TDataStructure.NewArray<T>(const Items: TArray<T>): IArray<T>;
begin
  Result := TImmutableArray<T>.Create(Items);
end;

end.
