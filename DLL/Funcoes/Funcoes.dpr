library Funcoes;

uses
  ShareMem,
  Windows,
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
  IdHashMessageDigest,
  UDM_Config in 'UDM_Config.pas' {DM_Config: TDataModule};

{$R *.res}

Function GetValorById(Tabela, Key, Field: String; ID: Integer):String; export;
Begin
  With DM_Config do
  Begin
    Qry_Geral.Close;
    Qry_Geral.CommandText:='Select * from '+ Tabela +
      ' where '+Key+' = ' + IntToStr(ID);
    Qry_Geral.Open;
    Result:=Qry_Geral.FieldByName(Field).AsString;
    Qry_Geral.Close;
  End;
End;

function MyData(Value: TDate): String; export;
var
  Dia, Mes, Ano: Word;
  Data:String;
begin
  Data:='';
  DecodeDate(Value, Ano, Mes, Dia);
  Data:=IntToStr(Ano)+'-'+FormatFloat('00', Mes)+'-'+FormatFloat('00', Dia);
  Result:=Data;
end;

Function ConfigSistem:String; export;
Var Config:String;
Begin
  DM_Config:=TDM_Config.Create(Application);
  With DM_Config do
  Begin
    Qry_Geral.Close;
    Qry_Geral.CommandText:='select * from tbl_config';
    Qry_Geral.Open;
    Config:=Qry_Geral.FieldValues['tema'];
    Config:=Config+';'+IntToStr(Qry_Geral.FieldValues['multiEndereco']);
    Result:=Config;
    Qry_Geral.Close;
  End;
End;

function CheckAcesso(IdUser:Integer; Perfil: String):Boolean; export;
Begin
  With DM_Config do
  Begin
    Qry_Geral.Close;
    Qry_Geral.CommandText:='select * from tbl_acesso where id_funcionario = '+
      IntToStr(IdUser) + ' and perfil like ' + '%'+Perfil+'%';
    Qry_Geral.Open;
    Result := Qry_Geral.RecordCount = 1;
    Qry_Geral.Close;
  End;
End;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

Function AbreviarNome(Nome:String):String; export;
Var SNome:TStrings;
  pRet:PChar;
Begin
  SNome:=TStringList.Create;
  Split(' ', Nome, Snome);
  Result:=SNome[0];
  if SNome.Count > 1 then 
  Begin
    Result:=Result + ' ' + Copy(SNome[1], 1, 1) + '.';
    GetMem(pRet,Length(Nome)+Length(SNome[0])+Length(SNome[1]));
  End
    else GetMem(pRet,Length(Nome)+Length(SNome[0]));

  FreeMem(pRet);
End;

function MD5String(Value: String): String; export;
var
  xMD5: TIdHashMessageDigest5;
  pRet : PChar;
begin
  xMD5 := TIdHashMessageDigest5.Create;
  try
    Result := xMD5.HashStringAsHex(Value);
  finally
    xMD5.Free;
    GetMem(pRet,Length(Value)+Length(Result));
    FreeMem(pRet);
  end;
end;

function MD5Arquivo(const Value: String): String; export;
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

function WebServiceCEP(CEP:String; idhttp1: TIdHTTP):String; export;
var
  Encode : TEncoding;
  InfoCEP: String;
begin
  Encode := TEncoding.GetEncoding('iso-8859-1');
  Try
  InfoCEP:=stringreplace(idhttp1.URL.URLDecode(
    idhttp1.Get('http://republicavirtual.com.br/web_cep.php?cep='+
    CEP+'&formato=query_string'), Encode),'&',#13#10,[rfreplaceAll]);

  InfoCEP:=stringreplace(InfoCEP, '+', ' ',[rfreplaceAll]);
  Except
    Application.MessageBox('Não foi possível consultar o CEP.'+#13+
      'Por favor tente mais tarde ou insira o endereço manualmente.',
      'Erro', MB_ICONERROR);
  End;
  Result:=InfoCEP;
end;

Function GeraLogin(Nome:String): String; export;
Var Str: TStringDynArray ;
  Res: String;
  I: Integer;
Begin
  Str:=SplitString(Nome, ' ');
  Res:='';
  for I := 0 to Length(Str) - 2 do
  Begin
    Res:=Res+Copy(Str[I],1,1);
  End;
  Res:=Res+Str[I];
  Result:=Res;
End;

Function GeraSenha(CPF:String): String; export;
Begin
  if CPF = '' then
  Begin
    Result:='123';
  end else
  Begin
    Result:=Copy(CPF, 1, 3);
  End;
End;

Function Q(Str:String):String; export;
Begin
  Result:=QuotedStr(Str);
End;

procedure SetVisibComandos(Tool: TToolBar; Tipo:String); export;
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

procedure SetVisibComandosSemExclusao(Tool: TToolBar; Tipo:String); export;
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

procedure SetVisibComandosComNovo(Tool: TToolBar; Tipo:String); export;
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

function ValidarCPF(Valor: string): boolean; export;
var n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
       d1,d2: integer;
       digitado, calculado, CPF: string;
       pRet:PChar;
begin
  Result:=false;
  CPF:=ReplaceStr(Valor, '.', '');
  CPF:=ReplaceStr(Valor, '-', '');
  n1:=StrToInt(Valor[1]);
  n2:=StrToInt(Valor[2]);
  n3:=StrToInt(Valor[3]);
  n4:=StrToInt(Valor[4]);
  n5:=StrToInt(Valor[5]);
  n6:=StrToInt(Valor[6]);
  n7:=StrToInt(Valor[7]);
  n8:=StrToInt(Valor[8]);
  n9:=StrToInt(Valor[9]);

  d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);

  if d1>=10 then d1:=0;
  d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:=11-(d2 mod 11);

  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=Valor[10]+Valor[11];

  if calculado=digitado then
    Result:=true;
  GetMem(pRet,Length(Valor)+Length(digitado)+Length(calculado)+Length(CPF));
  FreeMem(pRet);
end;

function ValidarCNPJ(numCNPJ: string): boolean; export;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
ret:=False;
cnpj:='';
//Analisa os formatos
if Length(numCNPJ) = 18 then
	if (Copy(numCNPJ,3,1) + Copy(numCNPJ,7,1) + Copy(numCNPJ,11,1) + Copy(numCNPJ,16,1) = '../-') then
  begin
		cnpj:=Copy(numCNPJ,1,2) + Copy(numCNPJ,4,3) + Copy(numCNPJ,8,3) + Copy(numCNPJ,12,4) + Copy(numCNPJ,17,2);
		ret:=True;
  end;

  if Length(numCNPJ) = 14 then
	begin
    cnpj:=numCNPJ;
    ret:=True;
	end;

  //Verifica
  if ret then
	begin
    try
      //1° digito
      total:=0;
      for x:=1 to 12 do
      begin
        if x < 5 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
      end;
      dg1:=11 - (total mod 11);
      if dg1 > 9 then dg1:=0;

      //2° digito
      total:=0;
      for x:=1 to 13 do
      begin
        if x < 6 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
      end;

      dg2:=11 - (total mod 11);
      if dg2 > 9 then dg2:=0;

      //Validação final
      if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
        ret:=True
      else
        ret:=False;
    except
      ret:=False;
		end;

	//Inválidos
	case AnsiIndexStr(cnpj,['00000000000000','11111111111111','22222222222222',
    '33333333333333','44444444444444','55555555555555','66666666666666',
    '77777777777777','88888888888888','99999999999999']) of

		0..9:   ret:=False;

		end;
	end;
  Result:=ret;
end;

exports GetValorById, MyData, ConfigSistem, CheckAcesso, Split,
  MD5String, MD5Arquivo, WebServiceCEP, AbreviarNome,
  GeraLogin, GeraSenha, Q, SetVisibComandos, SetVisibComandosSemExclusao,
  SetVisibComandosComNovo, ValidarCPF, ValidarCNPJ;

Begin
end.
