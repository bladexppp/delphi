object FrmRelMateriais: TFrmRelMateriais
  Left = 0
  Top = 0
  Caption = 'Rel'#225'torio De Materiais'
  ClientHeight = 546
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ReportMat: TRLReport
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
        Left = 259
        Top = 0
        Width = 199
        Height = 18
        Align = faCenterTop
        Caption = 'Rel'#225't'#243'rio De Materiais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 656
        Top = 24
        Width = 22
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 661
        Top = 24
        Width = 35
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = '/'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 117
      Width = 718
      Height = 24
      object RLDBText1: TRLDBText
        Left = 16
        Top = 4
        Width = 44
        Height = 16
        Alignment = taRightJustify
        DataField = 'COD_PRODUTO'
        DataSource = dsConsulta
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 96
        Top = 4
        Width = 441
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = dsConsulta
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 620
        Top = 2
        Width = 95
        Height = 16
        Alignment = taRightJustify
        DataField = 'VLR_UNITARIO'
        DataSource = dsConsulta
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 141
      Width = 718
      Height = 20
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 585
        Top = 4
        Width = 60
        Height = 16
        Alignment = taRightJustify
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 664
        Top = 4
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 91
      Width = 718
      Height = 26
      BandType = btHeader
      object RLLabel2: TRLLabel
        Left = 16
        Top = 8
        Width = 54
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 96
        Top = 8
        Width = 75
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 612
        Top = 6
        Width = 103
        Height = 16
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Consulta: TFDQuery
    Connection = DMDados.Bdados
    SQL.Strings = (
      'select *'
      '       from material'
      'where flg_ativo = '#39'S'#39
      'order by descricao')
    Left = 816
    Top = 96
    object ConsultaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object ConsultaVLR_UNITARIO: TBCDField
      FieldName = 'VLR_UNITARIO'
      Origin = 'VLR_UNITARIO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object ConsultaFLG_ATIVO: TStringField
      FieldName = 'FLG_ATIVO'
      Origin = 'FLG_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsulta: TDataSource
    DataSet = Consulta
    Left = 820
    Top = 192
  end
end
