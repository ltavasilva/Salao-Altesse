unit UFrmCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB, ADODB,
  UDM_CadClientes, UPesquisar;

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
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
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
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
  private
  public
    DM_CadClientes: TDM_CadClientes;
  end;

Procedure FrmPesquisar(Query: TADOQuery; Tabela: TADOTable;
  DataSource: TDataSource; Tipo:TTipo); External 'Pesquisar.dll';

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadClientes: TFrmCadClientes;
  EditCEP: Boolean;
  Modo: String;

implementation

procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String);
  External 'Funcoes.dll';

{$R *.dfm}

procedure SetROnly(Val:Boolean);
Begin
  DM_CadClientes.ds_Tp_Clientes.AutoEdit:=Not Val;
End;

procedure TFrmCadClientes.ToolButton1Click(Sender: TObject);
Begin
  FrmPesquisar(DM_CadClientes.Qry_Busca, DM_CadClientes.Tp_Pessoal,
  DM_CadClientes.ds_Tp_Clientes, Clientes);
  if DM_CadClientes.Tp_Pessoal.Active then
  Begin
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

procedure TFrmCadClientes.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  with DM_CadClientes do
  Begin
    SetROnly(True);
    try
      Tp_Clientes.Cancel;
    Except
    end;
    //ds_Tp_Clientes.DataSet:=Tp_Clientes;
  End;
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
  with DM_CadClientes do
  Begin
    SetROnly(False);

    {CDS_Clientes.Open;
    CDS_Clientes.Append;
    ds_Tp_Clientes.DataSet:=CDS_Clientes; }

    DBMemo1.SetFocus;
  End;
  SetVisibComandosSemExclusao(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadClientes.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadClientes.Btn_Pessoal_SalvarClick(Sender: TObject);
begin
  if DM_CadClientes.Tp_Pessoal.State in [dsEdit, dsinsert] then
    DM_CadClientes.Tp_Pessoal.Post;
  SetROnly(True);
  Modo:='';
  SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
end;

procedure TFrmCadClientes.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=DM_CadClientes.Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadClientes.FormShow(Sender: TObject);
begin
  SetVisibComandosSemExclusao(ToolBar1, 'PADRAO');
  with DM_CadClientes do
  Begin
    Conectar('root', '', 'modular');
  End;
end;

end.
