unit UFrmCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, UFuncoes, DB,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, JvImageList, JvExControls,
  JvTransparentButton;

type
  TFrmCadFuncionarios = class(TForm)
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
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBImage1: TDBImage;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    JvDBGrid1: TJvDBGrid;
    BitBtn1: TBitBtn;
    JvImgBtn1: TJvImgBtn;
    ImageList1: TImageList;
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
  private
  public

  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadFuncionarios: TFrmCadFuncionarios;
  EditCEP: Boolean;
  Modo: String;

implementation

{$R *.dfm}

uses UPesquisar, UDM_CadFuncionarios, UFrmAcessos;

procedure SetROnly(Val:Boolean);
Begin
  DM_CadFuncionarios.ds_Tp_Funcionarios.AutoEdit:=Not Val;
  FrmCadFuncionarios.JvDBGrid1.ReadOnly := Val;
  //FrmCadFuncionarios.JvDBGrid1.Enabled:= Not Val;
End;

procedure TFrmCadFuncionarios.BitBtn1Click(Sender: TObject);
begin
  FrmAcessos.ShowModal;
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  with DM_CadFuncionarios do
  Begin
    SetROnly(True);
    try
      Tp_Funcionarios.Cancel;
    Except
    end;
    //ds_Tp_Funcionarios.DataSet:=Tp_Funcionarios;
  End;
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  // *** Função desabilitada pois não faz sentido excluir cliente.
  // *** Desabilidata na procedure SetVisibComandos
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    SetVisibComandos(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_NovoClick(Sender: TObject);
var FPesquisar:TFrmPesquisar;
Begin
  FPesquisar := TFrmPesquisar.Create(nil);
  FPesquisar.Pessoal:=True;
  FPesquisar.Tipo := Funcionarios;
  FPesquisar.ShowModal;
  FPesquisar.Free;
  if DM_CadFuncionarios.Tp_Pessoal.Active then
  Begin
    SetVisibComandos(ToolBar1, 'EDITANDO');
    SetROnly(False);
  End;
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID, Ativo:integer;
begin
  With DM_CadFuncionarios do
  Begin
    if Tp_Funcionarios.State in [dsEdit, dsinsert] then
      Tp_Funcionarios.Post;

    SQL:='';
    CDS_Servicos.First;
    while Not CDS_Servicos.Eof do
    Begin
      if CDS_ServicosSelec.Value then
      Begin
        Qry_Exec.SQL.Text:='INSERT INTO modular.tbl_comissao (id_funcionario, id_item, '+
          'comissao) VALUES('+
          Tp_Funcionariosid_funcionario.AsString + ', '+
          CDS_Servicosid_item.AsString + ', '+
          CDS_ServicosComissao.AsString + ') ON DUPLICATE KEY '+
          'UPDATE Comissao = ' + CDS_ServicosComissao.AsString + '; ' +#13;
        Qry_Exec.ExecSQL;
      End;
      CDS_Servicos.Next;
    End;
  End;

  SetROnly(True);
  Modo:='';
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadFuncionarios.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=DM_CadFuncionarios.Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadFuncionarios.FormShow(Sender: TObject);
begin
  SetVisibComandos(ToolBar1, 'PADRAO');
  with DM_CadFuncionarios do
  Begin
    Conectar('root', '', 'modular');
  End;
end;

procedure TFrmCadFuncionarios.JvDBGrid1CellClick(Column: TColumn);
begin
  if (Column.FieldName = 'Selec') and not (JvDBGrid1.ReadOnly) then
  Begin
    DM_CadFuncionarios.CDS_Servicos.Edit;
    if DM_CadFuncionarios.CDS_ServicosSelec.Value then
      DM_CadFuncionarios.CDS_ServicosSelec.Value := False
    else DM_CadFuncionarios.CDS_ServicosSelec.Value := True;
    DM_CadFuncionarios.CDS_Servicos.Post;
  End;
end;

procedure TFrmCadFuncionarios.JvImgBtn1Click(Sender: TObject);
var FPesquisar:TFrmPesquisar;
Begin
  FPesquisar := TFrmPesquisar.Create(nil);
  FPesquisar.Tipo := Funcionarios;
  FPesquisar.ShowModal;
  FPesquisar.Free;
  if DM_CadFuncionarios.Tp_Pessoal.Active then
  Begin
    SetVisibComandos(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

end.
