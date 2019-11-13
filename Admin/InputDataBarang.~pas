unit InputDataBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Grids, DB, ADODB, Menus;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label9: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit5: TEdit;
    Image3: TImage;
    StringGrid1: TStringGrid;
    Label13: TLabel;
    ADOQuery1: TADOQuery;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    PopupMenu1: TPopupMenu;
    Menu1: TMenuItem;
    Hapus1: TMenuItem;
    Label3: TLabel;
    Label14: TLabel;
    Edit4: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure perbarui;
    procedure FormActivate(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure cari;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Label11Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure managebarang;
    procedure masukandata;
    procedure Menu1Click(Sender: TObject);
    procedure Hapus1Click(Sender: TObject);
    procedure hapusbarang;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Label14Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  kodebarang,ukuran: String;
implementation

uses Admin, EditBarang, DataKaryawan, LaporanTransaksi;

{$R *.dfm}

procedure TForm4.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit6.Text := '0';
  Edit1.SetFocus;
end;

procedure TForm4.Edit6Click(Sender: TObject);
begin
  edit6.SelectAll;
end;

procedure TForm4.masukandata;
begin
  label5.show;
  label6.show;
  label7.show;
  label8.show;
  label9.show;
  Edit1.Show;
  Edit2.Show;
  Edit3.Show;
  Edit4.Show;
  Button1.Show;
  Button2.Show;
  Button3.Show;
  label13.show;
  edit6.show;
  label12.Hide;
  Edit5.Hide;
  Image3.Hide;
  Stringgrid1.Hide;
  form4.width := 521;
  ukuran := '0';
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  ukuran := '1';
  masukandata;
end;

procedure TForm4.managebarang;
begin
  label5.hide;
  label6.hide;
  label7.hide;
  label8.hide;
  label9.hide;
  Edit1.hide;
  Edit2.hide;
  Edit3.hide;
  Edit4.hide;
  Button1.hide;
  Button2.hide;
  Button3.hide;
  label13.Hide;
  edit6.hide;
  label12.show;
  Edit5.Show;
  Image3.Show;
  Stringgrid1.Show;
  form4.Width:= 575;
  ukuran := '0';
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
  ukuran := '1';
  managebarang;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  label5.Top := 94;
  label6.Top := 135;
  label7.Top := 176;
  label8.Top := 258;
  label13.Top := 217;
  label9.Top := 35;
  Edit1.Top := 91;
  Edit2.Top := 131;
  Edit3.Top := 171;
  Edit6.Top := 251;
  Edit4.Top := 211;
  Button1.Top := 300;
  Button2.Top := 300;
  Button3.Top := 300;
  label5.Left := 56;
  label6.Left := 56;
  label7.Left := 56;
  label8.Left := 56;
  label13.Left := 56;
  label9.Left := 167;
  Edit1.Left := 248;
  Edit2.Left := 248;
  Edit3.Left := 248;
  Edit4.Left := 248;
  Edit6.Left := 248;
  Button1.Left := 96;
  Button2.Left := 200;
  Button3.Left := 304;
  //Hide Slide 2 Ketika Form Create
  label12.Hide;
  Edit5.Hide;
  Image3.Hide;
  Stringgrid1.Hide;
  //End Hide
  stringgrid1.Cells[0,0] := 'Kode';
  stringgrid1.Cells[1,0] := 'Nama Barang';
  stringgrid1.Cells[2,0] := 'Harga Beli';
  stringgrid1.Cells[3,0] := 'Harga Jual';
  stringgrid1.Cells[4,0] := 'DSC(%)';
  stringgrid1.ColWidths[0] := 105;
  stringgrid1.ColWidths[1] := 190;
  stringgrid1.ColWidths[2] := 80;
  stringgrid1.ColWidths[3] := 80;
  stringgrid1.ColWidths[4] := 45;
end;

procedure TForm4.Image3Click(Sender: TObject);
begin
  cari;
end;

procedure TForm4.cari;
var i :integer;
begin
  //Button Search
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Barang WHERE Nama_Barang LIKE' + QuotedStr('%' + Edit5.Text + '%'));
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount=0)
    THEN
    begin
      showmessage('Data tidak ditemukan!');
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
    end
    ELSE if(ADOQuery1.RecordCount>=1)
    THEN
      begin
        stringgrid1.RowCount := ADOQuery1.RecordCount+1;
        for i := 1 to ADOQuery1.RecordCount do
        begin
          stringgrid1.Cells[0,i] := ADOQuery1.FieldValues['Kode'];
          stringgrid1.Cells[1,i] := ADOQuery1.FieldValues['Nama_Barang'];
          stringgrid1.Cells[2,i] := ADOQuery1.FieldValues['Harga'];
          stringgrid1.Cells[3,i] := ADOQuery1.FieldValues['Harga_Beli'];
          stringgrid1.Cells[4,i] := ADOQuery1.FieldValues['Diskon'];
          ADOQuery1.Next;
        end;
      end;
end;

procedure TForm4.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  StringGrid1.Options := StringGrid1.Options + [goRowSelect];
  Stringgrid1.Selection:=TGridRect(Rect(0,aRow ,6 ,aRow));
  kodebarang := StringGrid1.Cells[0,aRow];
end;

procedure TForm4.perbarui;
var i : integer;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Barang ORDER BY ID ASC');
  ADOQuery1.Open;
  label15.caption := inttostr(ADOQuery1.RecordCount);
  //Jika Jumlah Barang Kurang dari Sama Dengan 8
  IF(ADOQuery1.RecordCount<=8)
    THEN
      stringgrid1.Height:= (ADOQuery1.RecordCount*26)+26
    //Jika Jumlah Barang Lebih dari Sama Dengan 9
    ELSE IF(ADOQuery1.RecordCount>=9)
      THEN
        stringgrid1.Height:= 225;
  //Stringgrid
  stringgrid1.RowCount := ADOQuery1.RecordCount+1;
  for i := 1 to ADOQuery1.RecordCount do
    begin
      stringgrid1.Cells[0,i] := ADOQuery1.FieldValues['Kode'];
      stringgrid1.Cells[1,i] := ADOQuery1.FieldValues['Nama_Barang'];
      stringgrid1.Cells[2,i] := ADOQuery1.FieldValues['Harga'];
      stringgrid1.Cells[3,i] := ADOQuery1.FieldValues['Harga_Beli'];
      stringgrid1.Cells[4,i] := ADOQuery1.FieldValues['Diskon'];
      ADOQuery1.Next;
    end;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT SUM(Jumlah) AS total FROM Transaksi');
  ADOQuery1.Open;
  label16.caption := ADOQuery1.FieldValues['total'];
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT ID FROM DataKaryawan');
  ADOQuery1.Open;
  label17.caption := inttostr(ADOQuery1.Recordcount);
  label3.Left := label16.Width + label16.Left + 8;
  label14.Left := label17.Width + label17.Left + 8;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if(edit1.Text = '') THEN Showmessage('Kode Barang Masih Kosong!') else
  if(edit2.Text = '') THEN Showmessage('Nama Barang Masih Kosong!') else
  if(edit3.Text = '') THEN Showmessage('Harga Modal Masih Kosong!') else
  if(edit4.Text = '') THEN Showmessage('Harga Jual Masih Kosong!') else
  if(edit6.Text = '') THEN Showmessage('Diskon Masih Kosong!') else
    begin
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('SELECT * FROM Barang WHERE Kode=' +Quotedstr(edit1.Text));
      ADOQuery1.Open;
      if(ADOQuery1.Recordcount=1)
        THEN
          begin
            Showmessage('Barang Sudah Ada!');
            edit1.clear;
            edit2.clear;
            edit3.clear;
            edit4.clear;
            edit6.text := '0';
          end
          ELSE
            begin
              ADOQuery1.Append;
              ADOQuery1.FieldByName('Kode').AsString := Edit1.Text;
              ADOQuery1.FieldByName('Nama_Barang').AsString := Edit2.Text;
              ADOQuery1.FieldByName('Harga_Beli').AsString := Edit3.Text;
              ADOQuery1.FieldByName('Harga').AsString := Edit4.Text;
              ADOQuery1.FieldByName('Diskon').AsString := Edit6.Text;
              ADOQuery1.Post;
              Showmessage('Sukses Menambahkan Barang');
              perbarui;
            end;
    end;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  perbarui;
end;

procedure TForm4.Edit5Change(Sender: TObject);
begin
  if(edit5.Text ='') THEN perbarui;
end;

procedure TForm4.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if(key in[#13]) THEN cari;
end;

procedure TForm4.Label11Click(Sender: TObject);
begin
  managebarang;
end;

procedure TForm4.Label10Click(Sender: TObject);
begin
  masukandata;
end;

procedure TForm4.Menu1Click(Sender: TObject);
begin
  if(kodebarang <> '')
    THEN
        form7.ShowModal
    else
      showmessage('Data belum Dipilih!');
end;

procedure TForm4.hapusbarang;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Barang WHERE Kode ="'+kodebarang+'"');
  ADOQuery1.Open;
  if(ADOQuery1.Recordcount=1)
    THEN
      ADOQuery1.Delete
    ELSE
      Showmessage('Data Tidak Ditemukan!');
  perbarui;
end;

procedure TForm4.Hapus1Click(Sender: TObject);
begin
  if(kodebarang <> '')
    THEN
      begin
        if messagedlg('Anda yakin akan menghapus Karyawan dengan Kode Barang '+kodebarang+'',mtconfirmation,[mbYes,mbNo],0)=mrYes
          then
            hapusbarang;
      end
      else
        showmessage('Data belum Dipilih!');
end;


procedure TForm4.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if(ukuran<>'1')
    THEN
      resize:=false
    else
      resize:=true;
end;

procedure TForm4.Label14Click(Sender: TObject);
begin
  close;
  form3.showmodal;
end;

procedure TForm4.Label3Click(Sender: TObject);
begin
  close;
  form9.showmodal;
end;

end.
