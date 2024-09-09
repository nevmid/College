unit unitprog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;
  type
   myForm = record
     Left: integer;
     Top: integer;
     Height: integer;
     Width: integer;
     Caption: string[100];
     Checked: boolean;
     wsMax: boolean;
   end;

var
  Form1: TForm1;
  MyF: myForm;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var f: file of myForm;
begin
  if not FileExists('MyProg.dat') then exit;
  try
    AssignFile(f, 'MyProg.dat');
    Reset(f);
    Read(f, MyF);
  finally
    closeFile(f);
  end;
  if MyF.wsMax then Form1.WindowState := wsMaximized
  else begin
    Form1.left := MyF.Left;
    Form1.top := MyF.top;
    Form1.width := MyF.width;
    Form1.height := MyF.height;
  end;
  Form1.Cpation := MyF.caption;
  CheckBox1.checked := MyF.Checked;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.text <> '' then Form1.Caption := Edit1.text;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  f: file of myForm;
begin
  if not (Form1.WindowState = wsMaximized) then
  begin
    MyF.Left := Form1.left;
    MyF.Width := Form1.Width;
    MyF.Height := Form1.Height;
    MyF.Top := Form1.Top;
    MyF.wsMax := False;
  end
  else MyF.wsMax := True;
  MyF.Caption := Form1.Caption;
  MyF.Checked := CheckBox1.checked;
  try
    AssignFile(f, 'MyProg.dat');
    Rewrite(f);
    Write(f, MyF);
  finally
    CloseFile(f);
  end;
end;

end.

