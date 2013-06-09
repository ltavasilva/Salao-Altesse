unit UFrmCadServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB, ADODB,
  Vcl.Buttons, UPesquisar, Datasnap.DBClient;

type
  TFrmCadServicos = class(TForm)
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
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    JvImgBtn1: TJvImgBtn;
    Conexao: TADOConnection;
    ds_Tp_Fornecedores: TDataSource;
    Qry_Exec: TADOQuery;
    Tp_Servicos: TADOTable;
    Tp_Servicosid_item: TIntegerField;
    Tp_Servicoscod_barras: TStringField;
    Tp_Servicosid_tipo_item: TIntegerField;
    Tp_Servicosdescricao: TStringField;
    Tp_Servicosid_fornecedor: TIntegerField;
    Tp_Servicosid_categoria: TIntegerField;
    Tp_Servicostmp_execucao: TIntegerField;
    Tp_Servicostaxa_lucro: TFloatField;
    Tp_Servicoscusto_aquisicao: TFloatField;
    Tp_ServicosCategoria: TStringField;
    Tp_Servicosativo: TIntegerField;
    ds_Tp_Servicos: TDataSource;
    Ta_Categoria: TADOTable;
    Ta_Categoriaid_categoria: TAutoIncField;
    Ta_Categoriaid_tipo: TIntegerField;
    Ta_Categoriadescricao: TStringField;
    ds_Ta_Categoria: TDataSource;
    CDS_Servicos: TClientDataSet;
    CDS_Servicosid_item: TIntegerField;
    CDS_Servicoscod_barras: TStringField;
    CDS_Servicosid_tipo_item: TIntegerField;
    CDS_Servicosdescricao: TStringField;
    CDS_Servicosid_fornecedor: TIntegerField;
    CDS_Servicosid_categoria: TIntegerField;
    CDS_Servicostmp_execucao: TIntegerField;
    CDS_Servicostaxa_lucro: TFloatField;
    CDS_Servicoscusto_aquisicao: TFloatField;
    CDS_ServicosCategoria: TStringField;
    Qp_Fornecedores: TADOQuery;
    Qp_Fornecedoresid_fornec: TIntegerField;
    Qp_Fornecedoresnome: TStringField;
    Qp_Fornecedorescnpj: TStringField;
    Qp_Fornecedoresdat_ult_atend: TDateTimeField;
    Qp_Fornecedoresinfo_geral: TMemoField;
    Qp_Fornecedoresfoto: TBlobField;
    LbSituacao: TLabel;
    procedure Tp_ServicosAfterInsert(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterClose(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterOpen(DataSet: TDataSet);
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
    Procedure Pesquisar;
    procedure SetROnly(Val:Boolean);
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure Tp_ServicosAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadServicos: TFrmCadServicos;
  Modo: String;

implementation

//function FrmPesquisar(Tipo:TTipo):Integer; External 'Pesquisar.dll';
procedure SetVisibComandos(Tool: TToolBar; Tipo:String); External 'funcoes.dll';

{$R *.dfm}

Procedure TFrmCadServicos.Conectar(User, Pass, Database: String);
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
End;

Procedure TFrmCadServicos.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Qp_Fornecedores.Cancel;
    Tp_Servicos.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmCadServicos.Qp_FornecedoresAfterClose(DataSet: TDataSet);
begin
  Tp_Servicos.Close;
  Ta_Categoria.Close;
end;

procedure TFrmCadServicos.Qp_FornecedoresAfterOpen(DataSet: TDataSet);
begin
  Tp_Servicos.Open;
  Ta_Categoria.Open;
end;

procedure TFrmCadServicos.Tp_ServicosAfterInsert(DataSet: TDataSet);
begin
  Tp_Servicosid_tipo_item.Value:=1;
  Tp_Servicosativo.Value:=1;
end;

procedure TFrmCadServicos.Tp_ServicosAfterScroll(DataSet: TDataSet);
begin
  if Tp_Servicosativo.Value = 0 then
    LbSituacao.Caption:='Serviço Inativo'
  else
    LbSituacao.Caption:='Serviço Ativo';
end;

procedure TFrmCadServicos.SetROnly(Val:Boolean);
Begin
  ds_Tp_Servicos.AutoEdit:=Not Val;
End;

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

Procedure TFrmCadServicos.Pesquisar;
Var ID: Integer;
Begin
  ID:=FrmPesquisar(Servicos);
  if ID >= 0 then
  Begin
    if Not Tp_Servicos.Active then Tp_Servicos.Open;
    Tp_Servicos.Locate('id_Item', ID, [loCaseInsensitive]);

    if Tp_Servicosativo.Value = 0 then
    Begin
      if Application.MessageBox('Este serviço está inativo!'+#13+
      'Deseja reativá-lo?', 'Serviço Inativo',
        MB_ICONQUESTION+MB_YesNo) = IDYes then
      Begin
        Tp_Servicos.Edit;
        Tp_Servicosativo.Value:=1;
        Tp_Servicos.Post;
        Tp_Servicos.Requery();
      End;
    End;
  End;
End;

procedure TFrmCadServicos.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  SetROnly(True);
  try
    Tp_Servicos.Cancel;
  Except
  end;
  ds_Tp_Servicos.DataSet:=Tp_Servicos;
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadServicos.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandos(ToolBar1, 'EDITANDO');
  if not Qp_Fornecedores.Active then
    Qp_Fornecedores.Open;
end;

procedure TFrmCadServicos.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Tp_Servicos.Edit;
    Tp_Servicosativo.Value:=0;
    Tp_Servicos.Post;
    Tp_Servicos.Requery();
    SetVisibComandos(ToolBar1, 'ABERTO');
    Tp_ServicosAfterScroll(Tp_Servicos);
  End;
end;

procedure TFrmCadServicos.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  Modo:='Novo';
  SetROnly(False);
  if not Qp_Fornecedores.Active then
    Qp_Fornecedores.Open;
  CDS_Servicos.Open;
  CDS_Servicos.Append;
  ds_Tp_Servicos.DataSet:=CDS_Servicos;

  DBEdit1.SetFocus;
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadServicos.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadServicos.Btn_Pessoal_SalvarClick(Sender: TObject);
begin
  DBEdit1.SetFocus;
  if Modo='Novo' then
  Begin
    Tp_Servicos.Open;
    if CDS_Servicos.State in [dsEdit, dsinsert] then
    Begin
      Tp_Servicos.Append;
      Tp_Servicoscod_barras.Value:=CDS_Servicoscod_barras.Value;
      Tp_Servicosdescricao.Value:=CDS_Servicosdescricao.Value;
      Tp_Servicosid_categoria.Value:=CDS_Servicosid_categoria.Value;
      Tp_Servicostmp_execucao.Value:=CDS_Servicostmp_execucao.Value;
      Tp_Servicostaxa_lucro.Value:=CDS_Servicostaxa_lucro.Value;
      Tp_Servicoscusto_aquisicao.Value:=CDS_Servicoscusto_aquisicao.Value;
      Tp_Servicos.Post;
    End;
  End
  else
  Begin
    if Tp_Servicos.State in [dsEdit, dsinsert] then
      Tp_Servicos.Post;
  End;
  ds_Tp_Servicos.DataSet:=Tp_Servicos;
  SetROnly(True);
  Modo:='';
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Desconectar;
end;

procedure TFrmCadServicos.FormShow(Sender: TObject);
begin
  SetVisibComandos(ToolBar1, 'PADRAO');
  Conectar('root', '', 'modular');
end;

procedure TFrmCadServicos.JvImgBtn1Click(Sender: TObject);
begin
  Pesquisar;
  SetVisibComandos(ToolBar1, 'ABERTO');
  SetROnly(True);
end;

end.
