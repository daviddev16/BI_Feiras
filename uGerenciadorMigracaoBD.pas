unit uGerenciadorMigracaoBD;

interface

uses
  System.Generics.Collections, uBaseMigracaoBD,

  Vcl.Dialogs,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Stan.Def, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.PG;

type
  TGerenciadorBDMigracao = class
    private
      fDacConnection: TFDConnection;
      fMigracoesBDLista: TObjectList<TBaseMigracaoBD>;

    public
      procedure Inicializar;
      procedure RegistrarMigracaoBD(MigracaoBD: TBaseMigracaoBD);

      constructor Create(const Host, Database: String);

  end;

implementation

constructor TGerenciadorBDMigracao.Create(const Host, Database: String);
begin
  fDacConnection := TFDConnection.Create(nil);
  fDacConnection.DriverName := 'PG';
  fDacConnection.Params.Database := Database;
  fDacConnection.Params.UserName := 'ALTERDATA_ADMIN';
  fDacConnection.Params.Password := 'alterdata123!';
  fDacConnection.Params.Add('Server=' + Host);
  fDacConnection.Params.Add('Port=5432');
  fDacConnection.Params.Add('SearchPath=wshop');
  fDacConnection.Connected := True;
  fDacConnection.ExecSQL('SET search_path TO wshop');

  fMigracoesBDLista := TObjectList<TBaseMigracaoBD>.Create;
end;

procedure TGerenciadorBDMigracao.RegistrarMigracaoBD(MigracaoBD: TBaseMigracaoBD);
begin
  fMigracoesBDLista.Add(MigracaoBD);
end;

procedure TGerenciadorBDMigracao.Inicializar;
var
  MigracaoBD : TBaseMigracaoBD;
begin
  for MigracaoBD in fMigracoesBDLista do
  begin
    MigracaoBD.DacConnection := fDacConnection;
    if MigracaoBD.VerificarNecessidade
      then MigracaoBD.Instalar;
  end;
  fMigracoesBDLista.Free;
end;

end.
