program VariosMenus;

uses
  System.StartUpCopy,
  FMX.Forms,
  uVariosMenus in 'uVariosMenus.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
