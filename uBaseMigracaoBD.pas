unit uBaseMigracaoBD;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

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
  FireDAC.Phys.PG;

type
  TBaseMigracaoBD = class
    public
      DacConnection: TFDConnection;

      function Instalar(): Boolean; virtual; abstract;
      function Desinstalar(): Boolean; virtual; abstract;
      function VerificarNecessidade: Boolean; virtual; abstract;

    protected
      function ObterSchemaOwner: String;
      function ExisteTabela(NomeTabela: String): Boolean;
      function AlterarOwnerTabela(const NovoOwner, NomeSchemaTabela: String): Boolean;

      procedure InstalarTabela(SQLDDL: TStringList);

    end;

implementation

procedure TBaseMigracaoBD.InstalarTabela(SQLDDL: TStringList);
var
  FdQuery : TFDQuery;
begin
  FdQuery := TFDQuery.Create(nil);
  try
    FdQuery.Connection := DacConnection;
    FdQuery.SQL := SqlDDL;
    FdQuery.ExecSQL;
  finally
    FdQuery.Free;
  end;
end;

function TBaseMigracaoBD.ExisteTabela(NomeTabela: String): Boolean;
var
  FdQuery : TFDQuery;
  SQL : TStringList;
begin
  Result := False;
  SQL := TStringList.Create;
  with SQL do
  begin
    Add('SELECT');
    Add(' ''S'' AS "retorno" ');
    Add('FROM');
    Add(' pg_class C ');
    Add('LEFT JOIN');
    Add(' pg_namespace NS');
    Add(' ON (C.relnamespace = NS.oid) ');
    Add('WHERE');
    Add(' C.relkind = ''r''');
    Add(' AND NS.nspname = (SELECT setting FROM pg_settings WHERE name=''search_path'') ');
    Add(' AND C.relname = :paramNomeTabela; ');
  end;
  FdQuery := TFDQuery.Create(nil);
  try
    FdQuery.Connection := DacConnection;
    FdQuery.SQL := SQL;
    FdQuery.ParamByName('paramNomeTabela').AsString := NomeTabela;
    FdQuery.Open;
    while not FdQuery.Eof do
    begin
      Result := FdQuery.FieldByName('retorno').AsString = 'S';
      FdQuery.Next;
    end;
  finally
    FdQuery.Free;
    SQL.Free;
  end;
end;

function TBaseMigracaoBD.ObterSchemaOwner: String;
var
  FdQuery : TFDQuery;
  SQL : TStringList;
begin
  Result := '';
  SQL := TStringList.Create;
  with SQL do
  begin
    Add('SELECT');
    Add(' AH.rolname AS "owner" ');
    Add('FROM');
    Add(' pg_namespace NS ');
    Add('LEFT JOIN');
    Add(' pg_authid AH');
    Add(' ON (NS.nspowner = AH.oid) ');
    Add('WHERE');
    Add(' NS.nspname = (SELECT setting FROM pg_settings WHERE name = ''search_path'')');
  end;
  FdQuery := TFDQuery.Create(nil);
  try
    FdQuery.Connection := DacConnection;
    FdQuery.SQL := SQL;
    FdQuery.Open;
    while not FdQuery.Eof do
    begin
      Result := FdQuery.FieldByName('owner').AsString;
      FdQuery.Next;
    end;
  finally
    FdQuery.Free;
    SQL.Free;
  end;
end;

function TBaseMigracaoBD.AlterarOwnerTabela(const NovoOwner, NomeSchemaTabela: String): Boolean;
var
  SQLDDL: TStringList;
begin
  SQLDDL := TStringList.Create;
  try
    with SQLDDL do
    begin
      Add('ALTER TABLE');
      Add(' ' + NomeSchemaTabela);
      Add(' OWNER TO "' + NovoOwner + '";');
    end;
    InstalarTabela(SQLDDL);
  finally
    SQLDDL.Free;
  end;
end;

end.
