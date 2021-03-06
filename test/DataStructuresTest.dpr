program DataStructuresTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  DUnitX.Loggers.Xml.NUnit,
  {$ELSE}
  DUnitX.Loggers.Console,
  {$ENDIF }
  DUnitX.TestFramework,
  uImmutableArray in '..\source\uImmutableArray.pas',
  uImmutableArrayTest in 'uImmutableArrayTest.pas',
  uDataStructures in '..\source\uDataStructures.pas',
  uArray in '..\source\uArray.pas',
  uMutableArray in '..\source\uMutableArray.pas',
  uMutableArrayTest in 'uMutableArrayTest.pas',
  uSinglyLinkedListTest in 'uSinglyLinkedListTest.pas',
  uSinglyLinkedList in '..\source\uSinglyLinkedList.pas',
  uSinglyLinkedNodeTest in 'uSinglyLinkedNodeTest.pas',
  uNode in '..\source\uNode.pas',
  uSinglyLinkedNode in '..\source\uSinglyLinkedNode.pas';

//------------------------------------------------------------------------------
{$IFNDEF TESTINSIGHT}
var
  Runner: ITestRunner;
  Results: IRunResults;
  Logger: ITestLogger;
  NUnitLogger: ITestLogger;
{$ENDIF}
begin
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  {$ELSE}
  try
    { Check command line options, will exit if invalid }
    TDUnitX.CheckCommandLine;
    { Create the test Runner }
    Runner := TDUnitX.CreateRunner;
    { Tell the Runner to use RTTI to find Fixtures }
    Runner.UseRTTI := True;
    { When true, Assertions must be made during tests }
    Runner.FailsOnNoAsserts := False;

    { Tell the Runner how we will log things
      Log to the console window if desired }
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then begin
      Logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      Runner.AddLogger(Logger);
    end;
    { Generate an NUnit compatible XML File }
    NUnitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    Runner.AddLogger(NUnitLogger);

    { Run tests }
    Results := Runner.Execute;
    if not Results.AllPassed then begin
      System.ExitCode := EXIT_ERRORS;
    end;

    {$IFNDEF CI}
    { We don't want this happening when running under CI. }
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do begin
      System.Writeln(E.ClassName, ': ', E.Message);
    end;
  end;
{$ENDIF}
end.
