unit UFrmTelefone;

interface

uses
  ShareMem, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Data.DB, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TFrmTelefone = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Server: TSQLConnection;
    DspConn: TDSProviderConnection;
    Ta_Tipo_Tel: TClientDataSet;
    Ta_Tipo_Telid_tipo: TAutoIncField;
    Ta_Tipo_Teldescricao: TStringField;
    EdTelefone: TEdit;
    DataSource1: TDataSource;
    CbTipo: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    idTipo: Integer;
    Tipo, Telefone: String;
  end;

var
  FrmTelefone: TFrmTelefone;

implementation

{$R *.dfm}

uses UFrmCadPessoal;

procedure TFrmTelefone.BitBtn1Click(Sender: TObject);
begin
  idTipo:=-1;
  Telefone:='';
  Tipo:='';
  Close;
end;

procedure TFrmTelefone.BitBtn2Click(Sender: TObject);
begin
  Ta_Tipo_Tel.Locate('descricao', CbTipo.Text, [loCaseInsensitive]);
  idTipo:=Ta_Tipo_Telid_tipo.Value;
  Telefone:=EdTelefone.Text;
  Close;
end;

procedure TFrmTelefone.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ta_Tipo_Tel.Close;
  EdTelefone.Text:='';
end;

procedure TFrmTelefone.FormShow(Sender: TObject);
begin
  Ta_Tipo_Tel.Open;
  CbTipo.Items.Clear;
  while Not Ta_Tipo_Tel.Eof do
  Begin
    CbTipo.Items.Add(Ta_Tipo_Teldescricao.Value);
    Ta_Tipo_Tel.Next;
  End;

  if Telefone <> '' then
  Begin
    EdTelefone.Text:=Telefone;
    CbTipo.SelText:=Tipo;
  End;
end;

end.
