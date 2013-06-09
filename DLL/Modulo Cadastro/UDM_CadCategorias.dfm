object DM_CadCategorias: TDM_CadCategorias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 399
  Width = 625
  object ds_Ta_Categ_Serv: TDataSource
    AutoEdit = False
    DataSet = Ta_Categ_Serv
    Left = 64
    Top = 128
  end
  object ds_Ta_Status_Mov: TDataSource
    AutoEdit = False
    DataSet = Ta_Status_Mov
    Left = 288
    Top = 128
  end
  object ds_Ta_Tipo_Email: TDataSource
    AutoEdit = False
    DataSet = Ta_Tipo_Email
    Left = 400
    Top = 128
  end
  object ds_Ta_Tipo_Ende: TDataSource
    AutoEdit = False
    DataSet = Ta_Tipo_Ende
    Left = 504
    Top = 128
  end
  object ds_Ta_Tipo_Entidade: TDataSource
    AutoEdit = False
    DataSet = Ta_Tipo_Entidade
    Left = 400
    Top = 248
  end
  object ds_Ta_Tipo_Itens: TDataSource
    AutoEdit = False
    DataSet = Ta_Tipo_Itens
    Left = 176
    Top = 248
  end
  object ds_Ta_Tipo_Mov: TDataSource
    AutoEdit = False
    DataSet = Ta_Tipo_Mov
    Left = 288
    Top = 248
  end
  object ds_Ta_Tipo_Tel: TDataSource
    AutoEdit = False
    DataSet = Ta_Tipo_Tel
    Left = 64
    Top = 248
  end
  object ds_Ta_Categ_Prod: TDataSource
    AutoEdit = False
    DataSet = Ta_Categ_Prod
    Left = 176
    Top = 128
  end
  object Server: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=17.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 24
    Top = 8
  end
  object DspConn: TDSProviderConnection
    Left = 64
    Top = 8
  end
  object Ta_Categ_Serv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Categ_Serv'
    RemoteServer = DspConn
    Left = 64
    Top = 80
    object Ta_Categ_Servdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Categ_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Categ_Prod'
    RemoteServer = DspConn
    Left = 176
    Top = 80
    object Ta_Categ_Proddescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Status_Mov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Status_Mov'
    RemoteServer = DspConn
    Left = 288
    Top = 80
    object Ta_Status_Movdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Tipo_Email: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Email'
    RemoteServer = DspConn
    Left = 400
    Top = 80
    object Ta_Tipo_Emaildescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Tipo_Ende: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Ende'
    RemoteServer = DspConn
    Left = 504
    Top = 80
    object Ta_Tipo_Endedescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Tipo_Entidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Entidade'
    RemoteServer = DspConn
    Left = 400
    Top = 200
    object Ta_Tipo_Entidadedescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Tipo_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Itens'
    RemoteServer = DspConn
    Left = 176
    Top = 200
    object Ta_Tipo_Itensdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Tipo_Mov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Mov'
    RemoteServer = DspConn
    Left = 288
    Top = 200
    object Ta_Tipo_Movdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Ta_Tipo_Tel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Tel'
    RemoteServer = DspConn
    Left = 64
    Top = 200
    object Ta_Tipo_Teldescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Size = 45
    end
  end
  object Qry_Acesso: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT * FROM tbl_acesso where id_funcionario = 1 and perfil lik' +
      'e '#39'%2%'#39
    Params = <>
    ProviderName = 'Dsp_Qry_Geral'
    ReadOnly = True
    RemoteServer = DspConn
    Left = 64
    Top = 320
  end
end
