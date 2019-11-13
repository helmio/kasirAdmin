unit SerialNumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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
  kyw:string;
implementation

uses Admin;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if(edit1.text = serial)
    THEN
      begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT * FROM DataToko WHERE ID = 1');
        ADOQuery1.Open;
        IF(ADOQuery1.RecordCount = 0)
          THEN
            begin
              ADOQuery1.Append;
              ADOQuery1.FieldByName('Nama_Toko').AsString:='';
	            ADOQuery1.FieldByName('Deskripsi_Toko').AsString:='';
              ADOQuery1.FieldByName('Alamat').AsString:='';
	            ADOQuery1.FieldByName('Nomor_Telepon').AsString:='';
              ADOQuery1.FieldByName('Nama_Pemilik').AsString:='';
              ADOQuery1.FieldByName('Username_Pemilik').AsString:='';
              ADOQuery1.FieldByName('Password_Pemilik').AsString:='';
              ADOQuery1.FieldByName('Password').AsString:='0';
              ADOQuery1.FieldByName('Karyawan').AsString:='0';
              ADOQuery1.FieldByName('Cetak_Struk').AsString:='0';
              ADOQuery1.FieldByName('Serial').AsString:=serial;
              ADOQuery1.Post;
              showmessage('Anda telah terdaftar, Terimakasih :)');
              form1.Caption := 'Panel Admin';
            end
            ELSE IF(ADOQuery1.RecordCount = 1)
              THEN
                begin
                  ADOQuery1.Edit;
                  ADOQuery1.FieldByName('Serial').AsString:=Edit1.Text;
                  ADOQuery1.Post;
                end;
      end
    else
      showmessage('Serial Number yang Anda Masukan Salah!');
end;



procedure TForm2.Edit1Change(Sender: TObject);
var i,a:integer;
begin
  edit1.MaxLength := 24;
  i:=0;
  a:=4;
  while(i+4<=length(edit1.Text))do
  begin
  if(length(edit1.text) MOD 4 = i) AND (length(edit1.text)= a) AND (kyw='0') THEN
    begin
      edit1.Text := edit1.Text+'-';
      edit1.selstart:= length(edit1.Text);
    end;
    i:=i+1;
    a:=a+5;
    kyw:='0';
  end;

end;
procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if(key in([#8])) THEN kyw:='1' else kyw:='0';
end;

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
