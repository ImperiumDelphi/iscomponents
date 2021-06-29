program MercadoLivre;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {FormInicio},
  uSearch in 'uSearch.pas' {FormSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormInicio, FormInicio);
  Application.Run;
end.
