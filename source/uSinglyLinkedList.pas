unit uSinglyLinkedList;

interface

uses
  uList;

type
  ISinglyLinkedList<T> = interface(IList<T>) ['{3AD41316-D33B-433D-9FC3-7E19123EAD87}']
  end;

type
  TSinglyLinkedList<T> = class(TInterfacedObject, IList<T>, ISinglyLinkedList<T>)
    function GetCount: Integer;
  end;

implementation

{ TSinglyLinkedList<T> }

function TSinglyLinkedList<T>.GetCount: Integer;
begin
  Result := 0;
end;

end.
