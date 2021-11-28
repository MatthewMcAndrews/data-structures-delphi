unit uImmutableArray;

interface

uses
  System.SysUtils,
  uArray;

type
  IImmutableArray<T> = interface(IArray<T>) ['{AF590E8A-4084-4AA4-B326-BA3A4656B29D}']
  end;

type
  TImmutableArray<T> = class(TInterfacedObject, IArray<T>, IImmutableArray<T>)
  private
    Items: TArray<T>;
  public
    function Add(const Item: T): IArray<T>; overload;
    function Add(const Items: TArray<T>): IArray<T>; overload;
    function GetCount: Integer;
    constructor Create(const Items: TArray<T>); overload;
  end;

implementation

uses
  uDataStructures;

{ TImmutableArray<T> }

function TImmutableArray<T>.Add(const Items: TArray<T>): IArray<T>;
var
  NewItems: TArray<T>;
begin
  NewItems := Self.Items + Items;
  Result := TDataStructure.NewImmutableArray<T>(NewItems);
end;

constructor TImmutableArray<T>.Create(const Items: TArray<T>);
begin
  inherited Create;
  Self.Items := Items;
end;

function TImmutableArray<T>.Add(const Item: T): IArray<T>;
var
  NewItems: TArray<T>;
begin
  NewItems := Items + [Item];
  Result := TDataStructure.NewImmutableArray<T>(NewItems);
end;

function TImmutableArray<T>.GetCount: Integer;
begin
  Result := Length(Items);
end;

end.
