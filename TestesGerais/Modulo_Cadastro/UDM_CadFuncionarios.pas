unit UDM_CadFuncionarios;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadFuncionarios = class(TDataModule)
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
    Tp_Funcionarios: TADOTable;
    ds_Tp_Funcionarios: TDataSource;
    Qry_Busca: TADOQuery;
    ds_Qry_Busca: TDataSource;
    Tp_Funcionariosid_funcionario: TIntegerField;
    Tp_Funcionariosativo: TSmallintField;
    Tp_Funcionariosdat_ult_atend: TDateTimeField;
    Tp_Funcionariosfoto: TBlobField;
    Tp_Funcionariosinfo_geral: TMemoField;
    QServicos: TADOQuery;
    ds_CDS_Servicos: TDataSource;
    CDS_Servicos: TClientDataSet;
    CDS_Servicosid_item: TIntegerField;
    CDS_ServicosSelec: TBooleanField;
    CDS_Servicosdescricao: TStringField;
    CDS_ServicosComissao: TFloatField;
    Qry_Buscaid_pessoal: TAutoIncField;
    Qry_Buscanome: TStringField;
    Qry_Buscadata_nasci: TDateField;
    Qry_Buscarg: TStringField;
    Qry_Buscacpf: TStringField;
    Qry_Buscaid_funcionario: TIntegerField;
    Qry_Buscaativo: TSmallintField;
    Qry_Buscadat_ult_atend: TDateTimeField;
    Qry_Exec: TADOQuery;
    QServicosid_item: TAutoIncField;
    QServicosdescricao: TStringField;
    QServicosid_funcionario: TIntegerField;
    QServicoscomissao: TFloatField;
    Tbl_Acesso: TADOTable;
    ds_Tbl_Acesso: TDataSource;
    Tbl_Acessoid_funcionario: TIntegerField;
    Tbl_Acessologin: TStringField;
    Tbl_Acessosenha: TStringField;
    Tbl_Acessoperfil: TStringField;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
    procedure Tp_FuncionariosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadFuncionarios: TDM_CadFuncionarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadFuncionarios.Conectar(User, Pass, Database: String);
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

Procedure TDM_CadFuncionarios.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TDM_CadFuncionarios.Tp_FuncionariosAfterScroll(DataSet: TDataSet);
begin
  CDS_Servicos.Open;
  CDS_Servicos.EmptyDataSet;
  QServicos.Close;
  QServicos.Parameters.ParamByName('PFunc').Value:=
    Tp_Funcionariosid_funcionario.Value;
  QServicos.Open;
  QServicos.First;
  while Not QServicos.Eof do
  Begin
    CDS_Servicos.Append;
    CDS_Servicosid_item.Value:=QServicosid_item.Value;
    CDS_ServicosSelec.Value:=Not QServicoscomissao.IsNull;
    CDS_Servicosdescricao.Value:=QServicosdescricao.Value;
    CDS_ServicosComissao.Value:=QServicoscomissao.Value;
    CDS_Servicos.Post;
    QServicos.Next;
  End;
end;

procedure TDM_CadFuncionarios.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Funcionarios.Close;
  CDS_Servicos.EmptyDataSet;
end;

procedure TDM_CadFuncionarios.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Funcionarios.Open;
end;

end.
