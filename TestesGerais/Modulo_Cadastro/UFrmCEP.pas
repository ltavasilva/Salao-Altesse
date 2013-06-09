unit UFrmCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, JvExButtons,
  JvBitBtn, Vcl.DBCtrls, Vcl.Mask, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFrmCEP = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IdHTTP1: TIdHTTP;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FModo: String;
    procedure SetModo(Value: String = 'Novo');
  public
    property Modo: String read FModo write SetModo;
    procedure BuscaCEP(CEP:String);
  end;

var
  FrmCEP: TFrmCEP;
  Modo: String;

implementation

{$R *.dfm}

uses UDM_CadPessoal, UFuncoes;

procedure TFrmCEP.SetModo(Value: String = 'Novo');
begin if FModo <> Value then FModo := Value; end;

procedure TFrmCEP.BitBtn2Click(Sender: TObject);
begin
  with DM_CadPessoal do
  Begin
    if Modo = 'Novo' then
      CDS_Endereco.Cancel
    else
      Tp_Endereco.Cancel;
  End;
end;

procedure TFrmCEP.BuscaCEP(CEP:String);
var
  lodados: TStringList;
  ValCEP: String;
begin
  lodados:=TStringList.Create;
  try
    lodados.text:=WebServiceCEP(CEP, idhttp1);
  Except
    Application.MessageBox('Sem comunicação com a internet para buscar o CEP.'+
      #13+'Favor inserir o endereço manualmente.', 'Sem Internet',
      MB_ICONWARNING);
    DBLookupComboBox1.SetFocus;
  end;
  with DM_CadPessoal do
  Begin
    if Modo = 'Novo' then
    Begin
      CDS_Enderecologradouro.Value:=lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'];
      CDS_Enderecobairro.Value:=lodados.Values['BAIRRO'];
      CDS_Enderecocidade.Value:=lodados.Values['CIDADE'];
      CDS_Enderecouf.Value:=lodados.Values['UF'];
      CDS_Enderecoid_tipo.Value:=1;
    End
    else
    Begin
      Try
        Tp_Endereco.Edit; Except End;
      Tp_Enderecologradouro.Value:=lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'];
      Tp_Enderecobairro.Value:=lodados.Values['BAIRRO'];
      Tp_Enderecocidade.Value:=lodados.Values['CIDADE'];
      Tp_Enderecouf.Value:=lodados.Values['UF'];
      Tp_Enderecoid_tipo.Value:=1;
    End;
  End;
end;

procedure TFrmCEP.FormShow(Sender: TObject);
begin
  With DM_CadPessoal do
  Begin
    if not Ta_Tipo_Ende.Active then
      Ta_Tipo_Ende.Open;
  End;
  DBEdit1.SetFocus;
end;

procedure TFrmCEP.SpeedButton1Click(Sender: TObject);
begin
  BuscaCEP(DBEdit1.Text);
  DBEdit6.SetFocus;
end;

end.
