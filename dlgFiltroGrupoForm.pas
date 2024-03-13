unit dlgFiltroGrupoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmFiltroRelatorio = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    lblCodigo: TLabel;
    lblConta: TLabel;
    lblNome: TLabel;
    btnGerar: TButton;
    btnCancelar: TButton;
    edtCodigo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelatorio: TfrmFiltroRelatorio;

implementation

{$R *.dfm}

end.
