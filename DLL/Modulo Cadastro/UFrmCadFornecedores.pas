unit UFrmCadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB,
  ADODB, UPesquisar;

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
    JvImgBtn1: TJvImgBtn;
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
    Qry_Exec: TADOQuery;
    Tp_Fornecedores: TADOTable;
    Tp_Fornecedoresid_fornec: TIntegerField;
    Tp_Fornecedorescnpj: TStringField;
    Tp_Fornecedoresativo: TSmallintField;
    Tp_Fornecedoresdat_ult_atend: TDateTimeField;
    Tp_Fornecedoresfoto: TBlobField;
    Tp_Fornecedoresinfo_geral: TMemoField;
    ds_Tp_Fornecedores: TDataSource;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

//function FrmPesquisar(Tipo:TTipo):Integer; External 'Pesquisar.dll';

procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String);
  External 'Funcoes.dll';

{$R *.dfm}

Procedure TFrmCadFornecedores.Conectar(User, Pass, Database: String);
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

Procedure TFrmCadFornecedores.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Tp_Fornecedores.Cancel;
    Tp_Pessoal.Cancel;
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmCadFornecedores.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Fornecedores.Close;
end;

procedure TFrmCadFornecedores.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Fornecedores.Open;
end;

procedure TFrmCadFornecedores.SetROnly(Val:Boolean);
Begin
  ds_Tp_Fornecedores.AutoEdit:=Not Val;
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

procedure TFrmCadFornecedores.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  SetROnly(True);
  try
    Tp_Fornecedores.Cancel;
  Except
  end;
  //ds_Tp_Fornecedores.DataSet:=Tp_Fornecedores;
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
  SetROnly(False);

  {CDS_Fornecedores.Open;
  CDS_Fornecedores.Append;
  ds_Tp_Fornecedores.DataSet:=CDS_Fornecedores; }

  DBMemo1.SetFocus;
  SetVisibComandosSemExclusao(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadFornecedores.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornecedores.Btn_Pessoal_SalvarClick(Sender: TObject);
begin
  if Tp_Pessoal.State in [dsEdit, dsinsert] then
    Tp_Pessoal.Post;
  SetROnly(True);
  Modo:='';
  SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
end;

procedure TFrmCadFornecedores.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Desconectar;
end;

procedure TFrmCadFornecedores.FormShow(Sender: TObject);
begin
  SetVisibComandosSemExclusao(ToolBar1, 'PADRAO');
  Conectar('root', '', 'modular');
end;

procedure TFrmCadFornecedores.JvImgBtn1Click(Sender: TObject);
Var ID: Integer;
Begin
  ID:=FrmPesquisar(Fornecedores);
  if ID >=0 Then
  Begin
    if Not Tp_Pessoal.Active then Tp_Pessoal.Open;
    Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
    SetVisibComandosSemExclusao(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

end.
