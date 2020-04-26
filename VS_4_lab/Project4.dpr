program Project4;

uses
  Forms,
  Fourth in 'Fourth.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
