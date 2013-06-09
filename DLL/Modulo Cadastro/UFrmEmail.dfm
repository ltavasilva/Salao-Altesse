object FrmEmail: TFrmEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de E-mail'
  ClientHeight = 131
  ClientWidth = 482
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
    Width = 41
    Height = 19
    Caption = 'E-mail'
  end
  object BitBtn1: TBitBtn
    Left = 120
    Top = 80
    Width = 97
    Height = 34
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 80
    Width = 97
    Height = 34
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object EdEmail: TEdit
    Left = 176
    Top = 33
    Width = 298
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
    Connected = True
    Left = 56
    Top = 48
  end
  object DspConn: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = Server
    Left = 96
    Top = 48
  end
  object Ta_Tipo_Email: TClientDataSet
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
    ProviderName = 'Dsp_Ta_Tipo_Email'
    RemoteServer = DspConn
    StoreDefs = True
    Left = 144
    Top = 48
    object Ta_Tipo_Emailid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Ta_Tipo_Emaildescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object DataSource1: TDataSource
    DataSet = Ta_Tipo_Email
    Left = 8
    Top = 48
  end
end
