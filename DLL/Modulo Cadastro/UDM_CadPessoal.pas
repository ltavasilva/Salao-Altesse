unit UDM_CadPessoal;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB;

type
  TDM_CadPessoal = class(TDataModule)
    Conexao: TADOConnection;
    Tp_Pessoal: TADOTable;
    ds_Tp_Pessoal: TDataSource;
    Tp_Pessoalid_pessoal: TAutoIncField;
    Tp_Pessoalnome: TStringField;
    Tp_Pessoaldata_nasci: TDateField;
    Tp_Pessoalrg: TStringField;
    Tp_Pessoalcpf: TStringField;
    Tp_Pessoaldata_incl: TDateTimeField;
    Tp_Pessoalresp_incl: TIntegerField;
    Tp_Pessoaldata_modif: TDateTimeField;
    Tp_Pessoalresp_modif: TIntegerField;
    Tp_Endereco: TADOTable;
    ds_Tp_Endereco: TDataSource;
    Ta_Tipo_Ende: TADOTable;
    Tp_Enderecocep: TStringField;
    Tp_Enderecoid_pessoal: TIntegerField;
    Tp_Enderecoid_tipo: TIntegerField;
    Tp_Enderecologradouro: TStringField;
    Tp_Enderecobairro: TStringField;
    Tp_Enderecocidade: TStringField;
    Tp_Enderecouf: TStringField;
    Tp_EnderecoTipo: TStringField;
    ds_Tp_Tel: TDataSource;
    Ta_Tipo_Tel: TADOTable;
    Tp_Tel: TADOTable;
    Tp_Teltelefone: TStringField;
    Tp_Telid_pessoal: TIntegerField;
    Tp_Telid_tipo: TIntegerField;
    Tp_TelTipo: TStringField;
    ds_Tp_Email: TDataSource;
    Ta_Tipo_Email: TADOTable;
    Tp_Email: TADOTable;
    Tp_Emailemail: TStringField;
    Tp_Emailid_pessoal: TIntegerField;
    Tp_Emailid_tipo: TIntegerField;
    Tp_EmailTipo: TStringField;
    Qry_Busca: TADOQuery;
    ds_Qry_Busca: TDataSource;
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
    Tp_Pessoalativo: TSmallintField;
    Qry_Exec: TADOQuery;
    Tp_Endereconum: TIntegerField;
    ds_Ta_Tipo_Ende: TDataSource;
    Tp_Enderecocomplemento: TStringField;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
  end;

var
  DM_CadPessoal: TDM_CadPessoal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDM_CadPessoal.Conectar(User, Pass, Database: String);
Var Str:String;
Begin
  with Conexao do
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

Procedure TDM_CadPessoal.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Tp_Tel.Cancel;
    Ta_Tipo_Tel.Cancel;
    Tp_Email.Cancel;
    Ta_Tipo_Email.Cancel;
    Ta_Tipo_Ende.Cancel;
    Tp_Endereco.Cancel;
    Tp_Pessoal.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TDM_CadPessoal.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Endereco.Close;
  Tp_Email.Close;
  Tp_Tel.Close;
  Ta_Tipo_Ende.Close;
  Ta_Tipo_Tel.Close;
  Ta_Tipo_Email.Close;
end;

procedure TDM_CadPessoal.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Ta_Tipo_Ende.Open;
  Ta_Tipo_Tel.Open;
  Ta_Tipo_Email.Open;
  Tp_Endereco.Open;
  Tp_Email.Open;
  Tp_Tel.Open;
end;

end.
