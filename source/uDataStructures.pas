unit uDataStructures;

interface

uses
  uArray;

type
  TDataStructure = class(TObject)
    class function NewArray<T>: IArray<T>;
  end;

implementation

{ TDataStructure }

class function TDataStructure.NewArray<T>: IArray<T>;
begin
  Result := TImmutableArray<T>.Create;
end;

end.
