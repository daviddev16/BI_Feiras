object TelaLogin: TTelaLogin
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 306
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
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
      Text = ''
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
      Text = ''
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
    object chBxEditarConfig: TCheckBox
      Left = 16
      Top = 255
      Width = 153
      Height = 17
      Caption = 'Editar Configura'#231#227'o'
      TabOrder = 3
      OnClick = chBxEditarConfigClick
    end
    object cmBxSchema: TComboBox
      Left = 128
      Top = 188
      Width = 101
      Height = 23
      TabOrder = 4
    end
  end
  object dxPanel2: TdxPanel
    Left = 279
    Top = 8
    Width = 241
    Height = 289
    TabOrder = 1
    object cxBtnLogar: TcxButton
      Left = 144
      Top = 187
      Width = 75
      Height = 25
      Caption = 'Logar'
      TabOrder = 0
      OnClick = cxBtnLogarClick
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
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2010Silver'
    FormCorners = fcRectangular
    Left = 294
  end
end
