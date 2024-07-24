unit uTelaLogin;

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

  Vcl.Menus,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.Mask,
  Vcl.ExtCtrls,


  uConexaoBD,
  uUtilitarios,

  Data.DB,
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
  dxSkinOffice2010Silver,
  dxCore,
  dxPanel,
  dxSkinsForm,
  cxContainer,
  cxEdit,
  cxLabel,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxGeometry,
  dxFramedControl;


type
  TTelaLogin = class(TdxRibbonForm)
    dxPanel1: TdxPanel;
    dxPanel2: TdxPanel;
    cxBtnLogar: TcxButton;
    dxSkinController1: TdxSkinController;
    TxUsuario: TLabeledEdit;
    TxSenha: TLabeledEdit;
    TxHost: TLabeledEdit;
    TxDatabase: TLabeledEdit;
    cxLabel1: TcxLabel;
    chBxEditarConfig: TCheckBox;
    cmBxSchema: TComboBox;
    procedure cxBtnLogarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chBxEditarConfigClick(Sender: TObject);
  private
    { Private declarations }
    fDacConnection: TFDConnection;

    procedure ConectarAoBanco;
    procedure SalvarConfigConexaoBD;

    procedure InicializarCmBxSchema;

  public
    { Public declarations }
    UsuarioLogado: Boolean;
    ConfigConexaoBD: TConfigConexaoBD;
    property DacConnection: TFDConnection read fDacConnection;
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}

procedure TTelaLogin.chBxEditarConfigClick(Sender: TObject);
begin
  TxHost.Enabled     := chBxEditarConfig.Checked;
  TxDatabase.Enabled := chBxEditarConfig.Checked;
  cmBxSchema.Enabled := chBxEditarConfig.Checked;
end;

procedure TTelaLogin.cxBtnLogarClick(Sender: TObject);
begin
  ConectarAoBanco;
  if UsuarioLogado then
  begin
    SalvarConfigConexaoBD;
    ModalResult := mrOk;
    CloseModal;
  end;
end;

procedure TTelaLogin.FormCreate(Sender: TObject);
begin
  InicializarCmBxSchema;

  if TConfigConexaoBD.ExisteConfiguracao then
  begin
    TConfigConexaoBD.CarregarConexao(ConfigConexaoBD);
    TxHost.Text    := ConfigConexaoBD.Host;
    TxHost.Enabled := False;

    TxDatabase.Text    := ConfigConexaoBD.Database;
    TxDatabase.Enabled := False;

    cmBxSchema.ItemIndex := ConfigConexaoBD.SchemaIndex;
    cmBxSchema.Enabled   := False;
  end
  else
    cmBxSchema.ItemIndex := 0;
end;

procedure TTelaLogin.SalvarConfigConexaoBD;
begin
  if not Assigned(ConfigConexaoBD)
    then ConfigConexaoBD := TConfigConexaoBD.Create;

  ConfigConexaoBD.Host        := TxHost.Text;
  ConfigConexaoBD.Database    := TxDatabase.Text;
  ConfigConexaoBD.SchemaIndex := cmBxSchema.ItemIndex;

  TConfigConexaoBD.SalvarConexao(ConfigConexaoBD);
end;

procedure TTelaLogin.ConectarAoBanco;
var
  Esquema: String;
begin
  fDacConnection := TFDConnection.Create(nil);
  try
    Esquema := cmBxSchema.Text;
    fDacConnection.DriverName := 'PG';
    fDacConnection.Params.Database := TxDatabase.Text;
    fDacConnection.Params.UserName := TxUsuario.Text;
    fDacConnection.Params.Password := TxSenha.Text;
    fDacConnection.Params.AddPair('Server', TxHost.Text);
    fDacConnection.Params.AddPair('Port', '5432');
    fDacConnection.Params.AddPair('SearchPath', Esquema);
    fDacConnection.Connected := True;
    fDacConnection.ExecSQL('SET search_path TO ' + Esquema + ';');
  finally
    UsuarioLogado := Assigned(fDacConnection) and (fDacConnection.Connected);
  end;
end;

procedure TTelaLogin.InicializarCmBxSchema;
begin
  cmBxSchema.Items.Add('wshop');
  cmBxSchema.Items.Add('ishop');
end;

end.
