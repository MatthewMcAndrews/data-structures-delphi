unit uSinglyLinkedNodeTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TSinglyLinkedNodeTest = class
  public
    [Test]
    procedure new_node_has_data;
  end;

implementation

uses
  uDataStructures;

{ TSinglyLinkedNodeTest }

procedure TSinglyLinkedNodeTest.new_node_has_data;
begin
  Assert.AreEqual(1, TDataStructure.NewSinglyLinkedNode<Integer>(1).Data);
end;

initialization
  TDUnitX.RegisterTestFixture(TSinglyLinkedNodeTest);

end.