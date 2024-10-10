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
  object OrdrQrySELECT: TFDQuery
    Connection = Conn
    Left = 256
    Top = 192
  end
  object OrdrQryINSERT: TFDQuery
    Connection = Conn
    Left = 384
    Top = 192
  end
  object OrdrQryUPDATE: TFDQuery
    Connection = Conn
    Left = 512
    Top = 192
  end
  object OrdrQryDELETE: TFDQuery
    Connection = Conn
    Left = 640
    Top = 192
  end
  object OrdrDtlQryINSERT: TFDQuery
    Connection = Conn
    Left = 368
    Top = 312
  end
  object OrdrDtlQrySELECT: TFDQuery
    Connection = Conn
    Left = 224
    Top = 312
  end
  object OrdrDtlQryUPDATE: TFDQuery
    Connection = Conn
    Left = 520
    Top = 312
  end
  object OrdrDtlQryDELETE: TFDQuery
    Connection = Conn
    Left = 672
    Top = 312
  end
  object OrdrDtlRprtQrySELECT: TFDQuery
    Connection = Conn
    Left = 440
    Top = 432
  end
end
