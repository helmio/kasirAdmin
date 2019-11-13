unit PengaturanLanjut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls;

type
  TForm6 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Panel2: TPanel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Panel3: TPanel;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
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
  Form6: TForm6;

implementation

uses Admin;

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm6.RadioButton6Click(Sender: TObject);
begin
  Edit1.Enabled := False;
  Edit2.Enabled := False;
end;

procedure TForm6.RadioButton5Click(Sender: TObject);
begin
  Edit1.Enabled := True;
  Edit2.Enabled := True;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM DataToko WHERE ID = 1');
  ADOQuery1.Open;
  if(ADOQuery1.RecordCount=1)
    THEN
      begin
        Edit1.Text := ADOQuery1.FieldValues['Username_Pemilik'];
        Edit2.Text := ADOQuery1.FieldValues['Password_Pemilik'];
        if(ADOQuery1.FieldValues['Password']='0')
          THEN
            Radiobutton6.Checked := TRUE
          ELSE
            Radiobutton5.Checked := TRUE;
        if(ADOQuery1.FieldValues['Karyawan']='0')
          THEN
            Radiobutton8.Checked := TRUE
          ELSE
            Radiobutton7.Checked := TRUE;
        if(ADOQuery1.FieldValues['Cetak_Struk']='0')
          THEN
            Radiobutton10.Checked := TRUE
          ELSE
            Radiobutton9.Checked := TRUE;
      end;
end;

procedure TForm6.Button1Click(Sender: TObject);
var Password,Karyawan,Cetak_Struk:String;
begin
  IF(Edit1.Text = '')
    THEN
      Edit1.Text := '';
  IF(Edit2.Text = '')
    THEN
      Edit2.Text := '';
  IF(Radiobutton5.Checked = TRUE)
    THEN
      Password := '1'
    ELSE
      Password := '0';
  IF(Radiobutton7.Checked = TRUE)
    THEN
      Karyawan := '1'
    ELSE
      Karyawan := '0';
  IF(Radiobutton9.Checked = TRUE)
    THEN
      Cetak_Struk := '1'
    ELSE
      Cetak_Struk := '0';
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('Username_Pemilik').AsString:=Edit1.Text;
  ADOQuery1.FieldByName('Password_Pemilik').AsString:=Edit2.Text;
  ADOQuery1.FieldByName('Password').AsString:=Password;
  ADOQuery1.FieldByName('Karyawan').AsString:=Karyawan;
  ADOQuery1.FieldByName('Cetak_Struk').AsString:=Cetak_Struk;
  ADOQuery1.Post;
  Showmessage('Data Anda Telah Diperbarui');
  Close;
end;

procedure TForm6.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
