unit UFrmCadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, UFuncoes, DB;

type
  TFrmCadFornecedores = class(TForm)
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
    Label8: TLabel;
    DBEdit7: TDBEdit;
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

  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadFornecedores: TFrmCadFornecedores;
  EditCEP: Boolean;
  Modo: String;

implementation

{$R *.dfm}

uses UPesquisar, UDM_CadFornecedores;

procedure SetROnly(Val:Boolean);
Begin
  DM_CadFornecedores.ds_Tp_Fornecedores.AutoEdit:=Not Val;
End;

procedure TFrmCadFornecedores.ToolButton1Click(Sender: TObject);
var FPesquisar:TFrmPesquisar;
Begin
  FPesquisar := TFrmPesquisar.Create(nil);
  FPesquisar.Tipo := Fornecedores;
  FPesquisar.ShowModal;
  FPesquisar.Free;
  if DM_CadFornecedores.Tp_Pessoal.Active then
  Begin
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

procedure TFrmCadFornecedores.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  with DM_CadFornecedores do
  Begin
    SetROnly(True);
    try
      Tp_Fornecedores.Cancel;
    Except
    end;
    //ds_Tp_Fornecedores.DataSet:=Tp_Fornecedores;
  End;
  SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
end;

procedure TFrmCadFornecedores.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandosSemExclusao(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadFornecedores.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  // *** Função desabilitada pois não faz sentido excluir cliente.
  // *** Desabilidata na procedure SetVisibComandosSemExclusao
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadFornecedores.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  // *** Função desabilitada pois não não precisa dar o comando Append.
  // *** Desabilidata na procedure SetVisibComandosSemExclusao
  Modo:='Novo';
  with DM_CadFornecedores do
  Begin
    SetROnly(False);

    {CDS_Fornecedores.Open;
    CDS_Fornecedores.Append;
    ds_Tp_Fornecedores.DataSet:=CDS_Fornecedores; }

    DBMemo1.SetFocus;
  End;
  SetVisibComandosSemExclusao(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadFornecedores.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornecedores.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID, Ativo:integer;
begin
  if DM_CadFornecedores.Tp_Pessoal.State in [dsEdit, dsinsert] then
    DM_CadFornecedores.Tp_Pessoal.Post;
  SetROnly(True);
  Modo:='';
  SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
end;

procedure TFrmCadFornecedores.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=DM_CadFornecedores.Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadFornecedores.FormShow(Sender: TObject);
begin
  SetVisibComandosSemExclusao(ToolBar1, 'PADRAO');
  with DM_CadFornecedores do
  Begin
    Conectar('root', '', 'modular');
  End;
end;

end.
