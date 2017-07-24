unit main;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, AdvEdit,
  Vcl.ComCtrls, System.DateUtils, AdvSpin, Vcl.Mask, Vcl.ExtCtrls,
  AdvDateTimePicker;

type
  TForm1 = class(TForm)
    edtPrice: TAdvEdit;
    edtRecalculationsSum: TAdvEdit;
    edtNumberOfDaysOfUse: TAdvSpinEdit;
    pnl1: TPanel;
    dtp1: TAdvDateTimePicker;
    procedure recalc(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure setMaxEdtValue(amountOfDays: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.recalc(Sender: TObject);
var
  monthNumber, selectedYear, amountOfDays: Integer;
  selectedDate: TDateTime;
  sum: double;
begin
  selectedDate := dtp1.Date;
  monthNumber := MonthOfTheYear(selectedDate);
  selectedYear := FormatDateTime('yyyy', selectedDate).ToInteger;
  amountOfDays := MonthDays[IsLeapYear(selectedYear)][monthNumber];
  sum := edtPrice.FloatValue / amountOfDays * edtNumberOfDaysOfUse.Value;
  edtRecalculationsSum.IntValue := Round(sum);
  setMaxEdtValue(amountOfDays);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dtp1.Date := Date;
end;

procedure TForm1.setMaxEdtValue(amountOfDays: Integer);
begin
  edtNumberOfDaysOfUse.MaxValue := amountOfDays;
  if edtNumberOfDaysOfUse.Value > amountOfDays then
  begin
    edtNumberOfDaysOfUse.Value := amountOfDays;
    edtNumberOfDaysOfUse.SelStart := 2;
  end;
end;

end.
