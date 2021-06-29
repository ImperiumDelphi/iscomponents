program Teste_DataCardList_ImageFieldEX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Query},
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  Unit3 in 'Unit3.pas' {ISFrame3: TISFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TQuery, Query);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
