unit Unit51;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,

  FMX.ISCircleIcon,
  FMX.ISKeyboardService,
  FMX.ISBaseButtons,
  FMX.ISDownload,
  FMX.ISMessageDlg,
  FMX.ISDataCard,
  FMX.ISDataCardFields,
  FMX.ISDataCardImageField,
  FMX.ISSpin,
  FMX.ISPlaceHolder,
  FMX.ISButtons,
  FMX.ISBase,
  FMX.ISWait,
  FMX.ISScrollBar,
  FMX.ISLabel,
  FMX.ISDataCardList,
  FMX.ISLayouts,
  FMX.ISBase.Presented,
  FMX.ISIcon,
  FMX.ISDataCardBase,
  FMX.ISText,
  FMX.Effects,
  FMX.ISDataCardImageFieldEx,
  FMX.ISAlcinoe;

type
  TForm51 = class(TForm)
    Par: TISParentLayout;
    Chil: TISChildrenLayout;
    ISIconTextButton1: TISIconTextButton;
    Card: TISDataCard;
    Lista: TISDataCardList;
    ISWaitLayout1: TISWaitLayout;
    ISSpinField1: TISSpinField;
    ISTextField1: TISTextField;
    Remove: TISIconTextButtonField;
    ISWorkField1: TISWorkField;
    Msg: TISMessageDlg;
    ISTextField2: TISTextField;
    ISTextField3: TISTextField;
    ISImageField1: TISImageFieldEx;
    ISWorkField2: TISWorkField;
    Down: TISDownload;
    Layout1: TLayout;
    ISIcon1: TISIcon;
    Total: TISText;
    LayoutFinaliza: TISChildrenLayout;
    TotFim: TISText;
    ListaFinal: TISDataCardList;
    CardFim: TISDataCard;
    ISTextButton1: TISTextButton;
    ISButtonStyle1: TISButtonStyle;
    ISWorkField3: TISWorkField;
    ISIconTextButton2: TISIconTextButton;
    ISIconTextButton4: TISIconTextButton;
    ISPlaceHolder1: TISPlaceHolder;
    CardPedido: TISDataCard;
    Descricao: TISTextField;
    ISBackKey1: TISBackKey;
    ISScrollBar1: TISScrollBar;
    OptionLeft: TISOptionsCard;
    OptionRight: TISOptionsCard;
    ScrollStyle: TISButtonStyle;
    ISTextField4: TISTextField;
    ISTextField5: TISTextField;
    ISTextField6: TISTextField;
    ISCircleIcon1: TISCircleIcon;
    procedure Button1Click(Sender: TObject);
    procedure RemoveClicked(Sender: TObject);
    procedure ListaCardActivate(aRecord: TISDataCardRecord);
    procedure ChilClickButton1(Sender: TObject);
    procedure LayoutFinalizaShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListaFinalCardActivate(aRecord: TISDataCardRecord);
    procedure ListaDeleteItem(Sender: TObject);
    procedure ISSpinField1Change(Sender: TObject);
    procedure ISIconTextButton2Clicked(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    TotalCarrinho : Single;
    NPed          : Integer;
    procedure SomaTotal;
  protected
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form51: TForm51;

implementation


{$R *.fmx}




//----------------------------------------------------
//     preenche os dados do carrinho
//----------------------------------------------------


procedure TForm51.Button1Click(Sender: TObject);
begin
if Lista.InUpdate then Exit;
Lista.BeginUpdate;
TThread.CreateAnonymousThread(
   Procedure

      Procedure AddCard(aCodigo : String; aNome, aDes : String; aPreco : Single; aQtd: Single; aTipo : Integer);
      Begin
      Card.FieldByName('CodPro').AsText   := aCodigo;
      Card.FieldByName('NomPro').AsText   := aNome;
      Card.FieldByName('DesPro').AsText   := aDes;
      Card.FieldByName('PreUni').AsFloat  := aPreco;
      Card.FieldByName('TipPro').AsFloat  := aTipo;
      Card.FieldByName('QtdPro').AsFloat  := aQtd;
      Card.FieldByName('Imgpro').AsString := 'https://app.jusimperium.com.br/Delphi/'+aCodigo+'.png';
      Lista.AddCard(Card);
      End;

   Var
      x : Integer;
   Begin

   for x := 1 to 10 do
      Begin
      CardPedido.FieldByName('Descricao').AsText := 'Pedido '+NPed.ToString;
      Lista.AddCard(CardPedido);

      AddCard('1', 'Biscoito',           'É biscoito não é bolacha', 2.50, 0.3, 1);
      AddCard('2', 'Também é Biscoito',  'Esse também é biscoito não é bolacha', 2.60, 6, 0);
      AddCard('3', 'Cerveja AMSTEL',     'Cerveja puro malte', 5.99, 1, 0);
      AddCard('4', 'Cerveja Antarctica', 'A cerveja dos pinguins', 5.89, 2, 0);
      AddCard('5', 'Cerveja Corona',     'A cerveja sucesso de vendas na China e Itália', 1.49, 12, 0);
      AddCard('6', 'Cartela de Ovos',    '30 ovos organizados em uma matriz de 5x6 ou 6x5 dependendo do ponto de vista', 9.30, 1, 0);
      Inc(NPed);
      End;

   Lista.EndUpdate;
   SomaTotal;
   End).Start;
end;


//----------------------------------------------------
//     Click no botão 1 do Layout, apagar o carrinho
//----------------------------------------------------

procedure TForm51.ChilClickButton1(Sender: TObject);
begin
Msg.MessageYesNo('Carrinho', 'Confirma cancelamento de todos os Itens?',
   Procedure
   Begin
   Lista.Clear;
   SomaTotal;
   End);
end;

procedure TForm51.FormClose(Sender: TObject; var Action: TCloseAction);
Var
a : Integer;
begin
a := 1;
end;

procedure TForm51.FormCreate(Sender: TObject);
begin
Nped := 1;
end;

//----------------------------------------------------
//     Calcula valor total do carrinho
//----------------------------------------------------

procedure TForm51.SomaTotal;
Begin
TThread.Queue(Nil,
   Procedure
   Var
      x : Integer;
   Begin
   TotalCarrinho := 0;
   for x := 0 to Lista.Count-1 do
      Begin
      If Lista.CardRecord(x).CardType = TISCardType.ctDetail Then
         TotalCarrinho := TotalCarrinho + Lista.CardRecord(x).FieldByName('PrePro').AsFloat;
      End;
   Total.Value := TotalCarrinho;
   End);
End;


//----------------------------------------------------
//     Click no botão de remover produto do carrinho
//----------------------------------------------------

procedure TForm51.ListaDeleteItem(Sender: TObject);
begin
SomaTotal;
end;

procedure TForm51.RemoveClicked(Sender: TObject);
begin
Msg.MessageYesNo('Carrinho', 'Confirma exclusão do item?',
   Procedure
   Var
      Index : Integer;
   Begin
   Index := (Card.GetDataCard(Sender) As TISDataCard).CardIndex;
   Lista.RemoveCard(Index);
   End);
end;


//----------------------------------------------------
//     Calcula alteração da quantidade do Item
//----------------------------------------------------

procedure TForm51.ISIconTextButton2Clicked(Sender: TObject);
begin
Lista.RemoveCard(Lista.CardClicked.CardIndex);
end;

procedure TForm51.ISSpinField1Change(Sender: TObject);
Var
   Car : TISDataCard;
   Qtd : Single;
   Pre : Single;
begin
Car := Card.GetCard(Sender As TControl) As TISDataCard;
if Assigned(Car) then
   Begin
   Qtd := Car.FieldByName('QtdPro').AsFloat;
   Pre := Car.FieldByName('PreUni').AsFloat;
   Car.FieldByName('PrePro').AsFloat := Pre * Qtd;
   if Not Lista.InUpdate then
      Begin
      SomaTotal;
      End;
   if (Qtd = 0) And Not(Lista.InUpdate) then RemoveClicked(Sender);
   End;
end;


//----------------------------------------------------
//     Carrega a imagem do Item durante sua exibição
//     No DataCardList
//----------------------------------------------------

procedure TForm51.ListaCardActivate(aRecord: TISDataCardRecord);
Var
   LSpin  : TISSpinField;
   TipPro : Integer;
begin
if aRecord.DataCard.CardType = TISCardType.ctHeader then Exit;
LSpin  := aRecord.DataCard.ControlByName('QtdPro') As TISSpinField;
TipPro := aRecord.FieldByName('TipPro').AsInteger;
if TipPro = 1 then
   Begin
   LSpin.ValueMin       := 0;
   LSpin.ValueIncrement := 0.100;
   LSpin.ValueMask      := '0.000';
   End
Else
   Begin
   LSpin.ValueMin       := 0;
   LSpin.ValueIncrement := 1;
   LSpin.ValueMask      := '###0';
   End
end;


procedure TForm51.ListaFinalCardActivate(aRecord: TISDataCardRecord);
begin
if aRecord.RecNo = 0 then
   aRecord.DataCard.EdgeSides := [TSide.Top, TSide.Bottom, TSide.Left, TSide.Right]
Else
   aRecord.DataCard.EdgeSides := [TSide.Bottom, TSide.Left, TSide.Right];
end;

//----------------------------------------------------
//     Mostra os Dados do Carrinho em outra listagem
//     Para mostrar como pegar os dados
//----------------------------------------------------

procedure TForm51.LayoutFinalizaShow(Sender: TObject);
Var
   a, B, C : String;
   x : Integer;
begin
TotFim    .Value := 0;
ListaFinal.Clear;
ListaFinal.BeginUpdate;
TThread.CreateAnonymousThread(
   procedure
   Var
      x : Integer;
   Begin
   for x := 0 to Lista.Count-1 do
      Begin
      if Lista.CardRecord(x).Cardtype = TISCardType.ctDetail then
         Begin
         A := Lista.CardRecord(X).FieldByName('QtdPro').AsText;
         B := Lista.CardRecord(X).FieldByName('NomPro').AsText;
         C := Lista.CardRecord(X).FieldByName('PrePro').AsText;

         CardFim.FieldByName('Qtd').AsText := A;
         CardFim.FieldByName('Nom').AsText := B;
         CardFim.FieldByName('Tot').AsText := C;
         ListaFinal.AddCard(CardFim);
         End;
      End;
   ListaFinal.EndUpdate;
   TThread.Queue(Nil,
      Procedure
      Begin
      TotFim.Value := TotalCarrinho;
      End);
   end).Start;
end;

end.
