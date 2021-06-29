unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FMX.ISBitmapList;

type
  TDataModule2 = class(TDataModule)
    ISBitmapList1: TISBitmapList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
