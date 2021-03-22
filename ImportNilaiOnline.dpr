program ImportNilaiOnline;

uses
  Forms,
  Ulogin in 'Ulogin.pas' {Flogin},
  Umain in 'Umain.pas' {Futama},
  Udm in 'Udm.pas' {DataModule1: TDataModule},
  Ukoneksi in 'Ukoneksi.pas' {Fkoneksi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Import Nilai Online';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(TFutama, Futama);
  Application.CreateForm(TFkoneksi, Fkoneksi);
  Application.Run;
end.
