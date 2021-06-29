program Demo_TreeView;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDemoTreeView in 'uDemoTreeView.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
