unit LaporanTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, ADODB, pngimage, ExtCtrls, ComCtrls, Menus;

type
  TForm9 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    Return1: TMenuItem;
    ComboBox1: TComboBox;
    ReturnSemua1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure data;
    procedure clear;
    procedure ComboBox1Change(Sender: TObject);
    procedure langsung;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure perbarui;
    procedure untung;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Return1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ReturnSemua1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  harga_beli,harga_jual,jumlah_untung,baris:integer;
  keyword:string;
implementation

uses Admin;

{$R *.dfm}

procedure TForm9.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0] := 'Kode Transaksi';
  stringgrid1.Cells[1,0] := 'Nama Barang';
  stringgrid1.Cells[2,0] := 'Harga Beli';
  stringgrid1.Cells[3,0] := 'Harga Jual';
  stringgrid1.Cells[4,0] := 'Pcs';
  stringgrid1.Cells[5,0] := 'Dsc(%)';
  stringgrid1.Cells[6,0] := 'Waktu';
  stringgrid1.ColWidths [0] := 100;
  stringgrid1.ColWidths [1] := 250;
  stringgrid1.ColWidths [2] := 65;
  stringgrid1.ColWidths [3] := 65;
  stringgrid1.ColWidths [4] := 40;
  stringgrid1.ColWidths [5] := 45;
  stringgrid1.ColWidths [6] := 110;
  datetimepicker1.Hide;
end;

procedure TForm9.data;
var i,ii,nol:integer;
begin
  i := 1;
  Stringgrid1.RowCount := ADOQuery1.RecordCount+1;
  while(i<=ADOQuery1.RecordCount) do
    begin
      nol := 10 - length(ADOQuery1.FieldValues['ID']);
      for ii:= 1 to nol do
        begin
          stringgrid1.Cells[0,i] := '0'+stringgrid1.Cells[0,i];
          if(ii = nol-1)
            THEN
              stringgrid1.Cells[0,i] := stringgrid1.Cells[0,i]+inttostr(ADOQuery1.FieldValues['ID']);
        end;
      stringgrid1.Cells[1,i] := ADOQuery1.FieldValues['Nama_Barang'];
      stringgrid1.Cells[2,i] := ADOQuery1.FieldValues['Harga_Beli'];
      stringgrid1.Cells[3,i] := ADOQuery1.FieldValues['Harga_Jual'];
      stringgrid1.Cells[4,i] := ADOQuery1.FieldValues['Jumlah'];
      stringgrid1.Cells[5,i] := ADOQuery1.FieldValues['Diskon'];
      stringgrid1.Cells[6,i] := ADOQuery1.FieldValues['Waktu'];
      ADOQuery1.Next;
      i:=i+1;
    end;
end;

procedure TForm9.FormActivate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Transaksi');
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount<=0)
    THEN
      Showmessage('Belum Ada Daftar Transaksi!')
    ELSE IF(ADOQuery1.RecordCount>=1)
      THEN data;
  perbarui;
  untung;
end;

procedure TForm9.untung;
var i:integer;
begin
  i:=1;
  harga_beli := 0;
  Harga_jual := 0;
  while(i<=Stringgrid1.rowcount-1)do
    begin
      harga_beli := harga_beli+strtoint(Stringgrid1.Cells[2,i]);
      harga_jual := harga_jual+strtoint(Stringgrid1.Cells[3,i]);
      i:=i+1;
    end;
  harga_jual := harga_jual;
  harga_beli := harga_beli;
  jumlah_untung := harga_jual-harga_beli;
end;

procedure TForm9.clear;
var i:integer;
begin
  i := 1;
  while(i<=stringgrid1.RowCount)do
    begin
      stringgrid1.Rows[i].Clear;
      i:=i+1;
    end;
end;

procedure TForm9.langsung;
var kategori:string;
begin
  case ComboBox1.ItemIndex of
    0:kategori:='Nama_Barang';
    1:kategori:='ID';
    2:kategori:='Waktu';
  end;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Transaksi WHERE '+kategori+' LIKE'+quotedstr('%' + keyword + '%'));
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount>=1)
    THEN
      begin
        clear;
        data;
      end
      else
        begin
          clear;
          stringgrid1.RowCount := 2;
        end;
end;

procedure TForm9.Edit1Change(Sender: TObject);
begin
  IF(Combobox1.ItemIndex <>1)
    THEN
      begin
        keyword := edit1.Text;
        langsung;
      end;
end;

procedure TForm9.ComboBox1Change(Sender: TObject);
begin
if(combobox1.ItemIndex =2)
    THEN
      begin
        edit1.Hide;
        datetimepicker1.show;
      end
      else
      begin
        edit1.Show;
        datetimepicker1.Hide;
      end;
      edit1.clear;  
end;

procedure TForm9.perbarui;
begin
  untung;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT SUM(Jumlah) AS total FROM Transaksi');
  ADOQuery1.Open;
  label5.caption := inttostr(ADOQuery1.FieldValues['total'])+' Unit';
  label6.caption := 'Rp '+FormatCurr('#,###', StrToCurrDef(inttostr(jumlah_untung), 0));
end;

procedure TForm9.DateTimePicker1Change(Sender: TObject);
begin
  langsung;
  edit1.Text := formatdatetime('dd/mm/yyy', datetimepicker1.datetime);
end;

procedure TForm9.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

procedure TForm9.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if(key in[#13])
  THEN
    begin
      IF(Combobox1.ItemIndex =1)
        THEN
          begin
            keyword := inttostr(strtointdef(edit1.Text,0));
            langsung;
          end;
    end;
end;

procedure TForm9.Return1Click(Sender: TObject);
var kode:string;
begin
  if messagedlg('Return Barang dengan Kode Transaksi '+Stringgrid1.Cells[0,baris]+''+'?',mtconfirmation,[mbYes,mbNo],0)=mrYes
    then
      begin
        kode := inttostr(strtointdef(stringgrid1.cells[0,baris],0));
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT * FROM Transaksi WHERE ID=:ID');
        ADOQuery1.Parameters.Items[0].Value := kode;
        ADOquery1.Open;
        if(strtoint(Stringgrid1.Cells[4,baris])>1)
          THEN
            begin
              ADOQuery1.Edit;
              ADOQuery1.FieldByName('Jumlah').AsString:= ADOQuery1.FieldValues['Jumlah']-1;
              ADOQuery1.Post;
            end
            else
              begin
                ADOQuery1.Delete;
              end;
      end;
end;

procedure TForm9.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  baris := arow;
end;

procedure TForm9.ReturnSemua1Click(Sender: TObject);
var kode:string;
begin
  if messagedlg('Return Semua Barang dengan Kode Transaksi '+Stringgrid1.Cells[0,baris]+''+'?',mtconfirmation,[mbYes,mbNo],0)=mrYes
    then
      begin
        kode := inttostr(strtointdef(stringgrid1.cells[0,baris],0));
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT * FROM Transaksi WHERE ID=:ID');
        ADOQuery1.Parameters.Items[0].Value := kode;
        ADOquery1.Open;
        ADOQuery1.Delete;
      end;
end;

end.
