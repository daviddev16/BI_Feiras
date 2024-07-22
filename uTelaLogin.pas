unit uTelaLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,

  Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Stan.Def, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.PG,

  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxUIAClasses, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinWXI, dxSkinXmas2008Blue, dxRibbonCustomizationForm,
  dxCore, dxStatusBar, dxRibbonStatusBar, dxBarApplicationMenu, cxGeometry,
  dxFramedControl, dxPanel, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxSkinsForm,
  Vcl.Mask, Vcl.ExtCtrls, uUtilitarios, cxContainer, cxEdit, cxLabel;

type
  TTelaLogin = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxPanel1: TdxPanel;
    dxPanel2: TdxPanel;
    cxButton1: TcxButton;
    dxSkinController1: TdxSkinController;
    TxUsuario: TLabeledEdit;
    TxSenha: TLabeledEdit;
    TxHost: TLabeledEdit;
    TxDatabase: TLabeledEdit;
    cxLabel1: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDacConnection: TFDConnection;
    procedure ConectarAoBanco;
  public
    { Public declarations }
    UsuarioLogado: Boolean;

    property DacConnection: TFDConnection read fDacConnection;
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}

procedure TTelaLogin.ConectarAoBanco;
begin
  fDacConnection := TFDConnection.Create(nil);
  try
    fDacConnection.DriverName := 'PG';
    fDacConnection.Params.Database := TxDatabase.Text;
    fDacConnection.Params.UserName := TxUsuario.Text;
    fDacConnection.Params.Password := TxSenha.Text;
    fDacConnection.Params.Add('Server=' + TxHost.Text);
    fDacConnection.Params.Add('Port=5432');
    fDacConnection.Params.Add('SearchPath=wshop');
    fDacConnection.Connected := True;
    fDacConnection.ExecSQL('SET search_path TO wshop');
  finally
    UsuarioLogado := Assigned(fDacConnection) and (fDacConnection.Connected);
  end;
end;

procedure TTelaLogin.cxButton1Click(Sender: TObject);
begin
  ConectarAoBanco;
  if UsuarioLogado then
  begin
    ModalResult := mrOk;
    CloseModal;
  end;
end;

end.
