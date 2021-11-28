unit uMutableArrayTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TMutableArrayTest = class
  public
    [Test]
    procedure new_array_is_empty;
    [Test]
    procedure add_item_to_array;
    [Test]
    procedure add_items_to_array;
    [Test]
    procedure create_from_array;
  end;

implementation

uses
  uArray,
  uDataStructures;

{ TMutableArrayTest }

procedure TMutableArrayTest.new_array_is_empty;
begin
  Assert.AreEqual(0, TDataStructure.NewMutableArray<Integer>.Count);
end;

procedure TMutableArrayTest.create_from_array;
begin
  Assert.AreEqual(2, TDataStructure.NewMutableArray<Integer>([0, 1]).Count);
end;

procedure TMutableArrayTest.add_item_to_array;
var
  Value: IArray<Integer>;
begin
  Value := TDataStructure.NewMutableArray<Integer>;
  Assert.AreEqual(1, Value.Add(0).Count);
  Assert.AreEqual(1, Value.Count);
end;

procedure TMutableArrayTest.add_items_to_array;
var
  Value: IArray<Integer>;
begin
  Value := TDataStructure.NewMutableArray<Integer>;
  Value.Add([0, 1]);
  Assert.AreEqual(2, Value.Count);
end;

initialization
  TDUnitX.RegisterTestFixture(TMutableArrayTest);

end.