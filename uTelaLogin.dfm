object TelaLogin: TTelaLogin
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'TelaLogin'
  ClientHeight = 306
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object dxPanel1: TdxPanel
    Left = 8
    Top = 8
    Width = 265
    Height = 289
    TabOrder = 0
    object TxHost: TLabeledEdit
      Left = 24
      Top = 96
      Width = 205
      Height = 23
      EditLabel.Width = 25
      EditLabel.Height = 15
      EditLabel.Caption = 'Host'
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object TxDatabase: TLabeledEdit
      Left = 24
      Top = 152
      Width = 205
      Height = 23
      EditLabel.Width = 48
      EditLabel.Height = 15
      EditLabel.Caption = 'Database'
      TabOrder = 1
      Text = 'ALTERDATA_SHOP'
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 16
      AutoSize = False
      Caption = 'BI F'#233'rias'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -20
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Height = 49
      Width = 205
    end
  end
  object dxPanel2: TdxPanel
    Left = 279
    Top = 8
    Width = 241
    Height = 289
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 144
      Top = 187
      Width = 75
      Height = 25
      Caption = 'Logar'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object TxUsuario: TLabeledEdit
      Left = 16
      Top = 88
      Width = 205
      Height = 23
      EditLabel.Width = 40
      EditLabel.Height = 15
      EditLabel.Caption = 'Usu'#225'rio'
      TabOrder = 1
      Text = 'SUPERVISOR'
    end
    object TxSenha: TLabeledEdit
      Left = 16
      Top = 144
      Width = 205
      Height = 23
      EditLabel.Width = 32
      EditLabel.Height = 15
      EditLabel.Caption = 'Senha'
      PasswordChar = '*'
      TabOrder = 2
      Text = '123456'
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 200
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
  end
  object dxBarApplicationMenu1: TdxBarApplicationMenu
    BarManager = dxBarManager1
    Buttons = <>
    ExtraPane.Items = <>
    ItemLinks = <>
    UseOwnFont = False
    Left = 416
    PixelsPerInch = 96
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2010Silver'
    FormCorners = fcRectangular
    Left = 294
  end
end
