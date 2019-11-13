unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  username : string;
implementation

uses Utama;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Password,Username,Nama FROM DataKaryawan WHERE Username='+quotedstr(edit1.text));
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount=0)
    THEN
      Showmessage('Password atau Username yang Anda Masukkan Salah!')
    ELSE
        begin
          if(ADOQuery1.FieldValues['Password']=edit2.Text)
            THEN
              begin
                Close;
                username := ADOQuery1.FieldValues['Nama'];
                form1.show;
              end
            ELSE
              Showmessage('Password atau Username yang Anda Masukkan Salah!');
        end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if(key in[#13])
    THEN
      begin
        key:=#0;
        button1.click;
      end;
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if(key in[#13])
      THEN
        begin
          key:=#0;
          button1.click;
        end;
end;

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
