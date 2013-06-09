library CadProdutos;

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
  UFrmCadProdutos in 'UFrmCadProdutos.pas' {FrmCadProdutos};

{$R *.res}

Procedure FrmCadProdutos(IdUser:Integer); export;
var F: TFrmCadProdutos;
begin
  F := TFrmCadProdutos.Create(Application);
  F.ShowModal;
  FreeAndNil(F);
end;

exports FrmCadProdutos;

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
