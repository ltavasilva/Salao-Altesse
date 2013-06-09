unit UFrmCadServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, UFuncoes, DB,
  Vcl.Buttons;

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
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
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
  FrmCadServicos: TFrmCadServicos;
  Modo: String;

implementation

{$R *.dfm}

uses UPesquisar, UDM_CadServicos;

procedure SetROnly(Val:Boolean);
Begin
  DM_CadServicos.ds_Tp_Servicos.AutoEdit:=Not Val;
End;

procedure TFrmCadServicos.ToolButton1Click(Sender: TObject);
var FPesquisar:TFrmPesquisar;
  Book: TBookmark;
Begin
  FPesquisar := TFrmPesquisar.Create(nil);
  FPesquisar.Tipo := Servicos;
  FPesquisar.ShowModal;
  FPesquisar.Free;
  if DM_CadServicos.Tp_Servicos.Active then
  Begin
    if DM_CadServicos.Tp_Servicosativo.Value = 0 then
      if Application.MessageBox('Este serviço está inativo!'+#13+
      'Deseja reativá-lo?', 'Serviço Inativo',
        MB_ICONQUESTION+MB_YesNo) = IDYes then
      Begin
        DM_CadServicos.Tp_Servicos.Edit;
        DM_CadServicos.Tp_Servicosativo.Value:=1;
        DM_CadServicos.Tp_Servicos.Post;
        DM_CadServicos.Tp_Servicos.Requery();
      End;

    SetVisibComandos(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

procedure TFrmCadServicos.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  with DM_CadServicos do
  Begin
    SetROnly(True);
    try
      Tp_Servicos.Cancel;
    Except
    end;
    ds_Tp_Servicos.DataSet:=Tp_Servicos;
  End;
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadServicos.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandos(ToolBar1, 'EDITANDO');
  if not DM_CadServicos.Qp_Fornecedores.Active then
    DM_CadServicos.Qp_Fornecedores.Open;
end;

procedure TFrmCadServicos.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    DM_CadServicos.Tp_Servicos.Edit;
    DM_CadServicos.Tp_Servicosativo.Value:=0;
    DM_CadServicos.Tp_Servicos.Post;
    DM_CadServicos.Tp_Servicos.Requery();
    SetVisibComandos(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadServicos.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  Modo:='Novo';
  with DM_CadServicos do
  Begin
    SetROnly(False);
    if not Qp_Fornecedores.Active then
      Qp_Fornecedores.Open;
    CDS_Servicos.Open;
    CDS_Servicos.Append;
    ds_Tp_Servicos.DataSet:=CDS_Servicos;

    DBEdit1.SetFocus;
  End;
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadServicos.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadServicos.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID, Ativo:integer;
begin
  DBEdit1.SetFocus;
  With DM_CadServicos do
  Begin
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

        ID:=Tp_Servicosid_item.Value;
      End;
    End
    else
    Begin
      if Tp_Servicos.State in [dsEdit, dsinsert] then
        Tp_Servicos.Post;
    End;
    ds_Tp_Servicos.DataSet:=Tp_Servicos;
  End;
  SetROnly(True);
  Modo:='';
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadServicos.FormShow(Sender: TObject);
begin
  SetVisibComandos(ToolBar1, 'PADRAO');
  with DM_CadServicos do
  Begin
    Conectar('root', '', 'modular');
  End;
end;

end.
