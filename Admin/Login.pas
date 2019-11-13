unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm8 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    ADOQuery1: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Admin;

{$R *.dfm}

procedure TForm8.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  ADOQuery1.Open;
  IF(ADOQuery1.FieldValues['Username_Pemilik'] = edit1.text)  AND (ADOQuery1.FieldValues['Password_Pemilik'] = Edit2.text) THEN Close ELSE Showmessage('Username atau Password Salah!');
end;

procedure TForm8.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
