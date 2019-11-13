unit EditBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls;

type
  TForm7 = class(TForm)
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Admin, InputDataBarang;

{$R *.dfm}

procedure TForm7.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Barang WHERE Kode="'+kodebarang+'"');
  ADOQuery1.Open;
  if(ADOQuery1.Recordcount=1)
    THEN
      begin
        Edit1.Text := ADOQuery1.FieldValues['Kode'];
        Edit2.Text := ADOQuery1.FieldValues['Nama_Barang'];
        Edit3.Text := ADOQuery1.FieldValues['Harga_Beli'];
        Edit4.Text := ADOQuery1.FieldValues['Harga'];
        Edit6.Text := ADOQuery1.FieldValues['Diskon'];
      end
      ELSE
        begin
          Showmessage('Data Tidak Ditemukan!');
          Close;
        end;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  if(edit1.Text='') THEN Showmessage('Kode Barang Masih Kosong!') else
  if(edit2.Text='') THEN Showmessage('Nama Barang Masih Kosong!') else
  if(edit3.Text='') THEN Showmessage('Harga Modal Masih Kosong!') else
  if(edit4.Text='') THEN Showmessage('Harga Jual Masih Kosong!') else
  if(edit6.Text='') THEN Showmessage('Diskon Masih Kosong!') else
  begin
    ADOQuery1.Edit;
    ADOQuery1.FieldByName('Kode').AsString := Edit1.Text;
    ADOQuery1.FieldByName('Nama_Barang').AsString := Edit2.Text;
    ADOQuery1.FieldByName('Harga_Beli').AsString := Edit3.Text;
    ADOQuery1.FieldByName('Harga').AsString := Edit4.Text;
    ADOQuery1.FieldByName('Diskon').AsString := Edit6.Text;
    ADOQuery1.Post;
    form4.perbarui;
    Showmessage('Data Sukses Diperbarui');
    close;
  end;
end;

procedure TForm7.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
