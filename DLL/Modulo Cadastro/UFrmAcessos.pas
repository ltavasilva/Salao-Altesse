unit UFrmAcessos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, DB, ADODB, StrUtils, System.Types, Datasnap.DBClient,
  JvExStdCtrls, JvButton, JvCtrls, Vcl.ImgList;

type
  TFrmAcessos = class(TForm)
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
    GroupBox3: TGroupBox;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    LogSenAutom: TCheckBox;
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
    Conexao: TADOConnection;
    Qry_Exec: TADOQuery;
    Tp_Funcionarios: TADOTable;
    Tp_Funcionariosid_funcionario: TIntegerField;
    Tp_Funcionariosativo: TSmallintField;
    Tp_Funcionariosdat_ult_atend: TDateTimeField;
    Tp_Funcionariosfoto: TBlobField;
    Tp_Funcionariosinfo_geral: TMemoField;
    ds_Tp_Funcionarios: TDataSource;
    Tp_Acesso: TADOTable;
    Tp_Acessoid_funcionario: TIntegerField;
    Tp_Acessologin: TStringField;
    Tp_Acessosenha: TStringField;
    Tp_Acessoperfil: TStringField;
    ds_Tp_Acesso: TDataSource;
    ImageList1: TImageList;
    BtnGerar: TJvImgBtn;
    btnSalvar: TJvImgBtn;
    BtnCancelar: TJvImgBtn;
    CheckBox9: TCheckBox;
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterClose(DataSet: TDataSet);
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    ID:Integer;
    Modo:String;
  end;
  Function GeraLogin(Nome:String): String; External 'funcoes.dll';
  Function GeraSenha(CPF:String): String; External 'funcoes.dll';

var
  FrmAcessos: TFrmAcessos;

implementation

{$R *.dfm}

Procedure TFrmAcessos.Conectar(User, Pass, Database: String);
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

Procedure TFrmAcessos.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmAcessos.Tp_PessoalAfterClose(DataSet: TDataSet);
begin
  Tp_Funcionarios.Close;
  Tp_Acesso.Close;
end;

procedure TFrmAcessos.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Tp_Funcionarios.Open;
  Tp_Acesso.Open;
end;

procedure TFrmAcessos.btnSalvarClick(Sender: TObject);
Var Perfil: String;
begin
  if Not (Tp_Acesso.State in [dsEdit, dsinsert]) then
    Tp_Acesso.Edit;

  Perfil:='';

  if CheckBox1.Checked Then Perfil:=Perfil+IntToStr(CheckBox1.Tag)+';';
  if CheckBox2.Checked Then Perfil:=Perfil+IntToStr(CheckBox2.Tag)+';';
  if CheckBox3.Checked Then Perfil:=Perfil+IntToStr(CheckBox3.Tag)+';';
  if CheckBox4.Checked Then Perfil:=Perfil+IntToStr(CheckBox4.Tag)+';';
  if CheckBox5.Checked Then Perfil:=Perfil+IntToStr(CheckBox5.Tag)+';';
  if CheckBox6.Checked Then Perfil:=Perfil+IntToStr(CheckBox6.Tag)+';';
  if CheckBox7.Checked Then Perfil:=Perfil+IntToStr(CheckBox7.Tag)+';';
  if CheckBox8.Checked Then Perfil:=Perfil+IntToStr(CheckBox8.Tag)+';';
  if CheckBox9.Checked Then Perfil:=Perfil+IntToStr(CheckBox9.Tag)+';';

  Tp_Acessoperfil.AsString:=Perfil;
  Tp_Acesso.Post;
  Close;
end;

procedure TFrmAcessos.BtnCancelarClick(Sender: TObject);
begin
  if Tp_Acesso.State in [dsEdit, dsinsert] then
    Tp_Acesso.Cancel;
  Close;
end;

procedure TFrmAcessos.BtnGerarClick(Sender: TObject);
begin
  if LogSenAutom.Checked then
  Begin
    DBEdit6.Text:=GeraLogin(DBEdit2.Text);
    DBEdit7.Text:=GeraSenha(DBEdit5.Text);
  End;
end;

procedure TFrmAcessos.FormClose(Sender: TObject; var Action: TCloseAction);
Var I: Integer;
begin
  Tp_Acesso.Close;
  ds_Tp_Acesso.AutoEdit:=False;
  for I := 1 to 8 do
    With TCheckBox(FindComponent('CheckBox'+IntToStr(I))) do
      Checked:=False;
  Desconectar;
end;

procedure TFrmAcessos.FormShow(Sender: TObject);
Var Spl: TStringDynArray;
  I: Integer;
  AutoEdit:Boolean;
begin
  Tp_Pessoal.Open;
  Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
  AutoEdit:=Modo = 'Editar';
  ds_Tp_Acesso.AutoEdit:=AutoEdit;
  ChAtivo.Enabled:=AutoEdit;
  btnSalvar.Enabled:=AutoEdit;
  BtnGerar.Enabled:=AutoEdit;
  BtnCancelar.Enabled:=AutoEdit;
  DBEdit6.Enabled:=AutoEdit;
  DBEdit7.Enabled:=AutoEdit;
  LogSenAutom.Enabled:=AutoEdit;
  GroupBox1.Enabled:=AutoEdit;
  Spl:=SplitString(Tp_Acessoperfil.AsString, ';');

  for I := 1 to 9 do
    With TCheckBox(FindComponent('CheckBox'+IntToStr(I))) do
      Checked:=False;

  for I := 0 to Length(Spl) - 2 do
  Begin
    With TCheckBox(FindComponent('CheckBox'+Spl[I])) do
      Checked:=True;
  End;
end;

end.
