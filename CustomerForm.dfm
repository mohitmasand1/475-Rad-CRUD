object frmCustomer: TfrmCustomer
  Left = 0
  Top = 0
  Caption = 'Customer Form'
  ClientHeight = 529
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -4
    Top = 0
    Width = 737
    Height = 529
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 14
      Width = 80
      Height = 21
      Caption = 'Customers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCreate: TButton
      Left = 40
      Top = 456
      Width = 129
      Height = 33
      Caption = 'Create'
      TabOrder = 1
      OnClick = btnCreateClick
    end
    object btnUpdate: TButton
      Left = 304
      Top = 456
      Width = 129
      Height = 33
      Caption = 'Update'
      TabOrder = 2
      OnClick = btnUpdateClick
    end
    object btnDelete: TButton
      Left = 552
      Top = 456
      Width = 129
      Height = 33
      Caption = 'Delete'
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 41
      Width = 735
      Height = 376
      Align = alCustom
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.QrySELECT
    Left = 344
    Top = 416
  end
end
