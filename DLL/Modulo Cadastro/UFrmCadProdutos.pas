unit UFrmCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB, ADODB, System.StrUtils,
  Vcl.Buttons, System.Types, UPesquisar, Datasnap.DBClient;

type
  TFrmCadProdutos = class(TForm)
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBImage1: TDBImage;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    JvImgBtn1: TJvImgBtn;
    Conexao: TADOConnection;
    ds_Tp_Fornecedores: TDataSource;
    Qry_Exec: TADOQuery;
    Tp_Produtos: TADOTable;
    Tp_Produtosid_item: TIntegerField;
    Tp_Produtoscod_barras: TStringField;
    Tp_Produtosid_tipo_item: TIntegerField;
    Tp_Produtosdescricao: TStringField;
    Tp_Produtosid_fornecedor: TIntegerField;
    Tp_Produtosid_categoria: TIntegerField;
    Tp_Produtostmp_execucao: TIntegerField;
    Tp_Produtostaxa_lucro: TFloatField;
    Tp_Produtoscusto_aquisicao: TFloatField;
    Tp_ProdutosCategoria: TStringField;
    ds_Tp_Produtos: TDataSource;
    Ta_Categoria: TADOTable;
    Ta_Categoriaid_categoria: TAutoIncField;
    Ta_Categoriaid_tipo: TIntegerField;
    Ta_Categoriadescricao: TStringField;
    ds_Ta_Categoria: TDataSource;
    Qp_Fornecedores: TADOQuery;
    Qp_Fornecedoresid_fornec: TIntegerField;
    Qp_Fornecedoresnome: TStringField;
    Qp_Fornecedorescnpj: TStringField;
    Qp_Fornecedoresdat_ult_atend: TDateTimeField;
    Qp_Fornecedoresinfo_geral: TMemoField;
    Qp_Fornecedoresfoto: TBlobField;
    Tp_Plan_STK: TADOTable;
    Tp_Plan_STKid_item: TIntegerField;
    Tp_Plan_STKqtd_min: TFloatField;
    Tp_Plan_STKqtd_max: TFloatField;
    Tp_Plan_STKtamanho_lote: TFloatField;
    Tp_Plan_STKstk_seguranca: TFloatField;
    Tp_Plan_STKleadtime: TIntegerField;
    Ds_Tp_Plan_STK: TDataSource;
    CDS_Produtos: TClientDataSet;
    CDS_Produtosid_item: TIntegerField;
    CDS_Produtoscod_barras: TStringField;
    CDS_Produtosid_tipo_item: TIntegerField;
    CDS_Produtosdescricao: TStringField;
    CDS_Produtosid_fornecedor: TIntegerField;
    CDS_Produtosid_categoria: TIntegerField;
    CDS_Produtostmp_execucao: TIntegerField;
    CDS_Produtostaxa_lucro: TFloatField;
    CDS_Produtoscusto_aquisicao: TFloatField;
    CDS_ProdutosCategoria: TStringField;
    CDS_Plan_STK: TClientDataSet;
    CDS_Plan_STKid_item: TIntegerField;
    CDS_Plan_STKqtd_min: TFloatField;
    CDS_Plan_STKqtd_max: TFloatField;
    CDS_Plan_STKtamanho_lote: TFloatField;
    CDS_Plan_STKstk_seguranca: TFloatField;
    CDS_Plan_STKleadtime: TIntegerField;
    procedure Tp_ProdutosAfterInsert(DataSet: TDataSet);
    procedure Tp_ProdutosAfterOpen(DataSet: TDataSet);
    procedure Qp_FornecedoresAfterClose(DataSet: TDataSet);
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
    procedure SetROnly(Val:Boolean);
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    Procedure Pesquisar;
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure Tp_ProdutosAfterClose(DataSet: TDataSet);
  private
  public
  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadProdutos: TFrmCadProdutos;
  Modo: String;

implementation

//function FrmPesquisarStr(Tipo:TTipo):String; External 'Pesquisar.dll';

procedure SetVisibComandosComNovo(Tool: TToolBar; Tipo:String);
  External 'Funcoes.dll';

{$R *.dfm}

Procedure TFrmCadProdutos.Conectar(User, Pass, Database: String);
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

Procedure TFrmCadProdutos.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Qp_Fornecedores.Cancel;
    Tp_Produtos.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmCadProdutos.Qp_FornecedoresAfterClose(DataSet: TDataSet);
begin
  Tp_Produtos.Close;
  Ta_Categoria.Close;
end;

procedure TFrmCadProdutos.Tp_ProdutosAfterClose(DataSet: TDataSet);
begin
  Ta_Categoria.Open;
  TP_Plan_STK.Close;
end;

procedure TFrmCadProdutos.Tp_ProdutosAfterInsert(DataSet: TDataSet);
begin
  Tp_Produtosid_tipo_item.Value:=2;
end;

procedure TFrmCadProdutos.Tp_ProdutosAfterOpen(DataSet: TDataSet);
begin
  Ta_Categoria.Open;
  TP_Plan_STK.Open;
end;

procedure TFrmCadProdutos.SetROnly(Val:Boolean);
Begin
  ds_Tp_Produtos.AutoEdit:=Not Val;
  DS_TP_Plan_STK.AutoEdit:=Not Val;
End;

function FrmPesquisarStr(Tipo:TTipo):String;
var DLL: THandle;
  func : function(Tipo:TTipo):String;
begin
  Result:='';
  DLL:=LoadLibrary('Pesquisar.dll');
  if (DLL <> 0) then begin
  func := GetProcAddress(DLL, 'FrmPesquisarStr');
  if (@func <> Nil) then
  Result:=func(Tipo);
  end;
  FreeLibrary(DLL);
end;

Procedure TFrmCadProdutos.Pesquisar;
Var Parent, ID: Integer;
  Res:String;
  Param: TStringDynArray;
Begin
  Res:=FrmPesquisarStr(Produtos);
  Param:=SplitString(Res, ';');
  Parent:=StrToInt(Param[0]);
  ID:=StrToInt(Param[1]);
  if Parent >= 0 then
  Begin
    if Not Qp_Fornecedores.Active then Qp_Fornecedores.Open;
    Qp_Fornecedores.Locate('id_fornec', Param[0], [loCaseInsensitive]);
    SetVisibComandosComNovo(ToolBar1, 'ABERTO');
  end;
  if ID >= 0 then
  Begin
    if Not Tp_Produtos.Active then Tp_Produtos.Open;
    Tp_Produtos.Locate('id_item', Param[1], [loCaseInsensitive]);
  End;
End;

procedure TFrmCadProdutos.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  SetROnly(True);
  try
    Tp_Produtos.Cancel;
    TP_Plan_STK.Cancel;
  Except
  end;
  ds_Tp_Produtos.DataSet:=Tp_Produtos;
  ds_TP_Plan_STK.DataSet:=TP_Plan_STK;
  SetVisibComandosComNovo(ToolBar1, 'ABERTO');
end;

procedure TFrmCadProdutos.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandosComNovo(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadProdutos.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  // *** Função desabilitada pois não faz sentido excluir cliente.
  // *** Desabilidata na procedure SetVisibComandosComNovo
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    SetVisibComandosComNovo(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadProdutos.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  Modo:='Novo';
  SetROnly(False);
  CDS_Produtos.Open;
  CDS_Produtos.Append;
  ds_Tp_Produtos.DataSet:=CDS_Produtos;

  CDS_Plan_STK.Open;
  CDS_Plan_STK.Append;
  DS_TP_Plan_STK.DataSet:=CDS_Plan_STK;

  DBEdit3.SetFocus;
  SetVisibComandosComNovo(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadProdutos.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadProdutos.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID:integer;
begin
  DBEdit12.SetFocus;
  ID:=-1;
  if Modo='Novo' then
  Begin
    Tp_Produtos.Open;
    if CDS_Produtos.State in [dsEdit, dsinsert] then
    Begin
      Tp_Produtos.Append;
      Tp_Produtoscod_barras.Value:=CDS_Produtoscod_barras.Value;
      Tp_Produtosdescricao.Value:=CDS_Produtosdescricao.Value;
      Tp_Produtosid_categoria.Value:=CDS_Produtosid_categoria.Value;
      Tp_Produtostmp_execucao.Value:=CDS_Produtostmp_execucao.Value;
      Tp_Produtostaxa_lucro.Value:=CDS_Produtostaxa_lucro.Value;
      Tp_Produtoscusto_aquisicao.Value:=CDS_Produtoscusto_aquisicao.Value;
      Tp_Produtos.Post;

      ID:=Tp_Produtosid_item.Value;
    End;

    if CDS_Plan_STK.State in [dsEdit, dsinsert] then
    Begin
      TP_Plan_STK.Append;
      TP_Plan_STKid_item.Value:=ID;
      TP_Plan_STKqtd_min.Value:=CDS_Plan_STKqtd_min.Value;
      TP_Plan_STKqtd_max.Value:=CDS_Plan_STKqtd_max.Value;
      TP_Plan_STKtamanho_lote.Value:=CDS_Plan_STKtamanho_lote.Value;
      TP_Plan_STKstk_seguranca.Value:=CDS_Plan_STKstk_seguranca.Value;
      TP_Plan_STKleadtime.Value:=CDS_Plan_STKleadtime.Value;
      TP_Plan_STK.Post;
      CDS_Plan_STK.Close;
    End;
  End
  else
  Begin
    if Tp_Produtos.State in [dsEdit, dsinsert] then
      Tp_Produtos.Post;
    if TP_Plan_STK.State in [dsEdit, dsinsert] then
      TP_Plan_STK.Post;
  End;
  ds_Tp_Produtos.DataSet:=Tp_Produtos;
  ds_TP_Plan_STK.DataSet:=TP_Plan_STK;
  SetROnly(True);
  Modo:='';
  SetVisibComandosComNovo(ToolBar1, 'ABERTO');
end;

procedure TFrmCadProdutos.FormShow(Sender: TObject);
begin
  SetVisibComandosComNovo(ToolBar1, 'PADRAO');
  Conectar('root', '', 'modular');
end;

procedure TFrmCadProdutos.JvImgBtn1Click(Sender: TObject);
begin
  Pesquisar;
  SetROnly(True);
end;

end.
