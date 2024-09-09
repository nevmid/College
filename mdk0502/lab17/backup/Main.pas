unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    lClock: TLabel;
    Timer1: TTimer;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.Timer1Timer(Sender: TObject);
var i:byte;
begin
  lClock.Caption := TimetoStr(Now);
  i := Random(4);
  case i of
  0: lClock.left := lClock.left + 50;
  1: lClock.left := lClock.left - 50;
  2: lClock.top := lClock.top + 50;
  3: lClock.top := lClock.top - 50;
  end;
  if lClock.left < 0 then lClock.left := 0;
  if lClock.top < 0 then lClock.top := 0;
  if (lClock.left + lClock.Width) > fMain.Width then
     lClock.left := fMain.Width - lClock.Width;
  if (lClock.top + lClock.height) > fMain.height then
     lClock.top := fMain.height - lClock.height;
end;

procedure TfMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #27 then Close;
end;


end.

