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
    procedure prepend_item_increases_count;
  end;

implementation

uses
  uDataStructures;

{ TSinglyLinkedListTest }

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