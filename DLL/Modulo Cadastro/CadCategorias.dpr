library CadCategorias;

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
  IdHTTP,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  StrUtils,
  System.Types,
  Vcl.Themes,
  Vcl.Styles,
  UDM_CadCategorias in 'UDM_CadCategorias.pas' {DM_CadCategorias: TDataModule},
  UFrmCadCategorias in 'UFrmCadCategorias.pas' {FrmCadCategorias};

{$R *.res}

Procedure FrmCadCategorias(IdUser:Integer); export;
var F: TFrmCadCategorias;
begin
  F := TFrmCadCategorias.Create(Application);
  F.IdUser:=IdUser;
  F.ShowModal;
  FreeAndNil(F);
end;

exports FrmCadCategorias;

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
