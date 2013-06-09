unit UFrmControleAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvLinkLabel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.DBCtrls, Vcl.DBCGrids,
  Vcl.Buttons, Datasnap.DBClient;

type
  TFrmControleAgenda = class(TForm)
    Label1: TLabel;
    TimerAgenda: TTimer;
    StatusBar1: TStatusBar;
    DBCtrlGrid1: TDBCtrlGrid;
    DBServico: TDBText;
    DBCliente: TDBText;
    DBData: TDBText;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Conexao: TADOConnection;
    Qry_Agenda: TADOQuery;
    DBSituacao: TDBText;
    Label6: TLabel;
    ds_Tbl_Agenda: TDataSource;
    DBImage1: TDBImage;
    Tbl_Agenda: TADOTable;
    Tbl_Agendaid: TIntegerField;
    Tbl_Agendadescricao: TStringField;
    Tbl_Agendafigura: TBlobField;
    Tbl_Agendadata_planejada: TDateTimeField;
    Tbl_Agendaservico: TStringField;
    Tbl_Agendacliente: TStringField;
    Tbl_Agendaprestador: TStringField;
    Tbl_Agendadif: TTimeField;
    Tbl_Agendasituacao: TIntegerField;
    Relogio: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Consultar_Agenda(Sender: TObject);
    procedure RelogioTimer(Sender: TObject);
    procedure TimerAgendaTimer(Sender: TObject);
  private
    Agora:TDateTime;
  public
    IdUser: Integer;
  end;

var
  FrmControleAgenda: TFrmControleAgenda;

implementation

{$R *.dfm}

procedure TFrmControleAgenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Conexao.Close;
end;

procedure TFrmControleAgenda.FormShow(Sender: TObject);
begin
  Tbl_Agenda.Open;
  RelogioTimer(Sender);
  Consultar_Agenda(Sender);
end;

procedure TFrmControleAgenda.RelogioTimer(Sender: TObject);
begin
  Agora:=Now;
  StatusBar1.Panels[0].Text:=DateTimeToStr(Agora);
end;

procedure TFrmControleAgenda.Consultar_Agenda(Sender: TObject);
var I: Integer;
begin
  if Tbl_Agenda.RecordCount > 0 then
    Tbl_Agenda.First;
  while Not Tbl_Agenda.Eof do
    Tbl_Agenda.Delete;
  Qry_Agenda.ExecSQL;
  Tbl_Agenda.Requery();
end;

procedure TFrmControleAgenda.TimerAgendaTimer(Sender: TObject);
begin
  Consultar_Agenda(Sender);
end;

end.
