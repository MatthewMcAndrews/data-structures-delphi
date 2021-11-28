unit uList;

interface

type
  IList<T> = interface(IInvokable) ['{CF211EBE-30C4-4C11-B817-37176C2B9019}']
    function GetCount: Integer;
    property Count: Integer read GetCount;
  end;

implementation

end.
