unit UFrmAcessos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, DB, StrUtils, System.Types;

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
    BitBtn1: TBitBtn;
    CheckBox9: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcessos: TFrmAcessos;

implementation

{$R *.dfm}

uses UDM_CadFuncionarios, UFuncoes;

procedure TFrmAcessos.BitBtn1Click(Sender: TObject);
Var I: Integer;
  Perfil: String;
  Ch: TCheckBox;
begin
  With DM_CadFuncionarios do
  Begin
    if Not (Tbl_Acesso.State in [dsEdit, dsinsert]) then
      Tbl_Acesso.Edit;

    Perfil:='';

    if CheckBox1.Checked Then Perfil:=Perfil+IntToStr(CheckBox1.Tag)+';';
    if CheckBox2.Checked Then Perfil:=Perfil+IntToStr(CheckBox2.Tag)+';';
    if CheckBox3.Checked Then Perfil:=Perfil+IntToStr(CheckBox3.Tag)+';';
    if CheckBox4.Checked Then Perfil:=Perfil+IntToStr(CheckBox4.Tag)+';';
    if CheckBox5.Checked Then Perfil:=Perfil+IntToStr(CheckBox5.Tag)+';';
    if CheckBox6.Checked Then Perfil:=Perfil+IntToStr(CheckBox6.Tag)+';';
    if CheckBox7.Checked Then Perfil:=Perfil+IntToStr(CheckBox7.Tag)+';';
    if CheckBox8.Checked Then Perfil:=Perfil+IntToStr(CheckBox8.Tag)+';';

    Tbl_Acessoperfil.Value:=Perfil;
    Tbl_Acesso.Post;
  End;
  Close;
end;

procedure TFrmAcessos.BitBtn2Click(Sender: TObject);
begin
  if DM_CadFuncionarios.Tbl_Acesso.State in [dsEdit, dsinsert] then
      DM_CadFuncionarios.Tbl_Acesso.Cancel;
  Close;
end;

procedure TFrmAcessos.BitBtn3Click(Sender: TObject);
begin
  if CheckBox9.Checked then
  Begin
    DBEdit6.Text:=GeraLogin(DBEdit2.Text);
    DBEdit7.Text:=GeraSenha(DBEdit5.Text);
  End;
end;

procedure TFrmAcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_CadFuncionarios.Tbl_Acesso.Close;
  DM_CadFuncionarios.ds_Tbl_Acesso.AutoEdit:=False;
end;

procedure TFrmAcessos.FormShow(Sender: TObject);
Var Spl: TStringDynArray;
  I: Integer;
begin
  With DM_CadFuncionarios do
  Begin
    Tbl_Acesso.Open;
    ds_Tbl_Acesso.AutoEdit:=True;
    Spl:=SplitString(Tbl_Acessoperfil.Value, ';');
  End;

  for I := 1 to 8 do
    With TCheckBox(FindComponent('CheckBox'+IntToStr(I))) do
      Checked:=False;

  for I := 0 to Length(Spl) - 2 do
  Begin
    With TCheckBox(FindComponent('CheckBox'+Spl[I])) do
      Checked:=True;
  End;
end;

end.
