unit UFrmCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, JvExButtons,
  JvBitBtn, Vcl.DBCtrls, Vcl.Mask, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ImgList,
  JvExStdCtrls, JvButton, JvCtrls;

  Type TEnde = record
    CEP, Logradouro, Complemento:String;
    Num:Integer;
    Bairro, Cidade, UF: String;
  end;

type
  TFrmCEP = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    JvImgBtn1: TJvImgBtn;
    ImageList1: TImageList;
    Label8: TLabel;
    EdCEP: TMaskEdit;
    EdLogradouro: TEdit;
    EdComplemento: TEdit;
    EdNum: TEdit;
    EdBairro: TEdit;
    EdCidade: TEdit;
    EdUF: TMaskEdit;
    IdHTTP1: TIdHTTP;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FModo: String;
    procedure SetModo(Value: String = 'Novo');
  public
    Ender:TEnde;
    property Modo: String read FModo write SetModo;
    Function BuscaRegCEP(CEP:String):TEnde;
    Procedure LimparCEP;
  end;

var FrmCEP: TFrmCEP;
  Modo: String;

implementation

function WebServiceCEP(CEP:String; idhttp1: TIdHTTP):String; External 'funcoes.dll';

{$R *.dfm}

procedure TFrmCEP.SetModo(Value: String = 'Novo');
begin if FModo <> Value then FModo := Value; end;

procedure TFrmCEP.BitBtn1Click(Sender: TObject);
begin
  Ender.CEP:=EdCEP.Text;
  Ender.Logradouro:=EdLogradouro.Text;
  Ender.Complemento:=EdComplemento.Text;
  Ender.Num:=StrToInt(EdNum.Text);
  Ender.Bairro:=EdBairro.Text;
  Ender.Cidade:=EdCidade.Text;
  Ender.UF:=EdUF.Text;
end;

procedure TFrmCEP.LimparCEP;
begin
  Ender.CEP:='';
  Ender.Logradouro:='';
  Ender.Complemento:='';
  Ender.Num:=0;
  Ender.Bairro:='';
  Ender.Cidade:='';
  Ender.UF:='';
end;

procedure TFrmCEP.BitBtn2Click(Sender: TObject);
begin
  LimparCEP;
end;

Function TFrmCEP.BuscaRegCEP(CEP:String):TEnde;
var
  lodados: TStringList;
  ValCEP: String;
  Ende: TEnde;
begin
  lodados:=TStringList.Create;
  try
    lodados.text:=WebServiceCEP(CEP, idhttp1);
  Except
    Application.MessageBox('Sem comunicação com a internet para buscar o CEP.'+
      #13+'Favor inserir o endereço manualmente.', 'Sem Internet',
      MB_ICONWARNING);
    Exit;
  end;
  if lodados.Values['RESULTADO'] <> '0' then
  Begin
    Ende.CEP:=CEP;
    Ende.Logradouro:=lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'];
    Ende.Bairro:=lodados.Values['BAIRRO'];
    Ende.Cidade:=lodados.Values['CIDADE'];
    Ende.UF:=lodados.Values['UF'];
    Result:=Ende;
  End
  else
  Begin
    Application.MessageBox('O CEP informado não está cadastrado no sistema dos Correios.'+
      #13+'Favor inserir o endereço manualmente.', 'CEP Inválido',
      MB_ICONWARNING);
  End;
end;

procedure TFrmCEP.FormShow(Sender: TObject);
begin
  EdCEP.Text:=Ender.CEP;
  EdLogradouro.Text:=Ender.Logradouro;
  EdComplemento.Text:=Ender.Complemento;
  EdNum.Text:=IntToStr(Ender.Num);
  EdBairro.Text:=Ender.Bairro;
  EdCidade.Text:=Ender.Cidade;
  EdUF.Text:=Ender.UF;
  EdCEP.SetFocus;
end;

procedure TFrmCEP.JvImgBtn1Click(Sender: TObject);
Var Ende:TEnde;
begin
  Ende:=BuscaRegCEP(EdCEP.Text);
  EdLogradouro.Text:=Ende.Logradouro;
  EdBairro.Text:=Ende.Bairro;
  EdCidade.Text:=Ende.Cidade;
  EdUF.Text:=Ende.UF;
  EdComplemento.SetFocus;
end;

end.
