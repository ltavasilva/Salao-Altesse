unit UDM_CadProdutos;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadProdutos = class(TDataModule)
    Conexao: TADOConnection;
    ds_Tp_Fornecedores: TDataSource;
    Qry_Busca: TADOQuery;
    ds_Qry_Busca: TDataSource;
    Qry_Exec: TADOQuery;
    Tp_Produtos: TADOTable;
    ds_Tp_Produtos: TDataSource;
    Tp_Produtosid_item: TIntegerField;
    Tp_Produtoscod_barras: TStringField;
    Tp_Produtosid_tipo_item: TIntegerField;
    Tp_Produtosdescricao: TStringField;
    Tp_Produtosid_fornecedor: TIntegerField;
    Tp_Produtosid_categoria: TIntegerField;
    Tp_Produtostmp_execucao: TIntegerField;
    Tp_Produtostaxa_lucro: TFloatField;
    Ta_Categoria: TADOTable;
    ds_Ta_Categoria: TDataSource;
    Ta_Categoriaid_categoria: TAutoIncField;
    Ta_Categoriaid_tipo: TIntegerField;
    Ta_Categoriadescricao: TStringField;
    Tp_ProdutosCategoria: TStringField;
    Qry_Buscaid_pessoal: TAutoIncField;
    Qry_Buscanome: TStringField;
    Qry_Buscacnpj: TStringField;
    Qry_Buscainfo_geral: TMemoField;
    Qry_Buscaid_item: TIntegerField;
    Qry_Buscacod_barras: TStringField;
    Qry_Buscadescricao: TStringField;
    Qry_Buscaid_tipo_item_1: TAutoIncField;
    Qry_Buscadescricao_1: TStringField;
    Qry_Buscadescricao_2: TStringField;
    TP_Plan_STK: TADOTable;
    DS_TP_Plan_STK: TDataSource;
    TP_Plan_STKid_item: TIntegerField;
    TP_Plan_STKqtd_min: TFloatField;
    TP_Plan_STKqtd_max: TFloatField;
    TP_Plan_STKtamanho_lote: TFloatField;
    TP_Plan_STKstk_seguranca: TFloatField;
    TP_Plan_STKleadtime: TIntegerField;
    CDS_Produtos: TClientDataSet;
    CDS_Plan_STK: TClientDataSet;
    CDS_Plan_STKid_item: TIntegerField;
    CDS_Plan_STKqtd_min: TFloatField;
    CDS_Plan_STKqtd_max: TFloatField;
    CDS_Plan_STKtamanho_lote: TFloatField;
    CDS_Plan_STKstk_seguranca: TFloatField;
    CDS_Plan_STKleadtime: TIntegerField;
    Tp_Produtoscusto_aquisicao: TFloatField;
    CDS_Produtosid_item: TIntegerField;
    CDS_Produtoscod_barras: TStringField;
    CDS_Produtosid_tipo_item: TIntegerField;
    CDS_Produtosdescricao: TStringField;
    CDS_Produtosid_fornecedor: TIntegerField;
    CDS_Produtosid_categoria: TIntegerField;
    CDS_Produtostmp_execucao: TIntegerField;
    CDS_Produtostaxa_lucro: TFloatField;
    CDS_ProdutosCategoria: TStringField;
    CDS_Produtoscusto_aquisicao: TFloatField;
    Qp_Fornecedores: TADOQuery;
    Qp_Fornecedoresid_fornec: TIntegerField;
    Qp_Fornecedoresnome: TStringField;
    Qp_Fornecedorescnpj: TStringField;
    Qp_Fornecedoresdat_ult_atend: TDateTimeField;
    Qp_Fornecedoresinfo_geral: TMemoField;
    Qp_Fornecedoresfoto: TBlobField;
    procedure Tp_ProdutosAfterInsert(DataSet: TDataSet);
    procedure Tp_ProdutosAfterOpen(DataSet: TDataSet);
    procedure Tp_ProdutosBeforeClose(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterClose(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadProdutos: TDM_CadProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadProdutos.Conectar(User, Pass, Database: String);
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

Procedure TDM_CadProdutos.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Qp_Fornecedores.Cancel;
    Tp_Produtos.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TDM_CadProdutos.Qp_FornecedoresAfterClose(DataSet: TDataSet);
begin
  Tp_Produtos.Close;
  Ta_Categoria.Close;
end;

procedure TDM_CadProdutos.Qp_FornecedoresAfterOpen(DataSet: TDataSet);
begin
  Tp_Produtos.Open;
  Ta_Categoria.Open;
end;

procedure TDM_CadProdutos.Tp_ProdutosAfterInsert(DataSet: TDataSet);
begin
  Tp_Produtosid_tipo_item.Value:=2;
end;

procedure TDM_CadProdutos.Tp_ProdutosAfterOpen(DataSet: TDataSet);
begin
  TP_Plan_STK.Open;
end;

procedure TDM_CadProdutos.Tp_ProdutosBeforeClose(DataSet: TDataSet);
begin
  TP_Plan_STK.Close;
end;

end.
