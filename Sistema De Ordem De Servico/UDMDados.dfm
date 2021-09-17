object DMDados: TDMDados
  OldCreateOrder = False
  Height = 316
  Width = 473
  object Bdados: TFDConnection
    Params.Strings = (
      
        'Database=C:\FBS Softwarer\Sistema De Ordem De Servico\Banco\BANC' +
        'O.FDB'
      'User_Name=SYSDBA'
      'Password=12345678'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 76
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 132
    Top = 76
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 296
    Top = 68
  end
end
