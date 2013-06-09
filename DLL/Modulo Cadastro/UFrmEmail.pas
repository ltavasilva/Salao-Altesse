unit UFrmEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmEmail = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdEmail: TEdit;
    Server: TSQLConnection;
    DspConn: TDSProviderConnection;
    Ta_Tipo_Email: TClientDataSet;
    Ta_Tipo_Emailid_tipo: TAutoIncField;
    Ta_Tipo_Emaildescricao: TStringField;
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
    Tipo, Email: String;
  end;

var
  FrmEmail: TFrmEmail;

implementation

{$R *.dfm}

procedure TFrmEmail.BitBtn1Click(Sender: TObject);
begin
  idTipo:=-1;
  Email:='';
  Tipo:='';
  Close;
end;

procedure TFrmEmail.BitBtn2Click(Sender: TObject);
begin
  Ta_Tipo_Email.Locate('descricao', CbTipo.Text, [loCaseInsensitive]);
  idTipo:=Ta_Tipo_Emailid_tipo.Value;
  Email:=EdEmail.Text;
  Close;
end;

procedure TFrmEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ta_Tipo_Email.Close;
  EdEmail.Text:='';
end;

procedure TFrmEmail.FormShow(Sender: TObject);
begin
  Ta_Tipo_Email.Open;
  CbTipo.Items.Clear;
  while Not Ta_Tipo_Email.Eof do
  Begin
    CbTipo.Items.Add(Ta_Tipo_Emaildescricao.Value);
    Ta_Tipo_Email.Next;
  End;

  if Email <> '' then
  Begin
    EdEmail.Text:=Email;
    CbTipo.SelText:=Tipo;
  End;
end;

end.
