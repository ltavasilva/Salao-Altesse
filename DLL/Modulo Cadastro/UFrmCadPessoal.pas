unit UFrmCadPessoal;

interface

uses
  ShareMem, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB, StrUtils,
  Vcl.Buttons, UPesquisar, UFrmCEP, Vcl.Themes,
  Vcl.Styles, Datasnap.DBClient, Data.Win.ADODB, Datasnap.Win.MConnect,
  Datasnap.Win.SConnect, Datasnap.Win.ObjBrkr, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Datasnap.DSConnect, Data.SqlExpr, Datasnap.DSMetadata,
  Datasnap.DSClientMetadata, UFrmTelefone, UFrmEmail;

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
    BtnLocalizar: TJvImgBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ChAtivo: TCheckBox;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CtgEmails: TCategoryPanel;
    DBGridEmail: TDBGrid;
    CtgTelefones: TCategoryPanel;
    DBGridTel: TDBGrid;
    CtgEnderecos: TCategoryPanel;
    ToolBarEnderecos: TToolBar;
    BtnAddEnde: TToolButton;
    BtnEditEnde: TToolButton;
    BtnDelEnde: TToolButton;
    DBGridEnderecos: TDBGrid;
    CtgEndereco: TCategoryPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    DBEdCEP: TDBEdit;
    DBEdLogradouro: TDBEdit;
    DBEdBairro: TDBEdit;
    DBEdCidade: TDBEdit;
    DBEdUF: TDBEdit;
    DBEdNum: TDBEdit;
    CbTipo: TDBLookupComboBox;
    DBEdComplemento: TDBEdit;
    Server: TSQLConnection;
    DspConn: TDSProviderConnection;
    Tp_Pessoal: TClientDataSet;
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
    Tp_Ende: TClientDataSet;
    Tp_Endecep: TStringField;
    Tp_Endelogradouro: TStringField;
    Tp_Endecomplemento: TStringField;
    Tp_Endebairro: TStringField;
    Tp_Endecidade: TStringField;
    Tp_Endeuf: TStringField;
    Tp_Endenum: TIntegerField;
    Tp_Endeid_tipo: TIntegerField;
    Tp_Endeid_pessoal: TIntegerField;
    dsTp_Pessoal: TDataSource;
    Tp_Tel: TClientDataSet;
    dsTp_Ende: TDataSource;
    dsTp_Tel: TDataSource;
    Tp_Teltelefone: TStringField;
    Tp_Telid_pessoal: TIntegerField;
    Tp_Telid_tipo: TIntegerField;
    Tp_Email: TClientDataSet;
    dsTp_Email: TDataSource;
    Tp_Emailemail: TStringField;
    Tp_Emailid_pessoal: TIntegerField;
    Tp_Emailid_tipo: TIntegerField;
    Ta_Tipo_Ende: TClientDataSet;
    Ta_Tipo_Endeid_tipo: TAutoIncField;
    Ta_Tipo_Endedescricao: TStringField;
    dsTa_Tipo_Ende: TDataSource;
    Ta_Tipo_Tel: TClientDataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    dsTa_Tipo_Tel: TDataSource;
    Ta_Tipo_Email: TClientDataSet;
    AutoIncField2: TAutoIncField;
    StringField2: TStringField;
    dsTa_Tipo_Email: TDataSource;
    Qry_Exec: TClientDataSet;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Tp_TelTipo: TStringField;
    Tp_EmailTipo: TStringField;
    Tp_EndeTipo: TStringField;
    Cd_Ende: TClientDataSet;
    Cd_EndeCep: TStringField;
    Cd_Endelogradouro: TStringField;
    Cd_Endecomplemento: TStringField;
    Cd_Endebairro: TStringField;
    Cd_Endecidade: TStringField;
    Cd_Endeuf: TStringField;
    Cd_Endenum: TIntegerField;
    Cd_Endeid_tipo: TIntegerField;
    Cd_Endeid_pessoal: TIntegerField;
    Cd_EndeTipo: TStringField;
    Cd_Tel: TClientDataSet;
    Cd_Teltelefone: TStringField;
    Cd_Telid_pessoal: TIntegerField;
    Cd_Telid_tipo: TIntegerField;
    Cd_Email: TClientDataSet;
    Cd_Emailemail: TStringField;
    Cd_Emailid_pessoal: TIntegerField;
    Cd_Emailid_tipo: TIntegerField;
    Cd_EmailTipo: TStringField;
    ToolBarTelefones: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBarEmails: TToolBar;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    Cd_TelTipo: TStringField;
    Panel3: TPanel;
    ChBuscaCEP: TCheckBox;
    function Pesquisar:Boolean;
    procedure AnimePanel(Sender: TObject; Expandir:Boolean; Min, Max,
      Incremento: Integer);
    procedure SetROnly(Val:Boolean);
    procedure Btn_Pessoal_NovoClick(Sender: TObject);
    procedure Btn_Pessoal_EditarClick(Sender: TObject);
    procedure Btn_Pessoal_ExcluirClick(Sender: TObject);
    procedure Btn_Pessoal_CancelarClick(Sender: TObject);
    procedure Btn_Pessoal_SalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_Pessoal_SairClick(Sender: TObject);
    procedure DBEdCEPChange(Sender: TObject);
    procedure DBEdCEPExit(Sender: TObject);
    procedure DBGridEnderecosColEnter(Sender: TObject);
    procedure ChAtivoClick(Sender: TObject);
    procedure BtnEditEndeClick(Sender: TObject);
    procedure BtnAddEndeClick(Sender: TObject);
    procedure BtnDelEndeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure CD_EnderecoAfterInsert(DataSet: TDataSet);
    procedure CD_TelAfterInsert(DataSet: TDataSet);
    procedure CD_EmailAfterInsert(DataSet: TDataSet);
    procedure BtnDelEmailClick(Sender: TObject);
    procedure BtnDelTelClick(Sender: TObject);
    procedure CtgEnderecoExpand(Sender: TObject);
    procedure CtgEnderecosExpand(Sender: TObject);
    procedure CtgTelefonesExpand(Sender: TObject);
    procedure CtgEmailsExpand(Sender: TObject);
    procedure EdChapaChange(Sender: TObject);
    procedure Tp_PessoalAfterOpen(DataSet: TDataSet);
    procedure Tp_PessoalAfterScroll(DataSet: TDataSet);
    procedure Tp_TelAfterInsert(DataSet: TDataSet);
    procedure Tp_EndeAfterInsert(DataSet: TDataSet);
    procedure Tp_EmailAfterInsert(DataSet: TDataSet);
    procedure DBGridEmailKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridTelKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
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
  FrmCEP: TFrmCEP;
  FrmTelefone: TFrmTelefone;
  FrmEmail: TFrmEmail;
  EditCEP: Boolean;
  Modo: String;

implementation

//function FrmPesquisar(Tipo:TTipo):Integer; External 'Pesquisar.dll';
Function Q(Str:String):String; External 'Funcoes.dll';
procedure SetVisibComandos(Tool: TToolBar; Tipo:String); External 'Funcoes.dll';
function ValidarCPF(Valor: string): boolean; External 'Funcoes.dll';
function MyData(Valor: TDate): String; External 'Funcoes.dll';

{$R *.dfm}

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

function TFrmCadPessoal.Pesquisar:Boolean;
Var ID: Integer;
Begin
  ID:=FrmPesquisar(Pessoal);
  Result:=ID >= 0;
  if Result then
  Begin
    SetROnly(False);
    if Not Tp_Pessoal.Active then Tp_Pessoal.Open;
    Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
    //
  End;
End;

procedure TFrmCadPessoal.AnimePanel(Sender: TObject; Expandir:Boolean; Min, Max,
  Incremento: Integer);
Var Pan: TControl;
  I, Passos, Fim: Integer;
Begin
  Pan:= TControl(Sender);
  Passos:= round((Max - Min) / Incremento);
  Fim:=0;
  for I := 0 to Passos do
  Begin
    if Expandir then Begin
      Pan.Height:=Pan.Height + Incremento;
      if Pan.Height > Max then Pan.Height := Max;
      Fim:=Max;
    End
    else Begin
      Pan.Height:=Pan.Height - Incremento;
      if Pan.Height < Min then Pan.Height := Min;
      Fim:=Min;
    End;
    Application.ProcessMessages;
  End;
  Pan.Height:=Fim;
End;

procedure TFrmCadPessoal.SetMultiEnde(Value: Boolean = False);
  begin if FMultiEnde <> Value then FMultiEnde := Value; end;

Procedure TransferCDS(CDS_Orig, CDS_Dest: TClientDataSet; ID: Integer);
var
  I: Integer;
Begin
  CDS_Dest.First;
  while Not CDS_Dest.Eof do Begin CDS_Dest.Delete;  end;

  CDS_Orig.First;
  while Not CDS_Orig.Eof do Begin
    CDS_Dest.Append;
    CDS_Dest.Fields[0].Value:=ID;
    for I := 1 to CDS_Dest.Fields.Count-1 do
    Begin
      CDS_Dest.Fields[i].Value:=CDS_Orig.Fields[i].Value;
    End;
    CDS_Dest.Post;
    CDS_Orig.Next;
  end;
  CDS_Orig.First;
  CDS_Dest.First;
End;

procedure TFrmCadPessoal.SetROnly(Val:Boolean);
Begin
  BtnLocalizar.Enabled:=Val;
  ChAtivo.Enabled:=Not Val;

  dsTp_Ende.AutoEdit:= Not FMultiEnde;

  Tp_Pessoal.ReadOnly:=Val;
  if Val then
  Begin
    dsTp_Ende.DataSet:=Tp_Ende;
    dsTp_Tel.DataSet:=Tp_Tel;
    dsTp_Email.DataSet:=Tp_Email;
  End
  else
  Begin
    dsTp_Ende.DataSet:=Cd_Ende;
    dsTp_Tel.DataSet:=Cd_Tel;
    dsTp_Email.DataSet:=Cd_Email;
  End;

  DBEdCEP.ReadOnly:=Val;
  CbTipo.ReadOnly:=Val;
  ToolBarEnderecos.Enabled:=Not Val;
  ToolBarTelefones.Enabled:=Not Val;
  ToolBarEmails.Enabled:=Not Val;
End;

procedure TFrmCadPessoal.ToolButton1Click(Sender: TObject);
begin
  FrmTelefone.Tipo:='';
  FrmTelefone.Telefone:='';
  FrmTelefone.Showmodal;
  if FrmTelefone.Telefone <> '' then
  Begin
    Cd_Tel.Append;
    Cd_Telid_tipo.Value:=FrmTelefone.idTipo;
    Cd_Teltelefone.Value:=FrmTelefone.Telefone;
    Cd_Tel.Post;
    FrmTelefone.idTipo:=-1;
    FrmTelefone.Telefone:='';
  End;
end;

procedure TFrmCadPessoal.ToolButton2Click(Sender: TObject);
begin
  FrmTelefone.Tipo:=Cd_TelTipo.Value;
  FrmTelefone.Telefone:=Cd_Teltelefone.Value;
  FrmTelefone.Showmodal;
  if FrmTelefone.Telefone <> '' then
  Begin
    Cd_Tel.Edit;
    Cd_Telid_tipo.Value:=FrmTelefone.idTipo;
    Cd_Teltelefone.Value:=FrmTelefone.Telefone;
    Cd_Tel.Post;
    FrmTelefone.idTipo:=-1;
    FrmTelefone.Telefone:='';
  End;
end;

procedure TFrmCadPessoal.ToolButton3Click(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Cd_Tel.Delete;
  End;
end;

procedure TFrmCadPessoal.ToolButton5Click(Sender: TObject);
begin
  FrmEmail.Tipo:='';
  FrmEmail.Email:='';
  FrmEmail.Showmodal;
  if FrmEmail.Email <> '' then
  Begin
    Cd_Email.Append;
    Cd_Emailid_tipo.Value:=FrmEmail.idTipo;
    Cd_Emailemail.Value:=FrmEmail.Email;
    Cd_Email.Post;
    FrmEmail.idTipo:=-1;
    FrmEmail.Email:='';
  End;
end;

procedure TFrmCadPessoal.ToolButton7Click(Sender: TObject);
begin
  FrmEmail.Tipo:=Cd_EmailTipo.Value;
  FrmEmail.Email:=Cd_Emailemail.Value;
  FrmEmail.Showmodal;
  if FrmTelefone.Telefone <> '' then
  Begin
    Cd_Email.Edit;
    Cd_Emailid_tipo.Value:=FrmEmail.idTipo;
    Cd_Emailemail.Value:=FrmEmail.Email;
    Cd_Email.Post;
    FrmEmail.idTipo:=-1;
    FrmEmail.Email:='';
  End;
end;

procedure TFrmCadPessoal.ToolButton8Click(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Cd_Email.Delete;
  End;
end;

procedure TFrmCadPessoal.Tp_EmailAfterInsert(DataSet: TDataSet);
begin
  Tp_Emailid_pessoal.Value:=Tp_Pessoalid_pessoal.Value;
end;

procedure TFrmCadPessoal.Tp_EndeAfterInsert(DataSet: TDataSet);
begin
  Tp_Endeid_pessoal.Value:=Tp_Pessoalid_pessoal.Value;
end;

procedure TFrmCadPessoal.Tp_PessoalAfterOpen(DataSet: TDataSet);
begin
  Ta_Tipo_Ende.Open;
  Ta_Tipo_Tel.Open;
  Ta_Tipo_Email.Open;

  Tp_Ende.Open;
  Tp_Tel.Open;
  Tp_Email.Open;
end;

procedure TFrmCadPessoal.Tp_PessoalAfterScroll(DataSet: TDataSet);
begin
  Tp_Ende.Filter:='id_pessoal = ' + Tp_Pessoalid_pessoal.AsString;
  Tp_Tel.Filter:='id_pessoal = ' + Tp_Pessoalid_pessoal.AsString;
  Tp_Email.Filter:='id_pessoal = ' + Tp_Pessoalid_pessoal.AsString;
end;

procedure TFrmCadPessoal.Tp_TelAfterInsert(DataSet: TDataSet);
begin
  Tp_Telid_pessoal.Value:=Tp_Pessoalid_pessoal.Value;
end;

procedure TFrmCadPessoal.BtnAddEndeClick(Sender: TObject);
begin
  Tp_Ende.ReadOnly:=False;
  Tp_Ende.Append;
  FrmCep.Modo:=Modo;
  FrmCEP.LimparCEP;
  FrmCep.ShowModal;

  Tp_EndeCEP.Text:=FrmCep.Ender.CEP;
  Tp_EndeLogradouro.Text:=FrmCep.Ender.Logradouro;
  Tp_EndeComplemento.Text:=FrmCep.Ender.Complemento;
  Tp_EndeNum.Text:=IntToStr(FrmCep.Ender.Num);
  Tp_EndeBairro.Text:=FrmCep.Ender.Bairro;
  Tp_EndeCidade.Text:=FrmCep.Ender.Cidade;
  Tp_EndeUF.Text:=FrmCep.Ender.UF;
  Tp_Endeid_tipo.Value:=FrmCep.DBLookupComboBox1.KeyValue;
  Tp_EndeTipo.AsString:=FrmCep.DBLookupComboBox1.Text;

  Tp_Ende.Post;
  FrmCEP.LimparCEP;
  Tp_Ende.ReadOnly:=True;
end;

procedure TFrmCadPessoal.BtnEditEndeClick(Sender: TObject);
begin
  Tp_Ende.Edit;
  FrmCep.Ender.CEP:=DBEdCEP.Text;
  FrmCep.Ender.Logradouro:=DBEdLogradouro.Text;
  FrmCep.Ender.Complemento:=DBEdComplemento.Text;
  FrmCep.Ender.Num:=StrToInt(DBEdNum.Text);
  FrmCep.Ender.Bairro:=DBEdBairro.Text;
  FrmCep.Ender.Cidade:=DBEdCidade.Text;
  FrmCep.Ender.UF:=DBEdUF.Text;
  FrmCep.ShowModal;

  Tp_EndeCEP.Text:=FrmCep.Ender.CEP;
  Tp_EndeLogradouro.Text:=FrmCep.Ender.Logradouro;
  Tp_EndeComplemento.Text:=FrmCep.Ender.Complemento;
  Tp_EndeNum.Text:=IntToStr(FrmCep.Ender.Num);
  Tp_EndeBairro.Text:=FrmCep.Ender.Bairro;
  Tp_EndeCidade.Text:=FrmCep.Ender.Cidade;
  Tp_EndeUF.Text:=FrmCep.Ender.UF;

  FrmCEP.LimparCEP;
end;

procedure TFrmCadPessoal.BtnDelEmailClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Tp_Email.ReadOnly:=False;
    Tp_Email.Delete;
    Tp_Email.ReadOnly:=True;
  End;
end;

procedure TFrmCadPessoal.BtnDelEndeClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Tp_Ende.ReadOnly:=False;
    Tp_Ende.Delete;
    Tp_Ende.ReadOnly:=True;
  End;
end;

procedure TFrmCadPessoal.BtnDelTelClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Tp_Tel.ReadOnly:=False;
    Tp_Tel.Delete;
    Tp_Tel.ReadOnly:=True;
  End;
end;

procedure TFrmCadPessoal.CD_EmailAfterInsert(DataSet: TDataSet);
begin
  Tp_Emailid_pessoal.AsString:=DBEdit1.Text;
end;

procedure TFrmCadPessoal.CD_EnderecoAfterInsert(DataSet: TDataSet);
begin
  Tp_Endeid_pessoal.AsString:=DBEdit1.Text;
end;

procedure TFrmCadPessoal.CD_TelAfterInsert(DataSet: TDataSet);
begin
  Tp_Telid_pessoal.AsString:=DBEdit1.Text;
end;

procedure TFrmCadPessoal.ChAtivoClick(Sender: TObject);
Var Ativo: Integer;
begin
  if (Modo = 'Novo') or (Modo = 'Editar') then
  Begin
    Ativo:=0;
    if ChAtivo.Checked then Ativo := 1;

    if Modo = 'Editar' then
    Begin
      if not (Tp_Pessoal.State in [dsEdit, dsinsert]) then
        Tp_Pessoal.Edit;
      Tp_Pessoalativo.Value:= Ativo;
    End;
  End;
end;

procedure TFrmCadPessoal.CtgEmailsExpand(Sender: TObject);
begin
  if MultiEndereco then
    CtgEnderecos.Collapse
  else
    CtgEndereco.Collapse;
  CtgTelefones.Collapse;
end;

procedure TFrmCadPessoal.CtgEnderecoExpand(Sender: TObject);
begin
  CtgTelefones.Collapse;
  CtgEmails.Collapse;
end;

procedure TFrmCadPessoal.CtgEnderecosExpand(Sender: TObject);
begin
  CtgTelefones.Collapse;
  CtgEmails.Collapse;
end;

procedure TFrmCadPessoal.CtgTelefonesExpand(Sender: TObject);
begin
  if MultiEndereco then
    CtgEnderecos.Collapse
  else
    CtgEndereco.Collapse;
  CtgEmails.Collapse;
end;

procedure TFrmCadPessoal.Btn_Pessoal_CancelarClick(Sender: TObject);
Var ID:Integer;
begin
  Modo:='';
  SetROnly(True);
  if (Tp_Pessoal.State in [dsEdit, dsinsert]) then Begin
  Tp_Pessoal.Cancel;
  Tp_Pessoal.Close; end;

  if (Tp_Ende.State in [dsEdit, dsinsert]) then Begin
  Tp_Ende.Cancel;
  Tp_Ende.Close; end;

  if (Tp_Tel.State in [dsEdit, dsinsert]) then Begin
  Tp_Tel.Cancel;
  Tp_Tel.Close; end;

  if (Tp_Email.State in [dsEdit, dsinsert]) then Begin
  Tp_Email.Cancel;
  Tp_Email.Close; end;

  if not Tp_Pessoal.Active Then Tp_Pessoal.Open;
  if Tp_Pessoal.RecordCount > 0 then
  Begin
    ID:=Tp_Pessoalid_pessoal.Value;
    Tp_Pessoal.Close;
    Tp_Pessoal.Open;
    Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
    SetVisibComandos(ToolBar1, 'ABERTO');
  End
  else
    SetVisibComandos(ToolBar1, 'PADRAO');
end;

procedure TFrmCadPessoal.Btn_Pessoal_EditarClick(Sender: TObject);
begin
  Modo:='Editar';
  SetROnly(False);
  TransferCDS(Tp_Ende, Cd_Ende, Tp_Pessoalid_pessoal.Value);
  TransferCDS(Tp_Tel, Cd_Tel, Tp_Pessoalid_pessoal.Value);
  TransferCDS(Tp_Email, Cd_Email, Tp_Pessoalid_pessoal.Value);
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadPessoal.Btn_Pessoal_ExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    Tp_Pessoal.Edit;
    Tp_Pessoalativo.Value:=0;
    Tp_Pessoal.Post;
    Tp_Pessoal.ApplyUpdates(-1);

    SetVisibComandos(ToolBar1, 'ABERTO');
  End;
end;

procedure TFrmCadPessoal.Btn_Pessoal_NovoClick(Sender: TObject);
begin
  ChAtivo.Checked:=True;
  Modo:='Novo';


  SetROnly(False);
  TransferCDS(Tp_Ende, Cd_Ende, 0);
  TransferCDS(Tp_Tel, Cd_Tel, 0);
  TransferCDS(Tp_Email, Cd_Email, 0);
  SetVisibComandos(ToolBar1, 'EDITANDO');
end;

procedure TFrmCadPessoal.Btn_Pessoal_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPessoal.Btn_Pessoal_SalvarClick(Sender: TObject);
Var ID:integer;
  CPF, Str:String;
begin
  CPF:=DBEdit5.Text;
  Str:=CPF;
  Str:=ReplaceStr(Str, '.', '');
  Str:=ReplaceStr(Str, '-', '');
  if Not ValidarCPF(Str) then
  Begin
    Application.MessageBox('O CPF digitado é inválido', 'CPF Inválido',
      MB_ICONERROR);
    Exit;
  End;

  if Modo='Novo' then
  Begin
    if (Tp_Ende.State in [dsEdit, dsinsert]) then Begin
      Tp_Pessoal.Post;
      Tp_Pessoal.ApplyUpdates(-1);
    End;
    Qry_Exec.CommandText:='select * from tbl_pessoal where cpf = '''+CPF+'''';
    Qry_Exec.Open;
    ID:=Qry_Exec.FieldByName('id_pessoal').AsInteger;
    Qry_Exec.Close;
    Qry_Exec.CommandText:='';
    Qry_Exec.CommandText:='INSERT INTO tbl_clientes (id_cliente, ativo) '+
      'VALUES ('+IntToStr(ID)+', 1)';
    Qry_Exec.Execute;
    Qry_Exec.CommandText:='';
  End
  else
  Begin
    ID:=Tp_Pessoalid_pessoal.Value;
    if (Tp_Ende.State in [dsEdit, dsinsert]) then Begin
      Tp_Pessoal.Post;
      Tp_Pessoal.ApplyUpdates(-1);
    End;
  End;

  Tp_Ende.ReadOnly:=False;
  Tp_Tel.ReadOnly:=False;
  Tp_Email.ReadOnly:=False;
  TransferCDS(Cd_Ende, Tp_Ende, ID); Tp_Ende.ApplyUpdates(-1);
  TransferCDS(Cd_Tel, Tp_Tel, ID); Tp_Tel.ApplyUpdates(-1);
  TransferCDS(Cd_Email, Tp_Email, ID); Tp_Email.ApplyUpdates(-1);
  Tp_Ende.ReadOnly:=True;
  Tp_Tel.ReadOnly:=True;
  Tp_Email.ReadOnly:=True;

  SetROnly(True);
  Modo:='';
  FormShow(Sender);

  SetVisibComandos(ToolBar1, 'ABERTO');
end;

procedure TFrmCadPessoal.DBEdCEPChange(Sender: TObject);
begin
  EditCEP:=True;  
end;

procedure TFrmCadPessoal.DBEdCEPExit(Sender: TObject);
Var Ende: TEnde;
begin
  if EditCEP then
  Begin
    EditCEP:=False;
    if ChBuscaCEP.Checked then
    Begin
      FrmCEP.Modo:=Modo;
      Ende:=FrmCEP.BuscaRegCEP(DBEdCEP.Text);
      if (Modo <> 'Editar') and (Modo <> 'Novo') then Exit;
      Cd_Endeid_tipo.AsInteger:=1;
      Cd_Endelogradouro.AsString:=Ende.Logradouro;
      Cd_Endebairro.AsString:=Ende.Bairro;
      Cd_Endecidade.AsString:=Ende.Cidade;
      Cd_Endeuf.AsString:=Ende.UF;
      Cd_Ende.Post;
    End;
    DBEdComplemento.SetFocus;
  End;
end;

procedure TFrmCadPessoal.DBGridEmailKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Cd_Email.State in [dsEdit, dsinsert]) then
    Cd_Email.Post;
end;

procedure TFrmCadPessoal.DBGridEnderecosColEnter(Sender: TObject);
begin
  if DBGridEnderecos.SelectedField.FieldName = 'CEP' then EditCEP:=True;
end;

procedure TFrmCadPessoal.DBGridTelKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Cd_Tel.State in [dsEdit, dsinsert]) then
    Cd_Tel.Post;
end;

procedure TFrmCadPessoal.EdChapaChange(Sender: TObject);
begin
  ChAtivo.Checked:=Tp_Pessoalativo.Value = 1;
end;

procedure TFrmCadPessoal.FormCreate(Sender: TObject);
begin
  DspConn.ServerClassName:='TServerSalao';
  DspConn.SQLConnection:=Server;
  FrmCEP:= TFrmCEP.Create(Application);
  FrmTelefone:= TFrmTelefone.Create(Application);
  FrmEmail:= TFrmEmail.Create(Application);
end;

procedure TFrmCadPessoal.FormShow(Sender: TObject);
begin
  Tp_Pessoal.Open;
  if Tp_Pessoal.RecordCount > 0 then
    SetVisibComandos(ToolBar1, 'ABERTO')
  else
    SetVisibComandos(ToolBar1, 'PADRAO');
  EditCEP:=False;
  CtgEndereco.Visible:= Not MultiEndereco;
  CtgEnderecos.Visible:= MultiEndereco;

  CtgEnderecos.Collapse;
  CtgEndereco.Collapse;
  CtgTelefones.Collapse;
  CtgEmails.Collapse;
  SetROnly(True);
end;

procedure TFrmCadPessoal.BtnLocalizarClick(Sender: TObject);
begin
  if Pesquisar Then
  Begin
    SetVisibComandos(ToolBar1, 'ABERTO');
    SetROnly(True);
  End;
end;

end.
