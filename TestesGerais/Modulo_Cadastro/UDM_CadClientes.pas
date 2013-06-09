unit UDM_CadClientes;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadClientes = class(TDataModule)
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
    Qry_Buscaid_pessoal: TAutoIncField;
    Qry_Buscanome: TStringField;
    Qry_Buscadata_nasci: TDateField;
    Qry_Buscarg: TStringField;
    Qry_Buscacpf: TStringField;
    Qry_Buscacep: TStringField;
    Qry_Buscalogradouro: TStringField;
    Qry_Buscabairro: TStringField;
    Qry_Buscacidade: TStringField;
    Qry_Buscauf: TStringField;
    Qry_Buscatelefone: TStringField;
    Qry_Buscaemail: TStringField;
    ds_Qry_Busca: TDataSource;
    Qry_Exec: TADOQuery;
    Tp_Clientes: TADOTable;
    ds_Tp_Clientes: TDataSource;
    Tp_Clientesid_cliente: TIntegerField;
    Tp_Clientesdat_ult_atend: TDateTimeField;
    Tp_ClientesFoto: TBlobField;
    Tp_Clientesinfo_geral: TMemoField;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadClientes: TDM_CadClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadClientes.Conectar(User, Pass, Database: String);
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

Procedure TDM_CadClientes.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Tp_Clientes.Cancel;
    Tp_Pessoal.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TDM_CadClientes.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Clientes.Close;
end;

procedure TDM_CadClientes.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Clientes.Open;
end;

end.
