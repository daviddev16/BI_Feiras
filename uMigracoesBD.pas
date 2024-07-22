unit uMigracoesBD;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  uBaseMigracaoBD;

type
  MigracoesControleFerias = class(TBaseMigracaoBD)
    public
      function VerificarNecessidade: Boolean; override;

      function Instalar(): Boolean; override;
      function Desinstalar(): Boolean; override;

      procedure InternoInstalarCbPeriodos(SQLDDL: TStringList; const NomeEsquema, NovoOwner: String);
      procedure InternoInstalarCbProjeto(SQLDDL: TStringList; const NomeEsquema, NovoOwner: String);
      procedure InternoInstalarPessoas(SQLDDL: TStringList; const NomeEsquema: String);

  end;

implementation


function MigracoesControleFerias.VerificarNecessidade: Boolean;
begin
  Result :=
    NOT ExisteTabela('cbperiodos') OR
    NOT ExisteTabela('cbproj')
end;

{
  INSTALAÇÃO TABELA DE PERÍODOS DE FÉRIAS DO USUÁRIO
  Nome: cbperiodos
}
procedure MigracoesControleFerias.InternoInstalarCbPeriodos(
  SQLDDL: TStringList;
  const NomeEsquema, NovoOwner: String);
var
  NomeEsquemaTabela: String;
begin
  SQLDDL.Clear;
  NomeEsquemaTabela := NomeEsquema + '.cbperiodos';

  with SQLDDL do
  begin
    Add('CREATE TABLE ' + NomeEsquemaTabela);
    Add('(');
    Add('  idpessoa VARCHAR(40) NOT NULL,');
    Add('  dtinicio TIMESTAMP NOT NULL,');
    Add('  dtfinal TIMESTAMP NOT NULL,');
    Add('  CONSTRAINT pk_cbperiodos_idcperiodo PRIMARY KEY (idpessoa, dtinicio, dtfinal)');
    Add(');');
  end;

  InstalarTabela(SQLDDL);
  AlterarOwnerTabela(NovoOwner, NomeEsquemaTabela);
end;

{
  INSTALAÇÃO TABELA DE PROJETOS DOS USUÁRIOS
  Nome: cbproj
}
procedure MigracoesControleFerias.InternoInstalarCbProjeto(
  SQLDDL: TStringList;
  const NomeEsquema, NovoOwner: String);
var
  NomeEsquemaTabela: String;
begin
  SQLDDL.Clear;
  NomeEsquemaTabela := NomeEsquema + '.cbproj';

  with SQLDDL do
  begin
    Add('CREATE TABLE ' + NomeEsquemaTabela);
    Add('(');
    Add('  idpessoa VARCHAR(40) NOT NULL,');
    Add('  idprojeto INTEGER NOT NULL,');
    Add('  CONSTRAINT cbproj_idxprimario PRIMARY KEY (idpessoa, idprojeto)');
    Add(');');
  end;

  InstalarTabela(SQLDDL);
  AlterarOwnerTabela(NovoOwner, NomeEsquemaTabela);
end;

procedure MigracoesControleFerias.InternoInstalarPessoas(
  SQLDDL: TStringList;
  const NomeEsquema: String);
var
  NomeEsquemaTabela: String;
begin
  SQLDDL.Clear;
  NomeEsquemaTabela := NomeEsquema + '.pessoas';

  with SQLDDL do
  begin
    Add('ALTER TABLE ' + NomeEsquemaTabela + ' ADD COLUMN vldiasprevistos INTEGER;');
  end;

  InstalarTabela(SQLDDL);
  SQLDDL.Clear;

  with SQLDDL do
  begin
    Add('UPDATE ' + NomeEsquemaTabela + ' SET vldiasprevistos = ''30'' WHERE stativo = ''S'' AND stvendedor = True;');
  end;

  InstalarTabela(SQLDDL);
end;

function MigracoesControleFerias.Instalar(): Boolean;
var
  SQLDDL: TStringList;
  NomeEsquema: String;
  NovoOwner: String;
begin
  NovoOwner         := ObterSchemaOwner;
  NomeEsquema       := DacConnection.Params.Values['SearchPath'];
  SQLDDL            := TStringList.Create;
  try
    InternoInstalarCbPeriodos(SQLDDL, NomeEsquema, NovoOwner);
    InternoInstalarCbProjeto (SQLDDL, NomeEsquema, NovoOwner);
    InternoInstalarPessoas   (SQLDDL, NomeEsquema);
  finally
    SQLDDL.Free;
  end;
end;

function MigracoesControleFerias.Desinstalar(): Boolean;
begin end;

end.
