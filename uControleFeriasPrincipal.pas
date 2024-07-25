unit uControleFeriasPrincipal;

interface

uses
  Windows,
  Messages,
  SysUtils,
  DateUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,

  uTelaLogin,
  uCadastroProjeto,
  uGerenciadorMigracaoBD,
  uCadastroPeriodoFerias,
  uMigracoesBD,
  uConexaoBD,
  uUtilitarios,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Stan.Def,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.PG,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,

  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons,

  dxBar,
  dxRibbon,
  dxRibbonForm,
  dxRibbonSkins,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxClasses,
  dxUIAClasses,
  dxSkinsCore,
  dxSkinOffice2007Blue,
  dxSkinOffice2010Silver,
  dxRibbonCustomizationForm,
  dxCore,
  dxStatusBar,
  dxRibbonStatusBar,
  dxBarApplicationMenu,
  dxSkinsForm,
  cxGeometry,
  dxFramedControl,

  dxPanel,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  cxButtons,
  dxMessageDialog,
  dxBarBuiltInMenu,
  cxPC,
  cxContainer,
  cxLabel,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxDBEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxGroupBox,
  System.ImageList,
  Vcl.ImgList,
  cxImageList,
  dxGDIPlusClasses,
  dxSkinOffice2010Blue,
  cxMemo, cxCalendar, Vcl.ComCtrls, cxDateUtils;

type
  EStatusAndamentoFerias = (ZERADO, ANDAMENTO, FINALIZADO);
  EStatusConflitoFerias = (SEM_CONFLITO, COM_CONFLITO);

  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TControleFeriasPrincipal = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxRibbon1: TdxRibbon;
    dxTabInicio: TdxRibbonTab;
    dxRibbonStatusBar: TdxRibbonStatusBar;
    dxSkinController1: TdxSkinController;
    dxPanel1: TdxPanel;
    dxPanel2: TdxPanel;
    Splitter1: TSplitter;
    cxGridPrincipalDBTableView: TcxGridDBTableView;
    cxGridPrincipalLevel: TcxGridLevel;
    cxGridPrincipal: TcxGrid;
    cxGridPreenchimentoDBTableView: TcxGridDBTableView;
    cxGridPreenchimentoLevel: TcxGridLevel;
    cxGridPreenchimento: TcxGrid;
    dxPanel3: TdxPanel;
    tblPrinColunaIdPessoa: TcxGridDBColumn;
    tblPrinColunaCdPessoa: TcxGridDBColumn;
    tblPrinColunaCdNome: TcxGridDBColumn;
    tblPrinColunaDtInicio: TcxGridDBColumn;
    tblPrinColunaDtFinal: TcxGridDBColumn;
    tblPrinColunaCdEmpresa: TcxGridDBColumn;
    tblPrinColunaNmEmpresa: TcxGridDBColumn;
    tblPrinColunaDtCadastro: TcxGridDBColumn;
    tblPrinColunaUsuarioVinculado: TcxGridDBColumn;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    cxStyleRepository1: TcxStyleRepository;
    cxGridSelecaoStyle: TcxStyle;
    cxPageCtrlPrincipal: TcxPageControl;
    cxTabFeriasPreenchidas: TcxTabSheet;
    cxTabConflitos: TcxTabSheet;
    tblPreencColunaIdPessoa: TcxGridDBColumn;
    tblPreencColunaCdChamada: TcxGridDBColumn;
    tblPreencColunaNmPessoa: TcxGridDBColumn;
    tblPreencColunaVlTotalDiasRegistrados: TcxGridDBColumn;
    tblPreencColunaVlDiasPrevistos: TcxGridDBColumn;
    cxLblOpcoes: TcxLabel;
    pnConteudoOpcoes: TPanel;
    cxLabel1: TcxLabel;
    cxBtnProcessar: TcxButton;
    cxTxNmVendedor: TcxTextEdit;
    cxGrpBxFiltro: TcxGroupBox;
    cxImageList: TcxImageList;
    cxGridPreenchimentoDBTableViewColumn1: TcxGridDBColumn;
    dxBarMgrFerias: TdxBar;
    dxBarBtnCadastroFerias: TdxBarLargeButton;
    dxBarBtnCadastroProjeto: TdxBarLargeButton;
    cxGridConflitos: TcxGrid;
    cxGridConflitosDBTableView: TcxGridDBTableView;
    tblConfColunaCdChamada: TcxGridDBColumn;
    tblConfColunaStatus: TcxGridDBColumn;
    tblConfColunaNome: TcxGridDBColumn;
    tblConfColunaDtInicio: TcxGridDBColumn;
    tblConfColunaDtFinal: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    chBxSemPeriodoGradePrincipal: TCheckBox;
    tblConfColunaIdPessoa: TcxGridDBColumn;
    dxPanel4: TdxPanel;
    cxLblDescConflito: TcxLabel;
    cxGridConflitosDBTableViewColumn1: TcxGridDBColumn;
    gpBxSemVend: TGroupBox;
    chBxSemPeriodoGradePreencimento: TCheckBox;
    gpBxOutros: TGroupBox;
    chBxEsconderVendedoresPeriodoCompleto: TCheckBox;
    dxBarBtnVendedores: TdxBarLargeButton;
    dxBarBtnCaracteristicas: TdxBarLargeButton;
    tblPrinColunaLsCar: TcxGridDBColumn;
    dxBarBtnExcluirPeriodoSelec: TdxBarLargeButton;
    dxBarBtnEditarDiasPrevistos: TdxBarLargeButton;
    chBxAutoExpandirGrupos: TCheckBox;
    dxBarBtnSair: TdxBarLargeButton;
    dxBarManager1Bar1: TdxBar;
    dxBarBtnExcluirTodosPeriodos: TdxBarLargeButton;
    chBxNaoResumirCrc: TCheckBox;
    cxDtEdtInicio: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDtEdtFinal: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxBtnLimpar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxGridPreenchimentoDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxBtnProcessarClick(Sender: TObject);
    procedure cxTxNmVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridPrincipalDBTableViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridPreenchimentoDBTableViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxPageCtrlPrincipalClick(Sender: TObject);
    procedure cxGridConflitosDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxBarBtnCadastroProjetoClick(Sender: TObject);
    procedure dxBarBtnCadastroFeriasClick(Sender: TObject);
    procedure dxBarBtnVendedoresClick(Sender: TObject);
    procedure dxBarBtnCaracteristicasClick(Sender: TObject);
    procedure dxBarBtnExcluirPeriodoSelecClick(Sender: TObject);
    procedure dxBarBtnEditarDiasPrevistosClick(Sender: TObject);
    procedure dxBarBtnSairClick(Sender: TObject);
    procedure dxBarBtnExcluirTodosPeriodosClick(Sender: TObject);
    procedure cxBtnLimparClick(Sender: TObject);
    
  private
    { Private declarations }
    DacConnection: TFDConnection;
    FrmCadastroPeriodoFerias: TFrmCadastroPeriodoFerias;

    procedure InicializarTela;
    procedure CarregarEstadoInicial;

    procedure ProcessarDadosGridPrincipal;
    procedure ProcessarDadosGridPreenchimento;
    procedure AcaoProcessarFiltros;

    procedure ProcessarDadosGridConflitos; overload;
    procedure ProcessarDadosGridConflitos(
      const IdPessoa: String; var DtInicio, DtFinal: TDateTime); overload;

    procedure InicializarBancoDeDados(const Host, Database, Esquema: String);

    function ObterPeriodoSelecionadoPrincipal: TcxCustomGridRecord;
    function ObterValorNatural(const Msg: String; const VlMinimo: Integer): Integer;
    function ObterStatusConflitoFerias(var TextoValidacao: String): EStatusConflitoFerias;
    function ObterColorPreenchimento(var StatusAndamento: EStatusAndamentoFerias): TColor;

    function ObterIndiceIconePreenchimento(
      var StatusAndamento: EStatusAndamentoFerias): Integer; overload;
    function ObterIndiceIconePreenchimento(
    var StatusConflitoFerias: EStatusConflitoFerias): Integer; overload;

    procedure OnCloseLimparFrmCadastroPeriodoFerias(Sender: TObject; var Action: TCloseAction);
    procedure OnEventoPeriodoInserido;

    procedure AtualizarFormPeriodoDeFeriasEmSelecao;

    procedure RemoverPeriodoDeFerias(const DtInicio, DtFinal: TDateTime; IdPessoa: String);
    procedure AtualizarDiasPrevistosDe(const IdPessoa: String; NovoVlDiasPrevistos: Integer);
    procedure LimparTodosPeriodosDeFerias;


  public
    { Public declarations }
  end;

var
  ControleFeriasPrincipal : TControleFeriasPrincipal;

implementation


{$R *.dfm}

procedure TControleFeriasPrincipal.FormCreate(Sender: TObject);
var
  TelaLogin: TTelaLogin;
  NmDatabase, NmHost, NmUsuario, Esquema: String;
begin
  TelaLogin := TTelaLogin.Create(nil);
  try
    TelaLogin.ShowModal;
  finally
    if TelaLogin.ModalResult <> mrOk
      then Application.Terminate;

    DacConnection := TelaLogin.DacConnection;

    if not Assigned(DacConnection) then
    begin
      TUtilitarios.MensagemErroRapido('Não foi possível estabelecer conexão com o banco de dados.');
      Application.Terminate;
    end;

    NmUsuario  := TelaLogin.TxUsuario.Text;
    Esquema    := TelaLogin.cmBxSchema.Text;
    NmDatabase := TelaLogin.ConfigConexaoBD.Database;
    NmHost     := TelaLogin.ConfigConexaoBD.Host;

    TelaLogin.Free;

    dxRibbonStatusBar.Panels[0].Text :=
      Format('%s Conectado em %s/%s',
      [NmUsuario, NmDatabase, NmHost]);

    InicializarBancoDeDados(NmHost, NmDatabase, Esquema);
    InicializarTela;

  end;
end;

procedure TControleFeriasPrincipal.InicializarBancoDeDados(
  const Host, Database, Esquema: String);
var
  GenMigracaoBD : TGerenciadorBDMigracao;
begin
  try
    GenMigracaoBD := TGerenciadorBDMigracao.Create(Host, Database, Esquema);
    GenMigracaoBD.RegistrarMigracaoBD(MigracoesControleFerias.Create);
    GenMigracaoBD.Inicializar;
  finally
    GenMigracaoBD.Free;
  end;
end;

procedure TControleFeriasPrincipal.cxBtnLimparClick(Sender: TObject);
begin
  cxDtEdtInicio.Clear;
  cxDtEdtFinal.Clear;
end;

procedure TControleFeriasPrincipal.cxBtnProcessarClick(Sender: TObject);
begin
  AcaoProcessarFiltros;
end;

function TControleferiasPrincipal.ObterPeriodoSelecionadoPrincipal: TcxCustomGridRecord;
var
  IndiceLinhaSelecionada: Integer;
begin
  IndiceLinhaSelecionada :=
    cxGridPrincipalDBTableView.DataController.FocusedRowIndex;
  Result :=
    cxGridPrincipalDBTableView.ViewData.Records[IndiceLinhaSelecionada];
end;

function TControleFeriasPrincipal.ObterStatusConflitoFerias(
  var TextoValidacao: String): EStatusConflitoFerias;
begin
  if SameText(TextoValidacao, 'Conflita')
    then Result := EStatusConflitoFerias.COM_CONFLITO
  else
    Result := EStatusConflitoFerias.SEM_CONFLITO;
end;

function TControleFeriasPrincipal.ObterIndiceIconePreenchimento(
  var StatusConflitoFerias: EStatusConflitoFerias): Integer;
begin
  case StatusConflitoFerias of
    SEM_CONFLITO: Exit(6);
    COM_CONFLITO: Exit(5);
  end;
end;

function TControleFeriasPrincipal.ObterValorNatural(
  const Msg: String; const VlMinimo: Integer): Integer;
var
  TextoInput: String;
begin
  while True do
  begin
    try
      TextoInput := InputBox(
        'Confirmação',
        Msg + ' (Mínimo: ' + IntToStr(VlMinimo) + ')',
        '');

        { CASO FECHE O INPUTBOX }
        if Trim(TextoInput) = '' then
          Exit(-1);

        Result := StrToInt(TextoInput);
        if Result >= VlMinimo
          then Exit;

        TUtilitarios.MensagemErroRapido('Valor inferior ao mínimo. Tente novamente!');
    except
      on E: EConvertError do
      begin
        TUtilitarios.MensagemErroRapido('Valor inválido. Tente novamente!');
      end;
    end;
  end;
end;

{ ============================================================================ }
{ ===================== CUSTOMIZAÇÃO LINHAS DA GRIDS ========================= }
{ ============================================================================ }

procedure TControleFeriasPrincipal.cxGridConflitosDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  TextoValidacao: String;
  StatusConflitoFerias: EStatusConflitoFerias;
  { PARA DESENHAR IMAGEM NA GRID }
  IndiceImagemConflito: Integer;
  APainter: TcxPainterAccess;
  AEditViewInfo: TcxCustomTextEditViewInfo;
  AImageRect: TRect;
begin
  TextoValidacao := VarAsType(
    AViewInfo.GridRecord.Values[tblConfColunaStatus.Index],
    varString);

  StatusConflitoFerias := ObterStatusConflitoFerias(TextoValidacao);

  {DESENHANDO IMAGEM NA GRID }
  if AViewInfo.Item = cxGridConflitosDBTableViewColumn1 then
  begin
    IndiceImagemConflito := ObterIndiceIconePreenchimento(StatusConflitoFerias);

    APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo)
      .GetPainterClass.Create(ACanvas, AViewInfo));
  try
    AEditViewInfo := TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo);

    APainter.DrawContent;
    APainter.DrawBorders;

    AImageRect := AViewInfo.ContentBounds;
    AImageRect.Left := AImageRect.Left + 4;
    AImageRect.Top := AImageRect.Top + 4;

    AImageRect.Width := 16;
    AImageRect.Height := 16;

    cxImageList.Draw(ACanvas.Canvas, AImageRect, IndiceImagemConflito);
  finally
    APainter.Free;
  end;
    ADone := True;
  end;
end;

procedure TControleFeriasPrincipal.cxGridPreenchimentoDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  VlDiasRegistrados: Integer;
  VlDiasPrevistos: Integer;
  StatusAndamento: EStatusAndamentoFerias;

  { PARA DESENHAR IMAGEM NA GRID }
  IndiceImagemPreenchimento: Integer;
  APainter: TcxPainterAccess;
  AEditViewInfo: TcxCustomTextEditViewInfo;
  AImageRect: TRect;
begin

  VlDiasRegistrados := VarAsType(
    AViewInfo.GridRecord.Values[tblPreencColunaVlTotalDiasRegistrados.Index],
    varInteger);

  VlDiasPrevistos := VarAsType(
    AViewInfo.GridRecord.Values[tblPreencColunaVlDiasPrevistos.Index],
    varInteger);

  if VlDiasRegistrados = 0
    then StatusAndamento := ZERADO

  else if VlDiasRegistrados >= VlDiasPrevistos
    then StatusAndamento := FINALIZADO

  else if VlDiasRegistrados < VlDiasPrevistos
    then StatusAndamento := ANDAMENTO;

  {DESENHANDO IMAGEM NA GRID }
  if AViewInfo.Item = cxGridPreenchimentoDBTableViewColumn1 then
  begin
    IndiceImagemPreenchimento := ObterIndiceIconePreenchimento(StatusAndamento);

    APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo)
      .GetPainterClass.Create(ACanvas, AViewInfo));
  try
    AEditViewInfo := TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo);

    APainter.DrawContent;
    APainter.DrawBorders;

    AImageRect := AViewInfo.ContentBounds;
    AImageRect.Left := AImageRect.Left + 4;
    AImageRect.Top := AImageRect.Top + 4;

    AImageRect.Width := 16;
    AImageRect.Height := 16;

    cxImageList.Draw(ACanvas.Canvas, AImageRect, IndiceImagemPreenchimento);
  finally
    APainter.Free;
  end;
    ADone := True;
  end;

  if AViewInfo.Selected
    then Exit;

  ACanvas.Font.Color :=
    ObterColorPreenchimento(StatusAndamento);

end;

function TControleFeriasPrincipal.ObterIndiceIconePreenchimento(
  var StatusAndamento: EStatusAndamentoFerias): Integer;
begin
  case StatusAndamento of
    ZERADO:     Exit(2);
    ANDAMENTO:  Exit(1);
    FINALIZADO: Exit(0);
  end;
end;

function TControleFeriasPrincipal.ObterColorPreenchimento(
  var StatusAndamento: EStatusAndamentoFerias): TColor;
begin
  case StatusAndamento of
    ZERADO:     Exit(TUtilitarios.HexToColor('#0f172a'));
    ANDAMENTO:  Exit(TUtilitarios.HexToColor('#3b82f6'));
    FINALIZADO: Exit(TUtilitarios.HexToColor('#22c55e'));
  end;
end;

{ ============================================================================ }
{ =================== SINCRONIZAÇÃO SELEÇÃO DAS GRIDS ======================== }
{ ============================================================================ }

procedure TControleFeriasPrincipal.cxGridPrincipalDBTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  I: Integer;
  VarIdPessoaPrincipal: Variant;
begin
  VarIdPessoaPrincipal :=
    ACellViewInfo.GridRecord.Values[tblPrinColunaIdPessoa.Index];

  for I := 0 to cxGridPreenchimentoDBTableView.DataController.RowCount - 1 do
  begin
    if cxGridPreenchimentoDBTableView.ViewData.Records[I].
      Values[tblPreencColunaIdPessoa.Index] = VarIdPessoaPrincipal then
    begin
      cxGridPreenchimentoDBTableView.DataController.FocusedRowIndex := I;
    end;
  end;

  { REPROCESSAR INFORMAÇÕES NA GRID DE CONFLITOS }
  ProcessarDadosGridConflitos;

  { ATUALIZAR FORM AUXILIAR PARA A SELEÇÃO DE
  PERIODO DE FÉRIAS AO VENDEDOR SELECIONADO }
  AtualizarFormPeriodoDeFeriasEmSelecao;
end;

procedure TControleFeriasPrincipal.cxGridPreenchimentoDBTableViewCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  I: Integer;
  VarIdPessoaPreenchimento: Variant;
begin
  VarIdPessoaPreenchimento :=
    ACellViewInfo.GridRecord.Values[tblPreencColunaIdPessoa.Index];

  for I := 0 to cxGridPrincipalDBTableView.DataController.RowCount - 1 do
  begin
    if cxGridPrincipalDBTableView.ViewData.Records[I].
      Values[tblPrinColunaIdPessoa.Index] = VarIdPessoaPreenchimento then
    begin
      cxGridPrincipalDBTableView.DataController.FocusedRowIndex := I;
    end;

  end;

end;


{ ============================================================================ }
{ ============================================================================ }
{ ============================================================================ }

procedure TControleferiasPrincipal.ProcessarDadosGridConflitos;
var
  IdPessoa, NmPessoa: String;
  VariantDtInicio, VariantDtFinal: Variant;
  DtInicio, DtFinal: TDateTime;
  PeriodoRecord: TcxCustomGridRecord;
begin
  PeriodoRecord   := ObterPeriodoSelecionadoPrincipal;

  { NÃO PROCESSAR DADOS DE GRUPOS }
  if Not PeriodoRecord.IsData
    then Exit;

  NmPessoa        := VarToStr(PeriodoRecord.Values[tblPrinColunaCdNome.Index]);
  IdPessoa        := VarToStr(PeriodoRecord.Values[tblPrinColunaIdPessoa.Index]);

  VariantDtInicio := PeriodoRecord.Values[tblPrinColunaDtInicio.Index];
  VariantDtFinal  := PeriodoRecord.Values[tblPrinColunaDtFinal.Index];

  { PARA QUANDO ESTIVER MARCADO PARA EXIBIR VENDEDORES SEM PERÍODO }
  if VarIsNull(VariantDtInicio) or VarIsNull(VariantDtFinal)
    then Exit;

  DtInicio := VarToDateTime(VariantDtInicio);
  DtFinal  := VarToDateTime(VariantDtFinal);

  ProcessarDadosGridConflitos(IdPessoa, DtInicio, DtFinal);
  cxLblDescConflito.Caption :=Format('Analisando %s no período %s até %s',
  [
    NmPessoa,
    FormatDateTime('dd/mm/yyyy', DtInicio),
    FormatDateTime('dd/mm/yyyy', DtFinal)
  ]);

end;

procedure TControleferiasPrincipal.ProcessarDadosGridConflitos(
  const IdPessoa: String; var DtInicio, DtFinal: TDateTime);
var
  FdQuery: TFDQuery;
  GridDataSource: TDataSource;
begin
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('SELECT');
      Add('   p.idpessoa,');
      Add('   p.nmpessoa,');
      Add('   p.cdchamada,');
      Add('   CASE WHEN ');
      Add('     (dtinicio, dtfinal) OVERLAPS (:paramDtInicio, :paramDtFinal) ');
      Add('     THEN ''Conflita'' ELSE ''Não Conflita'' END AS validacao, ');
      Add('   dtinicio, ');
      Add('   dtfinal ');
      Add('FROM ');
      Add('   cbperiodos CBP');
      Add('LEFT JOIN');
      Add('   pessoas P');
      Add('   ON (P.idpessoa = CBP.idpessoa)');
      Add('WHERE');
      Add('   p.stativo = ''S''');
      Add('   AND p.stvendedor = TRUE');
      Add('   AND p.idpessoa <> :paramIdPessoa');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString   := IdPessoa;
    FdQuery.ParamByName('paramDtInicio').AsDateTime := DtInicio;
    FdQuery.ParamByName('paramDtFinal').AsDateTime  := DtFinal;

    FdQuery.Connection := DacConnection;
    FdQuery.Active := True;

    GridDataSource := TDataSource.Create(nil);
    try
      GridDataSource.DataSet := FdQuery;
      cxGridConflitosDBTableView.DataController.DataSource := GridDataSource;
      cxGridConflitosDBTableView.DataController.Groups.FullExpand;
    except
      GridDataSource.Free;
      raise;
    end;
  except
    FdQuery.Free;
    raise;
  end;
end;

procedure TControleferiasPrincipal.ProcessarDadosGridPreenchimento;
var
  FdQuery: TFDQuery;
  GridDataSource: TDataSource;
begin
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('WITH cte_registro_periodos AS (');
      Add('SELECT');
      Add('   p.idpessoa,');
      Add('   p.nmpessoa,');
      Add('   p.cdchamada,');
      Add('   CAST(COALESCE(SUM(EXTRACT(EPOCH FROM (dtfinal - dtinicio)) / 86400), ''0'') AS INTEGER) AS totaldiasregistrados,');
      Add('   p.vldiasprevistos');
      Add('FROM');
      Add('   pessoas P');
      Add('LEFT JOIN');
      Add('   cbperiodos CBP');
      Add('   ON (P.idpessoa = CBP.idpessoa)');
      Add('WHERE');
      Add('   p.stativo = ''S''');
      Add('   AND p.stvendedor = TRUE ');
      if chBxSemPeriodoGradePreencimento.State <> cbChecked
        then Add('   AND cbp.idpessoa IS NOT NULL ');
      Add('GROUP BY');
      Add('   p.idpessoa');
      Add('ORDER BY');
      Add(' p.nmpessoa)');
      { FINAL CTE }
      Add('SELECT');
      Add(' * ');
      Add('FROM');
      Add(' cte_registro_periodos');
      Add(' WHERE 1 = 1 ');
      if chBxEsconderVendedoresPeriodoCompleto.State = cbChecked
        then Add(' AND (vldiasprevistos - totaldiasregistrados) > 0');
      if Trim(cxTxNmVendedor.Text) <> '' then
      begin
        Add(' AND nmpessoa ILIKE ''%'' || :paramNmPessoa || ''%''');
        FdQuery.ParamByName('paramNmPessoa').AsString := cxTxNmVendedor.Text;
      end;
    end;

    FdQuery.Connection := DacConnection;
    FdQuery.Active := True;

    GridDataSource := TDataSource.Create(nil);
    try
      GridDataSource.DataSet := FdQuery;
      cxGridPreenchimentoDBTableView.DataController.DataSource := GridDataSource;
    except
      GridDataSource.Free;
      raise;
    end;
  except
    FdQuery.Free;
    raise;
  end;
end;

procedure TControleferiasPrincipal.ProcessarDadosGridPrincipal;
var
  FdQuery: TFDQuery;
  GridDataSource: TDataSource;
begin
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('SELECT ');
      Add('   p.idpessoa, ');
      Add('   p.nmpessoa, ');
      Add('   p.cdchamada, ');
      Add('   CAST(cbp.dtinicio AS DATE) AS "dtinicio", ');
      Add('   CAST(cbp.dtfinal  AS DATE) AS "dtfinal", ');
      Add('   COALESCE(NULLIF(p.cdempresa, ''''), ''999'') AS "cdempresa", ');
      Add('   COALESCE(es.nmempresa, ''SEM EMPRESA'') AS "nmempresa", ');
      Add('   CAST(p.dtcadastro AS DATE) AS "dtcadastro", ');
      Add('   COALESCE(ads.nmusuario, ''SEM USUÁRIO'') AS "nmusuario", ');

      { !! particularidades para "expandir" caracteristicas para mais de uma linha na grid !! }
      if chBxNaoResumirCrc.Checked then
        Add('   UNNEST(COALESCE(L_J_CPS.caracteristicas, ARRAY[''Sem característica''])) AS "dscaracteristicas" ')
      else
        Add('   COALESCE(L_J_CPS.caracteristicas, ''Sem característica'') AS "dscaracteristicas" ');

      Add('FROM ');
      Add('   cbperiodos cbp ');
      Add('RIGHT JOIN ');
      Add('   pessoas p ');
      Add('   ON p.idpessoa = cbp.idpessoa ');
      Add('LEFT JOIN ');
      Add('   system.adusystem ads ');
      Add('   ON ads.idusuario = p.idusuario ');
      Add('LEFT JOIN ');
      Add('   empshop es ');
      Add('   ON es.cdempresa = p.cdempresa ');
      { JOIN CARACTERISTICAS }
      Add('LEFT JOIN (');
      Add('   SELECT ');
      Add('      PC.idpessoa,');

      { !! particularidades para "expandir" caracteristicas para mais de uma linha na grid !! }
      if chBxNaoResumirCrc.Checked then
        Add('      array_agg(CPS.dscaracpessoa) AS "caracteristicas" ')
      else
        Add('      string_agg(CPS.dscaracpessoa, '', '') AS "caracteristicas" ');

      Add('   FROM ');
      Add('      pesscar PC');
      Add('   JOIN ');
      Add('     caracps CPS');
      Add('     ON (PC.idcaracpessoa = CPS.idcaracpessoa)');
      Add('   GROUP BY ');
      Add('     PC.idpessoa) L_J_CPS');
      Add('   ON (L_J_CPS.idpessoa = p.idpessoa)');
      { JOIN CARACTERISTICAS }
      Add('WHERE ');
      Add('   p.stativo = ''S'' ');
      Add('   AND p.stvendedor = TRUE');

      if chBxSemPeriodoGradePrincipal.State <> cbChecked
      then Add('   AND cbp.idpessoa IS NOT NULL ');

      if Trim(cxTxNmVendedor.Text) <> '' then
      begin
        Add(' AND p.nmpessoa ILIKE ''%'' || :paramNmPessoa || ''%''');
        FdQuery.ParamByName('paramNmPessoa').AsString := cxTxNmVendedor.Text;
      end;

      if TUtilitarios.EhDataValida(cxDtEdtInicio.Date) and TUtilitarios.EhDataValida(cxDtEdtFinal.Date) then
      begin
        Add(' AND cbp.dtinicio >= :paramDtInicio AND  cbp.dtfinal <= :paramDtFinal');
        FdQuery.ParamByName('paramDtInicio').AsDate := cxDtEdtInicio.Date;
        FdQuery.ParamByName('paramDtFinal').AsDate  := cxDtEdtFinal.Date;
      end;

      Add('ORDER BY');
      Add(' p.nmpessoa');
    end;

    FdQuery.Connection := DacConnection;
    FdQuery.Active := True;

    GridDataSource := TDataSource.Create(nil);

    try
      GridDataSource.DataSet := FdQuery;
      cxGridPrincipalDBTableView.DataController.DataSource := GridDataSource;

      if chBxAutoExpandirGrupos.Checked then
        cxGridPrincipalDBTableView.DataController.Groups.FullExpand;

    except
      GridDataSource.Free;
      raise;
    end;
  except
    FdQuery.Free;
    raise;
  end;
end;

procedure TControleFeriasPrincipal.dxBarBtnExcluirPeriodoSelecClick(Sender: TObject);
var
  CxRecordSelecionado: TcxCustomGridRecord;
  DtInicio, DtFinal: TDateTime;
  IdPessoa, NmPessoa: String;
  RetornoConfirmacao: Integer;
begin
  CxRecordSelecionado := ObterPeriodoSelecionadoPrincipal;

    { PROVAVEL QUE SEJA GRUPO SELECIONADO }
  if not (CxRecordSelecionado.IsData) then
    Exit;

  IdPessoa := CxRecordSelecionado.Values[tblPrinColunaIdPessoa.Index];
  NmPessoa := CxRecordSelecionado.Values[tblPrinColunaCdNome.Index];
  DtInicio := CxRecordSelecionado.Values[tblPrinColunaDtInicio.Index];
  DtFinal  := CxRecordSelecionado.Values[tblPrinColunaDtFinal.Index];


  if (Trim(IdPessoa) = '') or not
     (TUtilitarios.EhDataValida(DtInicio) and TUtilitarios.EhDataValida(DtFinal))
    then Exit;

  RetornoConfirmacao :=
    dxMessageDlg(
      'Realmente deseja excluir este período?' + sLineBreak +
      'De: '  + FormatDateTime('dd/mm/yyyy', DtInicio) + sLineBreak +
      'Até: ' + FormatDateTime('dd/mm/yyyy', DtFinal)  + sLineBreak +
      'Vendedor: ' + NmPessoa,
      TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbCancel, TMsgDlgBtn.mbCancel],
      0);

  { CANCELAR OPERAÇÃO }
  if RetornoConfirmacao <> IDYES
    then Exit;

  RemoverPeriodoDeFerias(DtInicio, DtFinal, IdPessoa);
  TUtilitarios.MensagemInformativaRapida('Exclusão de período concluída.');

  AcaoProcessarFiltros;

end;

procedure TControleFeriasPrincipal.dxBarBtnExcluirTodosPeriodosClick(
  Sender: TObject);
var
  RetornoConfirmacao: Integer;
begin
  RetornoConfirmacao := dxMessageDlg(
    'Essa operação exclui todos os períodos de férias de' +
    ' todos os vendedores, confirmar operação?',
    TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbAbort], 0);

  { CANCELAR OPERAÇÃO }
  if RetornoConfirmacao <> IDYES
    then Exit;

  LimparTodosPeriodosDeFerias;
  AcaoProcessarFiltros;

end;

procedure TControleFeriasPrincipal.dxBarBtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TControleFeriasPrincipal.dxBarBtnEditarDiasPrevistosClick(Sender: TObject);
var
  CxRecordSelecionado: TcxCustomGridRecord;
  IdPessoa, NmPessoa: String;
  NovoVlDiasPrevistos: Integer;
begin
  CxRecordSelecionado := ObterPeriodoSelecionadoPrincipal;

  { PROVAVEL QUE SEJA GRUPO SELECIONADO }
  if not (CxRecordSelecionado.IsData) then
    Exit;

  IdPessoa := CxRecordSelecionado.Values[tblPrinColunaIdPessoa.Index];
  NmPessoa := CxRecordSelecionado.Values[tblPrinColunaCdNome.Index];

  NovoVlDiasPrevistos := ObterValorNatural('Informe os dias previstos', 30);

  if (NovoVlDiasPrevistos = -1)
    then Exit;

  AtualizarDiasPrevistosDe(IdPessoa, NovoVlDiasPrevistos);
  AcaoProcessarFiltros;

end;

procedure TControleFeriasPrincipal.LimparTodosPeriodosDeFerias;
var
  FdQuery: TFDQuery;
begin
  FdQuery := TFdQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('TRUNCATE TABLE cbperiodos; ');
    end;

    FdQuery.Connection := DacConnection;
    FdQuery.ExecSQL;

  finally
    FdQuery.Free;
  end;
end;

procedure TControleFeriasPrincipal.AtualizarDiasPrevistosDe(
  const IdPessoa: String; NovoVlDiasPrevistos: Integer);
var
  FdQuery: TFDQuery;
begin
  FdQuery := TFdQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('UPDATE ');
      Add('   pessoas ');
      Add('SET ');
      Add('   vldiasprevistos = :paramNovoDiasPrevistos ');
      Add('WHERE');
      Add('   IdPessoa = :paramIdPessoa');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString           := IdPessoa;
    FdQuery.ParamByName('paramNovoDiasPrevistos').AsInteger := NovoVlDiasPrevistos;

    FdQuery.Connection := DacConnection;
    FdQuery.ExecSQL;

  finally
    FdQuery.Free;
  end;
end;

procedure TControleFeriasPrincipal.RemoverPeriodoDeFerias(
  const DtInicio, DtFinal: TDateTime; IdPessoa: String);
var
  FdQuery: TFDQuery;
begin
  FdQuery := TFdQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('DELETE FROM ');
      Add('   cbperiodos ');
      Add('WHERE');
      Add('   IdPessoa = :paramIdPessoa');
      Add('   AND DtInicio = :paramDtInicio');
      Add('   AND DtFinal = :paramDtFinal');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString   := IdPessoa;
    FdQuery.ParamByName('paramDtInicio').AsDateTime := DtInicio;
    FdQuery.ParamByName('paramDtFinal').AsDateTime  := DtFinal;

    FdQuery.Connection := DacConnection;
    FdQuery.ExecSQL;

  finally
    FdQuery.Free;
  end;
end;

procedure TControleferiasPrincipal.AcaoProcessarFiltros;
begin
  if (cxDtEdtFinal.Date < cxDtEdtInicio.Date) then
  begin
    TUtilitarios.MensagemAlertaRapido('Data final não pode ser menor que a inicial.');
    cxDtEdtFinal.Date := cxDtEdtInicio.Date + 30;
    Exit;
  end;
  if (cxDtEdtInicio.Date > cxDtEdtFinal.Date) then
  begin
    TUtilitarios.MensagemAlertaRapido('Data inicial não pode ser maior que a final.');
    cxDtEdtInicio.Date := cxDtEdtFinal.Date - 30;
    Exit;
  end;
  CarregarEstadoInicial;
end;

procedure TControleferiasPrincipal.CarregarEstadoInicial;
begin
  ProcessarDadosGridPrincipal;
  ProcessarDadosGridPreenchimento;
end;


procedure TControleFeriasPrincipal.cxTxNmVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13
    then cxBtnProcessar.Click;
end;

procedure TControleFeriasPrincipal.dxBarBtnCadastroProjetoClick(
  Sender: TObject);
var
  FrmCadastroProjeto: TFrmCadastroProjeto;
begin
  FrmCadastroProjeto := TFrmCadastroProjeto.Create(nil);
  try
    FrmCadastroProjeto.ShowModal;
  finally
    FrmCadastroProjeto.Free;
  end;
end;

procedure TControleFeriasPrincipal.dxBarBtnCadastroFeriasClick(Sender: TObject);
begin

  if (Assigned(FrmCadastroPeriodoFerias)) or not
     (ObterPeriodoSelecionadoPrincipal.IsData)
    then Exit;

  FrmCadastroPeriodoFerias := TFrmCadastroPeriodoFerias.Create(nil);
  FrmCadastroPeriodoFerias.DacConnection := DacConnection;

  { EVENTOS FORM PERIODO }
  FrmCadastroPeriodoFerias.OnClose := OnCloseLimparFrmCadastroPeriodoFerias;
  FrmCadastroPeriodoFerias.EventoPeriodoInserido := OnEventoPeriodoInserido;

  FrmCadastroPeriodoFerias.Show;
  { ATUALIZAR FORM AUXILIAR PARA A SELEÇÃO DE
  PERIODO DE FÉRIAS AO VENDEDOR SELECIONADO }
  AtualizarFormPeriodoDeFeriasEmSelecao;
end;

procedure TControleFeriasPrincipal.dxBarBtnVendedoresClick(Sender: TObject);
begin
  TUtilitarios.MensagemErroRapido('Só é possível abrir este módulo pelo Shop.');
end;

procedure TControleFeriasPrincipal.dxBarBtnCaracteristicasClick(Sender: TObject);
begin
  TUtilitarios.MensagemErroRapido('Só é possível abrir este módulo pelo Shop.');
end;

procedure TControleFeriasPrincipal.OnEventoPeriodoInserido;
begin
  AcaoProcessarFiltros;
end;

procedure TControleFeriasPrincipal.OnCloseLimparFrmCadastroPeriodoFerias(
  Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FrmCadastroPeriodoFerias) then
    FreeAndNil(FrmCadastroPeriodoFerias);
end;

procedure TControleFeriasPrincipal.AtualizarFormPeriodoDeFeriasEmSelecao;
var
  CxRecord: TcxCustomGridRecord;
begin
  if not (Assigned(FrmCadastroPeriodoFerias))
    then Exit;

  CxRecord := ObterPeriodoSelecionadoPrincipal;

  if not (CxRecord.IsData) then
    Exit;

  FrmCadastroPeriodoFerias.AtualizarPessoaSelecionada(
    VarToStr(CxRecord.Values[tblPrinColunaCdNome.Index]),
    VarToStr(CxRecord.Values[tblPrinColunaIdPessoa.Index])
  );

end;

procedure TControleFeriasPrincipal.cxPageCtrlPrincipalClick(Sender: TObject);
begin
  if cxPageCtrlPrincipal.ActivePageIndex <> 1
    then Exit;

  ProcessarDadosGridConflitos;
end;

procedure TControleFeriasPrincipal.InicializarTela;
begin
  { INICIALIZAR DADOS NAS GRIDS }
  CarregarEstadoInicial;
end;

end.
