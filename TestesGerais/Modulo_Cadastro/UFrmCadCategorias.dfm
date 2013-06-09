object FrmCadCategorias: TFrmCadCategorias
  Left = 0
  Top = 0
  Caption = 'Cadastro de Categorias'
  ClientHeight = 502
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 672
    Height = 453
    ActivePage = TabSheet8
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Categorias'
      OnShow = TabSheet1Show
      ExplicitLeft = 8
      ExplicitTop = 0
      ExplicitWidth = 690
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 329
        Height = 395
        Align = alLeft
        TabOrder = 0
        object Label3: TLabel
          Left = 1
          Top = 1
          Width = 327
          Height = 24
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Servi'#231'os'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 255
        end
        object DBGrid10: TDBGrid
          Left = 1
          Top = 25
          Width = 327
          Height = 369
          Align = alClient
          DataSource = DM_CadCategorias.ds_Tbl_Categ_Serv
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Calibri'
          TitleFont.Style = []
        end
      end
      object Panel2: TPanel
        Left = 329
        Top = 0
        Width = 335
        Height = 395
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 257
        ExplicitWidth = 433
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 333
          Height = 24
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 255
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 25
          Width = 333
          Height = 369
          Align = alClient
          DataSource = DM_CadCategorias.ds_Tbl_Categ_Prod
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Calibri'
          TitleFont.Style = []
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Situa'#231#227'o Documentos'
      ImageIndex = 1
      OnShow = TabSheet2Show
      ExplicitLeft = 0
      ExplicitTop = 78
      ExplicitWidth = 514
      ExplicitHeight = 371
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Status_Mov
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tipo de E-mail'
      ImageIndex = 2
      OnShow = TabSheet3Show
      ExplicitLeft = 0
      ExplicitTop = 78
      ExplicitWidth = 514
      ExplicitHeight = 371
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Tipo_Email
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Tipos de Endere'#231'os'
      ImageIndex = 3
      OnShow = TabSheet4Show
      ExplicitLeft = 0
      ExplicitTop = 78
      ExplicitWidth = 514
      ExplicitHeight = 371
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Tipo_Ende
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Tipos de Telefones'
      ImageIndex = 4
      OnShow = TabSheet5Show
      ExplicitLeft = 0
      ExplicitTop = 78
      ExplicitWidth = 514
      ExplicitHeight = 371
      object DBGrid5: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Tipo_Tel
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Tipos de Itens'
      ImageIndex = 5
      OnShow = TabSheet6Show
      ExplicitLeft = 0
      ExplicitTop = 78
      ExplicitWidth = 514
      ExplicitHeight = 371
      object DBGrid6: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Tipo_Itens
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Tipos de Movimentos'
      ImageIndex = 6
      OnShow = TabSheet7Show
      ExplicitLeft = 0
      ExplicitTop = 78
      ExplicitWidth = 514
      ExplicitHeight = 371
      object DBGrid7: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Tipo_Mov
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Tipos de Entidades'
      ImageIndex = 7
      OnShow = TabSheet8Show
      object DBGrid8: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 395
        Align = alClient
        DataSource = DM_CadCategorias.ds_Tbl_Tipo_Entidade
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      672
      49)
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 642
      Height = 35
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Calibri'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 633
    end
  end
end
