program BarCode;

uses
  System.StartUpCopy,
  FMX.Forms,
  uBarCode in 'uBarCode.pas' {formBarCode};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TformBarCode, formBarCode);
  Application.Run;
end.
