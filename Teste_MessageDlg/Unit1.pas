unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISMessageDlg, FMX.Objects, FMX.ISBase,
  FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons, FMX.ISLayouts, FMX.Layouts, FMX.ISEditEx, FMX.ISObjects;

type
  TForm5 = class(TForm)
    ISParentLayout1: TISParentLayout;
    ISChildrenLayout1: TISChildrenLayout;
    ISTextButton1: TISTextButton;
    Msg: TISMessageDlg;
    ISButtonStyle1: TISButtonStyle;
    ISEditEX1: TISEditEX;
    ISEditEX2: TISEditEX;
    ISEditEX3: TISEditEX;
    ISTextButton2: TISTextButton;
    ISTextButton3: TISTextButton;
    ISTextButton4: TISTextButton;
    Layout1: TLayout;
    ISTextButton5: TISTextButton;
    procedure ISTextButton1Clicked(Sender: TObject);
    procedure ISTextButton2Clicked(Sender: TObject);
    procedure ISTextButton3Clicked(Sender: TObject);
    procedure ISTextButton4Clicked(Sender: TObject);
    procedure ISTextButton5Clicked(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.ISTextButton1Clicked(Sender: TObject);
begin
Msg.MessageYesNo('Texte OK', 'Texto Ok',
   Procedure
   Begin
   Msg.MessageOk('Novo teste', 'Você clicou em SIM na mensagem anterior');
   End,
   Procedure
   Begin
   Msg.MessageOk('Novo teste', 'Você clicou em NÃO na mensagem anterior');
   End);
end;

procedure TForm5.ISTextButton2Clicked(Sender: TObject);
begin
ISEditEX1.Error := Not ISEditEX1.Error;
ISEditEX1.SetFocus;
end;

procedure TForm5.ISTextButton3Clicked(Sender: TObject);
begin
ISEditEX2.SetFocus;
end;

procedure TForm5.ISTextButton4Clicked(Sender: TObject);
begin
ISEditEX3.SetFocus;
end;

procedure TForm5.ISTextButton5Clicked(Sender: TObject);
begin
Msg.ShowInformation('Titulo', 'Texto', False,
   Procedure
   Begin
   End);
end;

end.
