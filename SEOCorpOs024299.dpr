program SEOCorpOs024299;

uses
  Forms,
  HomeFrm in 'HomeFrm.pas' {Form1},
  dlgFiltroGrupoForm in 'dlgFiltroGrupoForm.pas' {frmFiltroRelatorio},
  relGrupoFrm in 'relGrupoFrm.pas' {dlgRelGrupoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmFiltroRelatorio, frmFiltroRelatorio);
  Application.CreateForm(TdlgRelGrupoForm, dlgRelGrupoForm);
  Application.Run;
end.
