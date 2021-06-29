unit uPesquisa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons,
  FMX.ISDataCardFields, FMX.ISText, FMX.ISBase, FMX.ISDataCardImageFieldEx, FMX.Objects, FMX.ISDataCardBase,
  FMX.ISDataCard, FMX.ISDataCardList, FMX.ISSearchEdit, FMX.Layouts, FMX.ISLayouts, FMX.ISDownload, FMX.ISPlaceHolder,
  FMX.ISWait, FMX.ISSideScroll, FMX.ISMessageDlg, FMX.ISAlcinoe, FMX.ISBadge;

type
  TForm5 = class(TForm)
    LayoutLista: TISChildrenLayout;
    ISSearchEdit1: TISSearchEdit;
    Lista: TISDataCardList;
    Card: TISDataCard;
    ISImageFieldEx1: TISImageFieldEx;
    ISTextField1: TISTextField;
    Layout1: TLayout;
    ISTextField2: TISTextField;
    ISSpeedButtonField1: TISSpeedButtonField;
    ISSpeedButtonField2: TISSpeedButtonField;
    ISTextField3: TISTextField;
    ISDownload1: TISDownload;
    ISWorkField1: TISWorkField;
    ISPlaceHolder1: TISPlaceHolder;
    Card2: TISDataCard;
    ISSpeedButtonField3: TISSpeedButtonField;
    ISSpeedButtonField4: TISSpeedButtonField;
    ISTextField4: TISTextField;
    ISTextField5: TISTextField;
    ISTextField6: TISTextField;
    ISImageFieldEx2: TISImageFieldEx;
    ISWorkField2: TISWorkField;
    ISWorkField3: TISWorkField;
    ISWorkField4: TISWorkField;
    ISSideScroll1: TISSideScroll;
    Msg: TISMessageDlg;
    ISBadge1: TISBadge;
    procedure LayoutListaActivate(Sender: TObject);
    procedure LayoutListaDeactivate(Sender: TObject);
    procedure ListaGetCard(Sender: TObject; aRecord : TISDataCardRecord; Var aCard: TISCustomDataCard);
    procedure Card2LoadRecord(Sender: TObject);
    procedure ISSpeedButtonField3Clicked(Sender: TObject);
    procedure ISIconTextButtonField1Clicked(Sender: TObject);
    procedure ISSpeedButtonField4Clicked(Sender: TObject);
  private
    Count : Integer;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Card2LoadRecord(Sender: TObject);
Var
   C : TISCustomDataCard;
begin
C := Sender As TISCustomDataCard;
if C.FieldByName('detach').AsBoolean  then
   C.FieldByName('foto').AsString := 'https://app.jusimperium.com.br/moveis/d'+C.FieldByName('id').AsString+'.png'
Else
   C.FieldByName('foto').AsString := 'https://app.jusimperium.com.br/moveis/'+C.FieldByName('id').AsString+'.png';
end;

procedure TForm5.ISIconTextButtonField1Clicked(Sender: TObject);
Var
   a : Integer;
begin
Msg.MessageYesNo('mmmm', 'aaaaaa',
   Procedure
   Begin
   End);
End;

procedure TForm5.ISSpeedButtonField3Clicked(Sender: TObject);
begin
Inc(Count);
Log.d('Button star strema Count = '+Count.ToString);
end;

procedure TForm5.ISSpeedButtonField4Clicked(Sender: TObject);
begin
Inc(Count);
Log.d('Button sort Count = '+Count.ToString);
end;

procedure TForm5.LayoutListaActivate(Sender: TObject);
begin
TThread.CreateAnonymousThread(
   procedure
   Begin
   Lista.Clear;
   Lista.BeginUpdate;
   Lista.LoadFromJsonArray(Nil, 'https://app.jusimperium.com.br/moveis/list.json');
   Lista.EndUpdate;
   End).Start;
end;

procedure TForm5.LayoutListaDeactivate(Sender: TObject);
begin
Lista.Clear;
Count := 0;
end;

procedure TForm5.ListaGetCard(Sender: TObject; aRecord : TISDataCardRecord; Var aCard: TISCustomDataCard);
begin
if aRecord.FieldByName('detach').AsBoolean then
   aCard := Card2
Else
   aCard := Card;
end;

end.
