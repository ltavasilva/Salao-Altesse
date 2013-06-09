unit UFrmCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB, ADODB,
  UPesquisar, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr;

type
  TFrmCadClientes = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    Btn_Pessoal_Novo: TToolButton;
    Btn_Pessoal_Editar: TToolButton;
    Btn_Pessoal_Excluir: TToolButton;
    Btn_Pessoal_Cancelar: TToolButton;
    ToolButton4: TToolButton;
    Btn_Pessoal_Salvar: TToolButton;
    ToolButton6: TToolButton;
    Btn_Pessoal_Sair: TToolButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    ChAtivo: TCheckBox;
    Label5: TLabel;
    DBImage1: TDBImage;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    JvImgBtn1: TJvImgBtn;
    ds_Tp_Pessoal: TDataSource;
    ds_Tp_Clientes: TDataSource;
    Server: TSQLConnection;
    DspConn: TDSProviderConnection;
    Tp_Pessoal: TClientDataSet;
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
    Tp_Clientes: TClientDataSet;
    Tp_Clientesid_cliente: TIntegerField;
    Tp_Clientesdat_ult_atend: TDateTimeField;
    Tp_ClientesFoto: TBlobField;
    Tp_Clientesinfo_geral: TMemoField;
    Qry_Exec: TClientDataSet;
    procedure SetROnly(Val:Boolean);
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Tp_PessoalAfterScroll(DataSet: TDataSet);
  private
  public

  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadClientes: TFrmCadClientes;
  EditCEP: Boolean;
  Modo: String;

implementation

//function FrmPesquisar(Tipo:TTipo):Integer; External 'Pesquisar.dll';

procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String);
  External 'Funcoes.dll';

{$R *.dfm}

procedure TFrmCadClientes.SetROnly(Val:Boolean);
Begin
  ds_Tp_Clientes.AutoEdit:=Not Val;
End;

procedure TFrmCadClientes.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Clientes.Close;
end;

procedure TFrmCadClientes.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Clientes.Open;
end;

procedure TFrmCadClientes.Tp_PessoalAfterScroll(DataSet: TDataSet);
begin
  Tp_Clientes.Filter:= 'id_cliente = ' + Tp_Pessoalid_pessoal.AsString;
end;

function FrmPesquisar(Tipo:TTipo):Integer;
var DLL: THandle;
  func : function(Tipo:TTipo):Integer;
begin
  Result:=-1;
  DLL:=LoadLibrary('Pesquisar.dll');
  if (DLL <> 0) then begin
  func := GetProcAddress(DLL, 'FrmPesquisar');
  if (@func <> Nil) then
  Result:=func(Tipo);
  end;
  FreeLibrary(DLL);
end;

procedure TFrmCadClientes.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  SetROnly(True);
  try
    Tp_Clientes.Cancel;
  Except
  end;
  SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
end;

procedure TFrmCadClientes.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandosSemExclusao(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadClientes.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  // *** Função desabilitada pois não faz sentido excluir cliente.
  // *** Desabilidata na procedure SetVisibComandosSemExclusao
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadClientes.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  // *** Função desabilitada pois não não precisa dar o comando Append.
  // *** Desabilidata na procedure SetVisibComandosSemExclusao
  Modo:='Novo';
  SetROnly(False);

  {Tp_Clientes.Open;
  Tp_Clientes.Append; }

  DBMemo1.SetFocus;
  SetVisibComandosSemExclusao(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadClientes.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadClientes.Btn_Pessoal_SalvarClick(Sender: TObject);
begin
  if Tp_Clientes.State in [dsEdit, dsinsert] then
    Tp_Clientes.Post;
  Tp_Clientes.ApplyUpdates(-1);
  SetROnly(True);
  Modo:='';
  SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
end;

procedure TFrmCadClientes.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadClientes.FormCreate(Sender: TObject);
begin
  DspConn.ServerClassName:='TServerSalao';
  DspConn.SQLConnection:=Server;
end;

procedure TFrmCadClientes.FormShow(Sender: TObject);
begin
  Tp_Pessoal.Open;
  if Tp_Pessoal.RecordCount > 0 then
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO')
  else
    SetVisibComandosSemExclusao(ToolBar1, 'PADRAO');
end;

procedure TFrmCadClientes.JvImgBtn1Click(Sender: TObject);
Var ID: Integer;
Begin
  ID:=FrmPesquisar(Clientes);
  if Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]) then
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
  SetROnly(True);
end;

end.
