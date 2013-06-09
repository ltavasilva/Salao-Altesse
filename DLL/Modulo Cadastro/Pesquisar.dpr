library Pesquisar;

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
  Vcl.ToolWin,
  StrUtils,
  System.Types,
  Vcl.Themes,
  Vcl.Styles,
  UPesquisar in 'UPesquisar.pas' {FrmPesquisar};

{$R *.res}

function FrmPesquisar(Tipo:TTipo):Integer; export;
var F: TFrmPesquisar;
begin
  F := TFrmPesquisar.Create(Application);
  F.Tipo:=Tipo;
  F.ShowModal;
  Result:=F.ID;
  FreeAndNil(F);
end;

function FrmPesquisarStr(Tipo:TTipo):String; export;
var F: TFrmPesquisar;
begin
  F := TFrmPesquisar.Create(Application);
  F.Tipo:=Tipo;
  F.ShowModal;
  Result:=IntToStr(F.Parent)+';'+IntToStr(F.ID);
  FreeAndNil(F);
end;

exports FrmPesquisar, FrmPesquisarStr;

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
