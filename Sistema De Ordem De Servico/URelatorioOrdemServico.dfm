object FrmRelOrdemServico: TFrmRelOrdemServico
  Left = 0
  Top = 0
  Caption = 'Rel'#225'torio De Ordem De Servi'#231'o'
  ClientHeight = 546
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Report: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 53
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 235
        Top = 0
        Width = 248
        Height = 18
        Align = faCenterTop
        Caption = 'Rel'#225't'#243'rio Ordem De Servi'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object OrdemServico: TRLBand
      Left = 38
      Top = 91
      Width = 718
      Height = 216
      BandType = btHeader
      object Label3: TLabel
        Left = 392
        Top = 44
        Width = 76
        Height = 16
        Caption = 'Data Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 336
        Top = 172
        Width = 67
        Height = 19
        Caption = 'Servi'#231'os'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 48
        Top = 198
        Width = 48
        Height = 16
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 460
        Top = 198
        Width = 74
        Height = 16
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 552
        Top = 198
        Width = 87
        Height = 16
        Caption = 'Valor Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 668
        Top = 198
        Width = 42
        Height = 16
        Caption = '$ Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 16
        Top = 44
        Width = 53
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText9: TRLDBText
        Left = 68
        Top = 44
        Width = 26
        Height = 16
        Alignment = taRightJustify
        DataField = 'COD_OS'
        DataSource = dsConsulta
        Text = ''
      end
      object RLLabel8: TRLLabel
        Left = 16
        Top = 76
        Width = 53
        Height = 16
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText10: TRLDBText
        Left = 94
        Top = 76
        Width = 224
        Height = 16
        DataField = 'NOME'
        DataSource = dsConsulta
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 68
        Top = 76
        Width = 26
        Height = 16
        Alignment = taRightJustify
        DataField = 'COD_CLIENTE'
        DataSource = dsConsulta
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 467
        Top = 44
        Width = 64
        Height = 16
        DataField = 'DATA_OS'
        DataSource = dsConsulta
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 578
        Top = 44
        Width = 73
        Height = 16
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText13: TRLDBText
        Left = 650
        Top = 44
        Width = 65
        Height = 16
        DataField = 'DATA_OS_FINAL'
        DataSource = dsConsulta
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 392
        Top = 76
        Width = 55
        Height = 16
        Caption = 'Modelo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText14: TRLDBText
        Left = 464
        Top = 76
        Width = 117
        Height = 16
        DataField = 'DESCRICAO_MODELO'
        DataSource = dsConsulta
        Text = ''
      end
      object RLDBText15: TRLDBText
        Left = 440
        Top = 76
        Width = 24
        Height = 16
        Alignment = taRightJustify
        DataField = 'COD_MODELO'
        DataSource = dsConsulta
        Text = ''
      end
      object RLDBText16: TRLDBText
        Left = 639
        Top = 76
        Width = 76
        Height = 16
        Alignment = taRightJustify
        DataField = 'VLR_TOTAL'
        DataSource = dsConsulta
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 619
        Top = 76
        Width = 40
        Height = 16
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBMemo1: TRLDBMemo
        Left = 54
        Top = 104
        Width = 655
        Height = 16
        Behavior = [beSiteExpander]
        DataField = 'OBSERVACAO'
        DataSource = dsConsulta
      end
      object RLLabel5: TRLLabel
        Left = 16
        Top = 104
        Width = 32
        Height = 16
        Caption = 'Obs:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object detailmaterial: TRLSubDetail
      Left = 38
      Top = 383
      Width = 718
      Height = 156
      DataSource = dsMaterial
      object RLGroup2: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 137
        DataFields = 'COD_OS'
        object Requisicao: TRLBand
          Left = 0
          Top = 81
          Width = 718
          Height = 20
          GroupIndex = 1
          object RLDBText7: TRLDBText
            Left = 8
            Top = 3
            Width = 33
            Height = 16
            Alignment = taRightJustify
            DataField = 'COD_REQUISICAO'
            DataSource = dsMaterial
            Text = ''
          end
          object RLDBText18: TRLDBText
            Left = 76
            Top = 4
            Width = 265
            Height = 16
            DataField = 'DESCRICAO_MATERIAL'
            DataSource = dsMaterial
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 39
            Top = 4
            Width = 38
            Height = 16
            Alignment = taRightJustify
            DataField = 'COD_PRODUTO'
            DataSource = dsMaterial
            Text = ''
          end
          object RLDBText19: TRLDBText
            Left = 457
            Top = 5
            Width = 77
            Height = 16
            Alignment = taRightJustify
            DataField = 'QUANTIDADE_MATERIAL'
            DataSource = dsMaterial
            Text = ''
          end
          object RLDBText20: TRLDBText
            Left = 552
            Top = 5
            Width = 84
            Height = 16
            Alignment = taRightJustify
            DataField = 'VLR_UNITARIO_MATERIAL'
            DataSource = dsMaterial
            Text = ''
          end
          object RLDBText21: TRLDBText
            Left = 648
            Top = 5
            Width = 67
            Height = 16
            Alignment = taRightJustify
            DataField = 'VLR_TOTAL_MATERIAL'
            DataSource = dsMaterial
            Text = ''
          end
        end
        object CabecalhoMaterial: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 81
          BandType = btHeader
          object Label7: TLabel
            Left = 336
            Top = 11
            Width = 68
            Height = 19
            Caption = 'Materiais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 48
            Top = 65
            Width = 52
            Height = 16
            Caption = 'Material'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 460
            Top = 65
            Width = 74
            Height = 16
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 552
            Top = 65
            Width = 87
            Height = 16
            Caption = 'Valor Unitario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 673
            Top = 64
            Width = 42
            Height = 16
            Caption = '$ Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object FinalRequisicao: TRLBand
          Left = 0
          Top = 101
          Width = 718
          Height = 33
          BandType = btSummary
          object DBText1: TDBText
            Left = 650
            Top = 13
            Width = 65
            Height = 17
            Alignment = taRightJustify
            DataField = 'VLR_FINAL_REQUISICAO'
            DataSource = dsMaterial
          end
          object RLLabel3: TRLLabel
            Left = 537
            Top = 13
            Width = 129
            Height = 16
            Caption = 'Total Dos Materiais:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object detailservico: TRLSubDetail
      Left = 38
      Top = 307
      Width = 718
      Height = 76
      DataSource = dsConsulta
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 65
        DataFields = 'COD_OS'
        object OrdemServicoItem: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 22
          object RLDBText1: TRLDBText
            Left = 8
            Top = 6
            Width = 33
            Height = 16
            Alignment = taRightJustify
            DataField = 'COD_OS_ITEM'
            DataSource = dsConsulta
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 40
            Top = 6
            Width = 33
            Height = 16
            Alignment = taRightJustify
            DataField = 'COD_SERVICO'
            DataSource = dsConsulta
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 72
            Top = 6
            Width = 265
            Height = 16
            DataField = 'DESCRICAO_SERVICO'
            DataSource = dsConsulta
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 460
            Top = 6
            Width = 74
            Height = 16
            Alignment = taRightJustify
            DataField = 'QUANTIDADE_SERVICO'
            DataSource = dsConsulta
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 552
            Top = 6
            Width = 84
            Height = 16
            Alignment = taRightJustify
            DataField = 'VLR_UNITARIO_SERVICO'
            DataSource = dsConsulta
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 648
            Top = 6
            Width = 67
            Height = 16
            Alignment = taRightJustify
            DataField = 'VLR_TOTAL_SERVICO'
            DataSource = dsConsulta
            Text = ''
          end
        end
        object FinalServico: TRLBand
          Left = 0
          Top = 22
          Width = 718
          Height = 31
          BandType = btSummary
          object DBText2: TDBText
            Left = 650
            Top = 16
            Width = 65
            Height = 17
            Alignment = taRightJustify
            DataField = 'VLR_FINAL_SERVICO'
            DataSource = dsConsulta
          end
          object RLLabel2: TRLLabel
            Left = 537
            Top = 15
            Width = 129
            Height = 16
            Caption = 'Total Dos Servi'#231'os:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 539
      Width = 718
      Height = 64
      BandType = btFooter
      object RLLabel4: TRLLabel
        Left = 241
        Top = 24
        Width = 235
        Height = 16
        Align = faCenter
        Caption = '_________________________________'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 241
        Top = 45
        Width = 235
        Height = 16
        Alignment = taCenter
        Info = itFullDate
        Text = ''
      end
    end
  end
  object Consulta: TFDQuery
    Connection = DMDados.Bdados
    SQL.Strings = (
      'SELECT  OS.COD_OS'
      '       ,OS.DATA_OS'
      '       ,OS.COD_CLIENTE'
      '       ,CLI.NOME'
      '       ,OS.VLR_TOTAL'
      '       ,OS.OBSERVACAO'
      '       ,OS.COD_MODELO'
      '       ,MOL.DESCRICAO DESCRICAO_MODELO'
      '       ,OS.DATA_OS_FINAL'
      '       ,OS.VLR_FINAL_SERVICO'
      '       '
      ''
      '       ,ITE.COD_OS_ITEM'
      '       ,ITE.VLR_UNITARIO_SERVICO'
      '       ,ITE.QUANTIDADE_SERVICO'
      '       ,ITE.VLR_TOTAL_SERVICO'
      ''
      '       ,SERV.COD_SERVICO'
      '       ,SERV.DESCRICAO DESCRICAO_SERVICO'
      '    FROM ORDEMSERVICO OS'
      '        ,CLIENTE   CLI'
      '        ,ORDEMSERVICO_ITEM ITE'
      ''
      '        ,MODELO MOL'
      ''
      '        ,servico SERV'
      'WHERE  '
      '     OS.COD_OS = :COD_ORDEMSERVICO'
      '    AND CLI.COD_CLIENTE = OS.COD_CLIENTE'
      '    AND MOL.cod_modelo = OS.cod_modelo'
      '    AND ITE.COD_OS = OS.COD_OS'
      '    AND SERV.cod_servico = ITE.cod_servico'
      ''
      ''
      ''
      'ORDER BY COD_OS_ITEM')
    Left = 816
    Top = 152
    ParamData = <
      item
        Name = 'COD_ORDEMSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object ConsultaCOD_OS: TIntegerField
      FieldName = 'COD_OS'
      Origin = 'COD_OS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsultaDATA_OS: TDateField
      FieldName = 'DATA_OS'
      Origin = 'DATA_OS'
    end
    object ConsultaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
    end
    object ConsultaNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ConsultaVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'VLR_TOTAL'
      DisplayFormat = '#,##0.00'
      currency = True
      Precision = 18
      Size = 2
    end
    object ConsultaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 250
    end
    object ConsultaCOD_MODELO: TIntegerField
      FieldName = 'COD_MODELO'
      Origin = 'COD_MODELO'
    end
    object ConsultaDESCRICAO_MODELO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_MODELO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object ConsultaDATA_OS_FINAL: TDateField
      FieldName = 'DATA_OS_FINAL'
      Origin = 'DATA_OS_FINAL'
    end
    object ConsultaVLR_FINAL_SERVICO: TBCDField
      FieldName = 'VLR_FINAL_SERVICO'
      Origin = 'VLR_FINAL_SERVICO'
      DisplayFormat = '#,##0.00'
      currency = True
      Precision = 18
      Size = 2
    end
    object ConsultaCOD_OS_ITEM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_OS_ITEM'
      Origin = 'COD_OS_ITEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object ConsultaVLR_UNITARIO_SERVICO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLR_UNITARIO_SERVICO'
      Origin = 'VLR_UNITARIO_SERVICO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ConsultaQUANTIDADE_SERVICO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE_SERVICO'
      Origin = 'QUANTIDADE_SERVICO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ConsultaVLR_TOTAL_SERVICO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLR_TOTAL_SERVICO'
      Origin = 'VLR_TOTAL_SERVICO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      currency = True
      Precision = 18
      Size = 2
    end
    object ConsultaCOD_SERVICO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_SERVICO'
      Origin = 'COD_SERVICO'
      ProviderFlags = []
      ReadOnly = True
    end
    object ConsultaDESCRICAO_SERVICO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SERVICO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
  object dsConsulta: TDataSource
    DataSet = Consulta
    Left = 816
    Top = 216
  end
  object ConsultaMaterial: TFDQuery
    Connection = DMDados.Bdados
    SQL.Strings = (
      'select  OS.COD_OS'
      ''
      '       ,OS.VLR_FINAL_REQUISICAO'
      '       ,MAT.COD_PRODUTO'
      '       ,MAT.DESCRICAO DESCRICAO_MATERIAL'
      '       ,REQ.COD_REQUISICAO'
      '       ,REQ.VLR_UNITARIO_MATERIAL'
      '       ,REQ.VLR_TOTAL_MATERIAL'
      '       ,REQ.QUANTIDADE_MATERIAL'
      '       from ORDEMSERVICO OS'
      '       ,MATERIAL MAT'
      '      ,REQUISICAO REQ'
      '  where  OS.COD_OS = :COD_os'
      '    AND MAT.COD_PRODUTO = REQ.cod_produto'
      '    AND REQ.cod_os = OS.cod_os'
      'order by COD_REQUISICAO')
    Left = 812
    Top = 296
    ParamData = <
      item
        Name = 'COD_OS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object ConsultaMaterialCOD_OS: TIntegerField
      FieldName = 'COD_OS'
      Origin = 'COD_OS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsultaMaterialVLR_FINAL_REQUISICAO: TBCDField
      FieldName = 'VLR_FINAL_REQUISICAO'
      Origin = 'VLR_FINAL_REQUISICAO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ConsultaMaterialCOD_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object ConsultaMaterialDESCRICAO_MATERIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_MATERIAL'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object ConsultaMaterialCOD_REQUISICAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_REQUISICAO'
      Origin = 'COD_REQUISICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object ConsultaMaterialVLR_UNITARIO_MATERIAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLR_UNITARIO_MATERIAL'
      Origin = 'VLR_UNITARIO_MATERIAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ConsultaMaterialVLR_TOTAL_MATERIAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLR_TOTAL_MATERIAL'
      Origin = 'VLR_TOTAL_MATERIAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ConsultaMaterialQUANTIDADE_MATERIAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE_MATERIAL'
      Origin = 'QUANTIDADE_MATERIAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object dsMaterial: TDataSource
    DataSet = ConsultaMaterial
    Left = 812
    Top = 368
  end
end
