unit uArray;

interface

type
  IArray = interface(IInvokable) ['{30A58FAA-F97C-41CF-BD0B-C718B80A4FBA}']
    function GetCount: Integer;
    property Count: Integer read GetCount;
  end;

function NewArray: IArray;

implementation

type
  TArray = class(TInterfacedObject, IArray)
    function GetCount: Integer;
  end;

function NewArray: IArray;
begin
  Result := TArray.Create;
end;

{ TArray }

function TArray.GetCount: Integer;
begin
  Result := 0;
end;

end.
