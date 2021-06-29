unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISBase, FMX.ISDataCardImageFieldEx,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ISDataCardBase, FMX.ISDataCard, FMX.ISDataCardList,
  FMX.ISText, FMX.ISDataCardFields, FMX.ISLayouts, FMX.Layouts, FMX.ISLayout, FMX.ISBase.Presented, FMX.ISBaseButtons,
  FMX.ISButtons, FMX.ISIcon, FMX.ISSpin, FMX.ISDataCardPresentation, FMX.ISDownload, FMX.ISVertScrollBox,
  FMX.ISAlcinoe;

type
  TForm4 = class(TForm)
    Card: TISDataCard;
    ISImageFieldEx1: TISImageFieldEx;
    ISTextField1: TISTextField;
    Lista: TISDataCardList;
    ISParentLayout1: TISParentLayout;
    LayProdutos: TISChildrenLayout;
    AddProduto: TISSpeedButtonField;
    ISText1: TISText;
    ISText2: TISTextField;
    ShowProduto: TISDataCardPresentation;
    ISImageFieldEx2: TISImageFieldEx;
    Quantidade: TISDataCard;
    ISTextField2: TISTextField;
    Layout1: TLayout;
    ISIcon1: TISIcon;
    ISIcon2: TISIcon;
    QtdProduto: TISSpin;
    Total: TISText;
    ISText4: TISText;
    ISTextButton1: TISTextButton;
    ISText3: TISText;
    ISTextField3: TISTextField;
    Morph: TISDataCardMorph;
    ISWorkField1: TISWorkField;
    ISWorkField2: TISWorkField;
    Download: TISDownload;
    ISWorkField3: TISWorkField;
    Layout2: TLayout;
    procedure Button3Click(Sender: TObject);
    procedure CardClickCard(Sender: TObject);
    procedure ISIcon1Clicked(Sender: TObject);
    procedure LayProdutosActivate(Sender: TObject);
    procedure LayProdutosShow(Sender: TObject);
    procedure AddProdutoClicked(Sender: TObject);
    procedure ShowProdutoStartMorph(aSource, aDestination: TISCustomDataCard);
    procedure ISTextButton1Clicked(Sender: TObject);
    procedure CardLoadRecord(Sender: TObject);
    procedure QtdProdutoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Cor : Integer;
    Qtd : Integer;
    procedure Listar;
    Procedure AddQtd(aQtd : Integer);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Listar;
begin
Cor := 0;
Lista.Clear;
TThread.CreateAnonymousThread(
   Procedure
   Begin
   Lista.BeginUpdate;
   Lista.LoadFromJsonArray(Card, 'https://app.jusimperium.com.br/exemplo2/lista.json');
   Lista.EndUpdate;
   End).Start;
end;

procedure TForm4.QtdProdutoChange(Sender: TObject);
begin
Total.Text := (Quantidade.FieldByName('preco').AsFloat * QtdProduto.Value).ToString;
end;

procedure TForm4.ShowProdutoStartMorph(aSource, aDestination: TISCustomDataCard);
begin
QtdProduto.Value := 1;
Total.Text       := Quantidade.FieldByName('preco').AsString;
end;

procedure TForm4.AddQtd(aQtd: Integer);
begin
Qtd := Qtd + aQtd;
if Qtd = 0 then
   LayProdutos.Button2Badge := ''
Else
   LayProdutos.Button2Badge := Qtd.ToString;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
TISImageFieldEX.ClearCache;
end;

procedure TForm4.CardClickCard(Sender: TObject);
begin
Morph.Start(Lista.CardClicked);
end;

procedure TForm4.CardLoadRecord(Sender: TObject);
begin
Card.FieldByName('foto').AsString := 'https://app.jusimperium.com.br/exemplo2/'+Card.FieldByName('id').AsString+'.png';
case Cor of
   00 : Card.Color := $ffff7e6e;
   01 : Card.Color := $fff7ad00;
   02 : Card.Color := $ffffd301;
   03 : Card.Color := $ffffe7c6;
   04 : Card.Color := $ff57bde4;
   05 : Card.Color := $ffff8300;
   06 : Card.Color := $ffffd6ef;
   07 : Card.Color := $ff8ac7e5;
   08 : Card.Color := $ffffd584;
   09 : Card.Color := $ffffce83;
   10 : Card.Color := $ff82b4b3;
   11 : Card.Color := $ffb1dbcf;
   12 : Card.Color := $ffc98592;
   13 : Card.Color := $ffe9b4c6;
   14 : Card.Color := $fff5d5df;
   15 : Card.Color := $fff1eada;
   end;
Inc(Cor);
if Cor > 15 then Cor := 0;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm4.LayProdutosActivate(Sender: TObject);
begin
TTHread.CreateAnonymousThread(
   Procedure
   Begin
   Listar;
   End).Start;
end;

procedure TForm4.LayProdutosShow(Sender: TObject);
begin
Qtd := 0;
end;

procedure TForm4.ISIcon1Clicked(Sender: TObject);
begin
Morph.Terminate;
end;

procedure TForm4.ISTextButton1Clicked(Sender: TObject);
begin
AddQtd(Trunc(QtdProduto.Value));
Morph.Terminate;
end;

procedure TForm4.AddProdutoClicked(Sender: TObject);
begin
AddQtd(1);
end;

end.
