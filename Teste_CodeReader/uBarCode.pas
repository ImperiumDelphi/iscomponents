unit uBarCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ISCodeReader,
  FMX.ISAndroid.Permissions, FMX.Objects, FMX.Media, FMX.ISAlcinoe, FMX.ISBase, FMX.ISBase.Presented, FMX.ISBaseButtons,
  FMX.ISButtons, FMX.Layouts, FMX.ISGridLayout;

type
  TformBarCode = class(TForm)
    Scan: TISCodeReader;
    ISAndroidPermissions1: TISAndroidPermissions;
    Code: TText;
    ISGridLayout1: TISGridLayout;
    ISTextButton1: TISIconTextButton;
    ISTextButton2: TISIconTextButton;
    procedure ScanCodeReady(aCode: string);
    procedure ISTextButton1Clicked(Sender: TObject);
    procedure ISTextButton2Clicked(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formBarCode: TformBarCode;

implementation

{$R *.fmx}

procedure TformBarCode.ISTextButton1Clicked(Sender: TObject);
begin
Scan.Start;
end;

procedure TformBarCode.ISTextButton2Clicked(Sender: TObject);
begin
Scan.Stop;
end;

procedure TformBarCode.ScanCodeReady(aCode: string);
begin
Code.Text := aCode;
end;

end.
