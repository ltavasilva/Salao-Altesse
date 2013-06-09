library CadFornecedores;

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
  UFrmCadFornecedores in 'UFrmCadFornecedores.pas' {FrmCadFornecedores};

{$R *.res}

Procedure FrmCadFornecedores(IdUser:Integer); export;
var F: TFrmCadFornecedores;
begin
  F := TFrmCadFornecedores.Create(Application);
  F.ShowModal;
  FreeAndNil(F);
end;

exports FrmCadFornecedores;

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
