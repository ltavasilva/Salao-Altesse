unit UPesquisar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, JvExControls,
  JvXPCore, JvXPButtons, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, StrUtils,
  Data.DB, Data.Win.ADODB, Vcl.Buttons;

type TTipo = (Pessoal, Clientes, Fornecedores, Produtos, Servicos,
  Funcionarios);

type
  TFrmPesquisar = class(TForm)
    Label17: TLabel;
    EdPesquisar: TEdit;
    Grid_Res_Pesquisa: TDBGrid;
    BtnCancelar: TJvXPButton;
    BtnSelecionar: TJvXPButton;
    Inativos: TCheckBox;
    Conexao: TADOConnection;
    Query_Clientes: TADOQuery;
    Query_Clientesid_pessoal: TAutoIncField;
    Query_Clientesnome: TStringField;
    Query_Clientesdata_nasci: TDateField;
    Query_Clientesrg: TStringField;
    Query_Clientescpf: TStringField;
    ds_Query: TDataSource;
    Query_Servicos: TADOQuery;
    Query_Produtos: TADOQuery;
    Query_Pessoal: TADOQuery;
    Query_Pessoalid_pessoal: TAutoIncField;
    Query_Pessoalnome: TStringField;
    Query_Pessoaldata_nasci: TDateField;
    Query_Pessoalrg: TStringField;
    Query_Pessoalcpf: TStringField;
    Query_Funcionarios: TADOQuery;
    Query_Fornecedores: TADOQuery;
    Query_Fornecedoresid_pessoal: TIntegerField;
    Query_Fornecedoresnome: TStringField;
    Query_Fornecedoresdata_nasci: TDateField;
    Query_Fornecedoresrg: TStringField;
    Query_Fornecedorescpf: TStringField;
    Query_Fornecedorescnpj: TStringField;
    Query_ProdutosFornecedor: TStringField;
    Query_Produtostipo: TStringField;
    Query_Produtoscategoria: TStringField;
    Query_Produtoscod_barras: TStringField;
    Query_Produtosdescricao: TStringField;
    Query_Produtosativo: TIntegerField;
    Query_ServicosFornecedor: TStringField;
    Query_ServicosTipo: TStringField;
    Query_ServicosCategoria: TStringField;
    Query_ServicosCod_Barras: TStringField;
    Query_Servicosdescricao: TStringField;
    Query_Servicosativo: TIntegerField;
    Query_Servicosid_item: TIntegerField;
    Query_Produtosid_item: TIntegerField;
    Query_Servicosid_pessoal: TIntegerField;
    Query_Produtosid_pessoal: TIntegerField;
    Query_Funcionariosid_pessoal: TAutoIncField;
    Query_Funcionariosnome: TStringField;
    Query_Funcionariosdata_nasci: TDateField;
    Query_Funcionariosrg: TStringField;
    Query_Funcionarioscpf: TStringField;
    procedure SetSQL;
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure InativosClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FTipo: TTipo;
    FisPessoal: Boolean;
    procedure SetTipo(Tipo: TTipo = Pessoal);
    procedure SetisPessoal(Value: Boolean = False);
  public
    FrmPesquisar: TFrmPesquisar;
    Parent, ID: Integer;
    property Tipo: TTipo read FTipo write SetTipo;
    property isPessoal: Boolean read FisPessoal write SetisPessoal;
  end;

var
  Pesquisando:Boolean;

implementation

{$R *.dfm}

procedure TFrmPesquisar.SetTipo(Tipo: TTipo = Pessoal);
  begin if FTipo <> Tipo then FTipo := Tipo; end;

procedure TFrmPesquisar.SetisPessoal(Value: Boolean = False);
  begin if FisPessoal <> Value then FisPessoal := Value; end;


procedure TFrmPesquisar.SetSQL;
Var Ativo, Parte, SQL: String;
Begin
  Ativo:= '1';
  if Inativos.Checked Then Ativo:= '0';
  case Tipo of
    Pessoal:Begin
      Query_Pessoal.Close;
      Query_Pessoal.SQL.Text:='SELECT distinct pes.* FROM modular.tbl_pessoal pes ' +
        'left join modular.tbl_endereco en on pes.id_pessoal = en.id_pessoal ' +
        'left join modular.tbl_telefones tel on pes.id_pessoal = tel.id_pessoal ' +
        'left join modular.tbl_email ema on pes.id_pessoal = ema.id_pessoal' +
        ' Where pes.ativo >= ' + Ativo +
        ' and concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(UCASE(CEP), '''')'+
        ',COALESCE(UCASE(LOGRADOURO), ''''),COALESCE(UCASE(BAIRRO), '''')'+
        ',COALESCE(UCASE(CIDADE), ''''),COALESCE(UCASE(UF), '''')'+
        ',COALESCE(UCASE(TELEFONE), ''''),COALESCE(UCASE(email), '''')) like ''%' + EdPesquisar.Text + '%''';
      ds_Query.DataSet:=Query_Pessoal;
      Query_Pessoal.Open;
    end;
    Clientes:Begin
      Query_Clientes.Close;
      Query_Clientes.SQL.Text:='SELECT distinct pes.* FROM modular.tbl_pessoal pes ' +
        'left join modular.tbl_endereco en on pes.id_pessoal = en.id_pessoal ' +
        'left join modular.tbl_telefones tel on pes.id_pessoal = tel.id_pessoal ' +
        'left join modular.tbl_email ema on pes.id_pessoal = ema.id_pessoal ' +
        'left join modular.tbl_clientes cli on pes.id_pessoal = cli.id_cliente ' +
        ' Where pes.ativo >= ' + Ativo +
        ' and concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(UCASE(CEP), '''')'+
        ',COALESCE(UCASE(LOGRADOURO), ''''),COALESCE(UCASE(BAIRRO), '''')'+
        ',COALESCE(UCASE(CIDADE), ''''),COALESCE(UCASE(UF), '''')'+
        ',COALESCE(UCASE(TELEFONE), ''''),COALESCE(UCASE(email), '''')) like ''%' + EdPesquisar.Text + '%''';
      ds_Query.DataSet:=Query_Clientes;
      Query_Clientes.Open;
    End;
    Fornecedores:Begin
      Query_Fornecedores.Close;
      Query_Fornecedores.SQL.Text:='select distinct pes.*, forn.cnpj from modular.tbl_pessoal pes '+
        'left join modular.tbl_fornecedores forn on pes.id_pessoal = forn.id_fornec '+
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_fornecedor ' +
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_tipo_item ' +
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categoria = acat.id_categoria ' +
        ' Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(forn.cnpj, '''')'+
        ',COALESCE(UCASE(forn.info_geral), ''''),COALESCE(itm.cod_barras, '''')'+
        ',COALESCE(UCASE(itm.descricao), ''''),COALESCE(UCASE(atip.descricao), '''')'+
        ',COALESCE(UCASE(acat.descricao), '''')) like ''%' + EdPesquisar.Text + '%''';
      ds_Query.DataSet:=Query_Fornecedores;
      Query_Fornecedores.Open;
    End;
    Produtos:Begin
      Query_Produtos.Close;
      SQL:='select distinct pes.id_pessoal, pes.nome Fornecedor, prd.tipo, prd.categoria,'+
        ' prd.cod_barras, prd.descricao, prd.ativo, prd.id_item from tbl_fornecedores forn'+
        ' inner join tbl_pessoal pes on forn.id_fornec = pes.id_pessoal'+
        ' left join (select distinct itm.*, atip.descricao tipo, acat.descricao categoria'+
        ' from tbl_itens itm'+
        ' left join tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_tipo_item'+
        ' left join tbl_aux_categoria_itens acat on itm.id_categoria = acat.id_categoria'+
        ' where atip.id_tipo_item = 2) prd on forn.id_fornec = prd.id_fornecedor'+
        ' Where (prd.ativo >= ' + Ativo + ' or prd.ativo is null)'+
        ' and concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(forn.cnpj, '''')'+
        ',COALESCE(UCASE(forn.info_geral), ''''),COALESCE(prd.cod_barras, '''')'+
        ',COALESCE(UCASE(prd.descricao), ''''),COALESCE(UCASE(prd.descricao), '''')'+
        ',COALESCE(UCASE(prd.descricao), '''')) like ''%' + EdPesquisar.Text + '%''';
      Query_Produtos.SQL.Text:=SQL;
      ds_Query.DataSet:=Query_Produtos;
      Query_Produtos.Open;
    End;
    Servicos:Begin
      Query_Servicos.Close;
      Query_Servicos.SQL.Text:='select distinct pes.id_pessoal, pes.nome Fornecedor, prd.tipo, prd.categoria,'+
        ' prd.cod_barras, prd.descricao, prd.ativo, prd.id_item from tbl_fornecedores forn'+
        ' inner join tbl_pessoal pes on forn.id_fornec = pes.id_pessoal'+
        ' left join (select distinct itm.*, atip.descricao tipo, acat.descricao categoria'+
        ' from tbl_itens itm'+
        ' left join tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_tipo_item'+
        ' left join tbl_aux_categoria_itens acat on itm.id_categoria = acat.id_categoria'+
        ' where atip.id_tipo_item = 1) prd on forn.id_fornec = prd.id_fornecedor'+
        ' Where (prd.ativo >= ' + Ativo + ' or prd.ativo is null)'+
        ' and concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(forn.cnpj, '''')'+
        ',COALESCE(UCASE(forn.info_geral), ''''),COALESCE(prd.cod_barras, '''')'+
        ',COALESCE(UCASE(prd.descricao), ''''),COALESCE(UCASE(prd.descricao), '''')'+
        ',COALESCE(UCASE(prd.descricao), '''')) like ''%' + EdPesquisar.Text + '%''';
      ds_Query.DataSet:=Query_Servicos;
      Query_Servicos.Open;
    End;
    Funcionarios:Begin
      Query_Funcionarios.Close;
      if isPessoal then Parte:='left' else Parte:='inner';

      Query_Funcionarios.SQL.Text:='select * from modular.tbl_pessoal pes '+
        Parte + ' join modular.tbl_funcionarios fun on pes.id_pessoal = fun.id_funcionario '+
        'Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, ''''), '+
        'COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''), '+
        'COALESCE(UCASE(fun.info_geral), '''')) like ''%' + EdPesquisar.Text + '%''';
      ds_Query.DataSet:=Query_Funcionarios;
      Query_Funcionarios.Open;
    End;
  end;
End;

procedure TFrmPesquisar.EdPesquisarChange(Sender: TObject);
begin
  if Pesquisando then
  Begin
    SetSQL;
  End;
end;

procedure TFrmPesquisar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pesquisando:=False;
  EdPesquisar.Text:='';
  Inativos.Checked:=False;
  Desconectar;
  ds_Query.DataSet:=Nil;
end;

procedure TFrmPesquisar.FormCreate(Sender: TObject);
begin
  SetTipo;
  SetisPessoal;
end;

Procedure TFrmPesquisar.Conectar(User, Pass, Database: String);
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

Procedure TFrmPesquisar.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmPesquisar.FormShow(Sender: TObject);
begin
  Conectar('root', '', 'modular');
  Pesquisando:=True;
  ID:=-1;
  Parent:=-1;
  EdPesquisarChange(Sender);
end;

procedure TFrmPesquisar.InativosClick(Sender: TObject);
begin
  EdPesquisarChange(Sender);
end;

procedure TFrmPesquisar.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisar.BtnSelecionarClick(Sender: TObject);
begin
  Try
    case Tipo of
      Pessoal:
        ID:=Query_Pessoal.FieldByName('id_pessoal').Value;
      Clientes:
        ID:=Query_Clientes.FieldByName('id_pessoal').Value;
      Fornecedores:
        ID:=Query_Fornecedores.FieldByName('id_pessoal').Value;
      Funcionarios:
        ID:=Query_Funcionarios.FieldByName('id_pessoal').Value;
      Servicos:
        ID:=Query_Servicos.FieldByName('id_item').Value;
      Produtos:Begin
        Parent:=Query_Produtos.FieldByName('id_pessoal').Value;
        if Not Query_Produtos.FieldByName('id_item').IsNull then
          ID:=Query_Produtos.FieldByName('id_item').Value; end;
    end;
  Except End;

  Close;
end;

end.
