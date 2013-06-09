unit UDM_CadCategorias;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.Win.ADODB, Data.DB,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Datasnap.DSConnect,
  Data.SqlExpr;

type
  TDM_CadCategorias = class(TDataModule)
    ds_Ta_Categ_Serv: TDataSource;
    ds_Ta_Categ_Prod: TDataSource;
    ds_Ta_Status_Mov: TDataSource;
    ds_Ta_Tipo_Email: TDataSource;
    ds_Ta_Tipo_Ende: TDataSource;
    ds_Ta_Tipo_Entidade: TDataSource;
    ds_Ta_Tipo_Itens: TDataSource;
    ds_Ta_Tipo_Mov: TDataSource;
    ds_Ta_Tipo_Tel: TDataSource;
    Server: TSQLConnection;
    DspConn: TDSProviderConnection;
    Ta_Categ_Serv: TClientDataSet;
    Ta_Categ_Prod: TClientDataSet;
    Ta_Status_Mov: TClientDataSet;
    Ta_Tipo_Email: TClientDataSet;
    Ta_Tipo_Ende: TClientDataSet;
    Ta_Tipo_Entidade: TClientDataSet;
    Ta_Tipo_Itens: TClientDataSet;
    Ta_Tipo_Mov: TClientDataSet;
    Ta_Tipo_Tel: TClientDataSet;
    Qry_Acesso: TClientDataSet;
    Ta_Categ_Servdescricao: TStringField;
    Ta_Categ_Proddescricao: TStringField;
    Ta_Status_Movdescricao: TStringField;
    Ta_Tipo_Emaildescricao: TStringField;
    Ta_Tipo_Endedescricao: TStringField;
    Ta_Tipo_Teldescricao: TStringField;
    Ta_Tipo_Itensdescricao: TStringField;
    Ta_Tipo_Movdescricao: TStringField;
    Ta_Tipo_Entidadedescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
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
Begin

End;

procedure TDM_CadCategorias.DataModuleCreate(Sender: TObject);
begin
  DspConn.ServerClassName:='TServerSalao';
  DspConn.SQLConnection:=Server;
end;

Procedure TDM_CadCategorias.Desconectar();
Begin

End;

end.
