unit UConfigSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Themes, JPEG, Vcl.Styles, Vcl.Imaging.pngimage, Data.DB, Data.SqlExpr,
  Data.DBXMySQL, Data.FMTBcd, Data.Win.ADODB, Vcl.DBCtrls, Vcl.Mask,
  Vcl.DBCGrids, Vcl.ImgList;

type
  TFrmConfigSistema = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Label1: TLabel;
    Image1: TImage;
    Conexao: TADOConnection;
    Qry_Config: TADOQuery;
    Qry_Configid: TAutoIncField;
    Qry_Configtema: TStringField;
    Qry_Configmultiendereco: TIntegerField;
    Qry_Config1: TADOQuery;
    Qry_Config1id: TAutoIncField;
    Qry_Config1tema: TStringField;
    Qry_Config1multiendereco: TIntegerField;
    DBCtrlGrid1: TDBCtrlGrid;
    Tbl_Atraso: TADOTable;
    Tbl_Atrasoid: TAutoIncField;
    Tbl_Atrasodescricao: TStringField;
    Tbl_Atrasoprazo: TFloatField;
    Tbl_Atrasofigura: TBlobField;
    DBEdit1: TDBEdit;
    ds_Tbl_Atraso: TDataSource;
    Label2: TLabel;
    BtnSalvar: TButton;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBImage1: TDBImage;
    ImageList1: TImageList;
    Notheme: TCheckBox;
    procedure BtnSalvarClick(Sender: TObject);
    procedure SetImage(Figura: String);
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigSistema: TFrmConfigSistema;

implementation

{$R *.dfm}

uses UPrinc;

procedure TFrmConfigSistema.BtnSalvarClick(Sender: TObject);
Var Multi:String;
  arq: TextFile;
begin
  Multi:='0';
  if CheckBox1.Checked then
    Multi:='1';
  FPrinc.MultiEndereco:=CheckBox1.Checked;

  FPrinc.Tema:=ListBox1.Items.Strings[ListBox1.ItemIndex];
  if Notheme.Checked then FPrinc.Tema := '';

  Try
    AssignFile (arq, 'D:\Empresa\Projects\Salao Altesse\Tema.txt');
    try
      rewrite(arq);
      Write (arq, FPrinc.Tema);
    Except
      FPrinc.Tema:='';
    end;
  Finally
    CloseFile(arq);
    Application.MessageBox('As alterações de temas terão efeito após '+
      'reiniciar o sistema!', 'Informação', MB_ICONINFORMATION);
  End;

  Qry_Config.SQL.Text:='UPDATE tbl_config SET tema='''+FPrinc.Tema+
    ''', multiendereco='+Multi+' WHERE id=1';
  Qry_Config.ExecSQL;
  Close;
end;

procedure TFrmConfigSistema.SetImage(Figura: String);
var
  png: TPngImage;
begin
  Try
    png := TPngImage.Create;
    try
      png.LoadFromResourceName(HInstance, Figura);
      Image1.Picture.Assign(png);
    finally
      png.Free;
    end;
  Except

  end;
end;

procedure TFrmConfigSistema.FormShow(Sender: TObject);
begin
  ListBox1.ItemIndex:=ListBox1.Items.IndexOf(FPrinc.Tema);
  if ListBox1.ItemIndex >= 0 then
    ListBox1Click(sender)
  else
    Notheme.Checked := True;
  Qry_Config1.Open;
  CheckBox1.Checked:=Qry_Config1multiendereco.Value = 1;
  Qry_Config1.Close;
  Tbl_Atraso.Open;
end;

procedure TFrmConfigSistema.ListBox1Click(Sender: TObject);
begin
  SetImage('PngImage_'+IntToStr(ListBox1.ItemIndex + 1));
  Notheme.Checked:=False;
end;

end.
