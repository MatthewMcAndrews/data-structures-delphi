unit uMutableArray;

interface

uses
  uArray;

type
  IMutableArray<T> = interface(IArray<T>) ['{9EAC07ED-6033-4507-A3E7-AD3FB0B5BAB7}']
    procedure SetItem(Index: Integer; Value: T);
    property Items[Index: Integer]: T read GetItem write SetItem; default;
  end;

type
  TMutableArray<T> = class(TInterfacedObject, IArray<T>, IMutableArray<T>)
  private
    Items: TArray<T>;
  public
    function Add(const Item: T): IArray<T>; overload;
    function Add(const Items: TArray<T>): IArray<T>; overload;
    function GetCount: Integer;
    function GetItem(Index: Integer): T;
    procedure SetItem(Index: Integer; Value: T);
    constructor Create(const Items: TArray<T>); overload;
  end;

implementation

uses
  uDataStructures;

{ TMutableArray<T> }

function TMutableArray<T>.Add(const Item: T): IArray<T>;
begin
  Items := Items + [Item];
  Result := Self;
end;

function TMutableArray<T>.Add(const Items: TArray<T>): IArray<T>;
begin
  Self.Items := Self.Items + Items;
  Result := Self;
end;

constructor TMutableArray<T>.Create(const Items: TArray<T>);
begin
  inherited Create;
  Self.Items := Items;
end;

function TMutableArray<T>.GetCount: Integer;
begin
  Result := Length(Items);
end;

function TMutableArray<T>.GetItem(Index: Integer): T;
begin
  Result := Items[Index];
end;

procedure TMutableArray<T>.SetItem(Index: Integer; Value: T);
begin
  Items[Index] := Value;
end;

end.
