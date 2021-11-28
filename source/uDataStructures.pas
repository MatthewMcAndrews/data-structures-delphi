unit uDataStructures;

interface

uses
  uArray,
  uList,
  uNode;

type
  TDataStructure = class(TObject)
    class function NewMutableArray<T>: IArray<T>; overload;
    class function NewMutableArray<T>(const Items: TArray<T>): IArray<T>; overload;
    class function NewImmutableArray<T>: IArray<T>; overload;
    class function NewImmutableArray<T>(const Items: TArray<T>): IArray<T>; overload;
    class function NewSinglyLinkedList<T>: IList<T>;
    class function NewSinglyLinkedNode<T>(const Data: T): INode<T>;
  end;

implementation

uses
  uImmutableArray,
  uMutableArray,
  uSinglyLinkedList,
  uSinglyLinkedNode;

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

class function TDataStructure.NewSinglyLinkedList<T>: IList<T>;
begin
  Result := TSinglyLinkedList<T>.Create;
end;

class function TDataStructure.NewSinglyLinkedNode<T>(const Data: T): INode<T>;
begin
  Result := TSinglyLinkedNode<T>.Create(Data);
end;

end.
