object frmFiltroRelatorio: TfrmFiltroRelatorio
  Left = 1495
  Top = 258
  Width = 315
  Height = 278
  Caption = 'frmFiltroRelatorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtCodigo: TEdit
    Left = 120
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edtConta: TEdit
    Left = 120
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtDescricao: TEdit
    Left = 120
    Top = 95
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnGerar: TButton
    Left = 56
    Top = 160
    Width = 81
    Height = 41
    Caption = 'Gerar relat'#243'rio'
    TabOrder = 3
    OnClick = btnGerarClick
  end
  object btnCancelar: TButton
    Left = 160
    Top = 160
    Width = 81
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object rgpFiltro: TRadioGroup
    Left = 16
    Top = 32
    Width = 97
    Height = 113
    Items.Strings = (
      'C'#243'digo'
      'Conta'
      'Descri'#231#227'o'
      'Mostrar tudo')
    TabOrder = 5
    OnClick = rgpFiltroClick
  end
end
