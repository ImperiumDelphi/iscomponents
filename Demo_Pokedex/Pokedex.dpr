program Pokedex;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPokedex in 'uPokedex.pas' {Pokeform};

{$R *.res}

begin
//ReportMemoryLeaksOnShutdown := True;
Application.Initialize;
Application.CreateForm(TPokeform, Pokeform);
 Application.Run;
end.
