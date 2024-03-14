unit relGrupoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, IBC, ExtCtrls, QuickRpt, QRCtrls, MemDS;

type
  TdlgRelGrupoForm = class(TForm)
    QuickRep1: TQuickRep;
    srcRelGrupo: TIBCDataSource;
    qryMestre: TIBCQuery;
    qryMestreCD_GRUPO: TIntegerField;
    qryMestreNR_CONTA: TStringField;
    qryMestreDS_GRUPO: TStringField;
    qryMestreCD_PAI: TIntegerField;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qryDetail: TIBCQuery;
    qryDetailCD_GRUPO: TIntegerField;
    qryDetailNR_CONTA: TStringField;
    qryDetailDS_GRUPO: TStringField;
    qryDetailCD_PAI: TIntegerField;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    procedure qryMestreAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgRelGrupoForm: TdlgRelGrupoForm;

implementation

{$R *.dfm}

uses
  dlgFiltroGrupoForm;

procedure TdlgRelGrupoForm.qryMestreAfterScroll(DataSet: TDataSet);
begin
  TRY
      qryDetail.close;
      qryDetail.ParamByName('id').AsInteger := qryMestreCD_GRUPO.Value;
      qryDetail.Execute;
      qryDetail.Open

  EXCEPT
  END;
end;

end.
