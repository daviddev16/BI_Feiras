unit uCadastroPeriodoFerias;

interface

uses
  Windows,
  Messages,
  SysUtils,
  System.Types,
  Variants,
  Classes,
  Graphics,
  DateUtils,
  Controls,
  Forms,

  uUtilitarios,

  Dialogs,
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
  cxMemo,
  Vcl.Menus,
  Vcl.StdCtrls,
  dxWheelPicker,
  dxNumericWheelPicker,
  dxDateTimeWheelPicker,
  Vcl.ComCtrls,
  Data.Bind.EngExt,
  Vcl.Bind.DBEngExt,
  System.Rtti,
  System.Bindings.Outputs,
  Vcl.Bind.Editors,
  Math,
  Data.Bind.Components;

type
  TEventoPeriodoInserido = procedure() of object;

  TFrmCadastroPeriodoFerias = class(TdxRibbonForm)
    dxSkinController1: TdxSkinController;
    dxWheelDataInicio: TdxDateTimeWheelPicker;
    GroupBox1: TGroupBox;
    dxWheelDataFinal: TdxDateTimeWheelPicker;
    cxBtnAdicionarPeriodo: TcxButton;
    dtPickerDataInicio: TDateTimePicker;
    dtPickerDataFinal: TDateTimePicker;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    BindingsList1: TBindingsList;
    procedure cxBtnAdicionarPeriodoClick(Sender: TObject);
    procedure dxWheelDataFinalPropertiesChange(Sender: TObject);
    procedure dtPickerDataFinalChange(Sender: TObject);
    procedure dxWheelDataInicioPropertiesChange(Sender: TObject);
    procedure dtPickerDataInicioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fIdPessoaSelecionado, fNmPessoaSelecionado: String;
    { Private declarations }
    function VerificarAutoColapso(out DtInicioConflito, DtFinalConflito: TDateTime): Boolean;
  public
    DacConnection: TFDConnection;
    EventoPeriodoInserido: TEventoPeriodoInserido;

    function ObterValorDiasPrevistos(const IdPessoa: String): Integer;
    function ObterValorFeriasComputadas(const IdPessoa: String): Integer;

    function LimitarData(const Data: TDateTime): TDate;

    procedure AtualizarPessoaSelecionada(const NomePessoa, IdPessoa: String);
    procedure InserirPeriodoDeFeriasSelecionado;
    { Public declarations }
  end;

var
  FrmCadastroPeriodoFerias: TFrmCadastroPeriodoFerias;

implementation

{$R *.dfm}

procedure TFrmCadastroPeriodoFerias.AtualizarPessoaSelecionada(
  const NomePessoa, IdPessoa: String);
begin
  GroupBox1.Caption := 'Adicionando período de férias para: ' + NomePessoa;
  fNmPessoaSelecionado := NomePessoa;
  fIdPessoaSelecionado := IdPessoa;
  GroupBox1.Update;
end;

procedure TFrmCadastroPeriodoFerias.cxBtnAdicionarPeriodoClick(Sender: TObject);
var
  {PARA VERIFICAR OS CONFLITOS}
  DtInicioConflito, DtFinalConflito: TDateTime;
  { VALORES DAS DATAS SELECIONADAS }
  DtInicio, DtFinal: TDate;
  { VALORES COMPUTADOS DO VENDEDOR }
  VlDiasPrevistos: Integer;
  VlFeriasJaComputado: Integer;
begin

  DtInicio := dxWheelDataInicio.DateTime;
  DtFinal  := dxWheelDataFinal.DateTime;

    if CompareDate(DtInicio, DtFinal) = GreaterThanValue then
  begin
    TUtilitarios.MensagemErroRapido(
      'A data inicial não pode ser maior que a data final.');
    Exit;
  end;

  {
  if DaysBetween(DtInicio, DtFinal) < 7 then
  begin
    TUtilitarios.MensagemErroRapido(
      'O intervalo entre a data inicial e final deve ser de no mínimo 7 dias.');
    Exit;
  end;

  VlDiasPrevistos     := ObterValorDiasPrevistos(fIdPessoaSelecionado);
  VlFeriasJaComputado := ObterValorFeriasComputadas(fIdPessoaSelecionado);

  if (VlFeriasJaComputado + DaysBetween(DtInicio,DtFinal)) > VlDiasPrevistos then
  begin
    TUtilitarios.MensagemErroRapido(
      'O período informado somado a quantidade de dias já preenchidos ' +
      'para este vendedor, supera seu valor de dias previstos.');
    Exit;
  end; }


  {VERIFICA SE NÃO COLAPSA COM OS PROPRIOS PERIODOS DO VENDEDOR}
  if VerificarAutoColapso(DtInicioConflito, DtFinalConflito) then
  begin
    TUtilitarios.MensagemErroRapido(
      'Período informado conflita com: ' +
      FormatDateTime('dd/mm/yyyy', DtInicioConflito) + ' até ' +
      FormatDateTime('dd/mm/yyyy', DtFinalConflito) + ' do mesmo vendedor. ' +
      'Tente novamente!');
    Exit;
  end;

  try
    InserirPeriodoDeFeriasSelecionado;
  finally
    TUtilitarios.MensagemInformativaRapida(
      'Período cadastrado para ' + fNmPessoaSelecionado + ' !');
  end;

end;

procedure TFrmCadastroPeriodoFerias.InserirPeriodoDeFeriasSelecionado;
var
  FdQuery: TFDQuery;
  DtInicio, DtFinal: TDateTime;
begin
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('INSERT INTO ');
      Add('   cbperiodos ');
      Add('  (idpessoa, dtinicio, dtfinal)');
      Add('  VALUES (:paramIdPessoa, :paramDtInicio, :paramDtFinal);');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString := fIdPessoaSelecionado;
    FdQuery.ParamByName('paramDtInicio').AsDate   := TDate(dxWheelDataInicio.DateTime);
    FdQuery.ParamByName('paramDtFinal').AsDate    := TDate(dxWheelDataFinal.DateTime);

    FdQuery.Connection := DacConnection;
    FdQuery.ExecSQL;

    if Assigned(EventoPeriodoInserido)
      then EventoPeriodoInserido();

  finally
    FdQuery.Free;
  end;
end;

function TFrmCadastroPeriodoFerias.VerificarAutoColapso(
  out DtInicioConflito, DtFinalConflito: TDateTime): Boolean;
var
  FdQuery: TFDQuery;
begin
  Result := False;
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('SELECT DISTINCT ');
      Add('   DtInicio, DtFinal ');
      Add('FROM ');
      Add('   cbperiodos CBP ');
      Add('WHERE');
      Add('   idpessoa = :paramIdPessoa');
      Add('   AND (DtInicio, DtFinal) OVERLAPS (:paramDtInicio, :paramDtFinal) ');
      Add('LIMIT 1');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString   := fIdPessoaSelecionado;
    FdQuery.ParamByName('paramDtInicio').AsDateTime := dxWheelDataInicio.DateTime;
    FdQuery.ParamByName('paramDtFinal').AsDateTime  := dxWheelDataFinal.DateTime;

    FdQuery.Connection := DacConnection;
    FdQuery.Active     := True;

    while not FdQuery.Eof do
    begin
      Result           := True;
      DtInicioConflito := FdQuery.FieldByName('DtInicio').AsDateTime;
      DtFinalConflito  := FdQuery.FieldByName('DtFinal').AsDateTime;
      FdQuery.Next;
    end;

  finally
    FdQuery.Free;
  end;
end;

function TFrmCadastroPeriodoFerias.ObterValorDiasPrevistos(
  const IdPessoa: String): Integer;
var
  FdQuery: TFDQuery;
begin
  Result := 30; {PADRÃO}
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('SELECT ');
      Add('   VlDiasPrevistos ');
      Add('FROM ');
      Add('   pessoas ');
      Add('WHERE');
      Add('   IdPessoa = :paramIdPessoa ');
      Add('LIMIT 1');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString := IdPessoa;

    FdQuery.Connection := DacConnection;
    FdQuery.Active     := True;

    while not FdQuery.Eof do
    begin
      Result := FdQuery.FieldByName('VlDiasPrevistos').AsInteger;
      FdQuery.Next;
    end;

  finally
    FdQuery.Free;
  end;
end;

function TFrmCadastroPeriodoFerias.ObterValorFeriasComputadas(
  const IdPessoa: String): Integer;
var
  FdQuery: TFDQuery;
begin
  Result := 0;
  FdQuery := TFDQuery.Create(nil);
  try
    with FdQuery.SQL do
    begin
      Add('SELECT ');
      Add('   CAST(COALESCE(SUM(EXTRACT(EPOCH FROM (dtfinal - dtinicio)) ' +
          '/ 86400), ''0'') AS INTEGER) AS "VlComputado" ');
      Add('FROM ');
      Add('   cbperiodos ');
      Add('WHERE');
      Add('   IdPessoa = :paramIdPessoa ');
      Add('GROUP BY ');
      Add('   IdPessoa;');
    end;

    FdQuery.ParamByName('paramIdPessoa').AsString := IdPessoa;

    FdQuery.Connection := DacConnection;
    FdQuery.Active     := True;

    while not FdQuery.Eof do
    begin
      Result := FdQuery.FieldByName('VlComputado').AsInteger;
      FdQuery.Next;
    end;

  finally
    FdQuery.Free;
  end;
end;

function TFrmCadastroPeriodoFerias.LimitarData(const Data: TDateTime): TDate;
var
  DtMaxima: TDate;
begin
  DtMaxima := Now + 365;
  Result   := Min(DtMaxima, Data);
end;

procedure TFrmCadastroPeriodoFerias.dtPickerDataFinalChange(Sender: TObject);
begin
  dtPickerDataFinal.DateTime := LimitarData(dtPickerDataFinal.DateTime);
  dxWheelDataFinal.DateTime  := dtPickerDataFinal.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.dtPickerDataInicioChange(Sender: TObject);
begin
  dtPickerDataInicio.DateTime := LimitarData(dtPickerDataInicio.DateTime);
  dxWheelDataInicio.DateTime := dtPickerDataInicio.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.dxWheelDataFinalPropertiesChange(
  Sender: TObject);
begin
  dxWheelDataFinal.DateTime  := LimitarData(dxWheelDataFinal.DateTime);
  dtPickerDataFinal.DateTime := dxWheelDataFinal.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.dxWheelDataInicioPropertiesChange(
  Sender: TObject);
begin
  dxWheelDataInicio.DateTime  := LimitarData(dxWheelDataInicio.DateTime);
  dtPickerDataInicio.DateTime := dxWheelDataInicio.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.FormCreate(Sender: TObject);
begin
  dxWheelDataFinal.DateTime  := dtPickerDataFinal.DateTime;
  dxWheelDataInicio.DateTime := dtPickerDataInicio.DateTime;
end;

end.
