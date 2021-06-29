program Camera;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCamera in 'uCamera.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
