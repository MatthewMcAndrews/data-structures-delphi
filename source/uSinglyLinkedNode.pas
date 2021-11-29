unit uSinglyLinkedNode;

interface

uses
  uNode;

type
  ISinglyLinkedNode<T> = interface(INode<T>) ['{9103EA3D-3CD4-4614-AA62-71FB472E2469}']
    function GetNext: ISinglyLinkedNode<T>;
    procedure SetNext(const Value: ISinglyLinkedNode<T>);
    property Next: ISinglyLinkedNode<T> read GetNext write SetNext;
  end;

type
  TSinglyLinkedNode<T> = class(TInterfacedObject, INode<T>, ISinglyLinkedNode<T>)
  private
    Data: T;
    Next: ISinglyLinkedNode<T>;
  public
    function GetData: T;
    function GetNext: ISinglyLinkedNode<T>;
    procedure SetNext(const Value: ISinglyLinkedNode<T>);
    constructor Create(const Data: T);
  end;

implementation

{ TSinglyLinkedNode<T> }

constructor TSinglyLinkedNode<T>.Create(const Data: T);
begin
  inherited Create;
  Self.Data := Data;
  Self.Next := nil;
end;

function TSinglyLinkedNode<T>.GetData: T;
begin
  Result := Data;
end;

function TSinglyLinkedNode<T>.GetNext: ISinglyLinkedNode<T>;
begin
  Result := Next;
end;

procedure TSinglyLinkedNode<T>.SetNext(const Value: ISinglyLinkedNode<T>);
begin
  Self.Next := Value;
end;

end.
