unit UFrmEvento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ImgList, DB,
  Datasnap.DBClient, Data.Win.ADODB, Vcl.DBCtrls;

type TStatus = (Novo, Editar, Consultar, Confirmado, Cancelado, Inalterado);

type
  TFrmEvento = class(TForm)
    Label1: TLabel;
    EdData: TLabeledEdit;
    EdHora: TLabeledEdit;
    EdServico: TLabeledEdit;
    ImageList128: TImageList;
    Image1: TImage;
    EdCliente: TLabeledEdit;
    BtnBuscarCliente: TJvImgBtn;
    ImageList24: TImageList;
    Conexao: TADOConnection;
    Qry_Geral: TADOQuery;
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
    CbDescricao: TDBLookupComboBox;
    Label2: TLabel;
    Qry_DescServ: TADOQuery;
    ds_Qry_DescServ: TDataSource;
    Qry_DescServid_item: TAutoIncField;
    Qry_DescServdescricao: TStringField;
    BtnConfirmar: TJvImgBtn;
    BtnCancelar: TJvImgBtn;
    BtnSair: TJvImgBtn;
    Qry_Exec: TADOQuery;
    procedure BtnBuscarClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Function GetNumMovimGrupo:Integer;
    Function GetNumMovim:Integer;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure CbDescricaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Data: TDate;
    Hora: TTime;
    Servico, DetalheServ, Funcionario, Cliente: Integer;
    Status: TStatus;
    Incr:TDateTime;
  end;

var
  FrmEvento: TFrmEvento;

implementation

uses UPesquisar, UFrmAgenda;

function FrmPesquisar(Tipo:TTipo):Integer; External 'Pesquisar.dll';
function MyData(Value: TDate): String; External 'Funcoes.dll';
Function GetValorById(Tabela, Key, Field: String; ID: Integer):String;
  External 'Funcoes.dll';

{$R *.dfm}

Function TFrmEvento.GetNumMovimGrupo:Integer;
Var HoraIni, HoraFim: TDateTime;
Begin
  Result:=0;
  HoraIni:=Hora-Incr;
  HoraFim:=Hora+Incr;
  Qry_Geral.Close;
  Qry_Geral.Sql.Text:='SELECT mov.id_movimento FROM tbl_movimentos mov '+
	  'inner join tbl_movimentos_itens mvi on mov.id_movimento = '+
    'mvi.id_movimento where mov.id_tipo = 2 and mov.id_status = 1 '+
    'and mov.data_planejada = '''+MyData(Data)+''' and mov.tipo_entidade = 1 '+
    'and mvi.hora_planejada between '''+TimeToStr(HoraIni)+''''+
    ' and '''+TimeToStr(HoraFim)+''' and id_entidade = '+IntToStr(Cliente);
  Qry_Geral.Open;
  Result:=Qry_Geral.FieldByName('id_movimento').AsInteger;
  Qry_Geral.Close;
End;

Function TFrmEvento.GetNumMovim:Integer;
Var HoraIni, HoraFim: TDateTime;
Begin
  Result:=0;
  HoraIni:=Hora-Incr;
  HoraFim:=Hora+Incr;
  Qry_Geral.Close;
  Qry_Geral.Sql.Text:='SELECT max(mov.id_movimento)id_movimento FROM tbl_movimentos mov '+
	  'where mov.id_tipo = 2 and mov.id_status = 1 '+
    'and mov.data_planejada = '''+MyData(Data)+''' and mov.tipo_entidade = 1 '+
    'and mov.id_entidade = '+IntToStr(Cliente);
  Qry_Geral.Open;
  Result:=Qry_Geral.FieldByName('id_movimento').AsInteger;
  Qry_Geral.Close;
End;

procedure TFrmEvento.BtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
      'Confirmar exclusão', MB_ICONQUESTION+MB_YESNO) = ID_YES Then
  Begin
    try
      FrmEvento.Status := Cancelado;
      Qry_Exec.SQL.Text:='delete from tbl_movimentos '+
        'where id_movimento = '+IntToStr(GetNumMovimGrupo);
      Try
        Qry_Exec.ExecSQL;
      Except

      End;
    finally
      Application.MessageBox('Agendamento cancelado com sucesso!',
        'Confirmado', MB_ICONINFORMATION);
    end;
    Close;
  End;
end;

procedure TFrmEvento.BtnConfirmarClick(Sender: TObject);
Var IdMov:Integer;
  Erro:Boolean;
begin
  try
    Erro:=False;
    FrmEvento.Status := Confirmado;
    IdMov:=GetNumMovimGrupo;
    if IdMov = 0 then
    Begin
      Qry_Exec.SQL.Text:='INSERT INTO tbl_movimentos (id_tipo, id_status, '+
        'data_planejada, id_entidade, tipo_entidade) '+
        'VALUES (2, 1, '''+MyData(Data)+''', '+IntToStr(Cliente)+', 1)';
      Qry_Exec.ExecSQL;
      IdMov:=GetNumMovim;
    End;
    Try
      Qry_Exec.SQL.Text:='INSERT INTO tbl_movimentos_itens (id_movimento, '+
        'id_item, id_funcionario, hora_planejada, quantidade, status, desconto) '+
        'VALUES ('+IntToStr(IdMov)+', '+IntToStr(DetalheServ)+', '+
        IntToStr(Funcionario)+', '''+TimeToStr(Hora)+''', 1, 1, 0)';
      Qry_Exec.ExecSQL;
    Except
      Application.MessageBox('Este serviço já está cadastrado para este cliente',
      'Erro ao criar agendamento', MB_ICONERROR);
      Erro:=True
    End;
  finally
    if not Erro Then
      Application.MessageBox('Agendamento cadastrado com sucesso!',
        'Confirmado', MB_ICONINFORMATION);
  end;
  if not Erro Then Close;
end;

procedure TFrmEvento.BtnSairClick(Sender: TObject);
begin
  FrmEvento.Status := Inalterado;
  Close;
end;

procedure TFrmEvento.CbDescricaoExit(Sender: TObject);
begin
  if CbDescricao.KeyValue > 0 then
    DetalheServ:=CbDescricao.KeyValue;
end;

procedure TFrmEvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Conexao.Close;
end;

procedure TFrmEvento.FormShow(Sender: TObject);
begin
  if Status = Novo then ImageList128.GetIcon(2, Image1.Picture.Icon);
  if Status = Editar then ImageList128.GetIcon(1, Image1.Picture.Icon);
  if Status = Consultar then ImageList128.GetIcon(3, Image1.Picture.Icon);

  CbDescricao.ReadOnly:=Status = Consultar;
  BtnBuscarCliente.Enabled:=Not (Status = Consultar);
  BtnConfirmar.Enabled:=Not (Status = Consultar);
  BtnCancelar.Enabled:=Not (Status = Consultar);

  Qry_DescServ.Parameters.ParamByName('PServ').Value:=Servico;
  Qry_DescServ.Open;
  EdData.Text:=DateToStr(Data);
  EdHora.Text:=Copy(TimeToStr(Hora),1,5);
  EdServico.Text:= GetValorById('tbl_aux_categoria_itens', 'id_categoria',
    'descricao',Servico);
  CbDescricao.KeyValue:=DetalheServ;
  CbDescricaoExit(Sender);
  EdCliente.Text:= GetValorById('tbl_pessoal', 'id_pessoal', 'nome', Cliente);
end;

procedure TFrmEvento.BtnBuscarClienteClick(Sender: TObject);
Var ID:Integer;
begin
  ID:=FrmPesquisar(Clientes);
  if ID >= 0 then
  Begin
    if Not Tp_Pessoal.Active then Tp_Pessoal.Open;
    Tp_Pessoal.Locate('id_pessoal', ID, [loCaseInsensitive]);
    EdCliente.Text:=Tp_Pessoalnome.Value;
    Cliente:=ID;
  End;
end;

end.
