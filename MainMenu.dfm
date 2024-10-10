object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Main Menu'
  ClientHeight = 549
  ClientWidth = 732
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
    Width = 732
    Height = 549
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 728
    ExplicitHeight = 536
    object Label1: TLabel
      Left = 328
      Top = 80
      Width = 95
      Height = 21
      Alignment = taCenter
      Caption = 'Assignment 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 264
      Top = 144
      Width = 233
      Height = 41
      Caption = 'Customer Maintenance'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 264
      Top = 232
      Width = 233
      Height = 41
      Caption = 'Orders / Order Details'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 264
      Top = 320
      Width = 233
      Height = 41
      Caption = 'Orders and Details Report'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
