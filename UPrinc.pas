unit UPrinc;

interface

uses
  Sharemem, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JvExButtons,
  JvBitBtn, Vcl.ComCtrls, JvPageList, JvNavigationPane, JvExControls,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ScreenTips, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.Ribbon,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.StdActns, Vcl.ImgList, Vcl.ActnMenus,
  Vcl.ExtCtrls, Vcl.RibbonActnMenus, Vcl.Themes, Vcl.Styles;

type
  TFPrinc = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    Action1: TAction;
    Action2: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonPage3: TRibbonPage;
    RibbonPage4: TRibbonPage;
    RibbonGroup3: TRibbonGroup;
    RibbonPage5: TRibbonPage;
    RibbonGroup4: TRibbonGroup;
    Action9: TAction;
    Action10: TAction;
    Action3: TAction;
    RibbonGroup5: TRibbonGroup;
    Action11: TAction;
    Action12: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
  private
    { Private declarations }
  public
    IdUser: Integer;
    Tema:String;
    MultiEndereco:Boolean;
    _64Bits:Boolean;
  end;

var
  FPrinc: TFPrinc;

implementation

{
procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
   External 'funcoes.dll';
function MD5String(Value: String): String; External 'funcoes.dll';
function MD5Arquivo(const Value: String): String; External 'funcoes.dll';
function WebServiceCEP(CEP:String; idhttp1: TIdHTTP):String; External 'funcoes.dll';
Function GeraLogin(Nome:String): String; External 'funcoes.dll';
Function GeraSenha(CPF:String): String; External 'funcoes.dll';
Function Q(Str:String):String; External 'funcoes.dll';
procedure AnimePanel(Sender: TObject; Expandir:Boolean; Min, Max,
  Incremento: Integer); External 'funcoes.dll';
procedure SetVisibComandos(Tool: TToolBar; Tipo:String); External 'funcoes.dll';
procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String); External 'funcoes.dll';
procedure SetVisibComandosComNovo(Tool: TToolBar; Tipo:String); External 'funcoes.dll';
}

uses UConfigSistema;

// utilizar apenas em plataforma 32 bits
Procedure FrmCadCategorias(IdUser:Integer); External 'CadCategorias.dll';
Procedure FrmCadClientes(IdUser:Integer); External 'CadClientes.dll';
Procedure FrmCadFornecedores(IdUser:Integer); External 'CadFornecedores.dll';
Procedure FrmCadFuncionarios(IdUser:Integer); External 'CadFuncionarios.dll';
Procedure FrmCadPessoal(IdUser: Integer; MultiEndereco:Boolean); External 'CadPessoal.dll';
Procedure FrmCadProdutos(IdUser:Integer); External 'CadProdutos.dll';
Procedure FrmCadServicos(IdUser:Integer); External 'CadServicos.dll';
Procedure FrmAgenda(IdUser:Integer); External 'Agenda.dll';
Procedure FrmAgendaFunc(IdUser:Integer); External 'Agenda.dll';
Procedure FrmControleAgenda(IdUser:Integer); External 'Agenda.dll';

{$R *.dfm}

procedure TFPrinc.Action10Execute(Sender: TObject);
begin
  FrmConfigSistema.ShowModal;
end;

procedure TFPrinc.Action11Execute(Sender: TObject);
begin
  FrmAgendaFunc(IdUser);
end;

procedure TFPrinc.Action12Execute(Sender: TObject);
begin
  FrmControleAgenda(IdUser);
end;

procedure TFPrinc.Action1Execute(Sender: TObject);
begin
  FrmCadClientes(IdUser);
end;

procedure TFPrinc.Action2Execute(Sender: TObject);
begin
  FrmCadFornecedores(IdUser);
end;

procedure TFPrinc.Action3Execute(Sender: TObject);
begin
  FrmAgenda(IdUser);
end;

procedure TFPrinc.Action4Execute(Sender: TObject);
begin
  FrmCadCategorias(IdUser);
end;

procedure TFPrinc.Action5Execute(Sender: TObject);
begin
  FrmCadFuncionarios(IdUser);
end;

procedure TFPrinc.Action6Execute(Sender: TObject);
begin
  FrmCadPessoal(IdUser, MultiEndereco);
end;

procedure TFPrinc.Action7Execute(Sender: TObject);
begin
  FrmCadProdutos(IdUser);
end;

procedure TFPrinc.Action8Execute(Sender: TObject);
begin
  FrmCadServicos(IdUser);
end;

end.
