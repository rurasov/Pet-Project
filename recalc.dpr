program recalc;

uses
  Vcl.Forms,
  main in 'main.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Blue');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
