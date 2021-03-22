unit Udm;

interface

uses
  Windows,Forms,Dialogs,SysUtils, Classes, DB, mySQLDbTables, XPMan,IniFiles,
  sSkinManager;

type
  TDataModule1 = class(TDataModule)
    xpmnfst1: TXPManifest;
    koneksi: TmySQLDatabase;
    Qrload: TmySQLQuery;
    dsload: TDataSource;
    Qraksi: TmySQLQuery;
    dsaksi: TDataSource;
    sSkinManager1: TsSkinManager;
    class function Encode(S: string): string;
    class function Decode(S: string): string;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  Pathname,Pathserver: TIniFile;
  server,db, serv, user, pass: string;
    e1, e2, e3, e4: string[100];
  str:String;
  txt:TextFile;
const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/l ';  


implementation

uses
  Ukoneksi;

{$R *.dfm}

class function TDataModule1.Decode(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Pos(s[i], codes64) - 1;
    if x >= 0 then
    begin
      b := b * 64 + x;
      a := a + 6;
      if a >= 8 then
      begin
        a := a - 8;
        x := b shr a;
        b := b mod (1 shl a);
        x := x mod 256;
        Result := Result + chr(x);
      end;
    end
    else
      Exit;
  end;

end;



class function TDataModule1.Encode(S: string): string;
var
  i: Integer;
  a: Integer;
  x: Integer;
  b: Integer;
begin
  Result := '';
  a := 0;
  b := 0;
  for i := 1 to Length(s) do
  begin
    x := Ord(s[i]);
    b := b * 256 + x;
    a := a + 8;
    while a >= 6 do
    begin
      a := a - 6;
      x := b div (1 shl a);
      b := b mod (1 shl a);
      Result := Result + Codes64[x + 1];
    end;
  end;
  if a > 0 then
  begin
    x := b shl (6 - a);
    Result := Result + Codes64[x + 1];
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  try
    Pathname := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'conf.cfg');
    db := Pathname.ReadString('master', 'db', '');
    serv := Pathname.ReadString('master', 'server', '');
    user := Pathname.ReadString('master', 'user', '');
    pass := Pathname.ReadString('master', 'pass', '');
    e1 := Copy(pass, 1, 50);
    pass := Decode(pass);
    e2 := Copy(user, 1, 50);
    user := Decode(user);
    e3 := Copy(db, 1, 50);
    db := Decode(db);
    e4 := Copy(serv, 1, 50);
    serv := Decode(serv);
    server := serv;
    Pathname.Free;
    Application.ProcessMessages;
    Koneksi.Connected := False;
    Koneksi.Host := serv;
    Koneksi.UserName := user;
    Koneksi.UserPassword := pass;
    Koneksi.DatabaseName := db;
    Koneksi.Connected := True;

  except
    Application.ProcessMessages;
    if Application.MessageBox('Koneksi Kedatabase Gagal, Apakah Ingin Mengkonfigurasi Ulang ?', 'Informasi', MB_YESNO + MB_ICONWARNING) = ID_YES then
      Application.CreateForm(TFkoneksi, Fkoneksi);
  end;

end;

end.
