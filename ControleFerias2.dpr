program ControleFerias2;



uses
  Vcl.Forms,
  uControleFeriasPrincipal in 'uControleFeriasPrincipal.pas' {ControleFeriasPrincipal},
  uTelaLogin in 'uTelaLogin.pas' {TelaLogin},
  uUtilitarios in 'uUtilitarios.pas',
  uGerenciadorMigracaoBD in 'uGerenciadorMigracaoBD.pas',
  uBaseMigracaoBD in 'uBaseMigracaoBD.pas',
  uMigracoesBD in 'uMigracoesBD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TControleFeriasPrincipal, ControleFeriasPrincipal);
  Application.Run;
end.
