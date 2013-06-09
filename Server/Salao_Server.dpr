program Salao_Server;

uses
  Vcl.Forms,
  UFrmServer in 'UFrmServer.pas' {FrmServer},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerSalao: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmServer, FrmServer);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

