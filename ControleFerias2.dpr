program ControleFerias2;



uses
  Vcl.Forms,
  uControleFeriasPrincipal in 'uControleFeriasPrincipal.pas' {ControleFeriasPrincipal},
  uTelaLogin in 'uTelaLogin.pas' {TelaLogin},
  uUtilitarios in 'uUtilitarios.pas',
  uGerenciadorMigracaoBD in 'uGerenciadorMigracaoBD.pas',
  uBaseMigracaoBD in 'uBaseMigracaoBD.pas',
  uMigracoesBD in 'uMigracoesBD.pas',
  uConexaoBD in 'uConexaoBD.pas',
  uCadastroProjeto in 'uCadastroProjeto.pas' {FrmCadastroProjeto},
  uCadastroPeriodoFerias in 'uCadastroPeriodoFerias.pas' {FrmCadastroPeriodoFerias};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TControleFeriasPrincipal, ControleFeriasPrincipal);
  Application.CreateForm(TFrmCadastroProjeto, FrmCadastroProjeto);
  Application.CreateForm(TFrmCadastroPeriodoFerias, FrmCadastroPeriodoFerias);
  Application.Run;
end.
