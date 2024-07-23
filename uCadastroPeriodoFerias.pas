unit uCadastroPeriodoFerias;

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
  dxDateTimeWheelPicker, Vcl.ComCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components;

type
  TEventoPeriodoInserido = procedure() of object;

  TFrmCadastroPeriodoFerias = class(TdxRibbonForm)
    dxSkinController1: TdxSkinController;
    dxWheelDataInicio: TdxDateTimeWheelPicker;
    GroupBox1: TGroupBox;
    dxWheelDataFinal: TdxDateTimeWheelPicker;
    cxButton1: TcxButton;
    dtPickerDataInicio: TDateTimePicker;
    dtPickerDataFinal: TDateTimePicker;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    BindingsList1: TBindingsList;
    procedure cxButton1Click(Sender: TObject);
    procedure dxWheelDataFinalPropertiesChange(Sender: TObject);
    procedure dtPickerDataFinalChange(Sender: TObject);
    procedure dxWheelDataInicioPropertiesChange(Sender: TObject);
    procedure dtPickerDataInicioChange(Sender: TObject);
  private
    fIdPessoaSelecionado, fNmPessoaSelecionado: String;
    { Private declarations }
    function VerificarAutoColapso(out DtInicioConflito, DtFinalConflito: TDateTime): Boolean;
  public
    DacConnection: TFDConnection;
    EventoPeriodoInserido: TEventoPeriodoInserido;

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

procedure TFrmCadastroPeriodoFerias.cxButton1Click(Sender: TObject);
var
  DtInicioConflito, DtFinalConflito: TDateTime;
begin
  if VerificarAutoColapso(DtInicioConflito, DtFinalConflito) then
  begin
    dxMessageDlg(
      'Período informado conflita com: ' +
      FormatDateTime('dd/mm/yyyy', DtInicioConflito) + ' até ' +
      FormatDateTime('dd/mm/yyyy', DtFinalConflito) + ' do mesmo vendedor. ' +
      'Tente novamente!',
      TMsgDlgType.mtError,
      [TMsgDlgBtn.mbRetry], 0);
    Exit;
  end;

  InserirPeriodoDeFeriasSelecionado;
  dxMessageDlg(
    'Período cadastrado para ' + fNmPessoaSelecionado + ' !',
    TMsgDlgType.mtInformation,
    [TMsgDlgBtn.mbOK], 0);
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

    FdQuery.ParamByName('paramIdPessoa').AsString   := fIdPessoaSelecionado;
    FdQuery.ParamByName('paramDtInicio').AsDateTime := dxWheelDataInicio.DateTime;
    FdQuery.ParamByName('paramDtFinal').AsDateTime  := dxWheelDataFinal.DateTime;

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

procedure TFrmCadastroPeriodoFerias.dtPickerDataFinalChange(Sender: TObject);
begin
  dxWheelDataFinal.DateTime := dtPickerDataFinal.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.dtPickerDataInicioChange(Sender: TObject);
begin
  dxWheelDataInicio.DateTime := dtPickerDataInicio.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.dxWheelDataFinalPropertiesChange(
  Sender: TObject);
begin
  dtPickerDataFinal.DateTime := dxWheelDataFinal.DateTime;
end;

procedure TFrmCadastroPeriodoFerias.dxWheelDataInicioPropertiesChange(
  Sender: TObject);
begin
  dtPickerDataInicio.DateTime := dxWheelDataInicio.DateTime;
end;



end.
