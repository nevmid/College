unit unit_udv;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    B_ex1: TButton;
    B_ex2: TButton;
    B_ex3: TButton;
    B_ex4: TButton;
    B_ex5: TButton;
    eInput: TEdit;
    lText: TLabel;
    procedure B_ex1Click(Sender: TObject);
    procedure B_ex2Click(Sender: TObject);
    procedure B_ex3Click(Sender: TObject);
    procedure B_ex4Click(Sender: TObject);
    procedure B_ex5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MyPrivate;
    procedure MyDouble;
  public

  end;

var
  Form1: TForm1;
  myNum:real;

implementation

{$R *.lfm}

{ TForm1 }
procedure Udvoenie(st: string);
var r: real;
  begin
    r := StrToFloat(st);
    r := r*2;
    ShowMessage(FloatToStr(r));
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.MyPrivate;
var r:real;
begin
  r := StrToFloat(eInput.text);
  r := r*2;
  ShowMessage(FloatToStr(r));
end;

procedure TForm1.MyDouble;
begin
  myNum := myNum*2;
end;

procedure TForm1.B_ex1Click(Sender: TObject);
begin
  Udvoenie(eInput.text);
end;

function FuncUdvoenie(st:string):string;
var r:real;
  begin
    r := StrToFloat(st);
    r := r*2;
    Result := FloatToStr(r);
  end;

procedure TForm1.B_ex2Click(Sender: TObject);
begin
  ShowMessage(FuncUdvoenie(eInput.text));
end;

procedure UdvoeniePoSsilke(var r:real);
begin
  r := r*2;
end;

procedure TForm1.B_ex3Click(Sender: TObject);
var myreal: real;
begin
  myReal := StrToFloat(eInput.text);
  UdvoeniePoSsilke(myReal);
  ShowMessage(FloatToStr(myReal));
end;

procedure TForm1.B_ex4Click(Sender: TObject);
begin
  MyPrivate;
end;

procedure TForm1.B_ex5Click(Sender: TObject);
begin
  myNum := StrToFloat(eInput.text);
  MyDouble;
  ShowMessage(FloatToStr(myNum));
end;

end.

