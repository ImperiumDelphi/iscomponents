unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISText, FMX.ISDataCardFields, FMX.ISDataCardBase,
  FMX.ISDataCard, FMX.ISDataCardList, FMX.Objects, FMX.ISBase, FMX.ISBase.Presented, FMX.ISBaseButtons,
  FMX.ISButtons, FMX.ISLayouts, FMX.Layouts, FMX.ISMessageDlg, FMX.ISLayout, FMX.ISDataCardImageField, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Net.URLClient, System.IOUtils,

  FMX.ISAndroid.Permissions, FMX.ISSideScroll, FMX.ISBase64, FMX.ISIcon, FMX.ISDataCardImageFieldEx, FMX.ISPlaceHolder,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.ISMultiLineEdit, FMX.ISBitmap, Unit2, FMX.ISCheckButtons, FMX.ISPath,
  FMX.ISDownload, FMX.ISPrice, FMX.StdCtrls, FMX.Effects, FMX.Filter.Effects, FMX.ISSpin, FMX.ISMainMenu, FMX.ISSearchEdit,
  FMX.ISAlcinoe, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TQuery = class(TForm)
    ISParentLayout1: TISParentLayout;
    Principal: TISChildrenLayout;
    ISTextButton1: TISTextButton;
    CardDB: TISDataCard;
    Msg: TISMessageDlg;
    FDCon: TFDConnection;
    Query: TFDQuery;
    ISAndroidPermissions1: TISAndroidPermissions;
    ISTextButton2: TISTextButton;
    Header: TISDataCard;
    ISTextField1: TISTextField;
    ISTextField2: TISTextField;
    ISPlaceHolder1: TISPlaceHolder;
    ISOptionsCard1: TISOptionsCard;
    ISOptionsCard2: TISOptionsCard;
    Down: TISDownload;
    Foto: TISImageField;
    Lista: TISDataCardList;
    CardURL: TISDataCard;
    ISImageFieldEx2: TISImageFieldEx;
    ISIcon1: TISIcon;
    ISTextButton3: TISTextButton;
    Layout1: TLayout;
    Text1: TISText;
    Layout2: TLayout;
    Text2: TISText;
    ISHorizontalLayout1: TISHorizontalLayout;
    ISPrice1: TISPriceField;
    Text3: TISText;
    ISTextField3: TISTextField;
    SearchEdit: TISSearchEdit;
    CardFoto: TISDataCard;
    ISImageFieldEx1: TISImageFieldEx;
    Texto: TISChildrenLayout;
    ISText1: TISText;
    ISTextField4: TISTextField;
    ISSideScroll1: TISSideScroll;
    procedure ISTextButton1Clicked(Sender: TObject);
    procedure ISTextField1Clicked(Sender: TObject);
    procedure CardDBClickCard(Sender: TObject);
    procedure ISTextButton2Clicked(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ISTextButton3Clicked(Sender: TObject);
  private
    Local : String;
  public
    { Public declarations }
  end;

var
  Query: TQuery;

implementation

{$R *.fmx}

procedure TQuery.FormCreate(Sender: TObject);
begin
TISText.TextNative := False;
ReportMemoryLeaksOnShutdown := True;
{$IFDEF ANDROID}
Local := System.IOUtils.TPath.GetSharedDocumentsPath+PathDelim+'banco.s3db';
{$ELSE}
Local := 'c:\temp\banco.s3db';
{$ENDIF}
FDCon.Params.Database := Local;
end;

procedure TQuery.ISTextButton1Clicked(Sender: TObject);
begin
TThread.CreateAnonymousThread(
   Procedure
   Var
      X : Integer;
      V : Single;
   Begin
   Lista.Clear;
   Lista.BeginUpdate;

   x := 0;
   V := 1.23;

//   Header.FieldByName('Texto').AsString := 'ImageField';
//   Lista.AddCard(Header);
//   for x := 1 to 102 do
//      Begin
//      CardDB.FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/curso/fotos/'+FormatFloat('000',X)+'.jpg';
//      Lista.AddCard(CardDB);
//      End;

//   Header.FieldByName('Texto').AsString := 'CardFoto';
//   Lista.AddCard(Header);
//   for x := 1 to 102 do
//      Begin
//      CardFoto.FieldByName('Foto').AsString := 'https://app.jusimperium.com.br/curso/fotos/'+FormatFloat('000',X)+'.jpg';
//      CardFoto.FieldByName('Nome').AsString := 'Nome joao'+X.ToString;
//      Lista.AddCard(CardFoto);
//      V := V + 2.34;
//      End;

//   Header.FieldByName('Texto').AsString := 'ImageFieldEX';
//   Lista.AddCard(Header);
   for x := 1 to 102 do
      Begin
      CardURL.FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/curso/fotos/'+FormatFloat('000',X)+'.jpg';
      CardURL.FieldByName('Valor') .AsFloat  := V*X;
      CardURL.FieldByName('NomGru').AsString := 'Foto '+X.ToString;
      Lista.AddCard(CardURL);
      V := V + 2.34;
//      Sleep(20);   // Tempo para ver o placeholder
      End;

//   Query.Open('Select * From SCAF032 Order By Ordem');
//   Query.First;

//
//   Header.FieldByName('Texto').AsString := 'Carregamento DB via LoadFromDataset';
//   Lista.AddCard(Header);
//   Lista.LoadFromDataSet(CardDB, Query);
//
//   while Not Query.Eof do
//      Begin
//      CardDB.FieldByName('NomGru').AsString    := Query.FieldByName('NomGru').AsString;
//      CardDB.FieldByName('Imagem').AsBlobImage := Query.FieldByName('Imagem');
//      Inc(x);
//      V := V + 2.34;
//      Lista.AddCard(CardDB);
//      Query.Next;
//      End;
//
//   Query.Close;

   Lista.EndUpdate;
   End).Start;
end;

procedure TQuery.ISTextButton2Clicked(Sender: TObject);
begin

//Down.Download('https://app.jusimperium.com.br/banco.s3db',Local,
//   Procedure
//   Begin
//   Msg.MessageOk('Download', 'Donwload concluído.');
//   End);
end;

procedure TQuery.ISTextButton3Clicked(Sender: TObject);
begin
//SearchEdit.Search('52,');
//Lista.Clear;
ISImageFieldEx2.ClearCache;
end;

procedure TQuery.CardDBClickCard(Sender: TObject);
begin
Msg.MessageOk('Card', 'Clicou no '+(Sender As TISCustomDataCard).TagString);
end;

procedure TQuery.ISTextField1Clicked(Sender: TObject);
begin
Msg.MessageOk('TextField', 'Clicou no '+(Sender As TIStext).Text);
end;

end.
