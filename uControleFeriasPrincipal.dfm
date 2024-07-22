object ControleFeriasPrincipal: TControleFeriasPrincipal
  Left = 0
  Top = 208
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'BI F'#233'rias'
  ClientHeight = 803
  ClientWidth = 1249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 785
    Top = 126
    Width = 6
    Height = 654
    AutoSnap = False
    MinSize = 50
    OnCanResize = Splitter1CanResize
    OnMoved = Splitter1Moved
    ExplicitLeft = 802
    ExplicitTop = 120
    ExplicitHeight = 655
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 1249
    Height = 126
    ApplicationButton.Menu = dxBarApplicationMenu1
    BarManager = dxBarManager1
    CapitalizeTabCaptions = bDefault
    ColorSchemeAccent = rcsaPurple
    ColorSchemeName = 'Office2010Silver'
    MinimizeOnTabDblClick = False
    ShowMinimizeButton = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabAreaSearchToolbar.Visible = False
    TabAreaToolbar.Visible = False
    TabOrder = 0
    TabStop = False
    ExplicitWidth = 1253
    object dxTabInicio: TdxRibbonTab
      Active = True
      Caption = 'In'#237'cio'
      Groups = <
        item
          Caption = 'Cadastros'
          ToolbarName = 'dxBarMgrCadastros'
        end
        item
          Caption = 'Gerenciamento de f'#233'rias'
          ToolbarName = 'dxBarMgrFerias'
        end>
      Index = 0
    end
  end
  object dxRibbonStatusBar: TdxRibbonStatusBar
    Left = 0
    Top = 780
    Width = 1249
    Height = 23
    Color = clBtnFace
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Text = 'Status'
      end>
    Ribbon = dxRibbon1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
  end
  object dxPanel1: TdxPanel
    Left = 0
    Top = 126
    Width = 785
    Height = 654
    Align = alLeft
    TabOrder = 2
    DesignSize = (
      783
      652)
    object cxGridPrincipal: TcxGrid
      Left = 191
      Top = 5
      Width = 587
      Height = 643
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object cxGridPrincipalDBTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellClick = cxGridPrincipalDBTableViewCellClick
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = 'Per'#237'odos = #0'
            Kind = skCount
            Column = tblPrinColunaCdNome
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnExpressionEditing = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.FocusRect = False
        OptionsView.NoDataToDisplayInfoText = 'Sem dados de f'#233'rias para apresentar'
        OptionsView.DataRowHeight = 26
        OptionsView.Footer = True
        OptionsView.GridLines = glNone
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 12
        Styles.UseOddEvenStyles = bFalse
        Styles.Inactive = cxGridSelecaoStyle
        Styles.Selection = cxGridSelecaoStyle
        object tblPrinColunaCdEmpresa: TcxGridDBColumn
          Caption = 'C'#243'digo Empresa'
          DataBinding.FieldName = 'cdempresa'
          DataBinding.IsNullValueType = True
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
        object tblPrinColunaCdPessoa: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'cdchamada'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object tblPrinColunaCdNome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nmpessoa'
          DataBinding.IsNullValueType = True
          Visible = False
          GroupIndex = 1
          HeaderAlignmentHorz = taCenter
        end
        object tblPrinColunaDtInicio: TcxGridDBColumn
          Caption = 'Data In'#237'cio'
          DataBinding.FieldName = 'dtinicio'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object tblPrinColunaDtFinal: TcxGridDBColumn
          Caption = 'Data Final'
          DataBinding.FieldName = 'dtfinal'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object tblPrinColunaUsuarioVinculado: TcxGridDBColumn
          Caption = 'Usu'#225'rio Vinculado'
          DataBinding.FieldName = 'nmusuario'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 110
        end
        object tblPrinColunaIdPessoa: TcxGridDBColumn
          Caption = 'Identificador (Pessoa)'
          DataBinding.FieldName = 'idpessoa'
          DataBinding.IsNullValueType = True
          Visible = False
          Width = 123
        end
        object tblPrinColunaNmEmpresa: TcxGridDBColumn
          Caption = 'Nome Empresa'
          DataBinding.FieldName = 'nmempresa'
          DataBinding.IsNullValueType = True
          Visible = False
          Width = 143
        end
        object tblPrinColunaDtCadastro: TcxGridDBColumn
          Caption = 'Cadastro'
          DataBinding.FieldName = 'dtcadastro'
          DataBinding.IsNullValueType = True
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
      end
      object cxGridPrincipalLevel: TcxGridLevel
        GridView = cxGridPrincipalDBTableView
      end
    end
    object dxPanel3: TdxPanel
      Left = 3
      Top = 5
      Width = 182
      Height = 644
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      DesignSize = (
        180
        642)
      object SpeedButton1: TSpeedButton
        Left = 154
        Top = 3
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        ImageIndex = 4
        Images = cxImageList
        Flat = True
        StyleElements = []
        OnClick = SpeedButton1Click
      end
      object pnConteudoOpcoes: TPanel
        Left = 0
        Top = 31
        Width = 180
        Height = 612
        Align = alCustom
        BevelOuter = bvNone
        Caption = 'pnConteudoOpcoes'
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          180
          612)
        object cxGrpBxFiltro: TcxGroupBox
          Left = 3
          Top = 0
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Filtros'
          TabOrder = 0
          DesignSize = (
            174
            321)
          Height = 325
          Width = 174
          object cxLabel1: TcxLabel
            Left = 8
            Top = 22
            Caption = 'Nome do Vendedor:'
            TabOrder = 0
          end
          object cxTxNmVendedor: TcxTextEdit
            Left = 8
            Top = 43
            TabOrder = 1
            OnKeyPress = cxTxNmVendedorKeyPress
            Width = 158
          end
          object cxBtnProcessar: TcxButton
            Left = 96
            Top = 292
            Width = 75
            Height = 25
            Caption = 'Processar'
            TabOrder = 2
            OnClick = cxBtnProcessarClick
          end
          object gpBxSemVend: TGroupBox
            Left = 8
            Top = 72
            Width = 158
            Height = 81
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Vendores sem F'#233'rias'
            TabOrder = 3
            DesignSize = (
              158
              81)
            object chBxSemPeriodoGradePrincipal: TCheckBox
              Left = 9
              Top = 19
              Width = 141
              Height = 19
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Ver na grade principal'
              TabOrder = 0
              WordWrap = True
            end
            object chBxSemPeriodoGradePreencimento: TCheckBox
              Left = 9
              Top = 40
              Width = 141
              Height = 32
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Ver na grade f'#233'rias preenchidas'
              Checked = True
              State = cbChecked
              TabOrder = 1
              WordWrap = True
            end
          end
          object gpBxOutros: TGroupBox
            Left = 13
            Top = 159
            Width = 158
            Height = 127
            Caption = 'Outros'
            TabOrder = 4
            object chBxEsconderVendedoresPeriodoCompleto: TCheckBox
              Left = 9
              Top = 24
              Width = 146
              Height = 79
              Caption = 
                'N'#227'o mostrar vendedores com per'#237'odo de f'#233'rias completo na grade d' +
                'e preenchimento'
              TabOrder = 0
              WordWrap = True
            end
          end
        end
      end
      object cxLblOpcoes: TcxLabel
        Left = 3
        Top = 3
        AutoSize = False
        Caption = 'Op'#231#245'es'
        Style.TextStyle = [fsBold]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        TabOrder = 1
        Height = 22
        Width = 134
        AnchorY = 14
      end
    end
  end
  object dxPanel2: TdxPanel
    Left = 791
    Top = 126
    Width = 458
    Height = 654
    Align = alClient
    TabOrder = 3
    DesignSize = (
      456
      652)
    object cxPageCtrlPrincipal: TcxPageControl
      Left = 5
      Top = 5
      Width = 448
      Height = 644
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Properties.ActivePage = cxTabFeriasPreenchidas
      Properties.CustomButtons.Buttons = <>
      OnClick = cxPageCtrlPrincipalClick
      ClientRectBottom = 638
      ClientRectLeft = 2
      ClientRectRight = 442
      ClientRectTop = 29
      object cxTabFeriasPreenchidas: TcxTabSheet
        Caption = 'F'#233'rias Preenchidas'
        ImageIndex = 0
        DesignSize = (
          440
          609)
        object cxGridPreenchimento: TcxGrid
          Left = 3
          Top = 3
          Width = 434
          Height = 603
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object cxGridPreenchimentoDBTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellClick = cxGridPreenchimentoDBTableViewCellClick
            OnCustomDrawCell = cxGridPreenchimentoDBTableViewCustomDrawCell
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.FocusRect = False
            OptionsView.NoDataToDisplayInfoText = 'Sem dados de f'#233'rias para apresentar'
            OptionsView.DataRowHeight = 26
            OptionsView.Footer = True
            OptionsView.GridLines = glNone
            Styles.UseOddEvenStyles = bFalse
            Styles.Inactive = cxGridSelecaoStyle
            Styles.Selection = cxGridSelecaoStyle
            object tblPreencColunaIdPessoa: TcxGridDBColumn
              Caption = 'Identificador (Pessoa)'
              DataBinding.FieldName = 'idpessoa'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object cxGridPreenchimentoDBTableViewColumn1: TcxGridDBColumn
              DataBinding.IsNullValueType = True
              BestFitMaxWidth = 26
              MinWidth = 26
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringWithFindPanel = False
              Options.Focusing = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringFilteredItemsListShowFilteredItemsOnly = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Options.FilteringPopupMultiSelect = False
              Options.AutoWidthSizable = False
              Options.ExpressionEditing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Width = 26
            end
            object tblPreencColunaCdChamada: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'cdchamada'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 93
            end
            object tblPreencColunaNmPessoa: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'nmpessoa'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 113
            end
            object tblPreencColunaVlTotalDiasRegistrados: TcxGridDBColumn
              Caption = 'Dias Registrados'
              DataBinding.FieldName = 'totaldiasregistrados'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 106
            end
            object tblPreencColunaVlDiasPrevistos: TcxGridDBColumn
              Caption = 'Dias Previstos'
              DataBinding.FieldName = 'vldiasprevistos'
              DataBinding.IsNullValueType = True
              FooterAlignmentHorz = taCenter
              GroupSummaryAlignment = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 83
            end
          end
          object cxGridPreenchimentoLevel: TcxGridLevel
            GridView = cxGridPreenchimentoDBTableView
          end
        end
      end
      object cxTabConflitos: TcxTabSheet
        Caption = 'Verifica'#231#227'o de Conflitos'
        ImageIndex = 1
        ExplicitWidth = 444
        ExplicitHeight = 610
        DesignSize = (
          440
          609)
        object cxGridConflitos: TcxGrid
          Left = 3
          Top = 39
          Width = 434
          Height = 567
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitWidth = 438
          ExplicitHeight = 568
          object cxGridConflitosDBTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCustomDrawCell = cxGridConflitosDBTableViewCustomDrawCell
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = 'Per'#237'odos = #0'
                Kind = skCount
                Column = tblConfColunaNome
              end>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnExpressionEditing = True
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.FocusRect = False
            OptionsView.NoDataToDisplayInfoText = 'Sem dados de f'#233'rias para apresentar'
            OptionsView.DataRowHeight = 26
            OptionsView.Footer = True
            OptionsView.GridLines = glNone
            OptionsView.GroupFooterMultiSummaries = True
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 12
            Styles.UseOddEvenStyles = bFalse
            Styles.Inactive = cxGridSelecaoStyle
            Styles.Selection = cxGridSelecaoStyle
            object cxGridConflitosDBTableViewColumn1: TcxGridDBColumn
              DataBinding.IsNullValueType = True
              BestFitMaxWidth = 26
              MinWidth = 24
              Options.Editing = False
              Options.Filtering = False
              Options.AutoWidthSizable = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 24
            end
            object tblConfColunaIdPessoa: TcxGridDBColumn
              Caption = 'Identificador (Pessoa)'
              DataBinding.FieldName = 'idpessoa'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object tblConfColunaCdChamada: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'cdchamada'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 79
            end
            object tblConfColunaNome: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'nmpessoa'
              DataBinding.IsNullValueType = True
              BestFitMaxWidth = 80
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 64
            end
            object tblConfColunaStatus: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'validacao'
              DataBinding.IsNullValueType = True
              Visible = False
              GroupIndex = 0
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 80
            end
            object tblConfColunaDtInicio: TcxGridDBColumn
              Caption = 'Data In'#237'cio'
              DataBinding.FieldName = 'dtinicio'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 84
            end
            object tblConfColunaDtFinal: TcxGridDBColumn
              Caption = 'Data Final'
              DataBinding.FieldName = 'dtfinal'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.AutoWidthSizable = False
              Width = 84
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridConflitosDBTableView
          end
        end
        object dxPanel4: TdxPanel
          Left = 3
          Top = 3
          Width = 434
          Height = 31
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitWidth = 438
          object cxLblDescConflito: TcxLabel
            Left = 5
            Top = 5
            Caption = 'Selecione um per'#237'odo antes'
            TabOrder = 0
          end
        end
      end
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
    Left = 1056
    Top = 8
    PixelsPerInch = 96
    object dxBarMgrCadastros: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1220
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarMgrFerias: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 81
      DockedTop = 0
      FloatLeft = 1265
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Cadastrar Per'#237'odo de F'#233'rias para Vendedor'
      Category = 0
      Hint = 'Cadastrar Per'#237'odo de F'#233'rias para Vendedor'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F4000000097048597300000B1300000B1301009A9C18000003E549444154789C
        ED966D6C13751CC79B90F05EED5D991112535FE8C1BAB2261646C6E82DBE357D
        D318DF1069AF5B54B0A021AE0FCAE2420931A8D805D110C8761DC45B16169538
        B7EB56AAEB149D5B68AF2DABC3756D67D7C73D4570ADFB99DF0A0B2B4C5BF790
        90EC977C92E6F7F4FDFE7BFF6B2A126DC6E3101A0EB6D2F68C4AD91C6D969F1A
        ED50DAC605A52D24C84FDFEE50DA22B65A3673007BD65CB8A66D46AC6A9DFA64
        DFE7B15959937F81B2DC84AA7361A0EDC945F69E0B03E62A9AFC0BD55FC46668
        76EAA3DA96E9A7D6445CC5A65EA5D9747CCFA711A0CC5EA0CC1ED87D6A6449FC
        3EBBAD238B35CAE2813DB608A8D8F464AD7DEA955589D3F6D43B349B81AAE628
        ECB47860A7394FD5F928D0F6D432F67D165DAA632FCEE02CCDA64DFF4F9C4D31
        B43D0D3517E3506E116097D99BC7E205550B9E3ABD0C556B72B176BF0F67F65F
        8CDFAB650E9524AEBA322555D953737832853508E526EF12F2C6C0BD933D4CC5
        09FFB25E85F5B7FC37C4A6665F6ACD3C5BC2E9936D38B8FF420C642661198AA6
        20D0ECD423C15A613FEEC83FA6444BD1379E661359BC58CA3363771F32601DCD
        AE68C03A9A2DEC7FF1CCD8DDFC454DCC17F566D45C9ADC46B7C535745B4AA338
        196C941985F90AA30088AC41C82A4E063FA0D9E9619A9D860286B1863D4BFD46
        611E77E02EDC89BB45A586CCE8DB256FF035C91B7CA7CB4DBE4ACC6938D842B7
        CEA85F3E7BE316829F3187B5CA06BF027B71066745EB19CC510B87ACABC8BFC5
        A601E6717C04901C5042EAA7BD1B6E00C0BB1592AE0F21E1FA3B37E198EB6124
        C7BFAD13976D880148F43D0F938E5F21DE0BB39E969CCB209DE8D612996EDD93
        2FACBB0198EC3A08B1AE39887D0791AFDF4DF00C7987D7113F3B0E12D25589FF
        9701887E2586896B9D30710D72BF77C090F540886788055E4B9CE534A2B5F9D7
        C4AC600022576B217A3502D14E98B9F1F19CEBF08E3F1C0C91E319F189920420
        D45E0DE1F62B30DECE3D0A7FFFA5305290FF06C6B90508B743E84BFD88534FFE
        D5AB27FA789DB88BD78AFB4B333076F93C842E43A9CCDFBA901D7CAFD273BD8E
        CCF5E989464E23DAC233E26A878E801E2D59DC2BE87DAB6C47E0F833DC4823D5
        1F303E17F019A501FFFB941BF15A28B7D74CB99D466512193251EE2123E5FEC5
        48B97F3C260DB8EA25779C0CF9671F43F6F632048738101D91E675E2DB3D3A82
        EB3E44D8BB5E7B62FB8A06826F3FBDDD774C62178E6EE33C0649D86320C3C347
        480E193C4C72836F905CE79BF23032F03AC90DD493DC0FF524F77D1DD97FBD8E
        0C3AF5924E2743720F1AE0B544B80729C6C083E131A009925BED2FA143477028
        2E2A35044399FAA6815417E6B5068B1A29760FAF25D548C9063643B401F10F2E
        295504DB6A7F410000000049454E44AE426082}
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Cadastrar Projetos'
      Category = 0
      Hint = 'Cadastrar Projetos'
      Visible = ivAlways
      LargeGlyph.SourceDPI = 96
      LargeGlyph.Data = {
        89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
        F4000000097048597300000761000007610195C3B8B60000001974455874536F
        667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000039049
        4441545885ED965D685B7518C67FEF39C9496A1BDBD28FAC4D2B452F84EA063A
        2D7AA903A99783A9A8110682E885D2C8B6EBDCBBD5CCDD8A886C829D8222A2C2
        C6262A346D11D68BD50BDD26DB4283DA35E6EB9C24E7BC5ED840929EB649AB57
        EE81FFCD73DEF77D9EFF79FF5F7017FF774827C1A7D3CE614F74BA217B25F178
        38B51703C64E01EFCD3B9373736A02A8704490D7EAC35079A31E37BBE4ECFFD7
        0DA4169C173C832B9989CAB9E4250D6C19B768270C8FE554BA32DBA9812D5B90
        5A70E2C08780B9417D033C0C8C3584D9C0A740BCA1E4A99929EBD89E0CCC2E38
        0F1970A541BC2328C41353A173EDC4FAB660EC86F533425B057CF093D6ACAFDB
        0DDEB20573736A66262A5F02CF7620FEAB06ADC7128FC8FAAE0D9C4E3B87D5E0
        4500942769EEF94EC88BF2AD1A28AAE999A9F0A99D1236AD6C4F745A549EEB40
        B41111158EA080C8FD40E70676836C51C9E495F58AE27A4AC8147A2DC60E9DCD
        4F5E8C47AEFE6706EC1A2CADBAAC95B5892F55953B3651C4587EFAE3C2196FA4
        FBF8E5A7A4E65763F32E1056806B1BC3DE4EFCFB9BB54DE22D3051993132A5F3
        C9A4FAEEB86DEF8277D3CE4722BCE2F7ED875B9B67BE1D54F4C4A5977ADE69DB
        406AD14EA0E27BB4668B4A3AE3367176D9217BFB4F2A952A3D3D5D4463831866
        D3A4738E5D1AFFF1D5A17C23E9FB5B52F3CE81ADC4013285E699ABE771F3FA2A
        D56A95EE4817B9F502D9CC1FAD69BDA170F7742BE96B60E689D0B2C2C916FA1A
        9007C8D9CD061CA74AAD5A233A3AC8E8F830F7F6F750C8977D2AEB81B60C0024
        A642C741EAFB785183D641E02B809A361B0804038808B9B5BFC8E78A940A652C
        2BE8A34F6FDB060066A6AC630A710D5ACF6C1CAF1E40C86C5E3A8180C9BED820
        8582CDAD1BABA8423436B0B9A041B695DAF11C68BAD54497401EECB518BB6313
        ADD39EEB61972B084AFDDF944B36E1AE508BBEF15D6BFD8E9E64751C3A9B9F54
        3196015355F9ED970C76C926D21FC10A0529E64B948B36C323030C0CF7FD93A4
        AC0C58F7EC3FFFBC346D9F1D9F647EB8188F5C45F40C403E57A45CB219191F26
        76DF3043D17E261E8811E9EDE6F7D5356A5517C03544DF6A15DFB501805CBEFB
        04F079A9602322048226BAB1385D4F09852D549552D1F680372FBCDC73C1AFCE
        AE5A504732A9C6677DB7DF5FCFE68ED65C5744043104CFF500B0C2963D32DA77
        74FEF57D9F6C55634F06EA38783233E868ED6DCFD5475DB7366404CCD58019F8
        62A010FBE072D2FF12BA8BBBA8E36F0C6D6BFBF1FB83820000000049454E44AE
        426082}
    end
  end
  object dxBarApplicationMenu1: TdxBarApplicationMenu
    BarManager = dxBarManager1
    Buttons = <>
    ExtraPane.AllowPinItems = False
    ExtraPane.Items = <>
    ItemLinks = <>
    ItemOptions.ShowDescriptions = False
    UseOwnFont = False
    Left = 1120
    Top = 8
    PixelsPerInch = 96
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2010Silver'
    FormCorners = fcRectangular
    Left = 1088
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 992
    Top = 8
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxGridSelecaoStyle: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 825117
      TextColor = clWhite
    end
  end
  object cxImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 656275
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000017749444154789C
          63604007AB42D918A6BBFB334C779DC630C3753304BB4D6598E6E20796C30BA6
          B9F930CC70BBCB30C3ED3F563CDDF50EC34C574FEC9A67BAE631CC70FD8B5333
          1CBBFE6598EE9683C566572234231932C3CD03C9CFAE77086992591CF5DF6075
          26B2D85D4898CC740B2046F3DD8FCFFE7FF8F1E53FDB2C2F841CC8E50CE0D086
          08B0CCF2FCCF3EDB1B45B3E882D0FF57DF3EF8FFEBCFEFFF413B1BD1BD329981
          6186DB569840C589B9FFF73C3EF79F79A60798CF3F2FF0FF9957B7FEFFF9FBF7
          7FDCBE2E2CB1E2B609E4822D3001A1F9C1FFEF7D7CFEBFE6D482FF5C737CFF1F
          7C7AE9FFBF7FFFFE671F9E82CB7B1B412E988A2C68BA36E7FFA79F5FFF1F7A06
          D15C79721EBED898CC004E7568123947A68035F75D5C8B3F3A67BA7B3330CC34
          666598E17A1B5DD2646D0E7ECDD3DD6E82F5324052A127490969BAEB1F86E96E
          AEA8A911943C893104A479A65B26F6FC004A9E33DC6EE1753686CD1899CA9815
          9A372683E3198C5D2781030CEE67040000E6889A9F024019460000000049454E
          44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000011F49444154789C
          9D93C14E02410C86E7823E0307F5E269C5D3328D6FE13B185F47C346036FE205
          C41B1D8DE1C2FA02FA04ECD2C6836448C705177666203669E630DB6FFBB7FF28
          B5135793F2120C67809C03D2E23739D7867BDDB7B2A34271FE648FC1701F9096
          60D8FA521BFAD1C88F496E8F1AC51A691C2A6C80909EB720803CF07DD8BE9EB8
          F443F8E14F33FADB8E0244CE6B79A1DCC002ADC6005517F74A237DFC1700C833
          A50D95FB00E9B808C92804508400A7B7530790D307D148F3A884EE4B61CF2AC8
          C9CDD4A6A3B94F02F7623B973FAF3B49FA9F3BF774A7C49EB2927D9064F0D558
          2398EFC47941EC79A80B6B996D9C28B604A4D1E1C5344CDF6D6BEB3D0844EC19
          9353DD658DE27A883DC5613261F188F309F24C06B6D15C8B1511976E04CC54D7
          5E0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000E549444154789C
          A593490EC2300C45B3012EC01110D82DACB80737035115C161184EC08EB2B1E1
          100CCB9A20A7A2D089A9961C6511BF7CC73FC6E4C21E7B03610884201286ABCB
          643FB507E8E7CFA761A9D31286B910CA8DD196A510C64238B391D72C16136EAA
          0A8B20586720C2B0283BD8EE8E5C56A8099F3D53B9EC0F80D832FA7A7B5025F5
          1DC04118270AD8FF0D20DC29E05243C1D9E85203707ADBC2E771262D4C6B00C6
          46EDA923F96B8CE479899108673F031882A79523AF2904ABAFA5332CED76D8C8
          FE0707C1B0AA9D876CBDB9509C0131FAEA307D61F5884BDD138ED39E5FE20EBE
          8570CFE38CA07B0000000049454E44AE426082}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000200000000000000000000000000000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000030000000D5000000230000000000000065000000B6000000070000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000007000000B1000000E70000002A0000001F000000DF000000B70000
          0007000000000000000000000000000000000000000000000000000000000000
          00000000000000000006000000AF000000E80000002C00000024000000E50000
          00AF000000050000000000000000000000000000000000000000000000000000
          0000000000000000000000000005000000AD000000E90000002D000000260000
          00E6000000AD0000000400000000000000000000000000000000000000000000
          000000000000000000000000000000000003000000A4000000EE000000340000
          0027000000E7000000AB00000004000000000000000000000000000000000000
          00000000000000000000000000000000000000000007000000E2000000DA0000
          00040000005B000000FF00000067000000000000000000000000000000000000
          000000000000000000000000000000000003000000A3000000EE000000340000
          002E000000EB000000A900000004000000000000000000000000000000000000
          0000000000000000000000000003000000A5000000EA0000002E0000002E0000
          00EB000000AA0000000400000000000000000000000000000000000000000000
          00000000000000000005000000AD000000E90000002D00000028000000E70000
          00AA000000040000000000000000000000000000000000000000000000000000
          000000000006000000AF000000E80000002C00000028000000E7000000AB0000
          0004000000000000000000000000000000000000000000000000000000000000
          00000000002B000000D6000000270000000000000078000000A9000000040000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000200000000000000000000000000000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000C249444154789C
          CDD2BB4A83511045E1AF1115BC905859181BC5CA229A4AA30FACA9CCC55608C1
          2EF105D42662A342921790C01CF8BB0C01C1DD4DB11667CE6CFE7B8EF188C398
          2FF1809D2CFC8631EA68E127845BABE046C0131CE00A33F4D781DB98A387CD0C
          FC5A816F02EE6063157C14F04BC0B758E02E031741797ABD22B8CF0ACA0AEFF1
          F3B5CAFEDDCCFE252798E219BBB88E0B0C32172839C50746519A6581BEA303DB
          9239C3278621B9C0179EB24D5CE63CAABB1F7333FAB09715FC7D7E019E592950
          321A4A710000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000016349444154789C
          B5D0CF4A02411C0770EF75C968D70285F49094159BA8E5226DDABA56442D12FD
          D9127B890EBD40502FD01304752BF0561D253DCE617D05C1E30EAEBA3BFE6296
          56D7CD440F0D7C607EBFE1FB3D8CC7F35F07AE7373A498AB90A2F445EF1385B5
          4B9121575904852C50A49055B122CD8F179645862869044A069CC8455AC54A6A
          7489266F31E6A980E05C00CA2CBD80597A86DE7C26A858FEA344A3E13C8FE084
          079B51FE04A3FCD19B2933CFFF2ED1E435C6388EA1AE1C07A7F6FB9BC5BD378E
          622A96A3FD92D6C17AB57BB8016EFAEB9365D85B7B9FABF40BA4E56A776F15DC
          F0E3BD65D85B4B5AE91768629069ED861111C3E064FE70EF3B99B0DA482E2D0C
          FC433DB1C8EADB2144764260EB3CDC5A067642506D24FD8361FBD4130CABF301
          445201A0F0DD8DC59E75DE5FFB33EC7196C47D886CFAC0498FB3B506373B3ADC
          2B894CB14DCE8BCCA817A82637337ED8598223D3158ADE270A4F72BE01B68E3B
          A0376215AC0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000013549444154789C
          9593CF4A033110C67351DF433328B59E7C1EC127D0471066583C48A56B8B7FCE
          E24D9F402BF4E013A8371FC166B05B2C484B6492EE9A66DB5D3B301092F94DF6
          9BFDA25414DB68F634720AC46F1A7924296B206E6F2683A65A163AB51B807C09
          64A6406C17269A8946EE364EEC7A1926F3BC148C52A3E9CD3501E2ABFFC24513
          E24EA119AA3E3BC883DBCC364FFFE46CE16057CD06560B1F3F8CEC646A6DFFE3
          C7EE24F9BE395780FC5E071FDD7B58E2A23F0E86CAAF4A136761F1F5CBD8DD16
          DF5C82DD3079281286F9C6E15DE60A0510B00A9EE557498214E64D6A602F0188
          DBF1C159EFDB9355B0F7434B893DE597C4870256C1CE95C967C33B11B9BBB291
          90D3C289624B4DE669052B3FEEDFD8B5B9F7E09B7067919CE831A525380CB1A7
          384C262C1E713E91359A56A139885FB7C34C4B448B6C150000000049454E44AE
          426082}
      end>
  end
end
