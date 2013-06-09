unit UFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdHTTP,
  Vcl.ComCtrls, Vcl.ToolWin, StrUtils, System.Types, IdHashMessageDigest;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
function MD5String(const Value: string): string;
function MD5Arquivo(const Value: string): string;
function WebServiceCEP(CEP:String; idhttp1: TIdHTTP):String;
Function GeraLogin(Nome:String): String;
Function GeraSenha(CPF:String): String;
Function Q(Str:String):String;
procedure AnimePanel(Sender: TObject; Expandir:Boolean; Min, Max,
  Incremento: Integer);
procedure SetVisibComandos(Tool: TToolBar; Tipo:String);
procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String);
procedure SetVisibComandosComNovo(Tool: TToolBar; Tipo:String);

implementation

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

function MD5String(const Value: string): string;
var
  xMD5: TIdHashMessageDigest5;
begin
  xMD5 := TIdHashMessageDigest5.Create;
  try
    Result := xMD5.HashStringAsHex(Value);
  finally
    xMD5.Free;
  end;
end;

function MD5Arquivo(const Value: string): string;
var
  xMD5: TIdHashMessageDigest5;
  xArquivo: TFileStream;
begin
  xMD5 := TIdHashMessageDigest5.Create;
  xArquivo := TFileStream.Create(Value, fmOpenRead OR fmShareDenyWrite);
  try
    Result := xMD5.HashStreamAsHex(xArquivo);
  finally
    xArquivo.Free;
    xMD5.Free;
  end;
end;

function WebServiceCEP(CEP:String; idhttp1: TIdHTTP):String;
var
  Encode : TEncoding;
  InfoCEP: String;
begin
  Encode := TEncoding.GetEncoding('iso-8859-1');

  InfoCEP:=stringreplace(idhttp1.URL.URLDecode(
    idhttp1.Get('http://republicavirtual.com.br/web_cep.php?cep='+
    CEP+'&formato=query_string'), Encode),'&',#13#10,[rfreplaceAll]);

  InfoCEP:=stringreplace(InfoCEP, '+', ' ',[rfreplaceAll]);
  Result:=InfoCEP;
end;

Function GeraLogin(Nome:String): String;
Var Str: TStringDynArray ;
  Res: String;
  I: Integer;
Begin
  //Str:= TStrings.Create;
  Str:=SplitString(Nome, ' ');
  Res:='';
  for I := 0 to Length(Str) - 2 do
  Begin
    Res:=Res+Copy(Str[I],1,1);
  End;
  Res:=Res+Str[I];
  Result:=Res;
End;

Function GeraSenha(CPF:String): String;
Begin
  if CPF = '' then
  Begin
    Result:='123';
  end else
  Begin
    Result:=Copy(CPF, 1, 3);
  End;
End;

Function Q(Str:String):String;
Begin
  Result:=QuotedStr(Str);
End;

procedure AnimePanel(Sender: TObject; Expandir:Boolean; Min, Max,
  Incremento: Integer);
Var Pan: TControl;
  I, Passos, Fim: Integer;
Begin
  Pan:= TControl(Sender);
  Passos:= round((Max - Min) / Incremento);

  for I := 0 to Passos do
  Begin
    if Expandir then Begin
      Pan.Height:=Pan.Height + Incremento;
      if Pan.Height > Max then Pan.Height := Max;
      Fim:=Max;
    End
    else Begin
      Pan.Height:=Pan.Height - Incremento;
      if Pan.Height < Min then Pan.Height := Min;
      Fim:=Min;
    End;
    Application.ProcessMessages;
  End;
  Pan.Height:=Fim;
End;

procedure SetVisibComandos(Tool: TToolBar; Tipo:String);
Begin
  case AnsiIndexStr(UpperCase(Tipo), ['PADRAO', 'EDITANDO','ABERTO']) of
    0:Begin
      Tool.Buttons[0].Visible:=True;
      Tool.Buttons[1].Visible:=False;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=False;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=False;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
    1:Begin
      Tool.Buttons[0].Visible:=False;
      Tool.Buttons[1].Visible:=False;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=True;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=True;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
    2:Begin
      Tool.Buttons[0].Visible:=True;
      Tool.Buttons[1].Visible:=True;
      Tool.Buttons[2].Visible:=True;
      Tool.Buttons[3].Visible:=False;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=False;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
  end;
End;

procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String);
Begin
  case AnsiIndexStr(UpperCase(Tipo), ['PADRAO', 'EDITANDO','ABERTO']) of
    0:Begin
      Tool.Buttons[0].Visible:=False;
      Tool.Buttons[1].Visible:=False;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=False;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=False;
      Tool.Buttons[6].Visible:=False;
      Tool.Buttons[7].Visible:=True;
    end;
    1:Begin
      Tool.Buttons[0].Visible:=False;
      Tool.Buttons[1].Visible:=False;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=True;
      Tool.Buttons[4].Visible:=True;
      Tool.Buttons[5].Visible:=True;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
    2:Begin
      Tool.Buttons[0].Visible:=False;
      Tool.Buttons[1].Visible:=True;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=False;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=False;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
  end;
End;

procedure SetVisibComandosComNovo(Tool: TToolBar; Tipo:String);
Begin
  case AnsiIndexStr(UpperCase(Tipo), ['PADRAO', 'EDITANDO','ABERTO']) of
    0:Begin
      Tool.Buttons[0].Visible:=False;
      Tool.Buttons[1].Visible:=False;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=False;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=False;
      Tool.Buttons[6].Visible:=False;
      Tool.Buttons[7].Visible:=True;
    end;
    1:Begin
      Tool.Buttons[0].Visible:=False;
      Tool.Buttons[1].Visible:=False;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=True;
      Tool.Buttons[4].Visible:=True;
      Tool.Buttons[5].Visible:=True;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
    2:Begin
      Tool.Buttons[0].Visible:=True;
      Tool.Buttons[1].Visible:=True;
      Tool.Buttons[2].Visible:=False;
      Tool.Buttons[3].Visible:=False;
      Tool.Buttons[4].Visible:=False;
      Tool.Buttons[5].Visible:=False;
      Tool.Buttons[6].Visible:=True;
      Tool.Buttons[7].Visible:=True;
    end;
  end;
End;

end.
