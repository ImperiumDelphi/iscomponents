unit uTeste_ChartLine;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.ISBase,
  FMX.ISIcon,
  FMX.ISCharts,
  FMX.ISObjects;

type
  TForm5 = class(TForm)
    Chart: TISLineChart;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Button1Click(Sender: TObject);
Var
   c : Integer;
begin
c := Chart.Add;
Chart.Line(c).LineColor   := TAlphaColors.Blue;
Chart.Line(c).LineHeight  := 2;
Chart.Line(c).PointColor  := TAlphaColors.Red;
Chart.Line(c).PointWidth  := 12;
Chart.Line(c).PointFormat := TISPointFormat.pfSquare;
Chart.Line(c).Add('', 10);
Chart.Line(c).Add('', 15);
Chart.Line(c).Add('', 30);
Chart.Line(c).Add('', 25);
Chart.Line(c).Add('', 60);
Chart.Line(c).Add('', 20);
Chart.Line(c).Add('',  5);
Chart.Line(c).Add('', 80);
Chart.Line(c).Add('', 40);

c := Chart.Add;
Chart.Line(c).LineColor   := TAlphaColors.Black;
Chart.Line(c).LineHeight  := 2;
Chart.Line(c).PointColor  := TAlphaColors.Green;
Chart.Line(c).PointWidth  := 12;
Chart.Line(c).PointFormat := TISPointFormat.pfCircle;
Chart.Line(c).Add('', 2);
Chart.Line(c).Add('', 4);
Chart.Line(c).Add('', 12);
Chart.Line(c).Add('', 38);
Chart.Line(c).Add('', 41);
Chart.Line(c).Add('', 82);
Chart.Line(c).Add('', 67);
Chart.Line(c).Add('', 22);
Chart.Line(c).Add('', 12);

c := Chart.Add;
Chart.Line(c).LineColor   := TAlphaColors.Gray;
Chart.Line(c).LineHeight  := 2;
Chart.Line(c).PointColor  := TAlphaColors.Red;
Chart.Line(c).PointWidth  := 12;
Chart.Line(c).PointFormat := TISPointFormat.pfTriangle;
Chart.Line(c).Add('', 31);
Chart.Line(c).Add('', 72);
Chart.Line(c).Add('', 18);
Chart.Line(c).Add('', 33);
Chart.Line(c).Add('', 24);
Chart.Line(c).Add('', 52);
Chart.Line(c).Add('', 26);
Chart.Line(c).Add('', 42);
Chart.Line(c).Add('', 45);

c := Chart.Add;
Chart.Line(c).LineColor   := TAlphaColors.Green;
Chart.Line(c).LineHeight  := 2;
Chart.Line(c).PointColor  := TAlphaColors.Maroon;
Chart.Line(c).PointWidth  := 16;
Chart.Line(c).PointFormat := TISPointFormat.pfIcon;
Chart.Line(c).PointIcon   := TISIconType.isHeart;
Chart.Line(c).Add('', 13);
Chart.Line(c).Add('', 27);
Chart.Line(c).Add('', 31);
Chart.Line(c).Add('', 33);
Chart.Line(c).Add('', 22);
Chart.Line(c).Add('', 20);
Chart.Line(c).Add('', 18);
Chart.Line(c).Add('', 19);
Chart.Line(c).Add('', 17);

Chart.Show;
end;

end.
