unit Ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFlogin = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

uses
  Umain;

{$R *.dfm}

procedure TFlogin.edt1KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
edt2.SetFocus;
end;

procedure TFlogin.edt2KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
begin
  if (edt1.Text='admin') and (edt2.Text='admin') then
  begin


  Flogin.Hide;
  Futama.ShowModal;

  end
  else
  Application.MessageBox('Username Password Salah','Peringatan',MB_OK+MB_ICONWARNING);
end;
end;

end.
