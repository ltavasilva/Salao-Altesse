object FrmCEP: TFrmCEP
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmCEP'
  ClientHeight = 375
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 19
    Caption = 'CEP'
  end
  object Label2: TLabel
    Left = 160
    Top = 5
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
  end
  object Label4: TLabel
    Left = 8
    Top = 198
    Width = 39
    Height = 19
    Caption = 'Bairro'
  end
  object Label5: TLabel
    Left = 8
    Top = 264
    Width = 45
    Height = 19
    Caption = 'Cidade'
  end
  object Label6: TLabel
    Left = 552
    Top = 264
    Width = 17
    Height = 19
    Caption = 'UF'
  end
  object Label7: TLabel
    Left = 515
    Top = 135
    Width = 30
    Height = 19
    Caption = 'Num'
  end
  object Label8: TLabel
    Left = 8
    Top = 134
    Width = 90
    Height = 19
    Caption = 'Complemento'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 160
    Top = 30
    Width = 169
    Height = 27
    KeyField = 'id_tipo'
    ListField = 'descricao'
    ListSource = DM_CadPessoal.ds_Ta_Tipo_Ende
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 328
    Width = 108
    Height = 33
    Caption = 'Salvar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 328
    Width = 105
    Height = 33
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object JvImgBtn1: TJvImgBtn
    Left = 88
    Top = 32
    Width = 25
    Height = 25
    Hint = 'Buscar o CEP na Internet'
    ImageIndex = 1
    Images = ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = JvImgBtn1Click
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -16
    HotTrackFont.Name = 'Calibri'
    HotTrackFont.Style = []
  end
  object EdCEP: TMaskEdit
    Left = 8
    Top = 32
    Width = 80
    Height = 27
    EditMask = '00000\-999;1;_'
    MaxLength = 9
    TabOrder = 4
    Text = '     -   '
  end
  object EdLogradouro: TEdit
    Left = 8
    Top = 96
    Width = 569
    Height = 27
    TabOrder = 5
  end
  object EdComplemento: TEdit
    Left = 8
    Top = 159
    Width = 489
    Height = 27
    TabOrder = 6
  end
  object EdNum: TEdit
    Left = 512
    Top = 160
    Width = 65
    Height = 27
    TabOrder = 7
  end
  object EdBairro: TEdit
    Left = 8
    Top = 223
    Width = 569
    Height = 27
    TabOrder = 8
  end
  object EdCidade: TEdit
    Left = 8
    Top = 289
    Width = 529
    Height = 27
    TabOrder = 9
  end
  object EdUF: TMaskEdit
    Left = 552
    Top = 289
    Width = 25
    Height = 27
    EditMask = '>LL;0;_'
    MaxLength = 2
    TabOrder = 10
    Text = ''
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    BlendColor = clBtnFace
    Height = 24
    Width = 24
    Left = 408
    Top = 40
    Bitmap = {
      494C010102000800400018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      010082420100824201008242010082420100824201008D480200813900008343
      0D007B4100008245070082420200824201008242010082420100824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF855532FF855532FF985E
      3CFF985E3CFF824E22FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8041040082420100824201008242
      01008242010082420100824201008242010082420100FBF4E0008A725E00DDAE
      9900FFFFF400602B000080430100824201008242010082420100824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF985E3CFFD5B7AEFFF1E7E4FFF1E7
      E4FFDEC6BFFF985E3CFF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      010082420100824201008242010084450000834B000061390F00FFFFF500865F
      49007B5C3B008242010082420100824201008242010082420100824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FFF1E7E4FFDEC6BFFFDEC6BFFFF1E7
      E4FFF1E7E4FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      0100824201008242010082420100813E0500B38E7400FFFBF2005F360F00FFFC
      F400CFAE9A008242010082420100824201008242010082420100824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FFDEC6BFFFDEC6BFFFFFFFFFFFE7D6
      D1FFB58871FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      01008242010082420100824201008C3F06008E5E4600846B4B00FFFCEF007234
      2400783F07008242010082420100824201008242010082420100824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824E22FFE7D6D1FFD5B7AEFFD5B7AEFFF1E7
      E4FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      010082420100824201008242020073420A00FFFCF20098776300DFBEA400FFFF
      ED00844300008242010082420100824201008242010082420100824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FFFFFFFFFFF1E7E4FFF1E7E4FFDEC6BFFF985E
      3CFF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7E41030082420100804202008042
      0200804202008042020088420000FCFFE4006A391100FFFAFA005F2501008F43
      0E00804202008041040080410400804202008041040082400500844201008242
      0100804301007F42040082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FFDEC6BFFFE7D6D1FFDEC6BFFFDEC6BFFF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8444030082410A00864207008642
      070086420700864207006A380000744B3C00FFFBFB00612D0800FFFFF7006A43
      0500833F040086410800854007008541060089390000803D0400874A0A008143
      0300804202008841010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFFB58871FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA36C51FFDEC6BFFFD5B7AEFFDEC6BFFFFFFFFFFFF1E7
      E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEC6BFFFDEC6BFFFF1E7E4FFF1E7
      E4FFCCAA9DFF824100FF824100FF824100FF88430000FFFFF700FDFFFF00FFFF
      FF00FFFFFF00FEFEFE00823900006C2E1000F9ECDC005B250700FDF6E2007A3E
      0A00F3F9F800FFFFFF00FFFFFF00FFFFFF00613D1900FFFFE6006D311400FEF5
      E70044250400943D050082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC19F83FFDEC6BFFFF1E7E4FFDEC6BFFFDEC6BFFFB588
      71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEC6BFFFD5B7AEFFDEC6
      BFFFFFFFFFFF824100FF824100FF824100FF7F40030083491500F9FCFF00FFFF
      FF00FFFFFF00FFFFFF00DBC6B100E9F8E30066281800E2C8C200F4CABE007D40
      0000FFFFF700FFFFFF00FFFFFF00FFFFFF00ECF2F70075421A00F2F8ED007341
      1D00FFF1DD00C8B88E0082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FFD5B7AEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB58871FFD5B7AEFFDEC6BFFFF1E7E4FFE7D6
      D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA36C51FFDEC6BFFFF1E7E4FFFFFF
      FFFFDEC6BFFFA36C51FF824100FF824100FF7F4003007D400000FBF7F600FFFF
      FF00FFFFFF00FFFFFF00FDFAFF0084400500E0BDA900FFFFE600451A0000FFFF
      F2006A320100FFFFFF00FFFFFF00FFFFFF00FFFEFF004A1D000067321100B895
      7B00FFFFF4004C2110007D400000844104000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF855532FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA36C51FFF1E7E4FFDEC6BFFFD5B7AEFFE7D6
      D1FFD5B7AEFFFFFFFFFFFFFFFFFFFFFFFFFFD5B7AEFFE7D6D1FFD5B7AEFFDEC6
      BFFFF1E7E4FFF1E7E4FF824100FF824100FF804104007F430100854B1000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E614C00F6F6E4005A321600FFFFF7005534
      0700783B0300FCFCFC00FFFFFF00FFFFFF00FFFFFE00FFFFFF00C6AC9400FFFF
      EF00632C0700F2F9EC00674121007F4400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FFF1E7
      E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEC6BFFFDEC6BFFFF1E7E4FFF1E7
      E4FFC19F83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA36C51FFDEC6BFFFFFFF
      FFFFF1E7E4FFDEC6BFFF824E22FF824100FF7F4003008242010082420100F9FD
      FE00FDFFFF00FFFFFF00FFFFFF00F4F7FB007B4C2000FFF7E900AF917800FBD2
      BC00FAFBEB0057321000FFFFFE00FFFFFF00FFFFFF00FEFEFE006E3803005A2A
      1200FFEED300B092790073523F00773900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCAA9DFFF1E7E4FFF1E7E4FFDEC6
      BFFFDEC6BFFFB58871FFFFFFFFFFFFFFFFFFFFFFFFFFF1E7E4FFFFFFFFFFDEC6
      BFFFD5B7AEFFDEC6BFFFFFFFFFFF824100FF7F40030082420100824201006D3D
      0900FFFEFD00FEFEFE00FEFEFE00FFFFF80066370400A17C5600A67F6300FFFF
      F3006E2D180091480A00F7FBFF00FFFFFF00FFFFFF00FFFFFF00FFFCF300FFFF
      ED00B29B85008B736700FFFFEB006A2E04000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF985E3CFFDEC6BFFFE7D6D1FFFFFF
      FFFFDEC6BFFFA36C51FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC19F83FFF1E7
      E4FFF1E7E4FFDEC6BFFFD5B7AEFF824100FF7F40030082420100824201008443
      0000F4E1C600F2E3C300F2E2C500FBE2C000FFEAC700BF986C00F7D7AC006C33
      0C00F7CFA500CEA27300FFFBF100FFFFFF00FFFFFF00FFFFFF00F9FFFE008B48
      0F00A5805400FFDFB50071431A00FFE3B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FFB58871FFFFFFFFFFFFFFFFFFFFFFFFFFE7D6D1FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8041040082420100824201007D43
      0100884101008941010089410100864201007D43020079420500844104007643
      04007F42040089470600FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFF9F5007F41
      0500824104007F4204007F4204007F4204000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA36C51FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      0100824201008242010082420100824201008242010082420100824201008242
      01007B420500511F0300FFFFFF00FFFFFF00FFFFFC00FFFEFF00774517008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF985E3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF7F40030082420100824201008242
      0100824201008242010082420100824201008242010082420100824201008242
      010084430000FDFAFC00FFFFFF00FFFFFF00FFFEFF00FFFFFE008C4A03008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF824E22FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8041040082420100824201008242
      0100824201008242010082420100824201008242010082420100824201008242
      010088481100FEFEFE00FFFFFF00FFFFFF00FFFFFE0080634400824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8147
      06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8041040082420100824201008242
      0100824201008242010082420100824201008242010082420100824201008242
      0100FEFDF900FFFFFF00FFFFFF00FFFFFF00FFFDFD0083410000824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8043010082420200824201008242
      0100824201008242010082420100824201008242010082420100864201006E32
      0000FFFDFF00FFFDFF00FFFDFF00FFFDFF00F0D7C30080420200824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8043010082420200824201008242
      0100824201008242010082420100824201008242010082420100844201006E38
      0900863411007F3610007D330F0079360F008041050080410500824201008242
      0100824201008242010082420100824201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1703FFF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF824100FF824100FF824100FF8241
      00FF824100FF824100FF824100FF824100FF8042020084420100844201008442
      0100844201008442010084420100844201008442010084420100824201008442
      0100844201008043010082420100824201008442010084420100844201008442
      0100844201008442010084420100844201000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58871FFA1703FFFA1703FFFA170
      3FFFA1703FFFA1703FFFA1703FFFA1703FFFA1703FFFA1703FFFA1703FFFA170
      3FFFA1703FFFA1703FFFA1703FFFA1703FFFA1703FFFA1703FFFA1703FFFA170
      3FFFA1703FFFA1703FFFA1703FFFA1703FFF7D42040080410400804104008042
      0200804104008042020080410400804104008042020080410400804202008041
      0400804104008242020084410400804202008041040080410400804202008041
      0400804202008041040080410400804202000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
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
    Left = 352
    Top = 40
  end
end