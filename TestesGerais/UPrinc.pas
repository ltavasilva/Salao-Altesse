unit UPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Buttons, JvExButtons,
  JvBitBtn;

type
  TFPrincipal = class(TForm)
    BtnCadPessoais: TButton;
    BtnCadClientes: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    JvBitBtn1: TJvBitBtn;
    procedure BtnCadPessoaisClick(Sender: TObject);
    procedure BtnCadClientesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses UFrmCadPessoal, UFrmCadClientes, UFrmCadFornecedores, UFrmCadProdutos,
  UFrmCadServicos, UFrmCadCategorias, UFrmCadFuncionarios, UFuncoes;

procedure TFPrincipal.BtnCadClientesClick(Sender: TObject);
begin
  FrmCadClientes.Showmodal;
end;

procedure TFPrincipal.BtnCadPessoaisClick(Sender: TObject);
begin
  FrmCadPessoal.MultiEndereco:=True;
  FrmCadPessoal.Showmodal;
end;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
  FrmCadFornecedores.Showmodal;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
  FrmCadProdutos.Showmodal;
end;

procedure TFPrincipal.Button3Click(Sender: TObject);
begin
  FrmCadServicos.Showmodal;
end;

procedure TFPrincipal.Button4Click(Sender: TObject);
begin
  FrmCadCategorias.Showmodal;
end;

procedure TFPrincipal.Button5Click(Sender: TObject);
begin
  FrmCadFuncionarios.ShowModal;
end;

procedure TFPrincipal.JvBitBtn1Click(Sender: TObject);
begin
  Showmessage(MD5String('Tavares'));
end;

end.
