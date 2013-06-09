object DM_CadFuncionarios: TDM_CadFuncionarios
  OldCreateOrder = False
  Height = 288
  Width = 530
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
  object Tp_Funcionarios: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    AfterScroll = Tp_FuncionariosAfterScroll
    IndexFieldNames = 'id_funcionario'
    MasterFields = 'id_pessoal'
    MasterSource = ds_Tp_Pessoal
    TableName = 'tbl_funcionarios'
    Left = 240
    Top = 8
    object Tp_Funcionariosid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object Tp_Funcionariosativo: TSmallintField
      FieldName = 'ativo'
    end
    object Tp_Funcionariosdat_ult_atend: TDateTimeField
      FieldName = 'dat_ult_atend'
    end
    object Tp_Funcionariosfoto: TBlobField
      FieldName = 'foto'
    end
    object Tp_Funcionariosinfo_geral: TMemoField
      FieldName = 'info_geral'
      BlobType = ftMemo
    end
  end
  object ds_Tp_Funcionarios: TDataSource
    AutoEdit = False
    DataSet = Tp_Funcionarios
    Left = 240
    Top = 56
  end
  object Qry_Busca: TADOQuery
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
    Left = 24
    Top = 120
    object Qry_Buscaid_pessoal: TAutoIncField
      FieldName = 'id_pessoal'
      ReadOnly = True
    end
    object Qry_Buscanome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object Qry_Buscadata_nasci: TDateField
      FieldName = 'data_nasci'
    end
    object Qry_Buscarg: TStringField
      FieldName = 'rg'
      Size = 12
    end
    object Qry_Buscacpf: TStringField
      FieldName = 'cpf'
      Size = 15
    end
    object Qry_Buscaid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object Qry_Buscaativo: TSmallintField
      DisplayLabel = 'ativo'
      FieldName = 'ativo_1'
    end
    object Qry_Buscadat_ult_atend: TDateTimeField
      FieldName = 'dat_ult_atend'
    end
  end
  object ds_Qry_Busca: TDataSource
    DataSet = Qry_Busca
    Left = 24
    Top = 176
  end
  object QServicos: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PFunc'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select itm.id_item, itm.descricao, que.id_funcionario, que.comis' +
        'sao'
      'from modular.tbl_itens itm'
      'left join (select fun.id_funcionario, com.id_item, com.comissao '
      #9'from modular.tbl_comissao com'
      
        'inner join modular.tbl_funcionarios fun on com.id_funcionario = ' +
        'fun.id_funcionario'
      
        ' and fun.id_funcionario =  :PFunc) que on itm.id_item = que.id_i' +
        'tem'
      'where itm.id_tipo_item = 1 and itm.ativo = 1')
    Left = 120
    Top = 120
    object QServicosid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object QServicosid_item: TAutoIncField
      FieldName = 'id_item'
      ReadOnly = True
    end
    object QServicosdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object QServicoscomissao: TFloatField
      FieldName = 'comissao'
    end
  end
  object ds_CDS_Servicos: TDataSource
    DataSet = CDS_Servicos
    Left = 240
    Top = 176
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
        Name = 'Selec'
        DataType = ftBoolean
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Comissao'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 240
    Top = 120
    Data = {
      670000009619E0BD01000000180000000400000000000300000067000769645F
      6974656D04000100000000000553656C65630200030000000000096465736372
      6963616F0100490000000100055749445448020002002D0008436F6D69737361
      6F08000400000000000000}
    object CDS_ServicosSelec: TBooleanField
      DisplayWidth = 3
      FieldName = 'Selec'
    end
    object CDS_Servicosid_item: TIntegerField
      FieldName = 'id_item'
      Visible = False
    end
    object CDS_Servicosdescricao: TStringField
      DisplayWidth = 19
      FieldName = 'descricao'
      Size = 45
    end
    object CDS_ServicosComissao: TFloatField
      DisplayWidth = 8
      FieldName = 'Comissao'
    end
  end
  object Qry_Exec: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 24
    Top = 56
  end
  object Tbl_Acesso: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    AfterScroll = Tp_FuncionariosAfterScroll
    IndexFieldNames = 'id_funcionario'
    MasterFields = 'id_funcionario'
    MasterSource = ds_Tp_Funcionarios
    TableName = 'tbl_acesso'
    Left = 352
    Top = 8
    object Tbl_Acessoid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object Tbl_Acessologin: TStringField
      FieldName = 'login'
      Size = 45
    end
    object Tbl_Acessosenha: TStringField
      FieldName = 'senha'
      Size = 45
    end
    object Tbl_Acessoperfil: TStringField
      FieldName = 'perfil'
      Size = 500
    end
  end
  object ds_Tbl_Acesso: TDataSource
    AutoEdit = False
    DataSet = Tbl_Acesso
    Left = 352
    Top = 56
  end
end
