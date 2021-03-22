unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TFutama = class(TForm)
    grp1: TGroupBox;
    btn1: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    lbl3: TLabel;
    dbgrd1: TDBGrid;
    spl1: TSplitter;
    grp2: TGroupBox;
    lbl6: TLabel;
    spl2: TSplitter;
    btn2: TBitBtn;
    pb1: TProgressBar;
    lbl7: TLabel;
    medtTaSiswa: TMaskEdit;
    rg1: TRadioGroup;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure medtTaSiswaKeyPress(Sender: TObject; var Key: Char);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Futama: TFutama;

implementation

uses
  Udm, Ulogin, mySQLDbTables, Math;

{$R *.dfm}

procedure TFutama.btn1Click(Sender: TObject);
begin
if rg1.ItemIndex=0 then
begin
with DataModule1.Qrload do
begin
  Active:=False;
  SQL.Clear;
  Close;
  SQL.Text:='select * from nilai.tb_krs where ta='+QuotedStr(medtTaSiswa.Text)+' and smt3='+QuotedStr(edt1.Text)+' and acc="Y"  and LENGTH(`uts`)<>0 AND `uts`<>"" order by nim';
  Open;
end;
end
else
begin
with DataModule1.Qrload do
begin
  Active:=False;
  SQL.Clear;
  Close;
  SQL.Text:='select * from nilai.tb_krs where ta='+QuotedStr(medtTaSiswa.Text)+' and smt3='+QuotedStr(edt1.Text)+' and acc="Y"  and LENGTH(`final`)<>0 AND `final`<>"" order by nim';
  Open;
end;
end;  
dbgrd1.DataSource:=DataModule1.dsload;
lbl3.Caption:='Total Data : '+IntToStr(DataModule1.Qrload.RecordCount);
pb1.Position:=0;
rg1.SetFocus;
end;

procedure TFutama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Hide;
Flogin.Show;
end;

procedure TFutama.medtTaSiswaKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
begin
  edt1.SetFocus;
end;
end;

procedure TFutama.edt1KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
begin
  rg1.SetFocus;
  rg1.ItemIndex:=0;
end;
end;

procedure TFutama.btn2Click(Sender: TObject);
var i,j,total:Integer;
begin
i:=0;
j:=0;
try
DataModule1.koneksi.StartTransaction; 
if rg1.ItemIndex=0 then
begin
total:=dbgrd1.DataSource.DataSet.RecordCount;
dbgrd1.DataSource.DataSet.First;
while not(dbgrd1.DataSource.DataSet.Eof) do
begin
with DataModule1.Qraksi do
begin
  Active:=False;
  SQL.Clear;
  SQL.Text:='update db_akademik.tb_krs set uts=:uts where nim=:nim and kdmk=:kdmk '+
  'and ta=:ta and smt3=:smt3 and kelas=:kelas and acc=:acc';
  Prepare;
  ParamByName('nim').AsString:=dbgrd1.DataSource.DataSet['nim'];
  ParamByName('kdmk').AsString:=dbgrd1.DataSource.DataSet['kdmk'];
  ParamByName('ta').AsString:=dbgrd1.DataSource.DataSet['ta'];
  ParamByName('smt3').AsString:=dbgrd1.DataSource.DataSet['smt3'];
  ParamByName('kelas').AsString:=dbgrd1.DataSource.DataSet['kelas'];
  ParamByName('uts').AsString:=dbgrd1.DataSource.DataSet['uts'];
  ParamByName('acc').AsString:=dbgrd1.DataSource.DataSet['acc'];
  ExecSQL;
end;
Inc(j);
i:=Floor((j/total)*100);
pb1.Position:=i;
dbgrd1.DataSource.DataSet.Next;
end;
end
else
begin
total:=dbgrd1.DataSource.DataSet.RecordCount;
dbgrd1.DataSource.DataSet.First;
while not(dbgrd1.DataSource.DataSet.Eof) do
begin
with DataModule1.Qraksi do
begin
  Active:=False;
  SQL.Clear;
  SQL.Text:='update db_akademik.tb_krs set final=:final where nim=:nim and kdmk=:kdmk '+
  'and ta=:ta and smt3=:smt3 and kelas=:kelas and acc=:acc';
  Prepare;
  ParamByName('nim').AsString:=dbgrd1.DataSource.DataSet['nim'];
  ParamByName('kdmk').AsString:=dbgrd1.DataSource.DataSet['kdmk'];
  ParamByName('ta').AsString:=dbgrd1.DataSource.DataSet['ta'];
  ParamByName('smt3').AsString:=dbgrd1.DataSource.DataSet['smt3'];
  ParamByName('kelas').AsString:=dbgrd1.DataSource.DataSet['kelas'];
  ParamByName('final').AsString:=dbgrd1.DataSource.DataSet['final'];
  ParamByName('acc').AsString:=dbgrd1.DataSource.DataSet['acc'];
  ExecSQL;
end;
Inc(j);
i:=Floor((j/total)*100);
pb1.Position:=i;
dbgrd1.DataSource.DataSet.Next;
end;
end;

lbl7.Caption:=IntToStr(j)+' Data Berhasil Diimport'; 
Application.MessageBox('Import Berhasil','Informasi',MB_OK+MB_ICONINFORMATION);

DataModule1.koneksi.Commit;
except
  DataModule1.koneksi.Rollback;
  Application.MessageBox('Import Gagal','Peringatan',MB_OK+MB_ICONWARNING);
end;


end;

end.
