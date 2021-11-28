unit uNode;

interface

type
  INode<T> = interface(IInvokable) ['{E7C7A10F-5332-4B3A-9CBF-BBF4F1817600}']
    function GetData: T;
    property Data: T read GetData;
  end;

implementation

end.
