unit unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var num, st, i, ans: integer;
begin
   num := Strtoint(Edit1.text);
   st := Strtoint(Edit2.text);
   i := 1; ans := 1;
   while i <= st do
   begin
     ans := ans*num;
     i := i + 1;
   end;
   Memo1.Lines.add('Число '+Edit1.text+' в степени '+ Edit2.text+' равно ' + Inttostr(ans));
end;

end.

