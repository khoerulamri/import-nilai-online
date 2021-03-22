unit Ukoneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls,IniFiles;

type
  TFkoneksi = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edttxtser: TEdit;
    edttxtuser: TEdit;
    edttxtpass: TEdit;
    edttxtdb: TEdit;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fkoneksi: TFkoneksi;

implementation

uses
  Udm;

{$R *.dfm}

procedure TFkoneksi.btn1Click(Sender: TObject);
var PathServer: TIniFile;
  db, serv, user, pass: string;
begin
  if edttxtdb.Text = '' then
  begin
    Application.MessageBox('Nama Database Kosong.', 'Informasi', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  try
    Pathserver := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conf.cfg');
    db := edttxtdb.Text;
    serv := edttxtser.Text;
    user := edttxtuser.Text;
    pass := edttxtpass.Text;
    e1 := Copy(pass, 1, 50);
    e2 := Copy(user, 1, 50);
    e3 := Copy(db, 1, 50);
    e4 := Copy(serv, 1, 50);
    pass := DataModule1.Encode(e1);
    user := DataModule1.Encode(e2);
    db := DataModule1.Encode(e3);
    serv := DataModule1.Encode(e4);
    PathServer.WriteString('master', 'db', db);
    PathServer.WriteString('master', 'server', serv);
    PathServer.WriteString('master', 'user', user);
    PathServer.WriteString('master', 'pass', pass);
    PathServer.Free;
    Application.MessageBox('Koneksi Kedatabase Sukses. Program Harus Direstart !', 'Informasi', MB_OK + MB_ICONINFORMATION);
    Application.Terminate;
  except
    Application.MessageBox('Koneksi Kedatabase Gagal', 'Kesalahan', MB_OK + MB_ICONERROR);
  end;


end;

procedure TFkoneksi.btn2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
