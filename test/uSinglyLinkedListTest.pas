unit uSinglyLinkedListTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TSinglyLinkedListTest = class
  public
    [Test]
    procedure new_list_is_empty;
    [Test]
    procedure append_item_increases_count;
    [Test]
    procedure prepend_item_increases_count;
    [Test]
    procedure prepended_item_accessible_by_index;
    [Test]
    procedure appended_item_accessible_by_index;
  end;

implementation

uses
  uDataStructures,
  uSinglyLinkedList;

{ TSinglyLinkedListTest }

procedure TSinglyLinkedListTest.prepended_item_accessible_by_index;
var
  List: ISinglyLinkedList<Integer>;
begin
  List := TDataStructure.NewSinglyLinkedList<Integer>;
  List := List.Prepend(1).Prepend(0);
  Assert.AreEqual(0, List[0]);
end;

procedure TSinglyLinkedListTest.appended_item_accessible_by_index;
var
  List: ISinglyLinkedList<Integer>;
begin
  List := TDataStructure.NewSinglyLinkedList<Integer>;
  List := List.Append(0).Append(1);
  Assert.AreEqual(0, List[0]);
end;

procedure TSinglyLinkedListTest.append_item_increases_count;
var
  List: ISinglyLinkedList<Integer>;
begin
  List := TDataStructure.NewSinglyLinkedList<Integer>;
  List := List.Append(0).Append(1);
  Assert.AreEqual(2, List.Count);
end;

procedure TSinglyLinkedListTest.new_list_is_empty;
begin
  Assert.AreEqual(0, TDataStructure.NewSinglyLinkedList<string>.Count);
end;

procedure TSinglyLinkedListTest.prepend_item_increases_count;
begin
  Assert.AreEqual(1, TDataStructure.NewSinglyLinkedList<string>.Prepend('').Count);
end;

initialization
  TDUnitX.RegisterTestFixture(TSinglyLinkedListTest);

end.