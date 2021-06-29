program Teste_ChartLine;

uses
  System.StartUpCopy,
  FMX.Forms,
  uTeste_ChartLine in 'uTeste_ChartLine.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
