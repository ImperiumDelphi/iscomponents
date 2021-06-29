program Demo_DataCardList;

uses
  System.StartUpCopy,
  FMX.Forms,
  uInicial in 'uInicial.pas' {Form4},
  uPesquisa in 'uPesquisa.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
