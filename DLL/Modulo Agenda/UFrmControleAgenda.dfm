object FrmControleAgenda: TFrmControleAgenda
  Left = 0
  Top = 0
  Caption = 'FrmControleAgenda'
  ClientHeight = 523
  ClientWidth = 646
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
  DesignSize = (
    646
    523)
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 646
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = 'Controle geral da agenda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 248
  end
  object Label2: TLabel
    Left = 230
    Top = 32
    Width = 32
    Height = 19
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 78
    Top = 47
    Width = 46
    Height = 19
    Caption = 'Cliente'
  end
  object Label4: TLabel
    Left = 382
    Top = 32
    Width = 50
    Height = 19
    Caption = 'Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 382
    Top = 47
    Width = 62
    Height = 19
    Caption = 'Prestador'
  end
  object Label6: TLabel
    Left = 78
    Top = 32
    Width = 59
    Height = 19
    Caption = 'Situa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 496
    Width = 646
    Height = 27
    Panels = <
      item
        Width = 50
      end>
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 8
    Top = 72
    Width = 630
    Height = 416
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds_Tbl_Agenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    PanelHeight = 52
    PanelWidth = 613
    ParentFont = False
    TabOrder = 1
    RowCount = 8
    object DBServico: TDBText
      Left = 374
      Top = 0
      Width = 194
      Height = 28
      DataField = 'Servico'
      DataSource = ds_Tbl_Agenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBCliente: TDBText
      Left = 70
      Top = 28
      Width = 298
      Height = 25
      DataField = 'Cliente'
      DataSource = ds_Tbl_Agenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object DBData: TDBText
      Left = 222
      Top = 0
      Width = 146
      Height = 28
      DataField = 'data_planejada'
      DataSource = ds_Tbl_Agenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 374
      Top = 28
      Width = 226
      Height = 25
      DataField = 'Prestador'
      DataSource = ds_Tbl_Agenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object DBSituacao: TDBText
      Left = 70
      Top = 0
      Width = 146
      Height = 28
      DataField = 'descricao'
      DataSource = ds_Tbl_Agenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBImage1: TDBImage
      Left = 11
      Top = 8
      Width = 41
      Height = 41
      DataField = 'figura'
      DataSource = ds_Tbl_Agenda
      Stretch = True
      TabOrder = 0
    end
  end
  object TimerAgenda: TTimer
    Interval = 10000
    OnTimer = TimerAgendaTimer
    Left = 592
    Top = 32
  end
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;User I' +
      'D=root;Data Source=modular'
    LoginPrompt = False
    Left = 208
    Top = 176
  end
  object Qry_Agenda: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'INSERT INTO tbl_temp_agenda (id, descricao, figura, data_planeja' +
        'da, servico,'
      '  cliente, prestador, dif, situacao)'
      'select sem.id, sem.descricao, sem.figura, que.*'
      'from tbl_param_atraso_agenda sem'
      
        '  join (select distinct DATE_FORMAT(CONCAT(mov.data_planejada, '#39 +
        ' '#39', mvi.hora_planejada),"%Y/%m/%d %H:%i:%s") data_planejada,'
      
        'concat(cat.descricao, '#39' - '#39', itm.descricao) Servico, pes.nome Cl' +
        'iente, pes2.nome Prestador, '
      'TimeDIFF(CURRENT_TIME, mvi.hora_planejada) Dif,'
      'CASE '
      
        '    WHEN TimeDIFF(CURRENT_TIME, mvi.hora_planejada) <= TIME_FORM' +
        'AT('#39'00:05:00'#39', '#39'%H:%i:%s'#39') THEN 1'
      
        '    WHEN TimeDIFF(CURRENT_TIME, mvi.hora_planejada) <= TIME_FORM' +
        'AT('#39'00:10:00'#39', '#39'%H:%i:%s'#39') THEN 2'
      
        #9#9'WHEN TimeDIFF(CURRENT_TIME, mvi.hora_planejada) <= TIME_FORMAT' +
        '('#39'00:15:00'#39', '#39'%H:%i:%s'#39') THEN 3'
      '    ELSE 4'
      'END situacao'
      ''
      'from tbl_aux_categoria_itens cat '
      
        #9'join tbl_itens itm on cat.id_categoria = itm.id_categoria and c' +
        'at.id_tipo = 1 '
      #9'join tbl_comissao com on itm.id_item = com.id_item '
      #9'join tbl_movimentos_itens mvi on itm.id_item = mvi.id_item '
      #9'join tbl_movimentos mov on mvi.id_movimento = mov.id_movimento '
      #9'join tbl_pessoal pes on mov.id_entidade = pes.id_pessoal '
      #9'join tbl_pessoal pes2 on mvi.id_funcionario = pes2.id_pessoal '
      
        'where mov.id_status = 1 and mvi.status in (1,2) and mov.data_pla' +
        'nejada = Current_Date) Que'
      #9'on que.situacao = sem.id')
    Left = 272
    Top = 176
  end
  object ds_Tbl_Agenda: TDataSource
    DataSet = Tbl_Agenda
    Left = 352
    Top = 224
  end
  object Tbl_Agenda: TADOTable
    Connection = Conexao
    CursorType = ctStatic
    TableName = 'tbl_temp_agenda'
    Left = 352
    Top = 176
    object Tbl_Agendaid: TIntegerField
      FieldName = 'id'
    end
    object Tbl_Agendadescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object Tbl_Agendafigura: TBlobField
      FieldName = 'figura'
    end
    object Tbl_Agendadata_planejada: TDateTimeField
      FieldName = 'data_planejada'
    end
    object Tbl_Agendaservico: TStringField
      FieldName = 'servico'
      Size = 150
    end
    object Tbl_Agendacliente: TStringField
      FieldName = 'cliente'
      Size = 150
    end
    object Tbl_Agendaprestador: TStringField
      FieldName = 'prestador'
      Size = 150
    end
    object Tbl_Agendadif: TTimeField
      FieldName = 'dif'
    end
    object Tbl_Agendasituacao: TIntegerField
      FieldName = 'situacao'
    end
  end
  object Relogio: TTimer
    OnTimer = RelogioTimer
    Left = 536
    Top = 32
  end
end
