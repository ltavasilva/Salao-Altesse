unit UFrmCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB, ADODB,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, JvImageList, JvExControls,
  JvTransparentButton, UPesquisar, UFrmAcessos,
  Datasnap.DBClient;

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
    JvImgBtn1: TJvImgBtn;
    ImageList1: TImageList;
    BtnAcessos: TJvImgBtn;
    Conexao: TADOConnection;
    Tp_Pessoal: TADOTable;
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
    ds_Tp_Pessoal: TDataSource;
    Tp_Funcionarios: TADOTable;
    Tp_Funcionariosid_funcionario: TIntegerField;
    Tp_Funcionariosativo: TSmallintField;
    Tp_Funcionariosdat_ult_atend: TDateTimeField;
    Tp_Funcionariosfoto: TBlobField;
    Tp_Funcionariosinfo_geral: TMemoField;
    ds_Tp_Funcionarios: TDataSource;
    QServicos: TADOQuery;
    QServicosid_funcionario: TIntegerField;
    QServicosid_item: TAutoIncField;
    QServicosdescricao: TStringField;
    QServicoscomissao: TFloatField;
    ds_CDS_Servicos: TDataSource;
    CDS_Servicos: TClientDataSet;
    CDS_ServicosSelec: TBooleanField;
    CDS_Servicosid_item: TIntegerField;
    CDS_Servicosdescricao: TStringField;
    CDS_ServicosComissao: TFloatField;
    Qry_Exec: TADOQuery;
    Tbl_Acesso: TADOTable;
    Tbl_Acessoid_funcionario: TIntegerField;
    Tbl_Acessologin: TStringField;
    Tbl_Acessosenha: TStringField;
    Tbl_Acessoperfil: TStringField;
    ds_Tbl_Acesso: TDataSource;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
    procedure Tp_FuncionariosAfterScroll(DataSet: TDataSet);
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
    procedure SetROnly(Val:Boolean);
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    Procedure Pesquisar(Tipo:TTipo);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAcessosClick(Sender: TObject);
  private
  public
  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadFuncionarios: TFrmCadFuncionarios;
  FrmAcessos: TFrmAcessos;
  EditCEP: Boolean;
  Modo: String;

implementation

//function FrmPesquisar(Tipo:TTipo):Integer; External 'Pesquisar.dll';

procedure SetVisibComandos(Tool: TToolBar; Tipo:String);
  External 'Funcoes.dll';

{$R *.dfm}

Procedure TFrmCadFuncionarios.Conectar(User, Pass, Database: String);
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

Procedure TFrmCadFuncionarios.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmCadFuncionarios.Tp_FuncionariosAfterScroll(DataSet: TDataSet);
begin
  CDS_Servicos.Open;
  CDS_Servicos.EmptyDataSet;
  QServicos.Close;
  QServicos.Parameters.ParamByName('PFunc').Value:=
    Tp_Funcionariosid_funcionario.Value;
  QServicos.Open;
  QServicos.First;
  while Not QServicos.Eof do
  Begin
    CDS_Servicos.Append;
    CDS_Servicosid_item.Value:=QServicosid_item.Value;
    CDS_ServicosSelec.Value:=Not QServicoscomissao.IsNull;
    CDS_Servicosdescricao.Value:=QServicosdescricao.Value;
    CDS_ServicosComissao.Value:=QServicoscomissao.Value;
    CDS_Servicos.Post;
    QServicos.Next;
  End;
  CDS_Servicos.First;
end;

procedure TFrmCadFuncionarios.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Funcionarios.Close;
  CDS_Servicos.EmptyDataSet;
  BtnAcessos.Enabled:=False;
end;

procedure TFrmCadFuncionarios.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Funcionarios.Open;
  BtnAcessos.Enabled:=True;
end;

procedure TFrmCadFuncionarios.SetROnly(Val:Boolean);
Begin
  ds_Tp_Funcionarios.AutoEdit:=Not Val;
  JvDBGrid1.ReadOnly := Val;
  JvDBGrid1.Enabled:= Not Val;
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

Procedure TFrmCadFuncionarios.Pesquisar(Tipo:TTipo);
Var ID: Integer;
Begin
  ID:=FrmPesquisar(Tipo);
  if ID >=0 then
  Begin
    if Not Tp_Pessoal.Active then Tp_Pessoal.Open;
    Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
  End;
End;

procedure TFrmCadFuncionarios.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  SetROnly(True);
  try
    Tp_Funcionarios.Cancel;
  Except
  end;
  //ds_Tp_Funcionarios.DataSet:=Tp_Funcionarios;
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
Begin
  Pesquisar(Pessoal);
  SetVisibComandos(ToolBar1, 'EDITANDO');
  SetROnly(False);
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFuncionarios.Btn_Pessoal_SalvarClick(Sender: TObject);
begin
  if Tp_Funcionarios.State in [dsEdit, dsinsert] then
    Tp_Funcionarios.Post;

  CDS_Servicos.First;
  while Not CDS_Servicos.Eof do
  Begin
    if CDS_ServicosSelec.Value then
    Begin
      Qry_Exec.SQL.Text:='INSERT INTO tbl_comissao (id_funcionario, id_item, '+
        'comissao) VALUES('+
        Tp_Funcionariosid_funcionario.AsString + ', '+
        CDS_Servicosid_item.AsString + ', '+
        CDS_ServicosComissao.AsString + ') ON DUPLICATE KEY '+
        'UPDATE Comissao = ' + CDS_ServicosComissao.AsString + '; ' +#13;
      Qry_Exec.ExecSQL;
    End;
    CDS_Servicos.Next;
  End;

  SetROnly(True);
  Modo:='';
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadFuncionarios.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadFuncionarios.FormCreate(Sender: TObject);
begin
  FrmAcessos:=TFrmAcessos.Create(Application);
end;

procedure TFrmCadFuncionarios.FormShow(Sender: TObject);
begin
  SetVisibComandos(ToolBar1, 'PADRAO');
  Conectar('root', '', 'modular');
end;

procedure TFrmCadFuncionarios.JvDBGrid1CellClick(Column: TColumn);
begin
  if (Column.FieldName = 'Selec') and not (JvDBGrid1.ReadOnly) then
  Begin
    CDS_Servicos.Edit;
    if CDS_ServicosSelec.Value then
      CDS_ServicosSelec.Value := False
    else CDS_ServicosSelec.Value := True;
    CDS_Servicos.Post;
  End;
end;

procedure TFrmCadFuncionarios.JvImgBtn1Click(Sender: TObject);
Begin
  Pesquisar(Funcionarios);
  SetVisibComandos(ToolBar1, 'ABERTO');
  SetROnly(True);
End;

procedure TFrmCadFuncionarios.BtnAcessosClick(Sender: TObject);
begin
  FrmAcessos.Modo:=Modo;
  FrmAcessos.ID:=Tp_Pessoalid_pessoal.Value;
  FrmAcessos.ShowModal;
end;

end.
