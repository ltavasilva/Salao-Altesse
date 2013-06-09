library CadClientes;

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
  UFrmCadClientes in 'UFrmCadClientes.pas' {FrmCadClientes};

{$R *.res}

Procedure FrmCadClientes(IdUser:Integer); export;
var F: TFrmCadClientes;
begin
  F := TFrmCadClientes.Create(Application);
  F.ShowModal;
  FreeAndNil(F);
end;

exports FrmCadClientes;

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
