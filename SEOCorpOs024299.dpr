program SEOCorpOs024299;

uses
  Forms,
  HomeFrm in 'HomeFrm.pas' {Form1},
  filtroRelatorioFrm in 'filtroRelatorioFrm.pas' {frmFiltroRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmFiltroRelatorio, frmFiltroRelatorio);
  Application.Run;
end.
