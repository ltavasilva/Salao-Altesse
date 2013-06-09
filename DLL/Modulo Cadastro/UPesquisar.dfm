object FrmPesquisar: TFrmPesquisar
  Left = 0
  Top = 0
  Caption = 'Pesquisar'
  ClientHeight = 456
  ClientWidth = 885
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    885
    456)
  PixelsPerInch = 96
  TextHeight = 19
  object Label17: TLabel
    Left = 8
    Top = 8
    Width = 497
    Height = 19
    Caption = 
      'Digite o valor a ser pesquisado (Nome, RG, CPF, CNPJ, Data Nasci' +
      'mento, etc)'
  end
  object EdPesquisar: TEdit
    Left = 8
    Top = 33
    Width = 497
    Height = 27
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdPesquisarChange
  end
  object Grid_Res_Pesquisa: TDBGrid
    Left = 8
    Top = 66
    Width = 869
    Height = 382
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds_Query
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Calibri'
    TitleFont.Style = []
    OnDblClick = BtnSelecionarClick
  end
  object BtnCancelar: TJvXPButton
    Left = 772
    Top = 27
    Width = 105
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 2
    Glyph.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      00180806000000E0773DF80000000473424954080808087C0864880000000970
      48597300000AF000000AF00142AC34980000001874455874536F667477617265
      0041646F62652046697265776F726B734FB31F4E000004994944415478DAB595
      6B4C1C551480EF9DD7BEA0CB6B2B08DB4A29500AC89677235BBA8D543144128A
      567E343EA2C698909A261A93461393FED2A0A6313135B5FCD0625BACD6D06AD3
      42299412452C4481B4815624A1227477A7FB7ECCCCF5DC9D5D6005A26DEC64EF
      EC9D3BE79CEF9E33E79C8B0921E8415EF85E005730163042A48690F0FF0698B2
      9635B27A4D134896225936218C0862D839B80F85EDEECEBCE1B1EEFB028C5794
      D83446CD8744912DB22F88647F00215951953816313A2D62751A8418662078C7
      B3BF6874E2DA7F068CD594EDE704FC714874A390E881A01084194CC5A3120411
      19D65806F1C98948586790C201795FF1E0C8897F058C5A2B5EE4B074CC37E740
      72288C18D82D482818633766D93998B34851B289A2B0119424230E3CD1AD4F46
      6189A9DF7675F8FC9A809F6D8F657361EF0DDFBC83574011DC8FEC1633AC5F6B
      36D797F70CF445E4AC55D992E86C9183C17720845AEA0DA715902E2DC911E212
      3757F5F63B57050C594BBF0A3AC5E742DE40C47DBAF54854688838FE96CEBCE1
      F1EAEEFEDF63F203DB4B2D61BBBD9BC8522A85688D06C427193FA8EC1B7E6B05
      E0C7C6FA8742B3D3333E874B807020BA8EA9F5C5B0C3332FCCEAB3B26A6B7AAE
      DC8C19B8BCBDAC2EB8307F0145EDE8538D0B429E6563D597C7FD7180FEDA8A66
      FFC29DCE903F84C03E62B5DA5F1449CA219294145988421881BFADCBCCDA61EB
      1958847CBF35A74F09047650531A8316E9D2D3ADD6EEAB037180F3E545EF05C4
      BBEF12457D1652531B189E9F0FCCCF0F1259E6F03208E6F9598379C3CEBA9EFE
      29BAD455BCE54DC9EB799FCE695268D625BCFCE4F0F8E771806F8BF30E87BDBE
      5635701869D34CB6A77FBA76F9BBCA6DBB830EFB5980F02B20990FD73ED53B78
      F37451EE0BB2CFDFAEEA82F70CF3DA9EC9992371809345B987C25EEFC14838E0
      A75967DCFBCCC8C429FAEE7465495DC0E138472171E1826F9292975FEA9AF9A3
      31E4717F160B192B685E69B97EEB681CE0B8A5B0257457EC8829737A7DFBBE89
      A997624A272A2CBB03514F9643588DE606A4B328FBFD55EAE630D2A79976ED1D
      1AE98D03743EB12B4B9C9A9C8E151066187FF2A64D5B9B2FF64DC7205FA810EA
      09B70841B134C7AA571C27A657569B1B3A4E7956D4C191829C2EC9E76F408C2A
      CC0AC2AFA6FC02DB9EAE1F1C3199F6F2923ABFD3710620FA25C8522AF306C3A7
      AF8E4FBEBE6AA11DABA92A74DD9E1D23D0D422BAF00AF3DC34A7D3BD9D915F70
      B6E9EB335E2A77B4BAFC59EF5F731D84A8DE466DD30CF225E5E46E7EFEC2A53F
      D7EC45871FDD7220E072B52DDF15CD1EE8430B10369AFB8C22CB9910CA0C3A8F
      850963062AD9D8D23A3A11D7F056EDA66D457987821EEF41D8A15ACD4BB4A578
      2FAED05E05C613125B0FFC76FD937FDA5AF33CF8C852D8E471BBDBA0921F21CB
      4C2F2A22B59540314E242426B6BE31327669353B110094A91EE6C93074300499
      B664845C1B4DA68C9D064D730A423681901C306AA04AD0BB5DD050261708BA78
      CEE5FD46743A45885502F805AA280483F621A744882F0680A30925C0A0FF3C52
      01ACAC2A78E919664E4B495E4F9448E6CC12EC99B3DB45CA826160D56F214707
      3DAF83303C0008DED3A17F3FD70307FC0D84C33FEFFFDDD09A0000000049454E
      44AE426082}
    Anchors = [akTop, akRight]
    OnClick = BtnCancelarClick
  end
  object BtnSelecionar: TJvXPButton
    Left = 661
    Top = 27
    Width = 105
    Height = 33
    Caption = 'selecionar'
    TabOrder = 3
    Glyph.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      00180806000000E0773DF80000000473424954080808087C0864880000000970
      48597300000AF000000AF00142AC34980000001874455874536F667477617265
      0041646F62652046697265776F726B734FB31F4E000003064944415478DAD595
      6B48145114C7EFB933BB3BEE6EF840344B84200CFA50E00BA4CD1E82A84B4510
      91541F5A8B7C80421FEA43911144D2A75EF600DB403130292252CB422229A8B4
      35CB4A53B15ABFF8205BDDC7EC3C6E7776671F6A6AA511DEE1CFDC39F79EF33B
      73CF19060821E85F0E581200C80074E5328A2ECE20DF171D50DB698A47C03511
      22AD0680B3FBD7B7562E1AA0EE5D8E4190E417BC30B04E224EA4631211CBC4B6
      4BF2648125E579DF8201565B4EB35BE8CF95E40904884532F15240149D636B49
      466FE18200376CE6536EEF970AAF344A036AC256880303D95A9E39D4F1D700AB
      6DD716A7F75BAB5BB0230025782006F00C66371DC9EC7B396B0DA014E0EA81FC
      63B46803C5E90F6F4F0F7EABBB68D998B3E7D3243FB882EEA6979A379D31C06C
      3B6AEA7D30255E38A0DAB61C7BC5F4FBBCF8C38CB11669B0B1AC24FDDEA57087
      AA57E65A073FB84F943D347B1C88AECC4F1CCFEA39333DA120A0A6AB2862821F
      6E7078EC669730E2738ED425214E1353569A7EC707B9D6B13B7FDCFDB5D1258C
      220C6C28088247159B3FE6FEEA388380CAB66C934774B4D1EC7DCE44B9888422
      B944A4D7C41C1EF3F4D619D8B8CFE36E7B423073FF1867804B3E9DFD66644E40
      7963929105433300630A150D21599650B47E25D26B23EDC313FD89A22CD0B783
      E03A0666CFB9DCAEFAD91A624A0D8A1A5239ADCEFB985A4CA110C48763694D44
      890F9EBB62C3089A2E6CEF32CFD57133BAC8529FC66959EF136ADD006176E2EB
      93702C72B158B7A66AE76BFB1F0194B1B7262D8265BD2D74C90430D349716130
      2EBF59D07911CD3366FDD0F2CEA77246A3E07B93194E086C0D07DFA6CC177C4E
      80AF261F7668869E0E5208C90A7DAC40B43A4DCADDC2F6CEDF06B0FECA298DCD
      A8520E064B0889091BE375C979B12D58C7A42A0E9253B23E3BD97D886E8A42A1
      76935529CF922A5124440E008CD4104765A0D2A9305685F05ABD865B6B596551
      9EDF5F1FA8960591803F914050E52EAAE2A99C54C314301900203573AC0A0277
      3AC1D44BA2FB5CFE1302032533C41F385CE1304512052C917FF27F05FC046315
      6DE047F1B4710000000049454E44AE426082}
    Anchors = [akTop, akRight]
    OnClick = BtnSelecionarClick
  end
  object Inativos: TCheckBox
    Left = 537
    Top = 38
    Width = 110
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Listar Inativos'
    TabOrder = 4
    OnClick = InativosClick
  end
  object Conexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 104
    Top = 72
  end
  object Query_Clientes: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM modular.tbl_pessoal pes '
      
        #9'left join modular.tbl_endereco en on pes.id_pessoal = en.id_pes' +
        'soal'
      
        #9'left join modular.tbl_telefones tel on pes.id_pessoal = tel.id_' +
        'pessoal'
      
        #9'left join modular.tbl_email ema on pes.id_pessoal = ema.id_pess' +
        'oal;')
    Left = 208
    Top = 72
    object Query_Clientesid_pessoal: TAutoIncField
      DisplayLabel = 'Chapa'
      DisplayWidth = 7
      FieldName = 'id_pessoal'
      ReadOnly = True
    end
    object Query_Clientesnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 26
      FieldName = 'nome'
      Size = 150
    end
    object Query_Clientesdata_nasci: TDateField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 11
      FieldName = 'data_nasci'
    end
    object Query_Clientesrg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 11
      FieldName = 'rg'
      Size = 12
    end
    object Query_Clientescpf: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 14
      FieldName = 'cpf'
      Size = 15
    end
  end
  object ds_Query: TDataSource
    Left = 104
    Top = 144
  end
  object Query_Servicos: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct pes.id_pessoal, pes.nome Fornecedor, prd.tipo, p' +
        'rd.categoria, '
      
        'prd.cod_barras, prd.descricao, prd.ativo, prd.id_item from tbl_f' +
        'ornecedores forn '
      'inner join tbl_pessoal pes on forn.id_fornec = pes.id_pessoal '
      
        'left join (select distinct itm.*, atip.descricao tipo, acat.desc' +
        'ricao categoria '
      'from tbl_itens itm '
      
        'left join tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_' +
        'tipo_item '
      
        'left join tbl_aux_categoria_itens acat on itm.id_categoria = aca' +
        't.id_categoria'
      
        'where atip.id_tipo_item = 1) prd on forn.id_fornec = prd.id_forn' +
        'ecedor')
    Left = 304
    Top = 72
    object Query_ServicosFornecedor: TStringField
      DisplayWidth = 25
      FieldName = 'Fornecedor'
      Size = 150
    end
    object Query_ServicosTipo: TStringField
      DisplayWidth = 10
      FieldName = 'Tipo'
      Size = 45
    end
    object Query_ServicosCategoria: TStringField
      DisplayWidth = 14
      FieldName = 'Categoria'
      Size = 45
    end
    object Query_ServicosCod_Barras: TStringField
      DisplayLabel = 'Cod Barras'
      DisplayWidth = 11
      FieldName = 'Cod_Barras'
      Size = 45
    end
    object Query_Servicosdescricao: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 35
      FieldName = 'descricao'
      Size = 45
    end
    object Query_Servicosativo: TIntegerField
      DisplayLabel = 'Ativo'
      DisplayWidth = 5
      FieldName = 'ativo'
    end
    object Query_Servicosid_item: TIntegerField
      FieldName = 'id_item'
      Visible = False
    end
    object Query_Servicosid_pessoal: TIntegerField
      FieldName = 'id_pessoal'
      Visible = False
    end
  end
  object Query_Produtos: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct pes.id_pessoal, pes.nome Fornecedor, prd.tipo, p' +
        'rd.categoria,'
      
        'prd.cod_barras, prd.descricao, prd.ativo, prd.id_item from tbl_f' +
        'ornecedores forn '
      'inner join tbl_pessoal pes on forn.id_fornec = pes.id_pessoal '
      
        'left join (select distinct itm.*, atip.descricao tipo, acat.desc' +
        'ricao categoria '
      'from tbl_itens itm '
      
        'left join tbl_aux_tipo_itens atip on itm.id_tipo_item = atip.id_' +
        'tipo_item '
      
        'left join tbl_aux_categoria_itens acat on itm.id_categoria = aca' +
        't.id_categoria'
      
        'where atip.id_tipo_item = 2) prd on forn.id_fornec = prd.id_forn' +
        'ecedor')
    Left = 400
    Top = 72
    object Query_ProdutosFornecedor: TStringField
      DisplayWidth = 25
      FieldName = 'Fornecedor'
      Size = 150
    end
    object Query_Produtostipo: TStringField
      DisplayWidth = 10
      FieldName = 'Tipo'
      Size = 45
    end
    object Query_Produtoscategoria: TStringField
      DisplayWidth = 14
      FieldName = 'Categoria'
      Size = 45
    end
    object Query_Produtoscod_barras: TStringField
      DisplayLabel = 'Cod Barras'
      DisplayWidth = 11
      FieldName = 'Cod_Barras'
      Size = 45
    end
    object Query_Produtosdescricao: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 35
      FieldName = 'descricao'
      Size = 45
    end
    object Query_Produtosativo: TIntegerField
      DisplayLabel = 'Ativo'
      DisplayWidth = 5
      FieldName = 'ativo'
    end
    object Query_Produtosid_item: TIntegerField
      FieldName = 'id_item'
      Visible = False
    end
    object Query_Produtosid_pessoal: TIntegerField
      FieldName = 'id_pessoal'
      Visible = False
    end
  end
  object Query_Pessoal: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM modular.tbl_pessoal pes '
      
        #9'left join modular.tbl_endereco en on pes.id_pessoal = en.id_pes' +
        'soal'
      
        #9'left join modular.tbl_telefones tel on pes.id_pessoal = tel.id_' +
        'pessoal'
      
        #9'left join modular.tbl_email ema on pes.id_pessoal = ema.id_pess' +
        'oal;')
    Left = 496
    Top = 72
    object Query_Pessoalid_pessoal: TAutoIncField
      DisplayLabel = 'Chapa'
      DisplayWidth = 6
      FieldName = 'id_pessoal'
      ReadOnly = True
    end
    object Query_Pessoalnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 27
      FieldName = 'nome'
      Size = 150
    end
    object Query_Pessoaldata_nasci: TDateField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 11
      FieldName = 'data_nasci'
    end
    object Query_Pessoalrg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 12
      FieldName = 'rg'
      Size = 12
    end
    object Query_Pessoalcpf: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 14
      FieldName = 'cpf'
      Size = 15
    end
  end
  object Query_Funcionarios: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from modular.tbl_pessoal pes '
      
        'inner join modular.tbl_funcionarios fun on pes.id_pessoal = fun.' +
        'id_funcionario  '
      
        ' Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI' +
        ', '#39#39#39#39'),'
      'COALESCE(UCASE(RG), '#39#39#39#39'),COALESCE(UCASE(CPF), '#39#39#39#39'),'
      'COALESCE(UCASE(fun.info_geral), '#39#39#39#39'))')
    Left = 600
    Top = 72
    object Query_Funcionariosid_pessoal: TAutoIncField
      DisplayLabel = 'Chapa'
      DisplayWidth = 6
      FieldName = 'id_pessoal'
      ReadOnly = True
    end
    object Query_Funcionariosnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 150
    end
    object Query_Funcionariosdata_nasci: TDateField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 11
      FieldName = 'data_nasci'
    end
    object Query_Funcionariosrg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 12
      FieldName = 'rg'
      Size = 12
    end
    object Query_Funcionarioscpf: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 14
      FieldName = 'cpf'
      Size = 15
    end
  end
  object Query_Fornecedores: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct pes.*, forn.cnpj from modular.tbl_pessoal pes'
      
        'left join modular.tbl_fornecedores forn on pes.id_pessoal = forn' +
        '.id_fornec'
      
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_forne' +
        'cedor'
      
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = ' +
        'atip.id_tipo_item'
      
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categor' +
        'ia = acat.id_categoria')
    Left = 720
    Top = 72
    object Query_Fornecedoresid_pessoal: TIntegerField
      DisplayLabel = 'Chapa'
      DisplayWidth = 8
      FieldName = 'id_pessoal'
    end
    object Query_Fornecedoresnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'nome'
      Size = 150
    end
    object Query_Fornecedoresdata_nasci: TDateField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 11
      FieldName = 'data_nasci'
    end
    object Query_Fornecedoresrg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 12
      FieldName = 'rg'
      Size = 12
    end
    object Query_Fornecedorescpf: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 14
      FieldName = 'cpf'
      Size = 15
    end
    object Query_Fornecedorescnpj: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 19
      FieldName = 'cnpj'
      Size = 18
    end
  end
end