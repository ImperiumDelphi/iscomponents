unit uSearch;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.ISBase, FMX.ISBase.Presented,
  FMX.ISBaseButtons, FMX.ISButtons, FMX.ISSearchEdit, FMX.Layouts, FMX.ISLayouts, FMX.ISDataCard, FMX.ISDataCardList,
  FMX.ISGridLayout, FMX.ISCircleIcon, FMX.ISDataCardFields, FMX.ISLabel, FMX.ISDataCardImageField, FMX.ISCards,
  FMX.ISCardCarousel, FMX.ISIndexIndicator, FMX.ISExecute, FMX.ISIcon, FMX.ISPlaceHolder, FMX.ISDownload, FMX.ISWait,
  FMX.ISDataCardHorzList, FMX.ISCheckButtons, FMX.ISText, FMX.ISDataCardBase, FMX.ISDataCardImageFieldEx,
  FMX.ISAlcinoe;

type
  TFormSearch = class(TForm)
    LaySearch: TISChildrenLayout;
    ISSearchEdit1: TISSearchEdit;
    BtCarrinho: TISIconButton;
    ListSearch: TISDataCardList;
    CardPromo: TISDataCard;
    CardOptions: TISDataCard;
    ISGridLayout1: TISGridLayout;
    CardOfertas: TISDataCard;
    Layout2: TLayout;
    ISCircleIcon2: TISCircleIcon;
    Text2: TText;
    Layout3: TLayout;
    ISCircleIcon3: TISCircleIcon;
    Text3: TText;
    Layout4: TLayout;
    ISCircleIcon4: TISCircleIcon;
    Text4: TText;
    Layout5: TLayout;
    ISCircleIcon5: TISCircleIcon;
    Text5: TText;
    Layout6: TLayout;
    ISCircleIcon6: TISCircleIcon;
    Text6: TText;
    CardBottom: TISDataCard;
    CardSessoes: TISDataCard;
    CabCard: TISTextField;
    CardProduto: TISControl;
    ISIconTextButtonField1: TISIconTextButtonField;
    CarrosselOfertas: TISDataCardHorzList;
    ISIconTextButton1: TISIconTextButton;
    ISIcon1: TISIcon;
    ISDownload1: TISDownload;
    ISImageField1: TISImageFieldEx;
    Workimg: TISWorkField;
    ISTextField1: TISTextField;
    ISTextField2: TISTextField;
    ISTextField3: TISTextField;
    parcelas: TISTextField;
    ISTextField4: TISTextField;
    Image1: TImage;
    ISWorkField1: TISWorkField;
    ISWaitLayout1: TISWaitLayout;
    procedure LaySearchShow(Sender: TObject);
    procedure LaySearchDeactivate(Sender: TObject);
    procedure CardSessoesLoadRecord(Sender: TObject);
    procedure CardPromoActivate(Sender: TObject);
    procedure CardSessoesActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSearch: TFormSearch;

implementation

{$R *.fmx}


// Chamado sempre que o layout entra na tela (lupa selecionada)
procedure TFormSearch.CardPromoActivate(Sender: TObject);
begin
TThread.CreateAnonymousThread(
   procedure
   Var
      x : Integer;
   Begin
   CarrosselOfertas.Clear;
   CarrosselOfertas.BeginUpdate;
   for x := 1 to 5 do
      Begin
      CardOfertas.FieldByName('ImgOfertas').AsText := 'https://app.jusimperium.com.br/curso/ml/ofertas/mobile/ofertas00'+X.ToString+'.png';
      CarrosselOfertas.AddCard(CardOfertas);
      End;
   CarrosselOfertas.EndUpdate;
   End).Start;
end;

procedure TFormSearch.CardSessoesActivate(Sender: TObject);
begin
((Sender As TISDataCard).ControlByName('TipFrete') As TISTextField) .Visible := (Sender As TISDataCard).FieldByName('frete').AsText = '1';
end;

procedure TFormSearch.CardSessoesLoadRecord(Sender: TObject);
begin
CardSessoes.FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/curso/ml/produtos/'+CardSessoes.FieldByName('img').AsText+'.png';
end;

procedure TFormSearch.LaySearchDeactivate(Sender: TObject); // O Layouts de search saiu da tela
begin                                                       // para o Slide do Carrossel para não rodar fora da tela
end;

procedure TFormSearch.LaySearchShow(Sender: TObject);
begin
CardPromo .Height := (LaySearch.ParentLayout.Width -32) * 0.45;
TThread.CreateAnonymousThread(
   Procedure
   Begin
   Sleep(400);
   ListSearch.BeginUpdate;
   ListSearch.AddCard(CardPromo);          // Primeiro card da Lista (Promoções)
   ListSearch.AddCard(CardOptions);        // Segundo card da Lista (Opções)
   ListSearch.LoadFromJsonArray(CardSessoes, 'https://app.jusimperium.com.br/curso/ml/search.json'); // demais cards da lista, dados baixados do endereço
   ListSearch.AddCard(CardBottom);         // Card em branco para dar uma margem ao final da lista
   ListSearch.EndUpdate;
   End).Start;
end;


end.
