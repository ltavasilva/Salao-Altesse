unit Udm_Database;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Salao_Server_TLB, StdVcl, Datasnap.Provider, Data.Win.ADODB, Data.DB;

type
  TDatabase = class(TRemoteDataModule, IDatabase)
    Conexao: TADOConnection;
    Tp_Endereco: TADOTable;
    Tp_Enderecocep: TStringField;
    Tp_EnderecoTipo: TStringField;
    Tp_Enderecologradouro: TStringField;
    Tp_Enderecocomplemento: TStringField;
    Tp_Enderecobairro: TStringField;
    Tp_Enderecocidade: TStringField;
    Tp_Enderecouf: TStringField;
    Tp_Endereconum: TIntegerField;
    Tp_Enderecoid_tipo: TIntegerField;
    Tp_Enderecoid_pessoal: TIntegerField;
    Ta_Tipo_Ende: TADOTable;
    Tp_Email: TADOTable;
    Tp_EmailTipo: TStringField;
    Tp_Emailemail: TStringField;
    Tp_Emailid_pessoal: TIntegerField;
    Tp_Emailid_tipo: TIntegerField;
    Ta_Tipo_Email: TADOTable;
    Tp_Tel: TADOTable;
    Tp_TelTipo: TStringField;
    Tp_Teltelefone: TStringField;
    Tp_Telid_pessoal: TIntegerField;
    Tp_Telid_tipo: TIntegerField;
    Ta_Tipo_Tel: TADOTable;
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
    Qry_Exec: TADOQuery;
    Dsp_Tp_Endereco: TDataSetProvider;
    Dsp_Ta_Tipo_Ende: TDataSetProvider;
    Dsp_Tp_Email: TDataSetProvider;
    Dsp_Ta_Tipo_Email: TDataSetProvider;
    Dsp_Tp_Tel: TDataSetProvider;
    Dsp_Ta_Tipo_Tel: TDataSetProvider;
    Dsp_Tp_Pessoal: TDataSetProvider;
    Dsp_Qry_Busca: TDataSetProvider;
    Dsp_Qry_Exec: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TDatabase.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDatabase,
    Class_Database, ciMultiInstance, tmApartment);
end.
