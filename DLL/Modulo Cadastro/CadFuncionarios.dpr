library CadFuncionarios;

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
  UFrmCadFuncionarios in 'UFrmCadFuncionarios.pas' {FrmCadFuncionarios},
  UFrmAcessos in 'UFrmAcessos.pas' {FrmAcessos};

{$R *.res}

Procedure FrmCadFuncionarios(IdUser:Integer); export;
var F: TFrmCadFuncionarios;
begin
  F := TFrmCadFuncionarios.Create(Application);
  F.ShowModal;
  FreeAndNil(F);
end;

exports FrmCadFuncionarios;

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
