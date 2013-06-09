program SMC;

{$R *.dres}

uses
  ShareMem,
  Vcl.Forms,
  System.StrUtils,
  System.Types,
  System.SysUtils,
  UPrinc in 'UPrinc.pas' {FPrinc},
  UConfigSistema in 'UConfigSistema.pas' {FrmConfigSistema},
  Vcl.Themes,
  Vcl.Styles;

Var ConfigSys, Tema:String;
  MultiEndereco:Boolean;
  Config:TStringDynArray;

Function ConfigSistem:String; External 'funcoes.dll';

{$R *.res}

begin
  Application.Initialize;
  ConfigSys:=ConfigSistem;
  Config:=SplitString(ConfigSys, ';');
  Tema:=Config[0];
  MultiEndereco:=StrToInt(Config[1]) = 1;

  Application.MainFormOnTaskbar := True;
  if Tema <> '' Then TStyleManager.TrySetStyle(Tema);
  Application.CreateForm(TFPrinc, FPrinc);
  FPrinc.IdUser:=1;
  FPrinc.Tema:=Tema;
  FPrinc.MultiEndereco:=MultiEndereco;
  Application.CreateForm(TFrmConfigSistema, FrmConfigSistema);
  Application.Run;
end.
