program Carrinho;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit51 in 'Unit51.pas' {Form51};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm51, Form51);
  Application.Run;
end.
