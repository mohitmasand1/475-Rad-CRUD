object frmProductCU: TfrmProductCU
  Left = 0
  Top = 0
  Caption = 'Product'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 22
    ExplicitTop = 112
    object Label1: TLabel
      Left = 64
      Top = 80
      Width = 115
      Height = 21
      Caption = 'Order Detail UID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 64
      Top = 136
      Width = 88
      Height = 21
      Caption = 'Line number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 64
      Top = 192
      Width = 113
      Height = 21
      Caption = 'Product number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 64
      Top = 248
      Width = 60
      Height = 21
      Caption = 'Quantity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 64
      Top = 304
      Width = 92
      Height = 21
      Caption = 'Price amount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtOrderDetailUID: TEdit
      Left = 208
      Top = 82
      Width = 313
      Height = 33
      TabOrder = 0
    end
    object edtLineNumber: TEdit
      Left = 208
      Top = 138
      Width = 313
      Height = 33
      TabOrder = 1
    end
    object edtProductNumber: TEdit
      Left = 208
      Top = 194
      Width = 313
      Height = 33
      TabOrder = 2
    end
    object edtQuantity: TEdit
      Left = 208
      Top = 250
      Width = 313
      Height = 33
      TabOrder = 3
    end
    object edtPriceAmnt: TEdit
      Left = 208
      Top = 306
      Width = 313
      Height = 33
      TabOrder = 4
    end
    object btnCreate: TButton
      Left = 288
      Top = 384
      Width = 129
      Height = 33
      Caption = 'Save'
      TabOrder = 5
      OnClick = btnCreateClick
    end
    object Button2: TButton
      Left = 456
      Top = 384
      Width = 129
      Height = 33
      Caption = 'Cancel'
      TabOrder = 6
    end
  end
end
