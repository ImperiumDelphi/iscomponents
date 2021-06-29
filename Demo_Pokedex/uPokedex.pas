unit uPokedex;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.ISBase, FMX.ISBaseButtons, FMX.ISCircleIcon, FMX.ISLayouts, FMX.Layouts, FMX.Ani,
  FMX.ISButtons, FMX.ISSendMail, FMX.ISLabel, FMX.ISCards, FMX.ISCardList,
  FMX.ISDownload, FMX.ISWait, FMX.ISExecute, FMX.Controls.Presentation,
  FMX.Edit, FMX.ISEditEx, FMX.StdCtrls, FMX.ISBitmapList, FMX.ISBitmap,
  FMX.Effects, FMX.ISSearchEdit, FMX.ISBase.Presented, FMX.ISDataCardBase, FMX.ISDataCard,
  FMX.ISDataCardImageField, FMX.ISDataCardFields, FMX.ISText, FMX.ISDataCardList, FMX.ISDataCardImageFieldEx,

  System.Json.Types,
  System.Json.Readers,
  System.Json, FMX.ISIcon, FMX.ISObjects;

type
  TPokeForm = class(TForm)
    Principal: TISParentLayout;
    MainPokedex: TISChildrenLayout;
    Ball: TISIconButton;
    LayUp: TLayout;
    ISControl2: TISControl;
    LayDown: TLayout;
    ISControl3: TISControl;
    LayList: TISChildrenLayout;
    List: TISDataCardList;
    PokeCard: TISDataCard;
    ImgPokemon: TISImageFieldEx;
    Name: TISTextField;
    Down: TISDownload;
    ISCircleControl1: TISCircleControl;
    Tipo1: TISTextField;
    Tipo2: TISTextField;
    Tipo3: TISTextField;
    Form: TISTextField;
    ISWaitLayout1: TISWaitLayout;
    ISBitmapList1: TISBitmapList;
    ISBitmap1: TISBitmap;
    GlowEffect1: TGlowEffect;
    AniGlow: TFloatAnimation;
    Image1: TImage;
    ISSearchEdit1: TISSearchEdit;
    ISWorkField1: TISWorkField;
    ISWorkField2: TISWorkField;
    ImgDefault: TImage;
    procedure MainPokedexShow(Sender: TObject);
    procedure BallClicked(Sender: TObject);
    procedure LayListShow(Sender: TObject);
    procedure MainPokedexActivate(Sender: TObject);
    procedure PokeCardLoadRecord(Sender: TObject);
  private
    { Private declarations }
    Procedure OpenPokedex;
    Procedure ClosePokedex;
  public
    { Public declarations }
  end;

var
  Pokeform: TPokeForm;

implementation

{$R *.fmx}


procedure TPokeForm.OpenPokedex;
begin
Log.d('Open Pokedex');
MainPokedex.BackgroundColor := $FFAF272A;
TAnimator.AnimateFloat(LayUp,   'Position.Y', -Layup.Height,      0.6, TAnimationType.&in, TInterpolationType.Exponential);
TAnimator.AnimateFloat(LayDown, 'Position.Y', MainPokedex.Height, 0.6, TAnimationType.&in, TInterpolationType.Exponential);
TAnimator.AnimateFloat(Ball,    'Opacity',    0,                  0.6);
TISExecute.StartExecute(600,
   procedure
   Begin
   TAnimator.AnimateColor(MainPokedex, 'BackgroundColor', TAlphaColorRec.White, 0.4);
   End);
end;

procedure TPokeForm.ClosePokedex;
begin
Log.d('Close Pokedex');
TAnimator.AnimateColor(MainPokedex, 'BackgroundColor', $FFAF272A, 0.4);
TISExecute.StartExecute(400,
   procedure
   Begin
   TAnimator.AnimateFloat(LayUp,   'Position.Y', MainPokeDex.Height/2 - LayUp.Height+1, 0.3, TAnimationType.Out, TInterpolationType.Exponential);
   TAnimator.AnimateFloat(LayDown, 'Position.Y', MainPokeDex.Height/2,                  0.3, TAnimationType.Out, TInterpolationType.Exponential);
   TAnimator.AnimateFloat(Ball,    'Opacity',    1,                                     0.3);
   End);
end;

procedure TPokeForm.MainPokedexShow(Sender: TObject);
begin
Log.d('Main Pokedex Show');
Ball   .Opacity    := 1;
LayUp  .Position.X := (MainPokeDex.Width - LayUp.Width)/2;
LayUp  .Position.Y := -LayUp.Height;
LayDown.Position.X := (MainPokeDex.Width - LayUp.Width)/2;
LayDown.Position.Y := MainPokeDex.Height;
Ball   .Opacity    := 0;
TISImageFieldEX.DefaultImage.Assign(ImgDefault.Bitmap);
TISImageFieldEx.DefaultImageColor := TAlphaColors.Lightgray;
end;

procedure TPokeForm.MainPokedexActivate(Sender: TObject);
begin
Log.d('Main Pokedex Activation');
AniGlow.Enabled := True;
List.Clear;
TISExecute.StartExecute(1000,
   Procedure
   Begin
   ClosePokedex;
   End);
end;

procedure TPokeForm.BallClicked(Sender: TObject);
begin
Log.d('Clicou início');
AniGlow.Enabled := False;
OpenPokedex;
TISExecute.StartExecute(1000,
   Procedure
   Begin
   LayList.ShowLayout;
   end);
end;

procedure TPokeForm.PokeCardLoadRecord(Sender: TObject);
Var
   Tipos : TStringList;
   ID_   : Integer;
begin
Tipos      := TStringList.Create;
ID_        := PokeCard.FieldByName('pokemon_id').AsInteger;
Tipos.Text := PokeCard.FieldByName('type').AsString+#13#10+#13#10+#13#10+#13#10;
PokeCard.FieldByName('Type1').AsString  := Tipos[0];
PokeCard.FieldByName('Type2').AsString  := Tipos[1];
PokeCard.FieldByName('Type3').AsString  := Tipos[2];
PokeCard.FieldByName('Photo').AsString  := 'https://www.serebii.net/pokemongo/pokemon/'+FormatFloat('000',PokeCard.FieldByName('Pokemon_id').AsInteger)+'.png';
case Id_ mod 8 of
   0 : PokeCard.Color := TAlphaColorRec.Crimson;
   1 : PokeCard.Color := TAlphaColorRec.SkyBlue;
   2 : PokeCard.Color := TAlphaColorRec.Blueviolet;
   3 : PokeCard.Color := TAlphaColorRec.Teal;
   4 : PokeCard.Color := TAlphaColorRec.Brown;
   5 : PokeCard.Color := TAlphaColorRec.Cadetblue;
   6 : PokeCard.Color := TAlphaColorRec.Cornflowerblue;
   7 : PokeCard.Color := TAlphaColorRec.Mediumorchid;
   end;
end;

procedure TPokeForm.LayListShow(Sender: TObject);
begin
Log.d('Entrou ListShow');
List.Clear;
TThread.CreateAnonymousThread(
   Procedure
   Begin
   List.BeginUpdate;
   Log.d('Carregou Json Thread');
   List.LoadFromJsonArray(PokeCard, 'https://app.jusimperium.com.br/curso/pokemon/Pokemon.json');
   List.EndUpdate;
   End).Start;
end;

end.
