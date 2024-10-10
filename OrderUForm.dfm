object frmOrderU: TfrmOrderU
  Left = 0
  Top = 0
  Caption = 'Order Update'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 112
      Top = 80
      Width = 71
      Height = 21
      Caption = 'Order UID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 112
      Top = 164
      Width = 98
      Height = 21
      Caption = 'Customer UID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 112
      Top = 248
      Width = 77
      Height = 21
      Caption = 'Order Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 232
      Top = 80
      Width = 305
      Height = 41
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 232
      Top = 164
      Width = 305
      Height = 41
      TabOrder = 1
    end
    object DateTimePicker1: TDateTimePicker
      Left = 232
      Top = 248
      Width = 249
      Height = 41
      Date = 45574.000000000000000000
      Time = 0.922930474538588900
      TabOrder = 2
    end
    object Button1: TButton
      Left = 272
      Top = 368
      Width = 129
      Height = 41
      Caption = 'Save'
      TabOrder = 3
    end
    object Button2: TButton
      Left = 448
      Top = 368
      Width = 129
      Height = 41
      Caption = 'Cancel'
      TabOrder = 4
    end
  end
end
