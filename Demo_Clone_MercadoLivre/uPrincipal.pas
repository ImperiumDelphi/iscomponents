unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISBase, FMX.ISLayouts, FMX.Layouts, FMX.ISBaseScrollLayout,
  FMX.ISNaviBarLayout, FMX.Objects, FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons, FMX.ISSearchEdit,

  FMX.ISExecute, FMX.ISKeyboardService;

type
  TFormInicio = class(TForm)
    Root: TISParentLayout;
    NaviBar: TISNaviBarLayout;
    ISBackKey1: TISBackKey;
    procedure NaviBarChangeIndex(aIndex: Integer; var aLayout: TISCustomChildrenLayout);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInicio: TFormInicio;

implementation

Uses
   uSearch;

{$R *.fmx}



// Cria o formulário de Search

procedure TFormInicio.FormShow(Sender: TObject);
begin
FormSearch := TFormSearch.Create(Self);
end;

// Evento de Quando se muda a aba do naviBar
// Criamos o Carrossel sem definir os Layouts,
// podemos defini-los aqui de acordo com o
// layout selecionado.

procedure TFormInicio.NaviBarChangeIndex(aIndex: Integer; var aLayout: TISCustomChildrenLayout);
begin
case aIndex of
   0 : aLayout := FormSearch.LaySearch;                 // Primeira aba = LaySearch em FormSearch
   end;
end;

end.
