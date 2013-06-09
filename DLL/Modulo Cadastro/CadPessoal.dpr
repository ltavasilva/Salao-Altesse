library CadPessoal;

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
  Vcl.ExtCtrls,
  Vcl.Themes,
  Vcl.Styles,
  UFrmCadPessoal in 'UFrmCadPessoal.pas' {FrmCadPessoal},
  UFrmCEP in 'UFrmCEP.pas' {FrmCEP},
  UFrmTelefone in 'UFrmTelefone.pas' {FrmTelefone},
  UFrmEmail in 'UFrmEmail.pas' {FrmEmail};

{$R *.res}

Procedure FrmCadPessoal(IdUser:Integer; MultiEndereco:Boolean); export;
var F: TFrmCadPessoal;
begin
  F := TFrmCadPessoal.Create(Application);
  F.MultiEndereco:=MultiEndereco;
  F.ShowModal;
  F.Release;
end;

exports FrmCadPessoal;

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
