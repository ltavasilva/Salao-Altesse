unit UFrmCadPessoal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB,
  Vcl.Buttons;

type
  TFrmCadPessoal = class(TForm)
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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Endereco: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Enderecos: TGroupBox;
    DBGridEnderecos: TDBGrid;
    Telefones: TGroupBox;
    DBGridTel: TDBGrid;
    Emails: TGroupBox;
    DBGridEmail: TDBGrid;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ChAtivo: TCheckBox;
    ToolBarEnderecos: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBGridEnderecosColEnter(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure ChAtivoClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    FMultiEnde: Boolean;
    procedure SetMultiEnde(Value: Boolean = False);
  public
    property MultiEndereco: Boolean read FMultiEnde write SetMultiEnde;
  end;

Const Min: Integer = 23;
  Max: Integer = 205;
  Incremento: Integer = 5;
var
  FrmCadPessoal: TFrmCadPessoal;
  EditCEP: Boolean;
  Modo: String;

implementation

{$R *.dfm}

uses UPesquisar, UDM_CadPessoal, UFuncoes, UFrmCEP;

procedure TFrmCadPessoal.SetMultiEnde(Value: Boolean = False);
  begin if FMultiEnde <> Value then FMultiEnde := Value; end;

procedure SetROnly(Val:Boolean);
Begin
  with DM_CadPessoal do
  Begin
    ds_Tp_Pessoal.AutoEdit:=Not Val;
    ds_Tp_Endereco.AutoEdit:=Not Val;
    ds_Tp_Email.AutoEdit:=Not Val;
    ds_Tp_Tel.AutoEdit:=Not Val;
  End;
  with FrmCadPessoal do
  Begin
    ChAtivo.Enabled:=Not Val;
    //DBGridEnderecos.ReadOnly:=Val;
    DBGridTel.ReadOnly:=Val;
    DBGridEmail.ReadOnly:=Val;
    ToolBarEnderecos.Enabled:=Not Val;
  End;
End;

procedure TFrmCadPessoal.ToolButton1Click(Sender: TObject);
var FPesquisar:TFrmPesquisar;
Begin
  FPesquisar := TFrmPesquisar.Create(nil);
  FPesquisar.Tipo := Pessoas;
  FPesquisar.ShowModal;
  FPesquisar.Free;
  if DM_CadPessoal.Tp_Pessoal.Active then
  Begin
    SetVisibComandos(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

procedure TFrmCadPessoal.ToolButton2Click(Sender: TObject);
begin
  if Modo='Novo' then
    DM_CadPessoal.CDS_Endereco.Append
  else
    DM_CadPessoal.TP_Endereco.Append;
  FrmCep.Modo:=Modo;
  FrmCep.ShowModal;
end;

procedure TFrmCadPessoal.ToolButton3Click(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    DM_CadPessoal.Tp_Endereco.Delete;
  End;
end;

procedure TFrmCadPessoal.ToolButton5Click(Sender: TObject);
begin
  DM_CadPessoal.Tp_Endereco.Edit;
  FrmCep.ShowModal;
end;

Procedure DefineTop();
Begin
  With FrmCadPessoal do
  Begin
    if MultiEndereco then
      Telefones.Top:=Enderecos.Top + Enderecos.Height + 6
    else
      Telefones.Top:=Endereco.Top + Endereco.Height + 6;
    Image2.Top:=Telefones.Top;

    Emails.Top:=Telefones.Top + Telefones.Height + 6;
    Image3.Top:=Emails.Top;
  End;
End;

procedure TFrmCadPessoal.ChAtivoClick(Sender: TObject);
Var Ativo: Integer;
begin
  if (Modo = 'Novo') or (Modo = 'Editar') then
  Begin
    Ativo:=0;
    if ChAtivo.Checked then Ativo := 1;

    if Modo = 'Editar' then
    Begin
      if not (DM_CadPessoal.Tp_Pessoal.State in [dsEdit, dsinsert]) then
        DM_CadPessoal.Tp_Pessoal.Edit;
      DM_CadPessoal.Tp_Pessoalativo.Value:= Ativo;
    End
    else
    Begin
      if not (DM_CadPessoal.CDS_Pessoal.State in [dsEdit, dsinsert]) then
        DM_CadPessoal.CDS_Pessoal.Edit;
      DM_CadPessoal.CDS_Pessoalativo.Value:= Ativo;
    End;
  End;
end;

procedure TFrmCadPessoal.Btn_Pessoal_CancelarClick(Sender: TObject);
begin
  Modo:='';
  with DM_CadPessoal do
  Begin
    SetROnly(True);
    CDS_Pessoal.Cancel;
    CDS_Pessoal.Close;
    ds_Tp_Pessoal.DataSet:=Tp_Pessoal;

    CDS_Endereco.Cancel;
    CDS_Endereco.Close;
    ds_Tp_Endereco.DataSet:=Tp_Endereco;

    CDS_Tel.Cancel;
    CDS_Tel.Close;
    ds_Tp_Tel.DataSet:=Tp_Tel;

    CDS_Email.Cancel;
    CDS_Email.Close;
    ds_Tp_Email.DataSet:=Tp_Email;
  End;
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadPessoal.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadPessoal.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    DM_CadPessoal.Tp_Pessoal.Edit;
    DM_CadPessoal.Tp_Pessoalativo.Value:=0;
    DM_CadPessoal.Tp_Pessoal.Post;
    SetVisibComandos(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadPessoal.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  ChAtivo.Checked:=True;
  Modo:='Novo';
  with DM_CadPessoal do
  Begin
    SetROnly(False);
    CDS_Pessoal.Open;
    CDS_Pessoal.Append;
    ds_Tp_Pessoal.DataSet:=CDS_Pessoal;

    CDS_Endereco.Open;
    CDS_Endereco.Append;
    ds_Tp_Endereco.DataSet:=CDS_Endereco;

    CDS_Tel.Open;
    CDS_Tel.Append;
    ds_Tp_Tel.DataSet:=CDS_Tel;

    CDS_Email.Open;
    CDS_Email.Append;
    ds_Tp_Email.DataSet:=CDS_Email;
    DBEdit2.SetFocus;
  End;
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadPessoal.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPessoal.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID, Ativo:integer;
begin
  Ativo:=0;
  if ChAtivo.Checked then Ativo := 1;
  With DM_CadPessoal do
  Begin
    if Modo='Novo' then
    Begin
      Tp_Pessoal.Open;
      if CDS_Pessoal.State in [dsEdit, dsinsert] then
      Begin
        CDS_Pessoal.Post;
        Tp_Pessoal.Append;
        Tp_Pessoalnome.Value:=CDS_Pessoalnome.Value;
        if Not CDS_Pessoaldata_nasci.IsNull Then
          Tp_Pessoaldata_nasci.Value:=CDS_Pessoaldata_nasci.Value;
        if Not CDS_Pessoaldata_nasci.IsNull Then
          Tp_Pessoalcpf.Value:=CDS_Pessoalrg.Value;
        if Not CDS_Pessoaldata_nasci.IsNull Then
          Tp_Pessoalrg.Value:=CDS_Pessoalcpf.Value;
        Tp_Pessoaldata_incl.Value:=Now;
        Tp_Pessoalresp_incl.Value:=1;
        Tp_Pessoaldata_modif.Value:=Now;
        Tp_Pessoalresp_modif.Value:=1;
        Tp_Pessoalativo.Value:=Ativo;
        Tp_Pessoal.Post;
        ID:=Tp_Pessoalid_pessoal.Value;

        CDS_Pessoal.Delete;
      End;

      if CDS_Endereco.State in [dsEdit, dsinsert] then
      Begin
        CDS_Endereco.First;
        while Not CDS_Endereco.Eof do
        Begin
          Tp_Endereco.Append;
          Tp_Enderecocep.Value:=CDS_Enderecocep.Value;
          Tp_Enderecologradouro.Value:=CDS_Enderecologradouro.Value;
          Tp_Enderecobairro.Value:=CDS_Enderecobairro.Value;
          Tp_Enderecocidade.Value:=CDS_Enderecocidade.Value;
          Tp_Enderecouf.Value:=CDS_Enderecouf.Value;
          Tp_Endereconum.Value:=CDS_Endereconum.Value;
          Tp_Enderecoid_tipo.Value:=CDS_Enderecoid_tipo.Value;
          Tp_Enderecoid_pessoal.Value:=ID;
          Tp_Endereco.Post;
          CDS_Endereco.Next;
        End;

        CDS_Endereco.First;
        while Not CDS_Endereco.Eof do CDS_Endereco.Delete;
        CDS_Endereco.Close;
      End;

      if CDS_Tel.State in [dsEdit, dsinsert] then
      Begin
        CDS_Tel.First;
        while Not CDS_Tel.Eof do
        Begin
          Tp_Tel.Append;
          Tp_Teltelefone.Value:=CDS_Teltelefone.Value;
          Tp_Telid_pessoal.Value:=ID;
          Tp_Telid_tipo.Value:=CDS_Telid_tipo.Value;
          Tp_Tel.Post;
          CDS_Tel.Next;
        End;

        CDS_Tel.First;
        while Not CDS_Tel.Eof do CDS_Tel.Delete;
        CDS_Tel.Close;
      End;

      if CDS_Email.State in [dsEdit, dsinsert] then
      Begin
        CDS_Email.First;
        while Not CDS_Email.Eof do
        Begin
          Tp_Email.Append;
          Tp_Emailemail.Value:=CDS_Emailemail.Value;
          Tp_Emailid_pessoal.Value:=ID;
          Tp_Emailid_tipo.Value:=CDS_Emailid_tipo.Value;
          Tp_Email.Post;
          CDS_Email.Next;
        End;

        CDS_Email.First;
        while Not CDS_Email.Eof do CDS_Email.Delete;
        CDS_Email.Close;
      End;
    End
    else
    Begin
      if Tp_Pessoal.State in [dsEdit, dsinsert] then
        Tp_Pessoal.Post;
      if Tp_Endereco.State in [dsEdit, dsinsert] then
        Tp_Endereco.Post;
      if Tp_Tel.State in [dsEdit, dsinsert] then
        Tp_Tel.Post;
      if Tp_Email.State in [dsEdit, dsinsert] then
        Tp_Email.Post;
    End;
    ID:=Tp_Pessoalid_pessoal.Value;
  End;
  SetROnly(True);
  Modo:='';
  DM_CadPessoal.Desconectar;
  FormShow(Sender);
  DM_CadPessoal.Tp_Pessoal.Open;
  DM_CadPessoal.Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadPessoal.DBEdit1Change(Sender: TObject);
begin
  ChAtivo.Checked:=DM_CadPessoal.Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadPessoal.DBEdit6Change(Sender: TObject);
begin
  EditCEP:=True;
end;

procedure TFrmCadPessoal.DBEdit6Exit(Sender: TObject);
begin
  if EditCEP then
  Begin
    EditCEP:=False;
    FrmCEP.BuscaCEP(DBEdit6.Text);
    DBEdit8.SetFocus;
  End;
end;

procedure TFrmCadPessoal.DBGridEnderecosColEnter(Sender: TObject);
begin
  if DBGridEnderecos.SelectedField.FieldName = 'CEP' then EditCEP:=True;
end;

procedure TFrmCadPessoal.FormShow(Sender: TObject);
begin
  SetVisibComandos(ToolBar1, 'PADRAO');
  with DM_CadPessoal do
  Begin
    DM_CadPessoal.Conectar('root', '', 'modular');
    ds_Tp_Pessoal.DataSet:=Tp_Pessoal;
    ds_Tp_Endereco.DataSet:=Tp_Endereco;
    ds_Tp_Tel.DataSet:=Tp_Tel;
    ds_Tp_Email.DataSet:=Tp_Email;
  End;
  EditCEP:=False;
  Endereco.Visible:= Not MultiEndereco;
  Enderecos.Visible:= MultiEndereco;
end;

procedure TFrmCadPessoal.Image1Click(Sender: TObject);
Var Expandir:boolean;
begin
  if MultiEndereco then
    Expandir:=Enderecos.Height < Max
  else
    Expandir:=Endereco.Height < Max;
  Emails.Height:=Min;
  Telefones.Height:=Min;
  Endereco.Height:=Min;
  Enderecos.Height:=Min;
  if MultiEndereco then
    AnimePanel(Enderecos, Expandir, Min, Max, Incremento)
  else
    AnimePanel(Endereco, Expandir, Min, Max, Incremento);
  DefineTop();
end;

procedure TFrmCadPessoal.Image2Click(Sender: TObject);
Var Expandir:boolean;
begin
  Expandir:=Telefones.Height < Max;
  Emails.Height:=Min;
  Telefones.Height:=Min;
  Endereco.Height:=Min;
  Enderecos.Height:=Min;
  AnimePanel(Telefones, Expandir, Min, Max, Incremento);
  DefineTop();
end;

procedure TFrmCadPessoal.Image3Click(Sender: TObject);
Var Expandir:boolean;
begin
  Expandir:=Emails.Height < Max;
  Emails.Height:=Min;
  Telefones.Height:=Min;
  Endereco.Height:=Min;
  Enderecos.Height:=Min;
  AnimePanel(Emails, Expandir, Min, Max, Incremento);
  DefineTop();
end;

end.
