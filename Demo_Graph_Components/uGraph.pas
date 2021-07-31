unit uGraph;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.ISPath, FMX.Objects, FMX.ISAlcinoe, FMX.ISBase, FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons, FMX.ISPieGraph,
  FMX.StdCtrls, FMX.Layouts, FMX.ISVertScrollBox, FMX.ISCheckButtons, FMX.ISGridLayout, FMX.ISComboBox, FMX.Controls.Presentation,
  FMX.ListBox, FMX.ISVectorGraph, FMX.ISPopUpMenu, FMX.ISGraphTitles, FMX.ISEditEx;

type

  TFormGraph = class(TForm)
    PieGraph: TISPieGraph;
    LayoutPie: TLayout;
    Scroll: TISVertScrollBox;
    ISGridLayout1: TISGridLayout;
    BtDonut: TISCheckButton;
    BtPie: TISCheckButton;
    Layout1: TLayout;
    VectorGraph: TIsVectorGraph;
    ISGridLayout2: TISGridLayout;
    BtAnimate: TISTextButton;
    BtAnimateLine: TISTextButton;
    PopUpType: TISPopUpMenu;
    ISTextButton1: TISTextButton;
    PieTitles: TISGraphTitles;
    VectorTitles: TISGraphTitles;
    procedure PieGraphClickItem(aIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure BtDonutClicked(Sender: TObject);
    procedure BtPieClicked(Sender: TObject);
    procedure BtAnimateClicked(Sender: TObject);
    procedure BtAnimateLineClicked(Sender: TObject);
    procedure PopUpTypeOptionSelected(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGraph: TFormGraph;

implementation

{$R *.fmx}

procedure TFormGraph.BtDonutClicked(Sender: TObject);
begin
TAnimator.AnimateFloat(PieGraph, 'Thickness', 30, 0.3);
end;

procedure TFormGraph.BtPieClicked(Sender: TObject);
begin
TAnimator.AnimateFloat(PieGraph, 'Thickness', PieGraph.Radius, 0.3);
end;

procedure TFormGraph.PieGraphClickItem(aIndex: Integer);
begin
Log.d('Click in '+aIndex.Tostring);
end;

procedure TFormGraph.PopUpTypeOptionSelected(Sender: TObject);
begin
case PopUpType.SelectedOption.Index of
   0 : VectorGraph.GraphType := TISVectorGraphType.vgLine;
   1 : VectorGraph.GraphType := TISVectorGraphType.vgWave;
   2 : VectorGraph.GraphType := TISVectorGraphType.vgBars;
   3 : VectorGraph.GraphType := TISVectorGraphType.vgBarsRound;
   4 : VectorGraph.GraphType := TISVectorGraphType.vgCenterBars;
   5 : VectorGraph.GraphType := TISVectorGraphType.vgCenterBarsRound;
   end;
end;

procedure TFormGraph.FormShow(Sender: TObject);
begin
ReportMemoryLeaksOnShutdown := True;
PieGraph.Clear
        .Add(10, TAlphaColors.Blue,       TAlphaColors.Blue,       'IBM')
        .Add(20, TAlphaColors.Maroon,     TAlphaColors.Maroon,     'Compaq')
        .Add(30, TAlphaColors.Red,        TAlphaColors.Red,        'HP')
        .Add(40, TAlphaColors.Green,      TAlphaColors.Green,      'Lenovo')
        .Add(50, TAlphaColors.Blueviolet, TAlphaColors.Blueviolet, 'Dell')
        .Add(30, TAlphaColors.Tomato,     TAlphaColors.Tomato,     'Avell')
        .Add(20, TAlphaColors.Slateblue,  TAlphaColors.Slateblue,  'Positivo')
        .ShowGraph;

VectorGraph.Clear
           .Add(20, TAlphaColors.Blue,       TAlphaColors.Blue,       'Jan')
           .Add(38, TAlphaColors.Maroon,     TAlphaColors.Maroon,     'Fev')
           .Add(30, TAlphaColors.Red,        TAlphaColors.Red,        'Mar')
           .Add(45, TAlphaColors.Green,      TAlphaColors.Green,      'Abr')
           .Add(56, TAlphaColors.Blueviolet, TAlphaColors.Blueviolet, 'Mai')
           .Add(35, TAlphaColors.Tomato,     TAlphaColors.Tomato,     'Jun')
           .Add(82, TAlphaColors.Lime,       TAlphaColors.Lime,       'Jul')
           .Add(44, TAlphaColors.Cadetblue,  TAlphaColors.Cadetblue,  'Ago')
           .Add(76, TAlphaColors.Aqua,       TAlphaColors.Aqua,       'Set')
           .Add(61, TAlphaColors.Hotpink,    TAlphaColors.Hotpink,    'Out')
           .Add(35, TAlphaColors.Peru,       TAlphaColors.Peru,       'Nov')
           .Add(42, TAlphaColors.Chartreuse, TAlphaColors.Chartreuse, 'Dez')
           .ShowGraph;
end;

procedure TFormGraph.BtAnimateClicked(Sender: TObject);
begin
VectorGraph.Animate;
end;

procedure TFormGraph.BtAnimateLineClicked(Sender: TObject);
begin
VectorGraph.AnimateLine;
end;

end.
