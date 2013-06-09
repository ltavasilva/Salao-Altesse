object FrmTelefone: TFrmTelefone
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Telefone'
  ClientHeight = 131
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 28
    Height = 19
    Caption = 'Tipo'
  end
  object Label1: TLabel
    Left = 176
    Top = 8
    Width = 56
    Height = 19
    Caption = 'Telefone'
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 80
    Width = 97
    Height = 34
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 80
    Width = 97
    Height = 34
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object EdTelefone: TEdit
    Left = 176
    Top = 33
    Width = 153
    Height = 27
    TabOrder = 2
  end
  object CbTipo: TComboBox
    Left = 8
    Top = 32
    Width = 153
    Height = 27
    TabOrder = 3
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
    Left = 56
    Top = 48
  end
  object DspConn: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = Server
    Left = 96
    Top = 48
  end
  object Ta_Tipo_Tel: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_tipo'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp_Ta_Tipo_Tel'
    ReadOnly = True
    RemoteServer = DspConn
    StoreDefs = True
    Left = 144
    Top = 48
    object Ta_Tipo_Telid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Ta_Tipo_Teldescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object DataSource1: TDataSource
    DataSet = Ta_Tipo_Tel
    Left = 8
    Top = 48
  end
end
