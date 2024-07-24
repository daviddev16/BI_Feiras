unit uConexaoBD;

interface

uses
  Registry,
  Windows,
  SysUtils;

type
  TConfigConexaoBD = class
    const REGKEY_PATH = 'SOFTWARE\ControleFerias\Conexao';

    private
      fHost: String;
      fDatabaseName: String;
      fSchemaIndex: Integer;

    public
      property Host: String read fHost write fHost;
      property Database: String read fDatabaseName write fDatabaseName;
      property SchemaIndex: Integer read fSchemaIndex write fSchemaIndex;

      class function CarregarConexao(out fdDbConn: TConfigConexaoBD): Boolean;
      class procedure SalvarConexao(fdDbConn: TConfigConexaoBD);
      class function ExisteConfiguracao(): Boolean;

  end;

implementation

class function TConfigConexaoBD.ExisteConfiguracao(): Boolean;
var
  Registry : TRegistry;
begin
  try
    try
      Registry := TRegistry.Create(KEY_ALL_ACCESS);
      with Registry do
      begin
        Registry.RootKey := HKEY_CURRENT_USER;
        Result := Registry.KeyExists(REGKEY_PATH);
        CloseKey;
      end;
    except
      Result := False;
    end;
  finally
    Registry.Free;
  end;
end;

class procedure TConfigConexaoBD.SalvarConexao(fdDbConn: TConfigConexaoBD);
var
  Registry : TRegistry;
begin
  try
    try
      Registry := TRegistry.Create(KEY_ALL_ACCESS);
      with Registry do
      begin
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(REGKEY_PATH, True) then
        begin
          WriteString('Host', fdDbConn.Host);
          WriteString('Database', fdDbConn.Database);
          WriteInteger('SchemaIndex', fdDbConn.SchemaIndex);
          CloseKey;
        end;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(Format('Não foi possível salvar o ' +
          'registro %s/%s. Verifique as permissões. [%s]', ['HKLM', REGKEY_PATH, e.Message]));
      end;
    end;
  finally
    Registry.Free;
  end;
end;

class function TConfigConexaoBD.CarregarConexao(out fdDbConn: TConfigConexaoBD): Boolean;
var
  Registry : TRegistry;
begin
  try
    try
      Registry := TRegistry.Create(KEY_ALL_ACCESS);
      with Registry do
      begin
        RootKey := HKEY_CURRENT_USER;
        if OpenKeyReadOnly(REGKEY_PATH) then
        begin
          fdDbConn := TConfigConexaoBD.Create;
          fdDbConn.Host := ReadString('Host');
          fdDbConn.Database := ReadString('Database');
          fdDbConn.SchemaIndex := ReadInteger('SchemaIndex');
          Result := True;
          CloseKey;
        end;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(Format('Não foi possível ler o ' +
          'registro %s/%s. Verifique as permissões. [%s]', ['HKLM', REGKEY_PATH]));
        Result := False;
      end;
    end;
  finally
    Registry.Free;
  end;
end;

end.
