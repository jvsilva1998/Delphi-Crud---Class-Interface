object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmPrincipal'
  ClientHeight = 316
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object edtNome: TEdit
    Left = 32
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 0
    TextHint = 'Nome'
  end
  object edtQtd: TEdit
    Left = 176
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 1
    TextHint = 'Qtd'
  end
  object Salvar: TBitBtn
    Left = 303
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = SalvarClick
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 95
    Width = 505
    Height = 194
    DataSource = ds_prod
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Width = 100
        Visible = True
      end>
  end
  object btnDelete: TBitBtn
    Left = 462
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object bntEditar: TBitBtn
    Left = 384
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 5
    OnClick = bntEditarClick
  end
  object Carregar: TBitBtn
    Left = 32
    Top = 61
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 6
    OnClick = CarregarClick
  end
  object ds_prod: TDataSource
    AutoEdit = False
    DataSet = dm1.qryProd
    Left = 456
    Top = 120
  end
end
