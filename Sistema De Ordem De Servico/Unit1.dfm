object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 447
    Height = 201
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'selecao'
        Title.Alignment = taCenter
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end>
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DMDados.Bdados
    SQL.Strings = (
      'SELECT * FROM MATERIAL')
    Left = 288
    Top = 136
    object FDQuery1COD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object FDQuery1VLR_UNITARIO: TFMTBCDField
      FieldName = 'VLR_UNITARIO'
      Origin = 'VLR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object FDQuery1FLG_ATIVO: TStringField
      FieldName = 'FLG_ATIVO'
      Origin = 'FLG_ATIVO'
      FixedChar = True
      Size = 1
    end
    object FDQuery1winner: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'winner'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 216
    Top = 104
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 160
    object ClientDataSet1nome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object ClientDataSet1selecao: TIntegerField
      FieldName = 'selecao'
    end
  end
end
