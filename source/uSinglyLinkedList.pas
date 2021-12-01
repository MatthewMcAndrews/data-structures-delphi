unit uSinglyLinkedList;

interface

uses
  uSinglyLinkedNode;

type
  ISinglyLinkedList<T> = interface(IInvokable) ['{3AD41316-D33B-433D-9FC3-7E19123EAD87}']
    function GetCount: Integer;
    function GetItem(Index: Integer): T;
    function Prepend(const Item: T): ISinglyLinkedList<T>;
    property Count: Integer read GetCount;
    property Item[Index: Integer]: T read GetItem; default;
  end;

type
  TSinglyLinkedList<T> = class(TInterfacedObject, ISinglyLinkedList<T>)
  private
    Head: ISinglyLinkedNode<T>;
  public
    function GetCount: Integer;
    function GetItem(Index: Integer): T;
    function Prepend(const Item: T): ISinglyLinkedList<T>;
  end;

implementation

uses
  System.SysUtils;

{ TSinglyLinkedList<T> }

function TSinglyLinkedList<T>.GetCount: Integer;
var
  Current: ISinglyLinkedNode<T>;
begin
  Result := 0;
  Current := Head;
  if not Assigned(Current) then begin
    Exit;
  end;
  Inc(Result);
  while Assigned(Current.Next) do begin
    Inc(Result);
    Current := Current.Next;
  end;
end;

function TSinglyLinkedList<T>.GetItem(Index: Integer): T;
var
  Current: ISinglyLinkedNode<T>;
begin
  if (Index < 0) or (GetCount < Index) then begin
    raise Exception.Create('Index Out Of Bounds.');
  end;
  if not Assigned(Head) then begin
    raise Exception.Create('Index Out Of Bounds.');
  end;
  Current := Head;
  while Index > 1 do begin
    Dec(Index);
    Current := Current.Next;
  end;
  Result := Current.Data;
end;

function TSinglyLinkedList<T>.Prepend(const Item: T): ISinglyLinkedList<T>;
var
  NewNode: ISinglyLinkedNode<T>;
begin
  NewNode := TSinglyLinkedNode<T>.Create(Item);
  NewNode.Next := Head;
  Head := NewNode;
  Result := Self;
end;

end.
