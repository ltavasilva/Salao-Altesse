library Agenda;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{$R *.dres}

uses
  ShareMem,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  System.Types,
  Vcl.Themes,
  Vcl.Styles,
  UFrmAgendaFunc in 'UFrmAgendaFunc.pas' {FrmAgendaFunc},
  UFrmEvento in 'UFrmEvento.pas' {FrmEvento},
  UPesquisar in '..\Modulo Cadastro\UPesquisar.pas' {FrmPesquisar},
  UFrmAgendaServ in 'UFrmAgendaServ.pas' {FrmAgendaServ},
  UFrmControleAgenda in 'UFrmControleAgenda.pas' {FrmControleAgenda};

{$R *.res}

Procedure FrmAgenda(IdUser:Integer); export;
var F: TFrmAgendaServ;
begin
  F := TFrmAgendaServ.Create(Application);
  F.IdUser:=IdUser;
  F.ShowModal;
  FreeAndNil(F);
end;

Procedure FrmAgendaFunc(IdUser:Integer); export;
var F: TFrmAgendaFunc;
begin
  F := TFrmAgendaFunc.Create(Application);
  F.IdUser:=IdUser;
  F.ShowModal;
  FreeAndNil(F);
end;

Procedure FrmControleAgenda(IdUser:Integer); export;
var F: TFrmControleAgenda;
begin
  F := TFrmControleAgenda.Create(Application);
  F.IdUser:=IdUser;
  F.ShowModal;
  FreeAndNil(F);
end;
exports FrmAgenda, FrmAgendaFunc, FrmControleAgenda;

Var Tema: String;
  arq: TextFile;
Begin
  Try
    AssignFile ( arq, 'D:\Empresa\Projects\Salao Altesse\Tema.txt' );
    try
      Reset ( arq );
      ReadLn ( arq, Tema );
    Except
      Tema:='';
    end;
  Finally
    CloseFile(arq);
    if Tema <> '' Then TStyleManager.TrySetStyle(Tema);
  End;
end.
