object frmOrder: TfrmOrder
  Left = 0
  Top = 0
  Caption = 'Order Form'
  ClientHeight = 448
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 162
    Width = 624
    Height = 95
    Align = alCustom
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 66
      Width = 100
      Height = 21
      Caption = 'Order Details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 114
      Top = 72
      Width = 163
      Height = 15
      Caption = '(Select order to view its details)'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 374
    Width = 625
    Height = 75
    TabOrder = 6
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 40
    Width = 624
    Height = 122
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGridCellClick
  end
  object btnCreate: TButton
    Left = 41
    Top = 182
    Width = 129
    Height = 33
    Caption = 'Create Order'
    TabOrder = 3
    OnClick = btnCreateClick
  end
  object btnUpdate: TButton
    Left = 248
    Top = 182
    Width = 129
    Height = 33
    Caption = 'Update Order'
    TabOrder = 4
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 447
    Top = 182
    Width = 129
    Height = 33
    Caption = 'Delete Order'
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 255
    Width = 624
    Height = 121
    DataSource = DataSource3
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitTop = 8
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 50
      Height = 21
      Caption = 'Orders'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 264
      Top = 13
      Width = 3
      Height = 15
    end
  end
  object btnCreateProduct: TButton
    Left = 41
    Top = 396
    Width = 129
    Height = 33
    Caption = 'Add Detail'
    TabOrder = 8
    OnClick = btnCreateProductClick
  end
  object btnUpdateProduct: TButton
    Left = 248
    Top = 396
    Width = 129
    Height = 33
    Caption = 'Update Detail'
    TabOrder = 9
    OnClick = btnUpdateProductClick
  end
  object btnDeleteProduct: TButton
    Left = 447
    Top = 396
    Width = 129
    Height = 33
    Caption = 'Delete Delete'
    TabOrder = 10
    OnClick = btnDeleteProductClick
  end
  object DataSource2: TDataSource
    DataSet = DM.OrdrQrySELECT
    Left = 296
    Top = 133
  end
  object DataSource3: TDataSource
    DataSet = DM.OrdrDtlQrySELECT
    Left = 288
    Top = 336
  end
end
