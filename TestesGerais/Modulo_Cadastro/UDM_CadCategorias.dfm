object DM_CadCategorias: TDM_CadCategorias
  OldCreateOrder = False
  Height = 455
  Width = 645
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object Tbl_Categ_Serv: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    Filter = 'id_tipo = 1'
    Filtered = True
    TableName = 'tbl_aux_categoria_itens'
    Left = 112
    Top = 8
    object Tbl_Categ_Servid_categoria: TAutoIncField
      FieldName = 'id_categoria'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Categ_Servid_tipo: TIntegerField
      FieldName = 'id_tipo'
      Visible = False
    end
    object Tbl_Categ_Servdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Categ_Serv: TDataSource
    AutoEdit = False
    DataSet = Tbl_Categ_Serv
    Left = 112
    Top = 56
  end
  object Tbl_Status_Mov: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_status_movimento'
    Left = 336
    Top = 8
    object Tbl_Status_Movid_status: TAutoIncField
      FieldName = 'id_status'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Status_Movdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Status_Mov: TDataSource
    AutoEdit = False
    DataSet = Tbl_Status_Mov
    Left = 336
    Top = 56
  end
  object Tbl_Tipo_Email: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_email'
    Left = 448
    Top = 8
    object Tbl_Tipo_Emailid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Tipo_Emaildescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Tipo_Email: TDataSource
    AutoEdit = False
    DataSet = Tbl_Tipo_Email
    Left = 448
    Top = 56
  end
  object Tbl_Tipo_Ende: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_ende'
    Left = 552
    Top = 8
    object Tbl_Tipo_Endeid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Tipo_Endedescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Tipo_Ende: TDataSource
    AutoEdit = False
    DataSet = Tbl_Tipo_Ende
    Left = 552
    Top = 56
  end
  object Tbl_Tipo_Entidade: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_entidade'
    Left = 112
    Top = 128
    object Tbl_Tipo_Entidadeid_tipo_entidade: TAutoIncField
      FieldName = 'id_tipo_entidade'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Tipo_Entidadedescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Tipo_Entidade: TDataSource
    AutoEdit = False
    DataSet = Tbl_Tipo_Entidade
    Left = 112
    Top = 176
  end
  object Tbl_Tipo_Itens: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_itens'
    Left = 224
    Top = 128
    object Tbl_Tipo_Itensid_tipo_item: TAutoIncField
      FieldName = 'id_tipo_item'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Tipo_Itensdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Tipo_Itens: TDataSource
    AutoEdit = False
    DataSet = Tbl_Tipo_Itens
    Left = 224
    Top = 176
  end
  object Tbl_Tipo_Mov: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_movimento'
    Left = 336
    Top = 128
    object Tbl_Tipo_Movid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Tipo_Movdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Tipo_Mov: TDataSource
    AutoEdit = False
    DataSet = Tbl_Tipo_Mov
    Left = 336
    Top = 176
  end
  object Tbl_Tipo_Tel: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_tel'
    Left = 448
    Top = 128
    object Tbl_Tipo_Telid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Tipo_Teldescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Tipo_Tel: TDataSource
    AutoEdit = False
    DataSet = Tbl_Tipo_Tel
    Left = 448
    Top = 176
  end
  object Tbl_Categ_Prod: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    Filter = 'id_tipo = 2'
    Filtered = True
    TableName = 'tbl_aux_categoria_itens'
    Left = 224
    Top = 8
    object Tbl_Categ_Prodid_categoria: TAutoIncField
      FieldName = 'id_categoria'
      ReadOnly = True
      Visible = False
    end
    object Tbl_Categ_Prodid_tipo: TIntegerField
      FieldName = 'id_tipo'
      Visible = False
    end
    object Tbl_Categ_Proddescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ds_Tbl_Categ_Prod: TDataSource
    AutoEdit = False
    DataSet = Tbl_Categ_Prod
    Left = 224
    Top = 56
  end
  object Tbl_Comissao: TADOTable
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_comissao'
    Left = 336
    Top = 272
    object Tbl_Comissaoid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object Tbl_Comissaoid_item: TIntegerField
      FieldName = 'id_item'
    end
    object Tbl_Comissaocomissao: TFloatField
      FieldName = 'comissao'
    end
  end
  object ds_Tbl_Comissao: TDataSource
    AutoEdit = False
    DataSet = Tbl_Comissao
    Left = 336
    Top = 320
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 112
    Top = 320
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = ADOTable2
    Left = 224
    Top = 320
  end
  object ADOTable2: TADOTable
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_comissao'
    Left = 224
    Top = 272
    object IntegerField3: TIntegerField
      FieldName = 'id_funcionario'
    end
    object IntegerField4: TIntegerField
      FieldName = 'id_item'
    end
    object FloatField2: TFloatField
      FieldName = 'comissao'
    end
  end
  object Qry_Funcionarios: TADOQuery
    Active = True
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select pes.id_pessoal, pes.nome'
      'from modular.tbl_pessoal pes'
      
        'inner join modular.tbl_funcionarios fun on pes.id_pessoal = fun.' +
        'id_funcionario')
    Left = 112
    Top = 272
    object Qry_Funcionariosid_pessoal: TAutoIncField
      FieldName = 'id_pessoal'
      ReadOnly = True
    end
    object Qry_Funcionariosnome: TStringField
      FieldName = 'nome'
      Size = 150
    end
  end
end
