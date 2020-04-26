program task2;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  TaskUnit in 'TaskUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
