object frmCustomerCU: TfrmCustomerCU
  Left = 0
  Top = 0
  Caption = 'Customer CU'
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
    ExplicitWidth = 620
    ExplicitHeight = 428
    object Label1: TLabel
      Left = 61
      Top = 122
      Width = 87
      Height = 21
      Caption = 'Customer ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 61
      Top = 198
      Width = 69
      Height = 21
      Caption = 'Firstname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 61
      Top = 270
      Width = 63
      Height = 21
      Caption = 'Surname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 61
      Top = 50
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
    object edtCustomerID: TEdit
      Left = 165
      Top = 120
      Width = 305
      Height = 23
      TabOrder = 0
    end
    object edtFirstname: TEdit
      Left = 160
      Top = 196
      Width = 305
      Height = 23
      TabOrder = 1
    end
    object edtSurname: TEdit
      Left = 160
      Top = 268
      Width = 305
      Height = 23
      TabOrder = 2
    end
    object chkActive: TCheckBox
      Left = 160
      Top = 320
      Width = 113
      Height = 25
      Caption = 'Active'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btnCreate: TButton
      Left = 296
      Top = 384
      Width = 129
      Height = 33
      Caption = 'Save'
      TabOrder = 4
      OnClick = btnCreateClick
    end
    object Button1: TButton
      Left = 464
      Top = 384
      Width = 129
      Height = 33
      Caption = '&Close'
      ModalResult = 8
      TabOrder = 5
    end
    object edtCustomerUID: TEdit
      Left = 165
      Top = 48
      Width = 305
      Height = 23
      TabOrder = 6
    end
  end
end
