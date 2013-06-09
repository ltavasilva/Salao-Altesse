unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.Provider, Data.Win.ADODB, Data.DB;

type
  TServerSalao = class(TDSServerModule)
    Conexao: TADOConnection;
    Tp_Endereco: TADOTable;
    Tp_Enderecocep: TStringField;
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
    Ta_Tipo_Email: TADOTable;
    Tp_Tel: TADOTable;
    Ta_Tipo_Tel: TADOTable;
    Tp_Pessoal: TADOTable;
    Qry_Busca: TADOQuery;
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
    Qry_Geral: TADOQuery;
    Dsp_Qry_Geral: TDataSetProvider;
    Ta_Categ_Serv: TADOTable;
    Dsp_Ta_Categ_Serv: TDataSetProvider;
    Ta_Categ_Prod: TADOTable;
    Dsp_Ta_Categ_Prod: TDataSetProvider;
    Ta_Status_Mov: TADOTable;
    Dsp_Ta_Status_Mov: TDataSetProvider;
    Ta_Tipo_Itens: TADOTable;
    Dsp_Ta_Tipo_Itens: TDataSetProvider;
    Ta_Tipo_Mov: TADOTable;
    Dsp_Ta_Tipo_Mov: TDataSetProvider;
    Ta_Tipo_Entidade: TADOTable;
    Dsp_Ta_Tipo_Entidade: TDataSetProvider;
    Tp_Clientes: TADOTable;
    Dsp_Tp_Clientes: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.

