unit UFrmCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ToolWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls, DB,
  Vcl.Buttons, UDM_CadCategorias;

type
  TFrmCadCategorias = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    DBGrid8: TDBGrid;
    Label1: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    DBGrid10: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    IdUser:Integer;
  end;
var
  FrmCadCategorias: TFrmCadCategorias;
  DM_CadCategorias: TDM_CadCategorias;

implementation

{$R *.dfm}

procedure TFrmCadCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  With DM_CadCategorias do
  Begin
    if Ta_Categ_Serv.ChangeCount > 0 Then Ta_Categ_Serv.ApplyUpdates(-1);
    if Ta_Categ_Prod.ChangeCount > 0 Then Ta_Categ_Prod.ApplyUpdates(-1);
    if Ta_Status_Mov.ChangeCount > 0 Then Ta_Status_Mov.ApplyUpdates(-1);
    if Ta_Tipo_Email.ChangeCount > 0 Then Ta_Tipo_Email.ApplyUpdates(-1);
    if Ta_Tipo_Ende.ChangeCount > 0 Then Ta_Tipo_Ende.ApplyUpdates(-1);
    if Ta_Tipo_Entidade.ChangeCount > 0 Then Ta_Tipo_Entidade.ApplyUpdates(-1);
    if Ta_Tipo_Itens.ChangeCount > 0 Then Ta_Tipo_Itens.ApplyUpdates(-1);
    if Ta_Tipo_Mov.ChangeCount > 0 Then Ta_Tipo_Mov.ApplyUpdates(-1);
    if Ta_Tipo_Tel.ChangeCount > 0 Then Ta_Tipo_Tel.ApplyUpdates(-1);
  End;
end;

procedure TFrmCadCategorias.FormCreate(Sender: TObject);
begin
  DM_CadCategorias:=TDM_CadCategorias.Create(Application);
end;

procedure TFrmCadCategorias.FormShow(Sender: TObject);
Var TemAcesso:Boolean;
begin
  DM_CadCategorias.Qry_Acesso.CommandText:='SELECT * FROM tbl_acesso where '+
    'id_funcionario = '+IntToStr(IdUser)+' and perfil like ''%2%''';
  DM_CadCategorias.Qry_Acesso.Open;
  TemAcesso:=DM_CadCategorias.Qry_Acesso.RecordCount > 0;

  With DM_CadCategorias do
  Begin
    ds_Ta_Categ_Serv.AutoEdit:=TemAcesso;
    ds_Ta_Categ_Prod.AutoEdit:=TemAcesso;
    ds_Ta_Status_Mov.AutoEdit:=TemAcesso;
    ds_Ta_Tipo_Email.AutoEdit:=TemAcesso;
    ds_Ta_Tipo_Ende.AutoEdit:=TemAcesso;
    ds_Ta_Tipo_Entidade.AutoEdit:=TemAcesso;
    ds_Ta_Tipo_Itens.AutoEdit:=TemAcesso;
    ds_Ta_Tipo_Mov.AutoEdit:=TemAcesso;
    ds_Ta_Tipo_Tel.AutoEdit:=TemAcesso;
  End;
end;

procedure TFrmCadCategorias.TabSheet1Show(Sender: TObject);
begin
  Label1.Caption:='Categorias de produtos e serviços';
  DM_CadCategorias.Ta_Categ_Serv.Open;
  DM_CadCategorias.Ta_Categ_Prod.Open;
end;

procedure TFrmCadCategorias.TabSheet2Show(Sender: TObject);
begin
  Label1.Caption:='Situações do documento';
  DM_CadCategorias.Ta_Status_Mov.Open;
end;

procedure TFrmCadCategorias.TabSheet3Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de E-mail';
  DM_CadCategorias.Ta_Tipo_Email.Open;
end;

procedure TFrmCadCategorias.TabSheet4Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Endereços';
  DM_CadCategorias.Ta_Tipo_Ende.Open;
end;

procedure TFrmCadCategorias.TabSheet5Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Telefones';
  DM_CadCategorias.Ta_Tipo_Tel.Open;
end;

procedure TFrmCadCategorias.TabSheet6Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Itens';
  DM_CadCategorias.Ta_Tipo_Itens.Open;
end;

procedure TFrmCadCategorias.TabSheet7Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Movimentos';
  DM_CadCategorias.Ta_Tipo_Mov.Open;
end;

procedure TFrmCadCategorias.TabSheet8Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Entidades';
  DM_CadCategorias.Ta_Tipo_Entidade.Open;
end;

end.
