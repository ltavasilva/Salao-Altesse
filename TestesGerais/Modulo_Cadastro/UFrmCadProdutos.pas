unit UFrmCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, UFuncoes, DB,
  Vcl.Buttons;

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
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
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
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
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

{$R *.dfm}

uses UPesquisar, UDM_CadProdutos;

procedure SetROnly(Val:Boolean);
Begin
  DM_CadProdutos.ds_Tp_Produtos.AutoEdit:=Not Val;
  DM_CadProdutos.DS_TP_Plan_STK.AutoEdit:=Not Val;
End;

procedure TFrmCadProdutos.ToolButton1Click(Sender: TObject);
var FPesquisar:TFrmPesquisar;
  Book: TBookmark;
Begin
  FPesquisar := TFrmPesquisar.Create(nil);
  FPesquisar.Tipo := Produtos;
  FPesquisar.ShowModal;
  FPesquisar.Free;
  if DM_CadProdutos.Tp_Produtos.Active then
  Begin
    SetVisibComandosComNovo(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

procedure TFrmCadProdutos.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  with DM_CadProdutos do
  Begin
    SetROnly(True);
    try
      Tp_Produtos.Cancel;
      TP_Plan_STK.Cancel;
    Except
    end;
    ds_Tp_Produtos.DataSet:=Tp_Produtos;
    ds_TP_Plan_STK.DataSet:=TP_Plan_STK;
  End;
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
  with DM_CadProdutos do
  Begin
    SetROnly(False);
    CDS_Produtos.Open;
    CDS_Produtos.Append;
    ds_Tp_Produtos.DataSet:=CDS_Produtos;

    CDS_Plan_STK.Open;
    CDS_Plan_STK.Append;
    DS_TP_Plan_STK.DataSet:=CDS_Plan_STK;

    DBEdit3.SetFocus;
  End;
  SetVisibComandosComNovo(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadProdutos.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadProdutos.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID, Ativo:integer;
begin
  DBEdit12.SetFocus;
  With DM_CadProdutos do
  Begin
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
  End;
  SetROnly(True);
  Modo:='';
  SetVisibComandosComNovo(ToolBar1, 'ABERTO');
end;

procedure TFrmCadProdutos.FormShow(Sender: TObject);
begin
  SetVisibComandosComNovo(ToolBar1, 'PADRAO');
  with DM_CadProdutos do
  Begin
    Conectar('root', '', 'modular');
  End;
end;

end.
