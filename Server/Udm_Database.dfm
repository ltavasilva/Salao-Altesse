object Database: TDatabase
  OldCreateOrder = False
  Height = 448
  Width = 756
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object Tp_Endereco: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    IndexFieldNames = 'id_pessoal'
    MasterFields = 'id_pessoal'
    TableName = 'tbl_endereco'
    Left = 176
    Top = 8
    object Tp_Enderecocep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      EditMask = '00000\-999;1;_'
      Size = 10
    end
    object Tp_EnderecoTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'Tipo'
      LookupDataSet = Ta_Tipo_Ende
      LookupKeyFields = 'id_tipo'
      LookupResultField = 'descricao'
      KeyFields = 'id_tipo'
      Lookup = True
    end
    object Tp_Enderecologradouro: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'logradouro'
      Size = 150
    end
    object Tp_Enderecocomplemento: TStringField
      FieldName = 'complemento'
      Size = 80
    end
    object Tp_Enderecobairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 150
    end
    object Tp_Enderecocidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 45
    end
    object Tp_Enderecouf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 45
    end
    object Tp_Endereconum: TIntegerField
      DisplayLabel = 'Num'
      FieldName = 'num'
    end
    object Tp_Enderecoid_tipo: TIntegerField
      FieldName = 'id_tipo'
      Visible = False
    end
    object Tp_Enderecoid_pessoal: TIntegerField
      FieldName = 'id_pessoal'
      Visible = False
    end
  end
  object Ta_Tipo_Ende: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_ende'
    Left = 280
    Top = 8
  end
  object Tp_Email: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    IndexFieldNames = 'id_pessoal'
    MasterFields = 'id_pessoal'
    TableName = 'tbl_email'
    Left = 368
    Top = 8
    object Tp_EmailTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'Tipo'
      LookupKeyFields = 'id_tipo'
      LookupResultField = 'descricao'
      KeyFields = 'id_tipo'
      Lookup = True
    end
    object Tp_Emailemail: TStringField
      DisplayLabel = 'e-Mail'
      FieldName = 'email'
      Size = 50
    end
    object Tp_Emailid_pessoal: TIntegerField
      FieldName = 'id_pessoal'
      Visible = False
    end
    object Tp_Emailid_tipo: TIntegerField
      FieldName = 'id_tipo'
      Visible = False
    end
  end
  object Ta_Tipo_Email: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_email'
    Left = 464
    Top = 8
  end
  object Tp_Tel: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    IndexFieldNames = 'id_pessoal'
    MasterFields = 'id_pessoal'
    TableName = 'tbl_telefones'
    Left = 552
    Top = 8
    object Tp_TelTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'Tipo'
      LookupKeyFields = 'id_tipo'
      LookupResultField = 'descricao'
      KeyFields = 'id_tipo'
      Lookup = True
    end
    object Tp_Teltelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
    end
    object Tp_Telid_pessoal: TIntegerField
      FieldName = 'id_pessoal'
      Visible = False
    end
    object Tp_Telid_tipo: TIntegerField
      FieldName = 'id_tipo'
      Visible = False
    end
  end
  object Ta_Tipo_Tel: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_tel'
    Left = 640
    Top = 8
  end
  object Tp_Pessoal: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_pessoal'
    Left = 80
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
      EditMask = '00\.000\.000-A;0;_'
      Size = 12
    end
    object Tp_Pessoalcpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      EditMask = '000\.000\.000-99;0;_'
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
  object Qry_Busca: TADOQuery
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
    Left = 80
    Top = 136
    object Qry_Buscaid_pessoal: TAutoIncField
      DisplayLabel = 'Chapa'
      DisplayWidth = 5
      FieldName = 'id_pessoal'
      ReadOnly = True
    end
    object Qry_Buscanome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 27
      FieldName = 'nome'
      Size = 150
    end
    object Qry_Buscadata_nasci: TDateField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 10
      FieldName = 'data_nasci'
    end
    object Qry_Buscarg: TStringField
      DisplayLabel = 'RG'
      DisplayWidth = 11
      FieldName = 'rg'
      Size = 12
    end
    object Qry_Buscacpf: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 13
      FieldName = 'cpf'
      Size = 15
    end
    object Qry_Buscacep: TStringField
      DisplayWidth = 9
      FieldName = 'cep'
      Size = 10
    end
    object Qry_Buscalogradouro: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 23
      FieldName = 'logradouro'
      Size = 150
    end
    object Qry_Buscabairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 18
      FieldName = 'bairro'
      Size = 150
    end
    object Qry_Buscacidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 18
      FieldName = 'cidade'
      Size = 150
    end
    object Qry_Buscauf: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 3
      FieldName = 'uf'
      Size = 45
    end
    object Qry_Buscatelefone: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 13
      FieldName = 'telefone'
    end
    object Qry_Buscaemail: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 19
      FieldName = 'email'
      Size = 50
    end
  end
  object Qry_Exec: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 176
    Top = 136
  end
  object Dsp_Tp_Endereco: TDataSetProvider
    DataSet = Tp_Endereco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 56
  end
  object Dsp_Ta_Tipo_Ende: TDataSetProvider
    DataSet = Ta_Tipo_Ende
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 56
  end
  object Dsp_Tp_Email: TDataSetProvider
    DataSet = Tp_Email
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 368
    Top = 56
  end
  object Dsp_Ta_Tipo_Email: TDataSetProvider
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 464
    Top = 56
  end
  object Dsp_Tp_Tel: TDataSetProvider
    DataSet = Tp_Tel
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 552
    Top = 56
  end
  object Dsp_Ta_Tipo_Tel: TDataSetProvider
    DataSet = Ta_Tipo_Tel
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 640
    Top = 56
  end
  object Dsp_Tp_Pessoal: TDataSetProvider
    DataSet = Tp_Pessoal
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 80
    Top = 56
  end
  object Dsp_Qry_Busca: TDataSetProvider
    DataSet = Qry_Busca
    Left = 80
    Top = 192
  end
  object Dsp_Qry_Exec: TDataSetProvider
    DataSet = Qry_Exec
    Left = 176
    Top = 192
  end
end
