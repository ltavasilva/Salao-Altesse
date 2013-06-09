object ServerSalao: TServerSalao
  OldCreateOrder = False
  Height = 427
  Width = 786
  object Conexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 16
    Top = 8
  end
  object Tp_Endereco: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_endereco'
    Left = 184
    Top = 8
    object Tp_Enderecocep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      EditMask = '00000\-999;1;_'
      Size = 10
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
    Left = 296
    Top = 8
  end
  object Tp_Email: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_email'
    Left = 392
    Top = 8
  end
  object Ta_Tipo_Email: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_email'
    Left = 496
    Top = 8
  end
  object Tp_Tel: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_telefones'
    Left = 592
    Top = 8
  end
  object Ta_Tipo_Tel: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_tel'
    Left = 688
    Top = 8
  end
  object Tp_Pessoal: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_pessoal'
    Left = 80
    Top = 8
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
    Top = 248
  end
  object Qry_Exec: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 248
  end
  object Dsp_Tp_Endereco: TDataSetProvider
    DataSet = Tp_Endereco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 56
  end
  object Dsp_Ta_Tipo_Ende: TDataSetProvider
    DataSet = Ta_Tipo_Ende
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 56
  end
  object Dsp_Tp_Email: TDataSetProvider
    DataSet = Tp_Email
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 392
    Top = 56
  end
  object Dsp_Ta_Tipo_Email: TDataSetProvider
    DataSet = Ta_Tipo_Email
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 496
    Top = 56
  end
  object Dsp_Tp_Tel: TDataSetProvider
    DataSet = Tp_Tel
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 56
  end
  object Dsp_Ta_Tipo_Tel: TDataSetProvider
    DataSet = Ta_Tipo_Tel
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 688
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
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 80
    Top = 304
  end
  object Dsp_Qry_Exec: TDataSetProvider
    DataSet = Qry_Exec
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 304
  end
  object Qry_Geral: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 296
    Top = 248
  end
  object Dsp_Qry_Geral: TDataSetProvider
    DataSet = Qry_Geral
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 304
  end
  object Ta_Categ_Serv: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    Filter = ' id_tipo = 1'
    Filtered = True
    TableName = 'tbl_aux_categoria_itens'
    Left = 80
    Top = 128
  end
  object Dsp_Ta_Categ_Serv: TDataSetProvider
    DataSet = Ta_Categ_Serv
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 80
    Top = 176
  end
  object Ta_Categ_Prod: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    Filter = ' id_tipo = 2'
    Filtered = True
    TableName = 'tbl_aux_categoria_itens'
    Left = 184
    Top = 128
  end
  object Dsp_Ta_Categ_Prod: TDataSetProvider
    DataSet = Ta_Categ_Prod
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 184
    Top = 176
  end
  object Ta_Status_Mov: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_status_movimento'
    Left = 296
    Top = 128
  end
  object Dsp_Ta_Status_Mov: TDataSetProvider
    DataSet = Ta_Status_Mov
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 296
    Top = 176
  end
  object Ta_Tipo_Itens: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_itens'
    Left = 400
    Top = 128
  end
  object Dsp_Ta_Tipo_Itens: TDataSetProvider
    DataSet = Ta_Tipo_Itens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 400
    Top = 176
  end
  object Ta_Tipo_Mov: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_movimento'
    Left = 496
    Top = 128
  end
  object Dsp_Ta_Tipo_Mov: TDataSetProvider
    DataSet = Ta_Tipo_Mov
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 496
    Top = 176
  end
  object Ta_Tipo_Entidade: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_aux_tipo_entidade'
    Left = 592
    Top = 128
  end
  object Dsp_Ta_Tipo_Entidade: TDataSetProvider
    DataSet = Ta_Tipo_Entidade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 592
    Top = 176
  end
  object Tp_Clientes: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_clientes'
    Left = 400
    Top = 248
  end
  object Dsp_Tp_Clientes: TDataSetProvider
    DataSet = Tp_Clientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 400
    Top = 304
  end
end
