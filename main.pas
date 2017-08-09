unit main;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, AdvEdit,
  Vcl.ComCtrls, System.DateUtils, AdvSpin, Vcl.Mask, Vcl.ExtCtrls,
  AdvDateTimePicker;

type
  TMainForm = class(TForm)
    edtPrice: TAdvEdit;
    edtRecalculationsSum: TAdvEdit;
    edtNumberOfDaysOfUse: TAdvSpinEdit;
    pnlMain: TPanel;
    dtmpckr: TAdvDateTimePicker;
    procedure Recalc(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetMaxEdtValue(AmountOfDays: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  dtmpckr.Date := Date;
end;

procedure TMainForm.Recalc(Sender: TObject);
var
  MonthNumber, SelectedYear, AmountOfDays: Integer;
  SelectedDate: TDateTime;
  Sum: double;
begin
  SelectedDate := dtmpckr.Date;
  MonthNumber := MonthOfTheYear(SelectedDate);
  SelectedYear := FormatDateTime('yyyy', SelectedDate).ToInteger;
  AmountOfDays := MonthDays[IsLeapYear(SelectedYear)][MonthNumber];
  Sum := edtPrice.FloatValue / AmountOfDays * edtNumberOfDaysOfUse.Value;
  edtRecalculationsSum.IntValue := Round(Sum);
  SetMaxEdtValue(AmountOfDays);
end;

procedure TMainForm.SetMaxEdtValue(AmountOfDays: Integer);
begin
  with edtNumberOfDaysOfUse do
  begin
    MaxValue := AmountOfDays;
    if Value > AmountOfDays then
    begin
      Value := AmountOfDays;
      SelStart := 2;
    end;
  end;
end;

end.
