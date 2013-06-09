unit UPesquisar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, JvExControls,
  JvXPCore, JvXPButtons, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, StrUtils,
  Data.DB, Data.Win.ADODB, Vcl.Buttons;

type TTipo = (Pessoas, Clientes, Fornecedores, Produtos, Servicos,
  Funcionarios);

type
  TFrmPesquisar = class(TForm)
    Label17: TLabel;
    EdPesquisar: TEdit;
    Grid_Res_Pesquisa: TDBGrid;
    BtnCancelar: TJvXPButton;
    BtnSelecionar: TJvXPButton;
    Inativos: TCheckBox;
    procedure SetSQL;
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdPesquisarChange(Sender: TObject);
    procedure InativosClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FTipo: TTipo;
    FPessoal: Boolean;
    procedure SetTipo(Tipo: TTipo = Pessoas);
    procedure SetPessoal(Value: Boolean = False);
  public
    property Tipo: TTipo read FTipo write SetTipo;
    property Pessoal: Boolean read FPessoal write SetPessoal;
  end;

var
  FrmPesquisar: TFrmPesquisar;
  SQL:String;
  Pesquisando:Boolean;

implementation

{$R *.dfm}

uses UDM_CadPessoal, UDM_CadClientes, UDM_CadFornecedores, UDM_CadProdutos,
  UDM_CadServicos, UDM_CadFuncionarios;

procedure TFrmPesquisar.SetTipo(Tipo: TTipo = Pessoas);
  begin if FTipo <> Tipo then FTipo := Tipo; end;

procedure TFrmPesquisar.SetPessoal(Value: Boolean = False);
  begin if FPessoal <> Value then FPessoal := Value; end;

procedure TFrmPesquisar.SetSQL;
Var Ativo, Parte: String;
Begin
  Ativo:= '1';
  if Inativos.Checked Then Ativo:= '0';
  case Tipo of
    Pessoas:Begin
      SQL:='SELECT * FROM modular.tbl_pessoal pes ' +
        'left join modular.tbl_endereco en on pes.id_pessoal = en.id_pessoal ' +
        'left join modular.tbl_telefones tel on pes.id_pessoal = tel.id_pessoal ' +
        'left join modular.tbl_email ema on pes.id_pessoal = ema.id_pessoal' +
        ' Where pes.ativo >= ' + Ativo +
        ' and concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(UCASE(CEP), '''')'+
        ',COALESCE(UCASE(LOGRADOURO), ''''),COALESCE(UCASE(BAIRRO), '''')'+
        ',COALESCE(UCASE(CIDADE), ''''),COALESCE(UCASE(UF), '''')'+
        ',COALESCE(UCASE(TELEFONE), ''''),COALESCE(UCASE(email), '''')) ';
    end;
    Clientes:Begin
      SQL:='SELECT * FROM modular.tbl_pessoal pes ' +
        'left join modular.tbl_endereco en on pes.id_pessoal = en.id_pessoal ' +
        'left join modular.tbl_telefones tel on pes.id_pessoal = tel.id_pessoal ' +
        'left join modular.tbl_email ema on pes.id_pessoal = ema.id_pessoal ' +
        'left join modular.tbl_clientes cli on pes.id_pessoal = cli.id_cliente ' +
        ' Where pes.ativo >= ' + Ativo +
        ' and concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(UCASE(CEP), '''')'+
        ',COALESCE(UCASE(LOGRADOURO), ''''),COALESCE(UCASE(BAIRRO), '''')'+
        ',COALESCE(UCASE(CIDADE), ''''),COALESCE(UCASE(UF), '''')'+
        ',COALESCE(UCASE(TELEFONE), ''''),COALESCE(UCASE(email), '''')) ';
    End;
    Fornecedores:Begin
      SQL:='select * from modular.tbl_pessoal pes '+
        'left join modular.tbl_fornecedores forn on pes.id_pessoal = forn.id_fornec '+
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_fornecedor ' +
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_tipo_item ' +
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categoria = acat.id_categoria ' +
        ' Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(forn.cnpj, '''')'+
        ',COALESCE(UCASE(forn.info_geral), ''''),COALESCE(itm.cod_barras, '''')'+
        ',COALESCE(UCASE(itm.descricao), ''''),COALESCE(UCASE(atip.descricao), '''')'+
        ',COALESCE(UCASE(acat.descricao), '''')) ';
    End;
    Produtos:Begin
      SQL:='select * from modular.tbl_pessoal pes '+
        'inner join modular.tbl_fornecedores forn on pes.id_pessoal = forn.id_fornec ' +
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_fornecedor ' +
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_tipo_item ' +
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categoria = acat.id_categoria ' +
        ' Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, '''')'+
        ',COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''),COALESCE(forn.cnpj, '''')'+
        ',COALESCE(UCASE(forn.info_geral), ''''),COALESCE(itm.cod_barras, '''')'+
        ',COALESCE(UCASE(itm.descricao), ''''),COALESCE(UCASE(atip.descricao), '''')'+
        ',COALESCE(UCASE(acat.descricao), '''')) ';
    End;
    Servicos:Begin
      SQL:='select * from modular.tbl_fornecedores forn ' +
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_fornecedor ' +
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_tipo_item ' +
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categoria = acat.id_categoria ' +
        ' Where itm.ativo >= ' + Ativo +
        ' and forn.id_fornec = 1 and concat(COALESCE(itm.cod_barras, '''')'+
        ',COALESCE(UCASE(itm.descricao), ''''),COALESCE(UCASE(atip.descricao), '''')'+
        ',COALESCE(UCASE(acat.descricao), '''')) ';
    End;
    Funcionarios:Begin
      if Pessoal then Parte:='left' else Parte:='inner';

      SQL:='select * from modular.tbl_pessoal pes '+
        Parte + ' join modular.tbl_funcionarios fun on pes.id_pessoal = fun.id_funcionario '+
        'Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI, ''''), '+
        'COALESCE(UCASE(RG), ''''),COALESCE(UCASE(CPF), ''''), '+
        'COALESCE(UCASE(fun.info_geral), '''')) ';
    End
    else Begin
      SQL:='';
    End;
  end;
End;

procedure TFrmPesquisar.EdPesquisarChange(Sender: TObject);
begin
  if Pesquisando then
  Begin
    SetSQL;
    case Tipo of
      Pessoas:Begin
        DM_CadPessoal.Qry_Busca.Close;
        DM_CadPessoal.Qry_Busca.SQL.Text:=SQL + ' like ''%' + EdPesquisar.Text + '%''';
        DM_CadPessoal.Qry_Busca.Open;
        Grid_Res_Pesquisa.DataSource:=DM_CadPessoal.ds_Qry_Busca;
      end;
      Clientes:Begin
        DM_CadClientes.Qry_Busca.Close;
        DM_CadClientes.Qry_Busca.SQL.Text:=SQL + ' like ''%' + EdPesquisar.Text + '%''';
        DM_CadClientes.Qry_Busca.Open;
        Grid_Res_Pesquisa.DataSource:=DM_CadClientes.ds_Qry_Busca;
      end;
      Fornecedores:Begin
        DM_CadFornecedores.Qry_Busca.Close;
        DM_CadFornecedores.Qry_Busca.SQL.Text:=SQL + ' like ''%' + EdPesquisar.Text + '%''';
        DM_CadFornecedores.Qry_Busca.Open;
        Grid_Res_Pesquisa.DataSource:=DM_CadFornecedores.ds_Qry_Busca;
        Grid_Res_Pesquisa.Columns[0].Width:=120;
        Grid_Res_Pesquisa.Columns[1].Width:=200;
        Grid_Res_Pesquisa.Columns[2].Width:=40;
        Grid_Res_Pesquisa.Columns[3].Width:=200;
        Grid_Res_Pesquisa.Columns[4].Width:=60;
        Grid_Res_Pesquisa.Columns[5].Width:=90;
        Grid_Res_Pesquisa.Columns[6].Width:=90;
      end;
      Produtos:Begin
        DM_CadProdutos.Qry_Busca.Close;
        DM_CadProdutos.Qry_Busca.SQL.Text:=SQL + ' like ''%' + EdPesquisar.Text + '%''';
        DM_CadProdutos.Qry_Busca.Open;
        Grid_Res_Pesquisa.DataSource:=DM_CadProdutos.ds_Qry_Busca;
      end;
      Servicos:Begin
        DM_CadServicos.Qry_Busca.Close;
        DM_CadServicos.Qry_Busca.SQL.Text:=SQL + ' like ''%' + EdPesquisar.Text + '%''';
        DM_CadServicos.Qry_Busca.Open;
        Grid_Res_Pesquisa.DataSource:=DM_CadServicos.ds_Qry_Busca;
      end;
      Funcionarios:Begin
        DM_CadFuncionarios.Qry_Busca.Close;
        DM_CadFuncionarios.Qry_Busca.SQL.Text:=SQL + ' like ''%' + EdPesquisar.Text + '%''';
        DM_CadFuncionarios.Qry_Busca.Open;
        Grid_Res_Pesquisa.DataSource:=DM_CadFuncionarios.ds_Qry_Busca;
      end;
    end;
  End;
end;

procedure TFrmPesquisar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pesquisando:=False;
  EdPesquisar.Text:='';
  Inativos.Checked:=False;
  case Tipo of
    Pessoas:
      DM_CadPessoal.Qry_Busca.Close;
    Clientes:
      DM_CadClientes.Qry_Busca.Close;
    Fornecedores:
      DM_CadFornecedores.Qry_Busca.Close;
    Produtos:
      DM_CadProdutos.Qry_Busca.Close;
    Servicos:
      DM_CadServicos.Qry_Busca.Close;
    Funcionarios:
      DM_CadFuncionarios.Qry_Busca.Close;
  end;
  Grid_Res_Pesquisa.DataSource:=Nil;
end;

procedure TFrmPesquisar.FormShow(Sender: TObject);
begin
  Pesquisando:=True;
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
Var ID:Integer;
begin
  case Tipo of
    Pessoas:Begin
      with DM_CadPessoal do
      Begin
        ID:= Qry_Busca.FieldByName('id_pessoal').Value;
        if not Tp_Pessoal.Active then
          Tp_Pessoal.Open;
        Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
      End;
    end;
    Clientes:Begin
      with DM_CadClientes do
      Begin
        ID:= Qry_Busca.FieldByName('id_pessoal').Value;
        if not Tp_Pessoal.Active then
          Tp_Pessoal.Open;
        Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
      End;
    end;
    Fornecedores:Begin
      with DM_CadFornecedores do
      Begin
        ID:= Qry_Busca.FieldByName('id_pessoal').Value;
        if not Tp_Pessoal.Active then
          Tp_Pessoal.Open;
        Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
      End;
    end;
    Produtos:Begin
      with DM_CadProdutos do
      Begin
        ID:= Qry_Busca.FieldByName('id_pessoal').Value;
        if not Qp_Fornecedores.Active then
          Qp_Fornecedores.Open;
        Try
          Qp_Fornecedores.Locate('id_fornec', ID, [loCaseInsensitive]);
          if Not Qry_Busca.FieldByName('id_item').isNull then
          Begin
            ID:= Qry_Busca.FieldByName('id_item').Value;
            Tp_Produtos.Locate('id_item', ID, [loCaseInsensitive]);
          End;
        Except End;
      End;
    end;
    Servicos:Begin
      with DM_CadServicos do
      Begin
        if Not Qry_Busca.FieldByName('id_item').isNull then
        Begin
          ID:= Qry_Busca.FieldByName('id_item').Value;
          if not Tp_Servicos.Active then
            Tp_Servicos.Open;
          Tp_Servicos.Locate('id_item', ID, [loCaseInsensitive]);
        End;
      End;
    end;
    Funcionarios:Begin
      with DM_CadFuncionarios do
      Begin
        ID:= Qry_Busca.FieldByName('id_pessoal').Value;
        if not Tp_Pessoal.Active then
          Tp_Pessoal.Open;
        Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
      End;
    end;
  end;
  Close;
end;

end.
