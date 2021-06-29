unit uCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ISMessageDlg, FMX.ISBase, FMX.ISLayouts, FMX.Layouts,
  FMX.ISCamera, FMX.ISAndroid.Permissions;

type
  TForm5 = class(TForm)
    Cam: TISCamera;
    ISParentLayout1: TISParentLayout;
    ISChildrenLayout1: TISChildrenLayout;
    Msg: TISMessageDlg;
    ISAndroidPermissions1: TISAndroidPermissions;
    procedure CamTakeImage(Sender: TObject; aBitmap: TBitmap);
    procedure ISChildrenLayout1ClickButton2(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.CamTakeImage(Sender: TObject; aBitmap: TBitmap);
begin
Cam.Stop;
Msg.MessageOk('Câmera', 'No evento TakeImage, vc pega o bitmap e processa como desejar.',
   Procedure
   Begin
   Cam.Start;
   End);
end;

procedure TForm5.ISChildrenLayout1ClickButton2(Sender: TObject);
begin
If Cam.IsActive Then Cam.Stop Else Cam.Start;
end;

end.
