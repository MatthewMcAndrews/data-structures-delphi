unit uSinglyLinkedNode;

interface

uses
  uNode;

type
  ISinglyLinkedNode<T> = interface(INode<T>) ['{9103EA3D-3CD4-4614-AA62-71FB472E2469}']
  end;

type
  TSinglyLinkedNode<T> = class(TInterfacedObject, INode<T>, ISinglyLinkedNode<T>)
  private
    Data: T;
  public
    function GetData: T;
    constructor Create(const Data: T);
  end;

implementation

{ TSinglyLinkedNode<T> }

constructor TSinglyLinkedNode<T>.Create(const Data: T);
begin
  inherited Create;
  Self.Data := Data;
end;

function TSinglyLinkedNode<T>.GetData: T;
begin
  Result := Data;
end;

end.
