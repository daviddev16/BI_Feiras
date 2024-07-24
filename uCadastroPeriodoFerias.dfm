object FrmCadastroPeriodoFerias: TFrmCadastroPeriodoFerias
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastrar Per'#237'odo de F'#233'rias'
  ClientHeight = 331
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    460
    331)
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 432
    Height = 315
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Adicionando per'#237'odo de f'#233'rias para: '
    TabOrder = 0
    ExplicitWidth = 428
    ExplicitHeight = 314
    object dxWheelDataInicio: TdxDateTimeWheelPicker
      Left = 16
      Top = 69
      EditValue = 45292d
      Properties.OnChange = dxWheelDataInicioPropertiesChange
      TabOrder = 0
      Height = 160
      Width = 200
    end
    object dxWheelDataFinal: TdxDateTimeWheelPicker
      Left = 222
      Top = 69
      EditValue = 45292d
      Properties.OnChange = dxWheelDataFinalPropertiesChange
      TabOrder = 1
      Height = 160
      Width = 200
    end
    object cxBtnAdicionarPeriodo: TcxButton
      Left = 304
      Top = 275
      Width = 118
      Height = 25
      Caption = 'Adicionar per'#237'odo'
      TabOrder = 2
      OnClick = cxBtnAdicionarPeriodoClick
    end
    object dtPickerDataInicio: TDateTimePicker
      Left = 16
      Top = 235
      Width = 200
      Height = 23
      Date = 45292.000000000000000000
      Time = 45292.000000000000000000
      TabOrder = 3
      OnChange = dtPickerDataInicioChange
    end
    object dtPickerDataFinal: TDateTimePicker
      Left = 222
      Top = 235
      Width = 200
      Height = 23
      Date = 45495.000000000000000000
      Time = 0.956597083335509500
      TabOrder = 4
      OnChange = dtPickerDataFinalChange
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 32
      AutoSize = False
      Caption = 'DATA INICIAL'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      TabOrder = 5
      Transparent = True
      Height = 19
      Width = 200
      AnchorX = 116
      AnchorY = 42
    end
    object cxLabel2: TcxLabel
      Left = 222
      Top = 32
      AutoSize = False
      Caption = 'DATA FINAL'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      TabOrder = 6
      Transparent = True
      Height = 19
      Width = 200
      AnchorX = 322
      AnchorY = 42
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2010Silver'
    FormCorners = fcRectangular
    Left = 424
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 284
    Top = 65533
  end
end
