object DM_Config: TDM_Config
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 163
  Width = 289
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
    Left = 12
    Top = 8
  end
  object DspConn: TDSProviderConnection
    Left = 68
    Top = 8
  end
  object Qry_Geral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp_Qry_Geral'
    ReadOnly = True
    RemoteServer = DspConn
    Left = 120
    Top = 8
  end
end
