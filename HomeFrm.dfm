object Form1: TForm1
  Left = 358
  Top = 239
  Width = 1221
  Height = 712
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastro: TPanel
    Left = 888
    Top = 41
    Width = 317
    Height = 632
    Align = alRight
    TabOrder = 0
    object lblNome: TLabel
      Left = 64
      Top = 72
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lblCategoria: TLabel
      Left = 64
      Top = 128
      Width = 45
      Height = 13
      Caption = 'Categoria'
    end
    object edtNome: TEdit
      Left = 64
      Top = 96
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'edtNome'
    end
    object btnSalvar: TButton
      Left = 48
      Top = 280
      Width = 89
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 176
      Top = 280
      Width = 89
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object cbbPai: TComboBox
      Left = 64
      Top = 152
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'cbbPai'
    end
  end
  object pnlTabela: TPanel
    Left = 0
    Top = 41
    Width = 888
    Height = 632
    Align = alClient
    Caption = 'pnlTabela'
    TabOrder = 1
    object trlDados: TdxDBTreeList
      Left = 1
      Top = 1
      Width = 886
      Height = 630
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'CD_GRUPO'
      ParentField = 'CD_PAI'
      Align = alClient
      TabOrder = 0
      OnClick = trlDadosClick
      DataSource = srcGrupo
      TreeLineColor = clGrayText
      object trlDadosNR_CONTA: TdxDBTreeListMaskColumn
        Width = 124
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NR_CONTA'
      end
      object trlDadosDS_GRUPO: TdxDBTreeListMaskColumn
        Width = 758
        BandIndex = 0
        RowIndex = 0
        FieldName = 'DS_GRUPO'
      end
    end
  end
  object pnpHeader: TPanel
    Left = 0
    Top = 0
    Width = 1205
    Height = 41
    Align = alTop
    TabOrder = 2
    object btnAdicionar: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnEditar: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnRelatorio: TButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 3
      OnClick = btnRelatorioClick
    end
  end
  object connection: TIBCConnection
    Database = 
      'C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024299\BD.F' +
      'DB'
    ClientLibrary = 
      'C:\Users\Desenv4.SEO\Desktop\trabalhos de pesquisa\os024299\fbcl' +
      'ient.dll'
    Port = '3050'
    Username = 'SYSDBA'
    Password = '19983101'
    Server = 'localhost'
    Connected = True
    Left = 67
    Top = 608
  end
  object qryGrupo: TIBCQuery
    Connection = connection
    SQL.Strings = (
      'SELECT * FROM GRUPO')
    Active = True
    Left = 123
    Top = 608
    object qryGrupoCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object qryGrupoNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Required = True
    end
    object qryGrupoDS_GRUPO: TStringField
      FieldName = 'DS_GRUPO'
      Size = 60
    end
    object qryGrupoCD_PAI: TIntegerField
      FieldName = 'CD_PAI'
    end
  end
  object srcGrupo: TIBCDataSource
    DataSet = qryGrupo
    Left = 19
    Top = 608
  end
  object qryPesquisas: TIBCQuery
    SQL.Strings = (
      'Select * from grupo')
    Left = 176
    Top = 609
    object qryPesquisasCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Required = True
    end
    object qryPesquisasNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Required = True
    end
    object qryPesquisasDS_GRUPO: TStringField
      FieldName = 'DS_GRUPO'
      Size = 60
    end
    object qryPesquisasCD_PAI: TIntegerField
      FieldName = 'CD_PAI'
    end
  end
end
