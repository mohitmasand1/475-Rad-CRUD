object frmOrder: TfrmOrder
  Left = 0
  Top = 0
  Caption = 'Order Form'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 345
    Width = 625
    Height = 104
    Caption = 'Panel1'
    TabOrder = 4
  end
  object DBGrid: TDBGrid
    Left = -8
    Top = -6
    Width = 633
    Height = 345
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnCreate: TButton
    Left = 40
    Top = 381
    Width = 129
    Height = 33
    Caption = 'Create'
    TabOrder = 1
    OnClick = btnCreateClick
  end
  object btnUpdate: TButton
    Left = 240
    Top = 381
    Width = 129
    Height = 33
    Caption = 'Update'
    TabOrder = 2
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 447
    Top = 381
    Width = 129
    Height = 33
    Caption = 'Delete'
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = DM.QrySELECT
    Left = 288
    Top = 309
  end
end