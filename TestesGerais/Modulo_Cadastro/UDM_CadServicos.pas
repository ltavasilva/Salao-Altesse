unit UDM_CadServicos;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadServicos = class(TDataModule)
    Conexao: TADOConnection;
    ds_Tp_Fornecedores: TDataSource;
    Qry_Busca: TADOQuery;
    ds_Qry_Busca: TDataSource;
    Qry_Exec: TADOQuery;
    Tp_Servicos: TADOTable;
    ds_Tp_Servicos: TDataSource;
    Tp_Servicosid_item: TIntegerField;
    Tp_Servicoscod_barras: TStringField;
    Tp_Servicosid_tipo_item: TIntegerField;
    Tp_Servicosdescricao: TStringField;
    Tp_Servicosid_fornecedor: TIntegerField;
    Tp_Servicosid_categoria: TIntegerField;
    Tp_Servicostmp_execucao: TIntegerField;
    Tp_Servicostaxa_lucro: TFloatField;
    Ta_Categoria: TADOTable;
    ds_Ta_Categoria: TDataSource;
    Ta_Categoriaid_categoria: TAutoIncField;
    Ta_Categoriaid_tipo: TIntegerField;
    Ta_Categoriadescricao: TStringField;
    Tp_ServicosCategoria: TStringField;
    Qry_Buscaid_item: TIntegerField;
    Qry_Buscacod_barras: TStringField;
    Qry_Buscadescricao: TStringField;
    Qry_Buscaid_tipo_item_1: TAutoIncField;
    Qry_Buscadescricao_1: TStringField;
    Qry_Buscadescricao_2: TStringField;
    CDS_Servicos: TClientDataSet;
    Tp_Servicoscusto_aquisicao: TFloatField;
    CDS_Servicosid_item: TIntegerField;
    CDS_Servicoscod_barras: TStringField;
    CDS_Servicosid_tipo_item: TIntegerField;
    CDS_Servicosdescricao: TStringField;
    CDS_Servicosid_fornecedor: TIntegerField;
    CDS_Servicosid_categoria: TIntegerField;
    CDS_Servicostmp_execucao: TIntegerField;
    CDS_Servicostaxa_lucro: TFloatField;
    CDS_ServicosCategoria: TStringField;
    CDS_Servicoscusto_aquisicao: TFloatField;
    Qp_Fornecedores: TADOQuery;
    Qp_Fornecedoresid_fornec: TIntegerField;
    Qp_Fornecedoresnome: TStringField;
    Qp_Fornecedorescnpj: TStringField;
    Qp_Fornecedoresdat_ult_atend: TDateTimeField;
    Qp_Fornecedoresinfo_geral: TMemoField;
    Qp_Fornecedoresfoto: TBlobField;
    Tp_Servicosativo: TIntegerField;
    procedure Tp_ServicosAfterInsert(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterClose(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadServicos: TDM_CadServicos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadServicos.Conectar(User, Pass, Database: String);
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

Procedure TDM_CadServicos.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Qp_Fornecedores.Cancel;
    Tp_Servicos.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TDM_CadServicos.Qp_FornecedoresAfterClose(DataSet: TDataSet);
begin
  Tp_Servicos.Close;
  Ta_Categoria.Close;
end;

procedure TDM_CadServicos.Qp_FornecedoresAfterOpen(DataSet: TDataSet);
begin
  Tp_Servicos.Open;
  Ta_Categoria.Open;
end;

procedure TDM_CadServicos.Tp_ServicosAfterInsert(DataSet: TDataSet);
begin
  Tp_Servicosid_tipo_item.Value:=1;
end;

end.
