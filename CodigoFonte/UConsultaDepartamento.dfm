object FConsultaDepartamento: TFConsultaDepartamento
  Left = 0
  Top = 0
  Caption = 'Consultar Departamento'
  ClientHeight = 360
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 662
    Height = 279
    Align = alClient
    DataSource = DSBusca
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id_departamento'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_departamento'
        Title.Caption = 'NOME DEPARTAMENTO'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_local'
        Title.Caption = 'LOCAL'
        Width = 200
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 81
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -247
    ExplicitWidth = 909
    object Label1: TLabel
      Left = 25
      Top = 34
      Width = 37
      Height = 13
      Caption = 'BUSCA:'
    end
    object Edit1: TEdit
      Left = 68
      Top = 31
      Width = 401
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = Edit1KeyDown
    end
    object Panel2: TPanel
      Left = 476
      Top = 1
      Width = 185
      Height = 79
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 723
      object btnSair: TSpeedButton
        Left = 57
        Top = 15
        Width = 112
        Height = 48
        Cursor = crHandPoint
        Caption = 'Sair'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000232E0000232E00000000000000000001FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC5C5C5C5C5C5C
          5D5B5A5E5A575E59545E58545E58545E58545E58545E58545E58545E59545E5A
          575D5B5A5C5C5C5C5C5CFFFFFFFFFFFFFFFFFF3B6A9C538BB64983B14A83B14A
          83B14A83B14A83B14983B0538BB63B6A9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3D69976595BC4C83B04E83B04E83AF4E83AF4D83AF4C83AF6594BC3D69
          97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6A9575A1C44A7DA65187B251
          87B25187B25187B24F86B175A1C33E6A95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3E6A9584ABCC457197548AB6538AB6538AB6528AB65088B583ABCC3E6A
          96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6B9593B5D323B9F8588BB857
          8DBB568DBB558CBB528BBA91B7D63E6B96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3F6C97A1BFDB20B8F75A8EBC5891BF5891BF5791BF538EBD9FC1DD3E6D
          98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6D98ADC9E3588FBF5B92C15B
          94C35B94C35A93C35691C1ACCAE43E6D98FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3D6E9AB9D4EA5794C65C97C85D98C85D98C85B97C85795C6B9D5EA3D6E
          9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D709AC6DEF05996CA5E99CB5F
          9ACC5F9ACC5E99CB5996CAC6DEF03D709AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3E719DD4E7F65A9ACE5D9CCF5E9DCF5E9DCF5D9CCF5A9ACED4E7F63E71
          9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42759FAFD1F1ADCFEEAECFEEAE
          CFEEAECFEEAECFEEADCFEEAFD1F142759FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF80A3BF4478A14276A04276A04276A04276A04276A04276A04478A180A3
          BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = btnSairClick
      end
    end
  end
  object QBusca: TZQuery
    Connection = DM.ZConnection1
    SQL.Strings = (
      'select departamentos.* from departamentos')
    Params = <>
    Left = 16
    Top = 128
    object QBuscaid_departamento: TIntegerField
      FieldName = 'id_departamento'
      Required = True
    end
    object QBuscanm_departamento: TWideStringField
      FieldName = 'nm_departamento'
      Size = 100
    end
    object QBuscanm_local: TWideStringField
      FieldName = 'nm_local'
      Size = 100
    end
  end
  object DSBusca: TDataSource
    DataSet = QBusca
    Left = 64
    Top = 128
  end
end
