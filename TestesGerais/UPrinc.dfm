object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 165
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BtnCadPessoais: TButton
    Left = 8
    Top = 8
    Width = 139
    Height = 33
    Caption = 'Cadastro Pessoal'
    TabOrder = 0
    OnClick = BtnCadPessoaisClick
  end
  object BtnCadClientes: TButton
    Left = 153
    Top = 8
    Width = 139
    Height = 33
    Caption = 'Cadastro Clientes'
    TabOrder = 1
    OnClick = BtnCadClientesClick
  end
  object Button1: TButton
    Left = 298
    Top = 8
    Width = 139
    Height = 33
    Caption = 'Cadastro Fornecedores'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 47
    Width = 139
    Height = 33
    Caption = 'Cadastro Produtos'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 153
    Top = 47
    Width = 139
    Height = 33
    Caption = 'Cadastro Servi'#231'os'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 298
    Top = 47
    Width = 139
    Height = 33
    Caption = 'Cadastro Categorias'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 86
    Width = 139
    Height = 33
    Caption = 'Cadastro Funcion'#225'rios'
    TabOrder = 6
    OnClick = Button5Click
  end
  object JvBitBtn1: TJvBitBtn
    Left = 232
    Top = 120
    Width = 75
    Height = 25
    Caption = 'JvBitBtn1'
    TabOrder = 7
    OnClick = JvBitBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
end
