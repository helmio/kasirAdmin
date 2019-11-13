unit Admin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, pngimage, StdCtrls, Buttons, DB, ADODB,
  Menus, frxpngimage;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image5: TImage;
    Image6: TImage;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label13: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Label3: TLabel;
    Image4: TImage;
    Image7: TImage;
    Image8: TImage;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label12: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure gambar1;
    procedure gambar2;
    procedure gambar4;
    procedure gambar5;
    procedure gambar6;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  serial : string;
implementation

uses SerialNumber, DataKaryawan, InputDataBarang, LaporanTransaksi,
  PengaturanLanjut, Login;

{$R *.dfm}

procedure TForm1.Image1Click(Sender: TObject);
begin
  gambar1;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  gambar6;
end;

procedure TForm1.gambar1;
begin
  form3.showmodal;
end;

procedure TForm1.gambar2;
begin
  form4.showmodal;
end;

procedure TForm1.gambar4;
begin
  form9.showmodal;
end;

procedure TForm1.gambar5;
begin
  Application.Terminate;
end;

procedure TForm1.gambar6;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Serial FROM DataToko');
  ADOQuery1.Open;
  if(ADOQuery1.FieldValues['Serial'] = null) OR (ADOQuery1.FieldValues['Serial'] <> serial) 
    THEN
      form2.showmodal
    ELSE
      showmessage('Anda Telah TErdaftar, Terimakasih :)');
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  gambar5;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  gambar2;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  //Button Keluar (Tab Pengaturan)
  Application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  //Button Reset (Tab Pengaturan)
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  //Button Simpan (Tab Pengaturan)
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataToko WHERE ID = 1');
  ADOQuery1.Open;
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('Nama_Toko').AsString:=Edit1.Text;
  ADOQuery1.FieldByName('Deskripsi_Toko').AsString:=Edit2.Text;
  ADOQuery1.FieldByName('Alamat').AsString:=Edit3.Text;
  ADOQuery1.FieldByName('Nomor_Telepon').AsString:=Edit4.Text;
  ADOQuery1.FieldByName('Nama_Pemilik').AsString:=Edit5.Text;
  ADOQuery1.Post;
  Showmessage('Sukses Memperbarui Data Toko');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  //Form Activate
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataToko WHERE ID = 1');
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount=1)
    THEN
      begin
        Edit1.Text := ADOQuery1.FieldValues['Nama_Toko'];
        Edit2.Text := ADOQuery1.FieldValues['Deskripsi_Toko'];
        Edit3.Text := ADOQuery1.FieldValues['Alamat'];
        Edit4.Text := ADOQuery1.FieldValues['Nomor_Telepon'];
        Edit5.Text := ADOQuery1.FieldValues['Nama_Pemilik'];
      end;
  serial := '15A7-OP1J-JJ3X-MHHM-1998';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Serial,Password FROM DataToko');
  ADOQuery1.Open;
  if(ADOQuery1.FieldValues['Serial'] <> serial)
    THEN
      form1.Caption := 'Panel Admin (Belum Aktivasi)'
    ELSE
      form1.Caption := 'Panel Admin';
  if(ADOQuery1.FieldValues['Password']='1') THEN form8.showmodal;
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  gambar4;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  gambar6;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  gambar1;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  gambar2;
end;

procedure TForm1.Label13Click(Sender: TObject);
begin
  gambar5;
end;

procedure TForm1.Label14Click(Sender: TObject);
begin
  gambar4;
end;

procedure TForm1.Label12Click(Sender: TObject);
begin
  form6.showmodal;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
