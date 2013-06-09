unit UDM_CadFornecedores;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadFornecedores = class(TDataModule)
    Conexao: TADOConnection;
    Tp_Pessoal: TADOTable;
    Tp_Pessoalid_pessoal: TAutoIncField;
    Tp_Pessoalnome: TStringField;
    Tp_Pessoaldata_nasci: TDateField;
    Tp_Pessoalrg: TStringField;
    Tp_Pessoalcpf: TStringField;
    Tp_Pessoaldata_incl: TDateTimeField;
    Tp_Pessoalresp_incl: TIntegerField;
    Tp_Pessoaldata_modif: TDateTimeField;
    Tp_Pessoalresp_modif: TIntegerField;
    Tp_Pessoalativo: TSmallintField;
    ds_Tp_Pessoal: TDataSource;
    Qry_Busca: TADOQuery;
    ds_Qry_Busca: TDataSource;
    Qry_Exec: TADOQuery;
    Tp_Fornecedores: TADOTable;
    ds_Tp_Fornecedores: TDataSource;
    Tp_Fornecedoresid_fornec: TIntegerField;
    Tp_Fornecedorescnpj: TStringField;
    Tp_Fornecedoresativo: TSmallintField;
    Tp_Fornecedoresdat_ult_atend: TDateTimeField;
    Tp_Fornecedoresfoto: TBlobField;
    Tp_Fornecedoresinfo_geral: TMemoField;
    Qry_Buscanome: TStringField;
    Qry_Buscaativo: TIntegerField;
    Qry_Buscacnpj: TStringField;
    Qry_Buscacod_barras: TStringField;
    Qry_Buscadescricao: TStringField;
    Qry_Buscadescricao_1: TStringField;
    Qry_Buscadescricao_2: TStringField;
    Qry_Buscaid_pessoal: TAutoIncField;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadFornecedores: TDM_CadFornecedores;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadFornecedores.Conectar(User, Pass, Database: String);
Var Str:String;
Begin
  with Conexao do
  Begin
    if Not Connected then
    Begin
      Close;
      Str:='Provider=MSDASQL.1;';
      Str:=Str + 'Password="' + Pass + '";';
      Str:=Str + 'Persist Security Info=True;';
      Str:=Str + 'User ID=' + User + ';';
      Str:=Str + 'Data Source=' + Database;
      ConnectionString:=Str;
      Open;
    End;
  End;
End;

Procedure TDM_CadFornecedores.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Tp_Fornecedores.Cancel;
    Tp_Pessoal.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TDM_CadFornecedores.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Fornecedores.Close;
end;

procedure TDM_CadFornecedores.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Fornecedores.Open;
end;

end.
