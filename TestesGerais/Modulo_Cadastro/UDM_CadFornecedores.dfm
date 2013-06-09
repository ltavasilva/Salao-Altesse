object DM_CadFornecedores: TDM_CadFornecedores
  OldCreateOrder = False
  Height = 227
  Width = 330
  object Conexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 24
    Top = 8
  end
  object Tp_Pessoal: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    AfterOpen = Tp_PessoalAfterOpen
    AfterClose = Tp_PessoalAfterClose
    TableName = 'tbl_pessoal'
    Left = 120
    Top = 8
    object Tp_Pessoalid_pessoal: TAutoIncField
      DisplayLabel = 'Chapa'
      FieldName = 'id_pessoal'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object Tp_Pessoalnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 150
    end
    object Tp_Pessoaldata_nasci: TDateField
      DisplayLabel = 'Dt Nascimento'
      FieldName = 'data_nasci'
      EditMask = '!99/99/9900;1;_'
    end
    object Tp_Pessoalrg: TStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
      EditMask = '00\.000\.000-A;1;_'
      Size = 12
    end
    object Tp_Pessoalcpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      EditMask = '000\.000\.000-99;1;_'
      Size = 15
    end
    object Tp_Pessoaldata_incl: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o'
      FieldName = 'data_incl'
    end
    object Tp_Pessoalresp_incl: TIntegerField
      DisplayLabel = 'Criado por'
      FieldName = 'resp_incl'
    end
    object Tp_Pessoaldata_modif: TDateTimeField
      DisplayLabel = 'Data Altera'#231#227'o'
      FieldName = 'data_modif'
    end
    object Tp_Pessoalresp_modif: TIntegerField
      DisplayLabel = 'Alterado por'
      FieldName = 'resp_modif'
    end
    object Tp_Pessoalativo: TSmallintField
      FieldName = 'ativo'
    end
  end
  object ds_Tp_Pessoal: TDataSource
    AutoEdit = False
    DataSet = Tp_Pessoal
    Left = 120
    Top = 56
  end
  object Qry_Busca: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from modular.tbl_pessoal pes'
      
        'inner join modular.tbl_fornecedores forn on pes.id_pessoal = for' +
        'n.id_fornec'
      
        'left join modular.tbl_itens itm on forn.id_fornec = itm.id_forne' +
        'cedor'
      
        'left join modular.tbl_aux_tipo_itens atip on itm.id_tipo_item = ' +
        'atip.id_tipo_item'
      
        'left join modular.tbl_aux_categoria_itens acat on itm.id_categor' +
        'ia = acat.id_categoria'
      
        ' Where concat(pes.id_pessoal,ucase(pes.nome),COALESCE(DATA_NASCI' +
        ', '#39#39#39#39')'
      
        ',COALESCE(UCASE(RG), '#39#39#39#39'),COALESCE(UCASE(CPF), '#39#39#39#39'),COALESCE(f' +
        'orn.cnpj, '#39#39#39#39')'
      
        ',COALESCE(UCASE(forn.info_geral), '#39#39#39#39'),COALESCE(itm.cod_barras,' +
        ' '#39#39#39#39')'
      
        ',COALESCE(UCASE(itm.descricao), '#39#39#39#39'),COALESCE(UCASE(atip.descri' +
        'cao), '#39#39#39#39')'
      ',COALESCE(UCASE(acat.descricao), '#39#39#39#39'))')
    Left = 24
    Top = 104
    object Qry_Buscacnpj: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 18
      FieldName = 'cnpj'
      Size = 18
    end
    object Qry_Buscanome: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'nome'
      Size = 150
    end
    object Qry_Buscaativo: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
    end
    object Qry_Buscadescricao: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'descricao'
      Size = 45
    end
    object Qry_Buscacod_barras: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cod_barras'
      Size = 45
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
    object Qry_Buscaid_pessoal: TAutoIncField
      FieldName = 'id_pessoal'
      ReadOnly = True
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
  object Tp_Fornecedores: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    IndexFieldNames = 'id_fornec'
    MasterFields = 'id_pessoal'
    MasterSource = ds_Tp_Pessoal
    TableName = 'tbl_fornecedores'
    Left = 240
    Top = 8
    object Tp_Fornecedoresid_fornec: TIntegerField
      FieldName = 'id_fornec'
    end
    object Tp_Fornecedorescnpj: TStringField
      DisplayWidth = 18
      FieldName = 'cnpj'
      EditMask = '00\.000\.000/0000\-00;1;_'
      Size = 18
    end
    object Tp_Fornecedoresativo: TSmallintField
      FieldName = 'ativo'
    end
    object Tp_Fornecedoresdat_ult_atend: TDateTimeField
      FieldName = 'dat_ult_atend'
    end
    object Tp_Fornecedoresfoto: TBlobField
      FieldName = 'foto'
    end
    object Tp_Fornecedoresinfo_geral: TMemoField
      FieldName = 'info_geral'
      BlobType = ftMemo
    end
  end
  object ds_Tp_Fornecedores: TDataSource
    AutoEdit = False
    DataSet = Tp_Fornecedores
    Left = 240
    Top = 56
  end
end
