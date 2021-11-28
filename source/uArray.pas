unit uArray;

interface

uses
  System.SysUtils;

type
  IArray<T> = interface(IInvokable) ['{30A58FAA-F97C-41CF-BD0B-C718B80A4FBA}']
    function Add(const Item: T): IArray<T>; overload;
    function Add(const Items: TArray<T>): IArray<T>; overload;
    function GetCount: Integer;
    property Count: Integer read GetCount;
  end;

type
  TImmutableArray<T> = class(TInterfacedObject, IArray<T>)
  private
    Items: TArray<T>;
  public
    function Add(const Item: T): IArray<T>; overload;
    function Add(const Items: TArray<T>): IArray<T>; overload;
    function GetCount: Integer;
    constructor Create(const Items: TArray<T>); overload;
  end;

implementation

{ TImmutableArray<T> }

function TImmutableArray<T>.Add(const Items: TArray<T>): IArray<T>;
var
  NewItems: TArray<T>;
begin
  NewItems := Self.Items + Items;
  Result := TImmutableArray<T>.Create(NewItems);
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
  Result := TImmutableArray<T>.Create(NewItems);
end;

function TImmutableArray<T>.GetCount: Integer;
begin
  Result := Length(Items);
end;

end.
