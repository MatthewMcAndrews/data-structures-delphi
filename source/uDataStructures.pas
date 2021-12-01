unit uDataStructures;

interface

uses
  uArray,
  uSinglyLinkedList;

type
  TDataStructure = class(TObject)
    class function NewMutableArray<T>: IArray<T>; overload;
    class function NewMutableArray<T>(const Items: TArray<T>): IArray<T>; overload;
    class function NewImmutableArray<T>: IArray<T>; overload;
    class function NewImmutableArray<T>(const Items: TArray<T>): IArray<T>; overload;
    class function NewSinglyLinkedList<T>: ISinglyLinkedList<T>;
  end;

implementation

uses
  uImmutableArray,
  uMutableArray;

{ TDataStructure }

class function TDataStructure.NewMutableArray<T>(
  const Items: TArray<T>): IArray<T>;
begin
  Result := TMutableArray<T>.Create(Items);
end;

class function TDataStructure.NewMutableArray<T>: IArray<T>;
begin
  Result := TMutableArray<T>.Create;
end;

class function TDataStructure.NewImmutableArray<T>: IArray<T>;
begin
  Result := TImmutableArray<T>.Create;
end;

class function TDataStructure.NewImmutableArray<T>(
  const Items: TArray<T>): IArray<T>;
begin
  Result := TImmutableArray<T>.Create(Items);
end;

class function TDataStructure.NewSinglyLinkedList<T>: ISinglyLinkedList<T>;
begin
  Result := TSinglyLinkedList<T>.Create;
end;

end.
