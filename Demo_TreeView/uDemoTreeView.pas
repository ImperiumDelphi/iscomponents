unit uDemoTreeView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Generics.Collections, FMX.Layouts, FMX.ISVertScrollBox,
  FMX.ISTreeView, FMX.Objects, FMX.ISBase, FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons, FMX.ISLayouts,
  FMX.ISMessageDlg, FMX.ISObjects;

type
  TForm3 = class(TForm)
    ISParentLayout1: TISParentLayout;
    ISChildrenLayout1: TISChildrenLayout;
    ISTextButton1: TISTextButton;
    Tree: TISTreeView;
    Msg: TISMessageDlg;
    procedure ISTextButton1Clicked(Sender: TObject);
    procedure TreeClickItem(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.ISTextButton1Clicked(Sender: TObject);

   Function CreateItem(Texto : String) : TISTreeViewItem;
   Begin
   Result           := TISTreeViewItem.Create(Self);
   Result.Text      := Texto;
   End;

Var
   Cat1, Cat2,
   Sub1        : TIStreeViewItem;
begin
Cat1 := CreateItem('Categoria 1');
Cat2 := CreateItem('Categoria 2');
Sub1 := CreateItem('SubItem 1');



Tree.BeginUpdate;
Tree.ClearItems;

Tree.AddItem(Cat1);
Tree.AddItem(Cat2);

Cat1.AddItem(Sub1);
Sub1.AddItem(CreateItem('Sub Sub 1'));
Sub1.AddItem(CreateItem('Sub Sub 2'));
Sub1.AddItem(CreateItem('Sub Sub 3'));
Sub1.AddItem(CreateItem('Sub Sub 4'));
Sub1.AddItem(CreateItem('Sub Sub 5'));
Sub1.AddItem(CreateItem('Sub Sub 6'));

Cat2.AddItem(CreateItem('Sub 1'));
Cat2.AddItem(CreateItem('Sub 2'));
Cat2.AddItem(CreateItem('Sub 3'));
Cat2.AddItem(CreateItem('Sub 4'));
Cat2.AddItem(CreateItem('Sub 5'));

Tree.EndUpdate;

end;

procedure TForm3.TreeClickItem(Sender: TObject);
begin
Msg.MessageOk('TreeView', 'Clicou no item '+(Sender As TISTreeViewItem).Text);

end;

end.
