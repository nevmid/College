unit unit_dz;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var b, h, y, x:integer;
begin
     x := StrToInt(Edit1.Text);
     b := StrToInt(Edit2.Text);
     h := StrToInt(Edit3.Text);
     Memo1.Clear;
     Memo2.Clear;
     while x <= b do
           begin
                y := x*x;
                Memo1.Lines.add(IntToStr(x));
                x := x + h;
                Memo2.Lines.add(IntToStr(y));
           end;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Memo1.ScrollBars:=ssVertical;
end;

procedure TForm1.Memo2Change(Sender: TObject);
begin
  Memo2.ScrollBars:=ssVertical;
end;



end.
