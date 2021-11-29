unit uSinglyLinkedList;

interface

uses
  uList,
  uSinglyLinkedNode;

type
  ISinglyLinkedList<T> = interface(IList<T>) ['{3AD41316-D33B-433D-9FC3-7E19123EAD87}']
  end;

type
  TSinglyLinkedList<T> = class(TInterfacedObject, IList<T>, ISinglyLinkedList<T>)
  private
    Head: ISinglyLinkedNode<T>;
  public
    function GetCount: Integer;
    function Prepend(const Item: T): IList<T>;
  end;

implementation

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

function TSinglyLinkedList<T>.Prepend(const Item: T): IList<T>;
var
  NewNode: ISinglyLinkedNode<T>;
begin
  NewNode := TSinglyLinkedNode<T>.Create(Item);
  NewNode.Next := Head;
  Head := NewNode;
  Result := Self;
end;

end.
