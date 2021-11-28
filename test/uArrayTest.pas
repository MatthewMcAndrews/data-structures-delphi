unit uArrayTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TArrayTest = class
  public
    [Test]
    procedure new_array_is_empty;
    [Test]
    procedure add_item_to_array;
    [Test]
    procedure add_items_to_array;
    [Test]
    procedure add_item_preserves_original_array;
    [Test]
    procedure create_from_array;
  end;

implementation

uses
  uArray,
  uDataStructures,
  System.Generics.Collections;

{ TArrayTest }

procedure TArrayTest.add_items_to_array;
var
  EmptyArray: IArray<Integer>;
  TwoItemArray: IArray<Integer>;
begin
  EmptyArray := TDataStructure.NewArray<Integer>;
  TwoItemArray := EmptyArray.Add([1, 2]);
  Assert.AreEqual(2, TwoItemArray.Count);
end;

procedure TArrayTest.add_item_preserves_original_array;
var
  EmptyArray: IArray<string>;
begin
  EmptyArray := TDataStructure.NewArray<string>;
  EmptyArray.Add('item');
  Assert.AreEqual(0, EmptyArray.Count);
end;

procedure TArrayTest.add_item_to_array;
var
  EmptyArray: IArray<string>;
  OneItemArray: IArray<string>;
begin
  EmptyArray := TDataStructure.NewArray<string>;
  OneItemArray := EmptyArray.Add('item');
  Assert.AreEqual(1, OneItemArray.Count);
end;

procedure TArrayTest.create_from_array;
var
  ThreeItemArray: IArray<Integer>;
begin
  ThreeItemArray := TDataStructure.NewArray<Integer>([1, 2, 3]);
  Assert.AreEqual(3, ThreeItemArray.Count);
end;

procedure TArrayTest.new_array_is_empty;
begin
  Assert.AreEqual(0, TDataStructure.NewArray<string>.Count);
end;

initialization
  TDUnitX.RegisterTestFixture(TArrayTest);

end.
