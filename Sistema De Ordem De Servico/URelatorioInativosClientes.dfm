object FrmRelCliInativo: TFrmRelCliInativo
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio De Clientes Inativos'
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
  object ReportInativoCli: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsCosulta
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
        Left = 227
        Top = 0
        Width = 264
        Height = 18
        Align = faCenterTop
        Caption = 'Rel'#225't'#243'rio De Clientes Inativos'
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
        Width = 46
        Height = 16
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 347
        Top = 8
        Width = 66
        Height = 16
        Caption = 'Telefone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 480
        Top = 8
        Width = 54
        Height = 16
        Caption = 'Cidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 643
        Top = 8
        Width = 23
        Height = 16
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
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
    object RLBand2: TRLBand
      Left = 38
      Top = 117
      Width = 718
      Height = 24
      object RLDBText1: TRLDBText
        Left = 16
        Top = 4
        Width = 54
        Height = 16
        Alignment = taRightJustify
        DataField = 'COD_CLIENTE'
        DataSource = dsCosulta
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 96
        Top = 4
        Width = 245
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsCosulta
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 347
        Top = 4
        Width = 72
        Height = 16
        DataField = 'TELEFONE'
        DataSource = dsCosulta
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 480
        Top = 4
        Width = 157
        Height = 16
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsCosulta
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 643
        Top = 4
        Width = 21
        Height = 16
        DataField = 'UF'
        DataSource = dsCosulta
        Text = ''
      end
    end
  end
  object Consulta: TFDQuery
    Connection = DMDados.Bdados
    SQL.Strings = (
      'select *'
      '       from cliente'
      'where flg_ativo = '#39'N'#39
      'order by nome')
    Left = 808
    Top = 128
    object ConsultaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ConsultaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object ConsultaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 11
    end
    object ConsultaDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object ConsultaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 200
    end
    object ConsultaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object ConsultaNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object ConsultaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 100
    end
    object ConsultaSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object ConsultaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '(000)0000-0000;0;_'
      Size = 21
    end
    object ConsultaFLG_ATIVO: TStringField
      FieldName = 'FLG_ATIVO'
      Origin = 'FLG_ATIVO'
      FixedChar = True
      Size = 1
    end
    object ConsultaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 100
    end
    object ConsultaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object ConsultaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object dsCosulta: TDataSource
    DataSet = Consulta
    Left = 812
    Top = 256
  end
end
