unit uArrayListTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TArrayListTest = class
  public
    [Test]
    procedure coverage;
  end;

implementation

uses
  uArray,
  System.Generics.Collections;

{ TArrayListTest }

procedure TArrayListTest.coverage;
begin
  Assert.AreEqual(0, NewArray.Count);
end;

initialization
  TDUnitX.RegisterTestFixture(TArrayListTest);

end.
