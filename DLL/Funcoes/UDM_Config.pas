unit UDM_Config;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect,
  Data.SqlExpr;

type
  TDM_Config = class(TDataModule)
    Server: TSQLConnection;
    DspConn: TDSProviderConnection;
    Qry_Geral: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Config: TDM_Config;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDM_Config.DataModuleCreate(Sender: TObject);
begin
  DspConn.ServerClassName:='TServerSalao';
  DspConn.SQLConnection:=Server;
end;

end.
