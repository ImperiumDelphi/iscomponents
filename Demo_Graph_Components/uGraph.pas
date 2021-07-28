unit uGraph;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.ISPath, FMX.Objects, FMX.ISAlcinoe, FMX.ISBase, FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons, FMX.ISPieGraph,
  FMX.StdCtrls, FMX.Layouts, FMX.ISVertScrollBox, FMX.ISCheckButtons, FMX.ISGridLayout, FMX.ISComboBox, FMX.Controls.Presentation,
  FMX.ListBox, FMX.ISVectorGraph, FMX.ISPopUpMenu;

type

  TFormGraph = class(TForm)
    PieGraph: TISPieGraph;
    LayoutPie: TLayout;
    PieSubTitles: TISPieSubTitles;
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
TAnimator.AnimateFloat(PieGraph, 'Thickness', 50, 0.3);
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
PieSubTitles.MaxItemHeight := 25;
PieGraph.Clear;
PieGraph.Add(10, TAlphaColors.Blue,       TAlphaColors.Blue,       'IBM');
PieGraph.Add(20, TAlphaColors.Maroon,     TAlphaColors.Maroon,     'Compaq');
PieGraph.Add(30, TAlphaColors.Red,        TAlphaColors.Red,        'HP');
PieGraph.Add(40, TAlphaColors.Green,      TAlphaColors.Green,      'Lenovo');
PieGraph.Add(50, TAlphaColors.Blueviolet, TAlphaColors.Blueviolet, 'Dell');
PieGraph.Add(30, TAlphaColors.Tomato,     TAlphaColors.Tomato,     'Avell');
PieGraph.Add(20, TAlphaColors.Slateblue,  TAlphaColors.Slateblue,  'Positivo');
PieGraph.ShowGraph;
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
