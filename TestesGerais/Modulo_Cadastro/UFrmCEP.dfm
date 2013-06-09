object FrmCEP: TFrmCEP
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmCEP'
  ClientHeight = 313
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 19
    Caption = 'CEP'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 208
    Top = 8
    Width = 28
    Height = 19
    Caption = 'Tipo'
    FocusControl = DBLookupComboBox1
  end
  object Label3: TLabel
    Left = 8
    Top = 71
    Width = 73
    Height = 19
    Caption = 'Logradouro'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 8
    Top = 134
    Width = 39
    Height = 19
    Caption = 'Bairro'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 45
    Height = 19
    Caption = 'Cidade'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 467
    Top = 201
    Width = 17
    Height = 19
    Caption = 'UF'
    FocusControl = DBEdit5
  end
  object Label7: TLabel
    Left = 515
    Top = 201
    Width = 30
    Height = 19
    Caption = 'Num'
    FocusControl = DBEdit6
  end
  object SpeedButton1: TSpeedButton
    Left = 88
    Top = 32
    Width = 89
    Height = 27
    Caption = 'Buscar CEP'
    OnClick = SpeedButton1Click
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 32
    Width = 81
    Height = 27
    DataField = 'cep'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 208
    Top = 33
    Width = 169
    Height = 27
    DataField = 'Tipo'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 96
    Width = 572
    Height = 27
    DataField = 'logradouro'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 159
    Width = 572
    Height = 27
    DataField = 'bairro'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 225
    Width = 441
    Height = 27
    DataField = 'cidade'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 467
    Top = 225
    Width = 33
    Height = 27
    DataField = 'uf'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 515
    Top = 225
    Width = 65
    Height = 27
    DataField = 'num'
    DataSource = DM_CadPessoal.ds_Tp_Endereco
    TabOrder = 6
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 264
    Width = 108
    Height = 33
    Caption = 'Salvar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 264
    Width = 105
    Height = 33
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 432
    Top = 16
  end
end
