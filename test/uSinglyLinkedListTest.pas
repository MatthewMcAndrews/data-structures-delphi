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
  end;

implementation

uses
  uDataStructures;

{ TSinglyLinkedListTest }

procedure TSinglyLinkedListTest.new_list_is_empty;
begin
  Assert.AreEqual(0, TDataStructure.NewSinglyLinkedList<string>.Count);
end;

initialization
  TDUnitX.RegisterTestFixture(TSinglyLinkedListTest);

end.