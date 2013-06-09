unit UFrmAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.CategoryButtons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.Win.ADODB, Data.DB, Datasnap.DBClient,
  Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan;

type
  TFrmAgenda = class(TForm)
    ImageList1: TImageList;
    Calendario: TMonthCalendar;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Agenda: TCategoryButtons;
    Label5: TLabel;
    ChOnlyDisp: TCheckBox;
    Conexao: TADOConnection;
    Qry_Funcionarios: TADOQuery;
    Qry_Exec: TADOQuery;
    Qry_Servicos: TADOQuery;
    Tbl_Config: TADOTable;
    Tbl_Confighorainicioagenda: TTimeField;
    Tbl_Confighorafimagenda: TTimeField;
    Tbl_Configincrementoagenda: TIntegerField;
    CDS_Agenda: TClientDataSet;
    CDS_AgendaHora: TTimeField;
    CDS_AgendaEvento: TStringField;
    CDS_AgendaImageIndex: TIntegerField;
    Ds_Qry_Servicos: TDataSource;
    Servicos: TDBLookupListBox;
    Qry_Servicosid_categoria: TAutoIncField;
    Qry_Servicosdescricao: TStringField;
    Tbl_Agendados: TADOTable;
    Qry_Funcionariosnome: TStringField;
    Tbl_Agendadosid_categoria: TIntegerField;
    Tbl_Agendadosdata_planejada: TDateField;
    Tbl_Agendadoshora_planejada: TTimeField;
    Tbl_Agendadosnome: TStringField;
    CDS_AgendaID: TIntegerField;
    CDS_AgendaData: TDateField;
    CDS_AgendaServico: TIntegerField;
    CDS_AgendaDetalheServ: TIntegerField;
    CDS_AgendaCliente: TIntegerField;
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
    Qry_Geral: TADOQuery;
    Tbl_Agendadosid_Item: TIntegerField;
    Tbl_Agendadosid_entidade: TIntegerField;
    CDS_AgendaFuncionario: TIntegerField;
    Tbl_Agendadosid_funcionario: TIntegerField;
    Qry_Funcionariosid_funcionario: TIntegerField;
    Procedure Conectar(User, Pass, Database: String);
    Procedure Desconectar();
    procedure AgendaCategoryCollapase(Sender: TObject;
      const Category: TButtonCategory);
    procedure AgendaServicos(Origem: String);
    procedure AgendaButtonClicked(Sender: TObject; const Button: TButtonItem);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServicosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ServicosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CalendarioClick(Sender: TObject);
    procedure ChOnlyDispClick(Sender: TObject);
  private
    { Private declarations }
  public
    IdUser: Integer;
  end;

var
  FrmAgenda: TFrmAgenda;
  TemAcesso:Boolean;
  Incr:TDateTime;

implementation

uses UFrmEvento;

Function AbreviarNome(Nome:String):String; External 'Funcoes.dll';
function CheckAcesso(IdUser:Integer; Perfil: String):Boolean;
  External 'Funcoes.dll';
Function GetValorById(Tabela, Key, Field: String; ID: Integer):String;
  External 'Funcoes.dll';

{$R *.dfm}

procedure TFrmAgenda.CalendarioClick(Sender: TObject);
begin
  AgendaServicos('Calendario');
end;

procedure TFrmAgenda.ChOnlyDispClick(Sender: TObject);
begin
  AgendaServicos('OnlyDisp');
end;

Procedure TFrmAgenda.Conectar(User, Pass, Database: String);
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

Procedure TFrmAgenda.Desconectar();
Begin
  Try
  if Conexao.Connected then
  Begin
    Conexao.Close;
  End;
  Except

  End;
End;

procedure TFrmAgenda.AgendaButtonClicked(Sender: TObject;
  const Button: TButtonItem);
Var TextoBotao:String;
begin
  TextoBotao:='';
  CDS_Agenda.Locate('ID', Button.ID, [loCaseInsensitive]);
  FrmEvento.Data:=CDS_AgendaData.Value;
  FrmEvento.Hora:=CDS_AgendaHora.Value;
  FrmEvento.Servico:=CDS_AgendaServico.Value;
  FrmEvento.DetalheServ:=CDS_AgendaDetalheServ.Value;
  FrmEvento.Funcionario:=CDS_AgendaFuncionario.Value;
  FrmEvento.Cliente:=CDS_AgendaCliente.Value;
  FrmEvento.Status:=Consultar;
  FrmEvento.Incr:=Incr;
  if CDS_AgendaEvento.Value='Disponível' then
  Begin
    if TemAcesso then FrmEvento.Status:=Novo;
  End
  else
    if TemAcesso then FrmEvento.Status:=Editar;
  FrmEvento.ShowModal;

  if FrmEvento.Status = Confirmado then
  Begin
    CDS_Agenda.Edit;
    CDS_AgendaDetalheServ.Value:=FrmEvento.DetalheServ;
    CDS_AgendaFuncionario.Value:=FrmEvento.Funcionario;
    CDS_AgendaCliente.Value:=FrmEvento.Cliente;
    CDS_AgendaEvento.Value:=AbreviarNome(FrmEvento.EdCliente.Text);
    CDS_AgendaImageIndex.Value:=155;
    CDS_Agenda.Post;
    TextoBotao:=TimeToStr(CDS_AgendaHora.Value)+' - '+
      GetValorById('tbl_aux_categoria_itens', 'id_categoria',
        'descricao',CDS_AgendaServico.Value) + ' - ' +
        CDS_AgendaEvento.Value;
  End
  else if FrmEvento.Status = Cancelado then
  Begin
    CDS_Agenda.Edit;
    CDS_AgendaDetalheServ.Value:=0;
    CDS_AgendaFuncionario.Value:=0;
    CDS_AgendaCliente.Value:=0;
    CDS_AgendaEvento.Value:='Disponível';
    CDS_AgendaImageIndex.Value:=30;
    CDS_Agenda.Post;

    TextoBotao:=TimeToStr(CDS_AgendaHora.Value)+' - '+CDS_AgendaEvento.Value;
  End;
  if TextoBotao <> '' then
  Begin
    Button.Caption:=TextoBotao;
    Button.ImageIndex:=CDS_AgendaImageIndex.Value;
  End;
end;

procedure TFrmAgenda.AgendaCategoryCollapase(Sender: TObject;
  const Category: TButtonCategory);
Var Idx: Integer;
begin
  if Not Category.Collapsed then
  Begin
    For Idx:=0 to Agenda.Categories.Count - 1 do
    Begin
      if Idx <> Category.Index Then
      Begin
        Agenda.Categories[Idx].Collapsed:=True;
      End;
    End;
  End;
end;

procedure TFrmAgenda.FormCreate(Sender: TObject);
begin
  FrmEvento := TFrmEvento.Create(Application);
end;

procedure TFrmAgenda.FormShow(Sender: TObject);
begin
  Qry_Servicos.Open;
  Calendario.Date:=Date;
  TemAcesso:=CheckAcesso(IdUser, '9');
end;

procedure TFrmAgenda.ServicosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) then AgendaServicos('Serviços');

end;

procedure TFrmAgenda.ServicosMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  AgendaServicos('Serviços');
end;

procedure TFrmAgenda.AgendaServicos(Origem: String);
Var Categ: TButtonCategory;
  Butt: TButtonItem;
  Ini, Fim, Hor: TDateTime;
  IncStr, TextoBotao:String;
  C, I:Integer;
  Collap, BotaoVisivel:Boolean;
begin
  if Servicos.KeyValue >= 0 then
  Begin
    Tbl_Config.Open;
    Ini:=Tbl_Confighorainicioagenda.Value;
    Fim:=Tbl_Confighorafimagenda.Value;
    IncStr:='00:'+formatFloat('00',Tbl_Configincrementoagenda.Value)+':00';
    Incr:=StrToTime(IncStr);
    Tbl_Config.Close;
    Qry_Funcionarios.Close;
    Qry_Funcionarios.Parameters.ParamByName('PServ').Value:=Servicos.KeyValue;
    Qry_Funcionarios.Open;
    Qry_Funcionarios.First;

    Agenda.Categories.Clear;
    CDS_Agenda.EmptyDataSet;
    Collap:=False;
    C:=0;
    while Not Qry_Funcionarios.Eof do
    Begin
      Categ:=Agenda.Categories.Add;
      Categ.Caption:=Qry_Funcionariosnome.Value;
      Categ.Collapsed:=Collap;

      Hor:=Ini;
      I:=0;
      Tbl_Agendados.Open;
      while Hor <= Fim do
      Begin
        CDS_Agenda.Append;
        CDS_AgendaID.Value:=I;
        CDS_AgendaData.Value:=Calendario.Date;
        CDS_AgendaHora.Value:=Hor;
        CDS_AgendaServico.Value:=Servicos.KeyValue;
        CDS_AgendaFuncionario.Value:=Qry_Funcionariosid_funcionario.Value;
        if Tbl_Agendados.Locate('id_funcionario;data_planejada;hora_planejada',
          VarArrayOf([Qry_Funcionariosid_funcionario.Value,
          DateToStr(Calendario.Date), Hor]), [loCaseInsensitive]) then
        Begin
          CDS_AgendaDetalheServ.Value:=Tbl_Agendadosid_Item.Value;
          CDS_AgendaCliente.Value:=Tbl_Agendadosid_entidade.Value;
          CDS_AgendaEvento.Value:=AbreviarNome(Tbl_Agendadosnome.Value);
          CDS_AgendaImageIndex.Value:=155;
          TextoBotao:=TimeToStr(CDS_AgendaHora.Value)+' - '+
            GetValorById('tbl_aux_categoria_itens', 'id_categoria',
              'descricao',Tbl_Agendadosid_categoria.Value) + ' - ' +
              CDS_AgendaEvento.Value;
        End
        else
        Begin
          CDS_AgendaEvento.Value:='Disponível';
          CDS_AgendaImageIndex.Value:=30;
          TextoBotao:=TimeToStr(CDS_AgendaHora.Value)+' - '+CDS_AgendaEvento.Value;
        End;
        // 149 = Executado
        // 155 = Planejado
        // 157 = Atrasado
        // 30  = Disponível

        BotaoVisivel:=True;
        if ChOnlyDisp.Checked and (CDS_AgendaImageIndex.Value<>30) then
          BotaoVisivel:=False;

        if BotaoVisivel then
        Begin
          Butt:=Categ.Items.Add;
          Butt.Caption:=TextoBotao;
          Butt.ImageIndex:=CDS_AgendaImageIndex.Value;
          Categ.Items.AddItem(Butt, I);
          Inc(I);
        End;
        CDS_Agenda.Post;

        Hor:=Hor+Incr;
        Collap:=True;
      End;
      Tbl_Agendados.Close;
      Qry_Funcionarios.Next;
      Inc(C);
    End;
    Tbl_Agendados.Close;
  End;
end;

end.
