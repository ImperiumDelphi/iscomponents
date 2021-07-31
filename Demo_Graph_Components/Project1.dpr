program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uGraph in 'uGraph.pas' {FormGraph};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGraph, FormGraph);
  Application.Run;
end.
