unit EditKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ComCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  hapus:string;
implementation

uses DataKaryawan, Admin;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataKaryawan WHERE Username ="'+username1+'"');
  ADOQuery1.Open;
  if(ADOQuery1.Recordcount=1)
    THEN
      begin
        label2.Caption := ADOQuery1.FieldValues['Username'];
        Edit1.Text := ADOQuery1.FieldValues['Nama'];
        DateTimePicker1.Date := strtodate(ADOQuery1.FieldValues['Tanggal_Lahir']);
        Combobox1.Text := ADOQuery1.FieldValues['Level'];
      end
      ELSE
        begin
          Showmessage('Data Tidak Ditemukan!');
          Close;
        end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
if(Edit1.Text = '')
    THEN
      Showmessage('Nama Karyawan Kosong!')

      ELSE if(Edit3.Text = '')
      THEN
        Showmessage('Password Kosong!')
      ELSE
        begin
          ADOQuery1.Edit;
          ADOQuery1.FieldByName('Nama').AsString:=Edit1.Text;
          ADOQuery1.FieldByName('Tanggal_Lahir').AsString:=FormatDateTime('dd/mm/yyyy',DateTimePicker1.DateTime);
          ADOQuery1.FieldByName('Level').AsString:=Combobox1.Text;
          ADOQuery1.FieldByName('Password').AsString:=Edit3.Text;
          ADOQuery1.Post;
          form3.perbarui;
          Showmessage('Data Karyawan Telah Diperbarui');
          close;
        end;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm5.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
