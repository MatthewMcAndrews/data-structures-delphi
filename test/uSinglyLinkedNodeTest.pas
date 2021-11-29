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
    [Test]
    procedure new_node_next_is_nil;
  end;

implementation

uses
  uSinglyLinkedNode;

{ TSinglyLinkedNodeTest }

procedure TSinglyLinkedNodeTest.new_node_has_data;
var
  Node: ISinglyLinkedNode<Integer>;
begin
  Node := TSinglyLinkedNode<Integer>.Create(1);
  Assert.AreEqual(1, Node.Data);
end;

procedure TSinglyLinkedNodeTest.new_node_next_is_nil;
var
  Node: ISinglyLinkedNode<Integer>;
begin
  Node := TSinglyLinkedNode<Integer>.Create(1);
  Assert.IsNull(Node.Next);
end;

initialization
  TDUnitX.RegisterTestFixture(TSinglyLinkedNodeTest);

end.