unit HomeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, DBAccess, IBC, MemDS, dxCntner, dxTL, dxDBCtrl,
  dxDBTL, ExtCtrls, StdCtrls, DBCtrls;

type
  TForm1 = class(TForm)
    connection: TIBCConnection;
    qryGrupo: TIBCQuery;
    srcGrupo: TIBCDataSource;
    qryGrupoCD_GRUPO: TIntegerField;
    qryGrupoNR_CONTA: TStringField;
    qryGrupoDS_GRUPO: TStringField;
    qryGrupoCD_PAI: TIntegerField;
    pnlCadastro: TPanel;
    pnlTabela: TPanel;
    trlDados: TdxDBTreeList;
    trlDadosNR_CONTA: TdxDBTreeListMaskColumn;
    trlDadosDS_GRUPO: TdxDBTreeListMaskColumn;
    pnpHeader: TPanel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtNome: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblNome: TLabel;
    lblCategoria: TLabel;
    cbbPai: TComboBox;
    qryPesquisas: TIBCQuery;
    qryPesquisasCD_GRUPO: TIntegerField;
    qryPesquisasNR_CONTA: TStringField;
    qryPesquisasDS_GRUPO: TStringField;
    qryPesquisasCD_PAI: TIntegerField;
    btnRelatorio: TButton;
    procedure ativarBotoesAlteracao(value:boolean);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure ativaInputs(value:boolean);
    procedure limparInputs;
    procedure ativarBotoesDML(value:boolean);
    procedure btnExcluirClick(Sender: TObject);
    procedure trlDadosClick(Sender: TObject);
    procedure preencheComboBox;
    procedure btnRelatorioClick(Sender: TObject);
  private
    mode:integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  filtroRelatorioFrm;

procedure TForm1.ativarBotoesAlteracao(value:boolean);
begin
  btnSalvar.Enabled := value;
  btnCancelar.Enabled := value;
end;

procedure TForm1.ativaInputs(value:boolean);
begin
  edtNome.Enabled := value;
  cbbPai.Enabled := value;
end;

procedure TForm1.limparInputs;
begin
  edtNome.Clear;
  cbbPai.Clear;
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
begin
  ativarBotoesAlteracao(true);
  ativaInputs(true);
  mode:=0;
  ativarBotoesDML(false);
  preencheComboBox;
end;

procedure TForm1.preencheComboBox;
begin
  cbbPai.Items.Clear;
  qryPesquisas.SQL.Text := 'select * from grupo;';
  qryPesquisas.Open;
  qryPesquisas.First;
  while not qryPesquisas.Eof do
  begin
     cbbPai.Items.Add(qryPesquisasDS_GRUPO.value);
     qryPesquisas.Next;
  end;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
var
valorcbb:string;
codPai:integer;
begin
  try
  valorcbb := cbbPai.Text;
  qryPesquisas.SQL.Text := 'SELECT * FROM GRUPO  where DS_GRUPO = :nome;';
  qryPesquisas.ParamByName('nome').AsString := valorCbb;
  qryPesquisas.Open;

  codPai:=qryPesquisasCD_GRUPO.Value;

  if mode = 0 then
    qryGrupo.Insert
  else
    qryGrupo.Edit;

  showmessage(IntToStr(qryGrupoCD_GRUPO.Value));
  qryGrupoNR_CONTA.AsString := '0.0';
  qryGrupoDS_GRUPO.AsString := edtNome.text;
  qryGrupoCD_PAI.AsInteger := codPai;
  qryGrupo.Post;
  qryGrupo.Transaction.CommitRetaining;
  except
    qryGrupo.Transaction.RollbackRetaining;
  end;

  ativarBotoesAlteracao(False);
  ativaInputs(False);
  limparInputs;
  ativarBotoesDML(true);

  qryGrupo.SQL.Text := 'select * from grupo;';
  qryGrupo.Open;
end;

procedure TForm1.ativarBotoesDML(value:boolean);
begin
  btnAdicionar.Enabled := value;
  btnEditar.Enabled := value;
  btnExcluir.Enabled := value;
  trlDados.Enabled := value;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  ativarBotoesAlteracao(False);
  ativaInputs(False);
  limparInputs;
  ativarBotoesDML(true);
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  ativarBotoesAlteracao(true);
  ativaInputs(true);
  mode:=1;
  ativarBotoesDML(false);
  preencheComboBox;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      qryGrupo.delete;
      qryGrupo.Transaction.CommitRetaining;
    except
      qryGrupo.Transaction.RollbackRetaining;
    end;
  end;

end;

procedure TForm1.trlDadosClick(Sender: TObject);
var
codPai:integer;
begin
  edtNome.Text := qryGrupoDS_GRUPO.Value;
  codPai:= qryGrupoCD_PAI.value;
  if not (codPai = 0) then
  begin
    qryPesquisas.SQL.Text := 'SELECT * FROM GRUPO  where CD_GRUPO = :pai;';
    qryPesquisas.ParamByName('pai').AsInteger := qryGrupoCD_PAI.value;
    qryPesquisas.Open;
    cbbPai.Text := qryPesquisasDS_GRUPO.value;
  end;
end;

procedure TForm1.btnRelatorioClick(Sender: TObject);
begin
  application.CreateForm(TfrmFiltroRelatorio, frmFiltroRelatorio);
  frmFiltroRelatorio.ShowModal;
end;

end.
