object DM_CadServicos: TDM_CadServicos
  OldCreateOrder = False
  Height = 329
  Width = 580
  object Conexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 24
    Top = 8
  end
  object ds_Tp_Fornecedores: TDataSource
    AutoEdit = False
    DataSet = Qp_Fornecedores
    Left = 136
    Top = 56
  end
  object Qry_Busca: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from modular.tbl_fornecedores forn'
      
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_forne' +
        'cedor '
      
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = ' +
        'atip.id_tipo_item '
      
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categor' +
        'ia = acat.id_categoria ')
    Left = 24
    Top = 112
    object Qry_Buscaid_item: TIntegerField
      FieldName = 'id_item'
    end
    object Qry_Buscacod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 45
    end
    object Qry_Buscadescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object Qry_Buscaid_tipo_item_1: TAutoIncField
      FieldName = 'id_tipo_item_1'
      ReadOnly = True
    end
    object Qry_Buscadescricao_1: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'descricao_1'
      Size = 45
    end
    object Qry_Buscadescricao_2: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'descricao_2'
      Size = 45
    end
  end
  object ds_Qry_Busca: TDataSource
    DataSet = Qry_Busca
    Left = 24
    Top = 160
  end
  object Qry_Exec: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 24
    Top = 56
  end
  object Tp_Servicos: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    AfterInsert = Tp_ServicosAfterInsert
    IndexFieldNames = 'id_fornecedor'
    MasterFields = 'id_fornec'
    MasterSource = ds_Tp_Fornecedores
    TableName = 'tbl_itens'
    Left = 256
    Top = 8
    object Tp_Servicosid_item: TIntegerField
      FieldName = 'id_item'
    end
    object Tp_Servicoscod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 45
    end
    object Tp_Servicosid_tipo_item: TIntegerField
      FieldName = 'id_tipo_item'
    end
    object Tp_Servicosdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object Tp_Servicosid_fornecedor: TIntegerField
      FieldName = 'id_fornecedor'
    end
    object Tp_Servicosid_categoria: TIntegerField
      FieldName = 'id_categoria'
    end
    object Tp_Servicostmp_execucao: TIntegerField
      FieldName = 'tmp_execucao'
    end
    object Tp_Servicostaxa_lucro: TFloatField
      FieldName = 'taxa_lucro'
    end
    object Tp_Servicoscusto_aquisicao: TFloatField
      FieldName = 'custo_aquisicao'
    end
    object Tp_ServicosCategoria: TStringField
      FieldKind = fkLookup
      FieldName = 'Categoria'
      LookupDataSet = Ta_Categoria
      LookupKeyFields = 'id_categoria'
      LookupResultField = 'descricao'
      KeyFields = 'id_categoria'
      Lookup = True
    end
    object Tp_Servicosativo: TIntegerField
      FieldName = 'ativo'
    end
  end
  object ds_Tp_Servicos: TDataSource
    AutoEdit = False
    DataSet = Tp_Servicos
    Left = 256
    Top = 56
  end
  object Ta_Categoria: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    Filter = 'id_tipo = 1'
    Filtered = True
    TableName = 'tbl_aux_categoria_itens'
    Left = 352
    Top = 8
    object Ta_Categoriaid_categoria: TAutoIncField
      FieldName = 'id_categoria'
      ReadOnly = True
    end
    object Ta_Categoriaid_tipo: TIntegerField
      FieldName = 'id_tipo'
    end
    object Ta_Categoriadescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Ta_Categoria: TDataSource
    AutoEdit = False
    DataSet = Ta_Categoria
    Left = 352
    Top = 56
  end
  object CDS_Servicos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_item'
        DataType = ftInteger
      end
      item
        Name = 'cod_barras'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'id_tipo_item'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'id_fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'id_categoria'
        DataType = ftInteger
      end
      item
        Name = 'tmp_execucao'
        DataType = ftInteger
      end
      item
        Name = 'taxa_lucro'
        DataType = ftFloat
      end
      item
        Name = 'custo_aquisicao'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 104
    Data = {
      E70000009619E0BD010000001800000009000000000003000000E7000769645F
      6974656D04000100000000000A636F645F626172726173010049000000010005
      5749445448020002002D000C69645F7469706F5F6974656D0400010000000000
      0964657363726963616F0100490000000100055749445448020002002D000D69
      645F666F726E656365646F7204000100000000000C69645F63617465676F7269
      6104000100000000000C746D705F657865637563616F04000100000000000A74
      6178615F6C7563726F08000400000000000F637573746F5F6171756973696361
      6F08000400000000000000}
    object CDS_Servicosid_item: TIntegerField
      FieldName = 'id_item'
    end
    object CDS_Servicoscod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 45
    end
    object CDS_Servicosid_tipo_item: TIntegerField
      FieldName = 'id_tipo_item'
    end
    object CDS_Servicosdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object CDS_Servicosid_fornecedor: TIntegerField
      FieldName = 'id_fornecedor'
    end
    object CDS_Servicosid_categoria: TIntegerField
      FieldName = 'id_categoria'
    end
    object CDS_Servicostmp_execucao: TIntegerField
      FieldName = 'tmp_execucao'
    end
    object CDS_Servicostaxa_lucro: TFloatField
      FieldName = 'taxa_lucro'
    end
    object CDS_Servicoscusto_aquisicao: TFloatField
      FieldName = 'custo_aquisicao'
    end
    object CDS_ServicosCategoria: TStringField
      FieldKind = fkLookup
      FieldName = 'Categoria'
      LookupDataSet = Ta_Categoria
      LookupKeyFields = 'id_categoria'
      LookupResultField = 'descricao'
      KeyFields = 'id_categoria'
      Lookup = True
    end
  end
  object Qp_Fornecedores: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Filter = 'id_fornec = 1'
    Filtered = True
    AfterOpen = Qp_FornecedoresAfterOpen
    AfterClose = Qp_FornecedoresAfterClose
    Parameters = <>
    SQL.Strings = (
      'select forn.id_fornec, pes.nome, forn.cnpj, forn.dat_ult_atend, '
      'forn.info_geral, forn.foto'
      'from tbl_pessoal pes '
      
        'inner join tbl_fornecedores forn on pes.id_pessoal = forn.id_for' +
        'nec')
    Left = 136
    Top = 8
    object Qp_Fornecedoresid_fornec: TIntegerField
      FieldName = 'id_fornec'
    end
    object Qp_Fornecedoresnome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object Qp_Fornecedorescnpj: TStringField
      FieldName = 'cnpj'
      Size = 18
    end
    object Qp_Fornecedoresdat_ult_atend: TDateTimeField
      FieldName = 'dat_ult_atend'
    end
    object Qp_Fornecedoresinfo_geral: TMemoField
      FieldName = 'info_geral'
      BlobType = ftMemo
    end
    object Qp_Fornecedoresfoto: TBlobField
      FieldName = 'foto'
    end
  end
end
