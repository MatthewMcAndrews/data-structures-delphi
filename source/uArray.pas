unit uArray;

interface

type
  IArray<T> = interface(IInvokable) ['{30A58FAA-F97C-41CF-BD0B-C718B80A4FBA}']
    function Add(const Item: T): IArray<T>; overload;
    function Add(const Items: TArray<T>): IArray<T>; overload;
    function GetCount: Integer;
    property Count: Integer read GetCount;
  end;

implementation

end.
