object DM: TDM
  Height = 935
  Width = 1246
  PixelsPerInch = 134
  object QrySELECT: TFDQuery
    Connection = Conn
    Left = 256
    Top = 80
  end
  object Conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\mohit\OneDrive\Desktop\courses\Cmpt 475\a2\rad' +
        '-studio\customer_orders.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 80
  end
  object QryINSERT: TFDQuery
    Connection = Conn
    Left = 384
    Top = 80
  end
  object QryUPDATE: TFDQuery
    Connection = Conn
    Left = 512
    Top = 80
  end
  object QryDELETE: TFDQuery
    Connection = Conn
    Left = 632
    Top = 80
  end
end
