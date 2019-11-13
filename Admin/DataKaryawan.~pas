unit DataKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pngimage, ExtCtrls, ADODB, DB, Grids, XpMan,
  frxpngimage, ComCtrls, Menus;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit5: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    StringGrid1: TStringGrid;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    Manage1: TMenuItem;
    Hapus1: TMenuItem;
    procedure Image2Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure perbarui;
    procedure Edit5Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure cari;
    procedure hapususr;
    procedure masukandata;
    procedure managedata;
    procedure Manage1Click(Sender: TObject);
    procedure Hapus1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  username1: string;
implementation

uses Admin, EditKaryawan;

{$R *.dfm}

function SetCueBanner(const Edit: TEdit; const Placeholder: String): Boolean;
const EM_SETCUEBANNER = $1501;
var UniStr: WideString;
begin
  UniStr := Placeholder;
  SendMessage(Edit.Handle, EM_SETCUEBANNER, WParam(True),LParam(UniStr));
  Result := GetLastError() = ERROR_SUCCESS;
end;

procedure TForm3.managedata;
begin
  label1.Visible := false;
  label2.Visible := false;
  label3.Visible := false;
  label4.Visible := false;
  label5.Visible := false;
  edit1.Visible := false;
  datetimepicker1.Visible := false;
  edit3.Visible := false;
  edit4.Visible := false;
  combobox1.Visible := false;
  BitBtn1.visible := false;
  BitBtn2.visible := false;
  button1.Visible := false;
  stringgrid1.Visible := true;
  edit5.visible := true;
  image1.Visible := true;
end;

procedure TForm3.masukandata;
begin
  label1.Visible := true;
  label2.Visible := true;
  label3.Visible := true;
  label4.Visible := true;
  label5.Visible := true;
  edit1.Visible := true;
  datetimepicker1.Visible := true;
  edit3.Visible := true;
  edit4.Visible := true;
  combobox1.Visible := true;
  BitBtn1.visible := true;
  BitBtn2.visible := true;
  button1.Visible := true;
  stringgrid1.Visible := false;
  edit5.visible := false;
  image1.Visible := false;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
  managedata;
end;

procedure TForm3.Label7Click(Sender: TObject);
begin
  managedata;
end;

procedure TForm3.Image3Click(Sender: TObject);
begin
  masukandata;
end;

procedure TForm3.Label6Click(Sender: TObject);
begin
  masukandata;
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
  cari;
end;

procedure TForm3.cari;
var i :integer;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataKaryawan WHERE Nama LIKE' + QuotedStr('%' + Edit5.Text + '%'));
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
        IF(ADOQuery1.RecordCount<=8)
          THEN
            stringgrid1.Height:= (ADOQuery1.RecordCount*26)+26
          ELSE IF(ADOQuery1.RecordCount>=9)
            THEN
              stringgrid1.Height:= 241;
        for i := 1 to ADOQuery1.RecordCount do
          begin
            stringgrid1.Cells[0,i] := ADOQuery1.FieldValues['ID'];
            stringgrid1.Cells[1,i] := ADOQuery1.FieldValues['Nama'];
            stringgrid1.Cells[2,i] := ADOQuery1.FieldValues['Username'];
            stringgrid1.Cells[3,i] := ADOQuery1.FieldValues['Level'];
            stringgrid1.Cells[4,i] := ADOQuery1.FieldValues['Tanggal_Daftar'];
            ADOQuery1.Next;
          end;
      end;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  perbarui;
end;

procedure TForm3.perbarui;
var i : integer;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataKaryawan ORDER BY ID ASC');
  ADOQuery1.Open;
  IF(ADOQuery1.RecordCount<=8)
    THEN
      stringgrid1.Height:= (ADOQuery1.RecordCount*26)+26
    ELSE IF(ADOQuery1.RecordCount>=9)
      THEN
        stringgrid1.Height:= 241;
  stringgrid1.RowCount := ADOQuery1.RecordCount+1;
  label9.caption := inttostr(ADOQuery1.RecordCount);
  for i := 1 to ADOQuery1.RecordCount do
    begin
      stringgrid1.Cells[0,i] := ADOQuery1.FieldValues['ID'];
      stringgrid1.Cells[1,i] := ADOQuery1.FieldValues['Nama'];
      stringgrid1.Cells[2,i] := ADOQuery1.FieldValues['Username'];
      stringgrid1.Cells[3,i] := ADOQuery1.FieldValues['Level'];
      stringgrid1.Cells[4,i] := ADOQuery1.FieldValues['Tanggal_Daftar'];
      ADOQuery1.Next;
    end;
  //Memanggil Fungsi Placeholder
  SetCueBanner(Edit5, 'Masukkan Username');
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  //Button Simpan
  IF(Edit1.Text = '')
    THEN
      Showmessage('Nama Karyawan Masih Kosong!')

    ELSE IF(Edit3.Text = '')
      THEN
        Showmessage('Username Masih Kosong!')
    ELSE IF(Edit1.Text = '')
      THEN
        Showmessage('Password Masih Kosong!')
    ELSE
      begin
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('SELECT * FROM DataKaryawan WHERE Username=' + QuotedStr(Edit3.Text));
        ADOQuery1.Open;
        IF(ADOQuery1.RecordCount=0)
          THEN
           begin
            ADOQuery1.Append;
	          ADOQuery1.FieldByName('Nama').AsString:=Edit1.Text;
	          ADOQuery1.FieldByName('Tanggal_Lahir').AsString:=FormatDateTime('dd/mm/yyy',datetimepicker1.DateTime);
	          ADOQuery1.FieldByName('Level').AsString:=Combobox1.Text;
	          ADOQuery1.FieldByName('Tanggal_Daftar').AsString:=DateToStr(Now);
            ADOQuery1.FieldByName('Username').AsString:=Edit3.Text;
	          ADOQuery1.FieldByName('Password').AsString:=Edit4.Text;
	          ADOQuery1.Post;
            Showmessage('Sukses Menambahkan Karyawan');
            Edit1.Clear;
            edit3.clear;
            edit4.clear;
            combobox1.Text := 'Pemilik';
            perbarui;
          end
          ELSE IF(ADOQuery1.RecordCount=1)
            THEN
              begin
                Showmessage('Username Sudah Ada!');
                Edit3.Clear;
              end;
  end;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  //Button Keluar
  Close;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  //Button Cek
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT Username FROM DataKaryawan WHERE Username =' + QuotedStr(Edit3.Text));
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount=0)
    THEN
      begin
      if(edit3.Text = '')
      THEN
        Showmessage('Username Kosong!')
      Else
        Showmessage('Username Tersedia')
      end
    ELSE if(ADOQuery1.RecordCount=1)
      THEN
      begin
        Showmessage('Username tidak Tersedia!');
        Edit3.Clear;
      end;
end;

procedure TForm3.hapususr;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataKaryawan WHERE Username ="'+username1+'"');
  ADOQuery1.Open;
  if(ADOQuery1.Recordcount=1)
    THEN
      ADOQuery1.Delete
    ELSE
      Showmessage('Data Tidak Ditemukan!');
  perbarui;
end;

procedure TForm3.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  resize:=false;
end;

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  StringGrid1.Options := StringGrid1.Options + [goRowSelect];
  Stringgrid1.Selection:=TGridRect(Rect(1,aRow ,6 ,aRow));
  username1 := StringGrid1.Cells[2,aRow];
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  label1.Top := 115;
  label1.Left := 16;
  label2.Top := 163;
  label2.Left := 16;
  label3.Top := 215;
  label3.Left := 16;
  label4.Top := 263;
  label4.Left := 16;
  label5.Top := 310;
  label5.Left := 16;
  edit1.Top := 112;
  edit1.Left := 240;
  datetimepicker1.Top := 160;
  datetimepicker1.Left := 240;
  edit3.Top := 256;
  button1.Top := 255;
  button1.left := 385;
  edit3.Left := 240;
  edit4.Top := 304;
  edit4.Left := 240;
  combobox1.Top := 208;
  combobox1.Left := 240;
  Bitbtn1.Top := 360;
  Bitbtn1.Left := 240;
  Bitbtn2.Top := 360;
  Bitbtn2.Left := 130;
  stringgrid1.Visible := false;
  edit5.visible := false;
  image1.Visible := false;
  stringgrid1.ColCount := 5;
  stringgrid1.Cells[0,0] := 'ID';
  stringgrid1.Cells[1,0] := 'Nama';
  stringgrid1.Cells[2,0] := 'Username';
  stringgrid1.Cells[3,0] := 'Level';
  stringgrid1.Cells[4,0] := 'Tanggal Daftar';
  stringgrid1.ColWidths[0] := 30;
  stringgrid1.ColWidths[1] := 120;
  stringgrid1.ColWidths[2] := 100;
  stringgrid1.ColWidths[3] := 90;
  stringgrid1.ColWidths[4] := 85;
end;

procedure TForm3.Edit5Change(Sender: TObject);
begin
  if(edit5.text='') THEN perbarui;
end;

procedure TForm3.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if(key in[#13]) THEN cari;
end;

procedure TForm3.Manage1Click(Sender: TObject);
begin
  if(username1 <>'') THEN
  form5.showmodal else
  showmessage('Data belum Dipilih!');
end;

procedure TForm3.Hapus1Click(Sender: TObject);
begin
  if(username1 <>'')
    THEN
      begin
        if messagedlg('Anda yakin akan menghapus Karyawan dengan Username '+username1+'',mtconfirmation,[mbYes,mbNo],0)=mrYes
          then
            hapususr;
      end
      else
        showmessage('Data belum Dipilih!');
end;

end.
