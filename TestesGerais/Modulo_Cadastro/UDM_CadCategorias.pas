unit UDM_CadCategorias;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadCategorias = class(TDataModule)
    Conexao: TADOConnection;
    Tbl_Categ_Serv: TADOTable;
    ds_Tbl_Categ_Serv: TDataSource;
    Tbl_Categ_Prod: TADOTable;
    ds_Tbl_Categ_Prod: TDataSource;
    Tbl_Status_Mov: TADOTable;
    ds_Tbl_Status_Mov: TDataSource;
    Tbl_Tipo_Email: TADOTable;
    ds_Tbl_Tipo_Email: TDataSource;
    Tbl_Tipo_Ende: TADOTable;
    ds_Tbl_Tipo_Ende: TDataSource;
    Tbl_Tipo_Entidade: TADOTable;
    ds_Tbl_Tipo_Entidade: TDataSource;
    Tbl_Tipo_Itens: TADOTable;
    ds_Tbl_Tipo_Itens: TDataSource;
    Tbl_Tipo_Mov: TADOTable;
    ds_Tbl_Tipo_Mov: TDataSource;
    Tbl_Tipo_Tel: TADOTable;
    ds_Tbl_Tipo_Tel: TDataSource;
    Tbl_Categ_Servid_categoria: TAutoIncField;
    Tbl_Categ_Servid_tipo: TIntegerField;
    Tbl_Categ_Servdescricao: TStringField;
    Tbl_Status_Movid_status: TAutoIncField;
    Tbl_Status_Movdescricao: TStringField;
    Tbl_Tipo_Emailid_tipo: TAutoIncField;
    Tbl_Tipo_Emaildescricao: TStringField;
    Tbl_Tipo_Endeid_tipo: TAutoIncField;
    Tbl_Tipo_Endedescricao: TStringField;
    Tbl_Tipo_Entidadeid_tipo_entidade: TAutoIncField;
    Tbl_Tipo_Entidadedescricao: TStringField;
    Tbl_Tipo_Itensid_tipo_item: TAutoIncField;
    Tbl_Tipo_Itensdescricao: TStringField;
    Tbl_Tipo_Movid_tipo: TAutoIncField;
    Tbl_Tipo_Movdescricao: TStringField;
    Tbl_Tipo_Telid_tipo: TAutoIncField;
    Tbl_Tipo_Teldescricao: TStringField;
    Tbl_Categ_Prodid_categoria: TAutoIncField;
    Tbl_Categ_Prodid_tipo: TIntegerField;
    Tbl_Categ_Proddescricao: TStringField;
    Tbl_Comissao: TADOTable;
    Tbl_Comissaoid_funcionario: TIntegerField;
    Tbl_Comissaoid_item: TIntegerField;
    Tbl_Comissaocomissao: TFloatField;
    ds_Tbl_Comissao: TDataSource;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable2: TADOTable;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField2: TFloatField;
    Qry_Funcionarios: TADOQuery;
    Qry_Funcionariosid_pessoal: TAutoIncField;
    Qry_Funcionariosnome: TStringField;
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadCategorias: TDM_CadCategorias;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadCategorias.Conectar(User, Pass, Database: String);
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
  Tbl_Categ_Serv.Open;
  Tbl_Categ_Prod.Open;
  Tbl_Status_Mov.Open;
  Tbl_Tipo_Email.Open;
  Tbl_Tipo_Ende.Open;
  Tbl_Tipo_Entidade.Open;
  Tbl_Tipo_Itens.Open;
  Tbl_Tipo_Mov.Open;
  Tbl_Tipo_Tel.Open;
End;

Procedure TDM_CadCategorias.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Conexao.Close;
  End;
  Except

  End;
End;

end.
