unit uControleFeriasPrincipal;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,

  uTelaLogin,
  uGerenciadorMigracaoBD,
  uMigracoesBD,
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
  cxPC, cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  System.ImageList, Vcl.ImgList, cxImageList, dxGDIPlusClasses,
  dxSkinOffice2010Blue, cxMemo;

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
    dxBarMgrCadastros: TdxBar;
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
    SpeedButton1: TSpeedButton;
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
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
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
    procedure FormCreate(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure Splitter1Moved(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
    
  private
    { Private declarations }
    VlPanel3Inicial, init2, init3 : Integer;
    Panel3Aberto: Boolean;

    DacConnection: TFDConnection;

    procedure InicializarTela;
    procedure CarregarEstadoInicial;

    procedure ProcessarDadosGridPrincipal;
    procedure ProcessarDadosGridPreenchimento;

    procedure ProcessarDadosGridConflitos; overload;
    procedure ProcessarDadosGridConflitos(
      const IdPessoa: String; var DtInicio, DtFinal: TDateTime); overload;

    procedure InicializarBancoDeDados(const Host, Database: String);

    function ObterPeriodoSelecionadoPrincipal: TcxCustomGridRecord;

    function ObterStatusConflitoFerias(var TextoValidacao: String): EStatusConflitoFerias;
    function ObterColorPreenchimento(var StatusAndamento: EStatusAndamentoFerias): TColor;

    function ObterIndiceIconePreenchimento(
      var StatusAndamento: EStatusAndamentoFerias): Integer; overload;
    function ObterIndiceIconePreenchimento(
    var StatusConflitoFerias: EStatusConflitoFerias): Integer; overload;

    procedure AcaoProcessarFiltros;

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
  NmDatabase, NmHost, NmUsuario: String;
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
      ShowMessage('Não foi possível estabelecer conexão com o banco de dados.');
      Application.Terminate;
    end;

    NmUsuario := TelaLogin.TxUsuario.Text;

    TelaLogin.Free;

    NmDatabase := DacConnection.Params.Values['Database'];
    NmHost     := DacConnection.Params.Values['Server'];

    dxRibbonStatusBar.Panels[0].Text :=
      Format('%s Conectado em %s/%s',
      [NmUsuario, NmDatabase, NmHost]);

    InicializarBancoDeDados(NmHost, NmDatabase);

    InicializarTela;
  end;
end;



procedure TControleFeriasPrincipal.SpeedButton1Click(Sender: TObject);
var
  dif :integer;
begin
  Panel3Aberto := not Panel3Aberto;
  if not Panel3Aberto then
  begin
    dif := 35 - dxPanel3.Width;
    dxPanel3.Width := 35;
    cxGridPrincipal.width := init3 + abs(dif);
  end
  else
  begin
    dif := VlPanel3Inicial - dxPanel3.Width;
    dxPanel3.Width := VlPanel3Inicial;
    cxGridPrincipal.width := init3;
  end;
  cxGridPrincipal.Left := cxGridPrincipal.Left + dif;
  cxGridPrincipal.LayoutChanged;
  pnConteudoOpcoes.Visible := Panel3Aberto;
  cxLblOpcoes.Visible := Panel3Aberto;

  if Panel3Aberto
    then SpeedButton1.ImageIndex := 4
    else SpeedButton1.ImageIndex := 3;

end;


procedure TControleFeriasPrincipal.InicializarBancoDeDados(const Host, Database: String);
var
  GenMigracaoBD : TGerenciadorBDMigracao;
begin
  try
    GenMigracaoBD := TGerenciadorBDMigracao.Create(Host, Database);
    GenMigracaoBD.RegistrarMigracaoBD(MigracoesControleFerias.Create);
    GenMigracaoBD.Inicializar;
  finally
    GenMigracaoBD.Free;
  end;
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
      Add('   wshop.pessoas P');
      Add('LEFT JOIN');
      Add('   wshop.cbperiodos CBP');
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
      Add('   cbp.dtinicio AS "dtinicio", ');
      Add('   cbp.dtfinal AS "dtfinal", ');
      Add('   COALESCE(NULLIF(p.cdempresa, ''''), ''999'') AS "cdempresa", ');
      Add('   COALESCE(es.nmempresa, ''SEM EMPRESA'') AS "nmempresa", ');
      Add('   CAST(p.dtcadastro AS DATE) AS "dtcadastro", ');
      Add('   COALESCE(ads.nmusuario, ''SEM USUÁRIO'') AS nmusuario ');
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

      Add('ORDER BY');
      Add(' p.nmpessoa');
    end;

    FdQuery.Connection := DacConnection;
    FdQuery.Active := True;

    GridDataSource := TDataSource.Create(nil);

    try
      GridDataSource.DataSet := FdQuery;
      cxGridPrincipalDBTableView.DataController.DataSource := GridDataSource;
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

procedure TControleferiasPrincipal.AcaoProcessarFiltros;
begin
  CarregarEstadoInicial;
end;

procedure TControleferiasPrincipal.CarregarEstadoInicial;
begin
  ProcessarDadosGridPrincipal;
  ProcessarDadosGridPreenchimento;
end;

procedure TControleFeriasPrincipal.Splitter1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  Accept := Panel3Aberto;
end;

procedure TControleFeriasPrincipal.cxTxNmVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13
    then cxBtnProcessar.Click;

end;

procedure TControleFeriasPrincipal.cxPageCtrlPrincipalClick(Sender: TObject);
begin
  if cxPageCtrlPrincipal.ActivePageIndex <> 1
    then Exit;

  ProcessarDadosGridConflitos;
end;

procedure TControleFeriasPrincipal.FormResize(Sender: TObject);
begin
  init2 := cxGridPrincipal.Left;
  init3 := cxGridPrincipal.Width;
end;

procedure TControleFeriasPrincipal.Splitter1Moved(Sender: TObject);
begin
  if not Panel3Aberto then Exit;
  init2 := cxGridPrincipal.Left;
  init3 := cxGridPrincipal.Width;
end;

procedure TControleFeriasPrincipal.InicializarTela;
begin
  Constraints.MinHeight := 800;
  Constraints.MinWidth  := 600;
  Constraints.MaxHeight := 8080;
  Constraints.MaxWidth  := 1366;
  VlPanel3Inicial := dxPanel3.Width;
  Panel3Aberto := True;
  init2 := cxGridPrincipal.Left;
  init3 := cxGridPrincipal.Width;

  { INICIALIZAR DADOS NAS GRIDS }
  CarregarEstadoInicial;
end;

end.
