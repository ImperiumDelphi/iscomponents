unit uVariosMenus;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISBase, FMX.ISBase.Presented, FMX.ISBaseButtons,
  FMX.ISButtons, FMX.ISMainMenu, FMX.Objects, FMX.ISLayouts, FMX.Layouts, FMX.ISObjects;

type
  TForm6 = class(TForm)
    Root: TISParentLayout;
    Lay1: TISChildrenLayout;
    Lay2: TISChildrenLayout;
    Main1: TISMainMenu;
    Main2: TISMainMenu;
    ISMainMenuItem1: TISMainMenuItem;
    ISMainMenuItem2: TISMainMenuItem;
    ISTextButton1: TISTextButton;
    procedure Lay1Activate(Sender: TObject);
    procedure Lay2Activate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.Lay1Activate(Sender: TObject);
begin
Lay1.ParentLayout.MainMenu := Main1;
end;

procedure TForm6.Lay2Activate(Sender: TObject);
begin
Lay2.ParentLayout.MainMenu := Main2;
end;

end.
