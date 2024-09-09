unit unit_calcmass;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, StdCtrls,
  ExtCtrls, Buttons;

type

  { TCalculator }

  TCalculator = class(TForm)
    bCalculate: TButton;
    bClear: TBitBtn;
    cbOfMater: TComboBox;
    eH: TEdit;
    eW: TEdit;
    eL: TEdit;
    lAns: TLabel;
    lMass: TLabel;
    lH: TLabel;
    lW: TLabel;
    lL: TLabel;
    lMater: TLabel;
    procedure bCalculateClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure cbOfMaterChange(Sender: TObject);
    procedure editsKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Calculator: TCalculator;
  p: integer;
  m, V: real;

implementation

{$R *.lfm}

{ TCalculator }

procedure TCalculator.cbOfMaterChange(Sender: TObject);
begin
  case cbOfMater.ItemIndex of
  0: p := 720;
  1: p := 520;
  2: p := 650;
  3: p := 635;
  4: p := 500;
  5: p := 700;
  6: p := 7800;
  7: p := 8900;
  8: p := 8500;
  9: p := 2700;
  end;
end;

procedure TCalculator.EditsKeyPress(Sender: TObject; var Key: char);
begin
  case Key of
  '0'..'9': Key := Key;
  ',','.': key := ',';
  #8: key := Key;
  else Key := #0;
  end;
end;

procedure TCalculator.FormCreate(Sender: TObject);
begin
  p := 720;
end;

procedure TCalculator.bClearClick(Sender: TObject);
begin
  cbOfMater.ItemIndex := 0;
  eH.text := '';
  eW.text := '';
  eL.text := '';
  lAns.caption := '';
end;

procedure TCalculator.bCalculateClick(Sender: TObject);
begin
  if (eH.Text = '') or (eW.Text = '') or (eL.Text = '') then
     ShowMessage('Необходимо заполнить все поля!')
  else
  begin
    V := StrToFloat(eH.text)*StrToFloat(eW.text)*StrToFloat(eL.text);
    m := V*p;
    lAns.Caption := FloatToStr(m)+' кг';
  end;
end;


end.

