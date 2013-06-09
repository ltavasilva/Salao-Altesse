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
    procedure FormShow(Sender: TObject);
  private
  public
    DM_CadCategorias: TDM_CadCategorias;
  end;
var
  FrmCadCategorias: TFrmCadCategorias;

implementation

{$R *.dfm}

procedure TFrmCadCategorias.FormShow(Sender: TObject);
begin
  DM_CadCategorias.Conectar('root', '', 'modular');
end;

procedure TFrmCadCategorias.TabSheet1Show(Sender: TObject);
begin
  Label1.Caption:='Categorias de produtos e serviços';
end;

procedure TFrmCadCategorias.TabSheet2Show(Sender: TObject);
begin
  Label1.Caption:='Situações do documento';
end;

procedure TFrmCadCategorias.TabSheet3Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de E-mail';
end;

procedure TFrmCadCategorias.TabSheet4Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Endereços';
end;

procedure TFrmCadCategorias.TabSheet5Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Telefones';
end;

procedure TFrmCadCategorias.TabSheet6Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Itens';
end;

procedure TFrmCadCategorias.TabSheet7Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Movimentos';
end;

procedure TFrmCadCategorias.TabSheet8Show(Sender: TObject);
begin
  Label1.Caption:='Tipos de Entidades';
end;

end.
