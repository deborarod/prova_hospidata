object DM: TDM
  OldCreateOrder = False
  Height = 320
  Width = 392
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 5432
    Database = 'hospidata'
    User = 'postgres'
    Password = 'masterkey'
    Protocol = 'postgresql'
    LibraryLocation = 'C:\Program Files (x86)\PostgreSQL\10\bin\libpq.dll'
    Left = 32
    Top = 24
  end
  object TBDepartamento: TZTable
    Connection = ZConnection1
    TableName = 'public.departamentos'
    Left = 128
    Top = 24
    object TBDepartamentoid_departamento: TIntegerField
      FieldName = 'id_departamento'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object TBDepartamentonm_departamento: TWideStringField
      FieldName = 'nm_departamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object TBDepartamentonm_local: TWideStringField
      FieldName = 'nm_local'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
  end
  object TBFuncao: TZTable
    Connection = ZConnection1
    TableName = 'public.funcoes'
    Left = 128
    Top = 80
    object TBFuncaoid_funcao: TIntegerField
      FieldName = 'id_funcao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object TBFuncaonm_funcao: TWideStringField
      FieldName = 'nm_funcao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
  end
  object TBEmpregado: TZTable
    Connection = ZConnection1
    TableName = 'public.empregados'
    Left = 128
    Top = 137
    object TBEmpregadoid_empregado: TIntegerField
      FieldName = 'id_empregado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object TBEmpregadocod_departamento: TIntegerField
      FieldName = 'cod_departamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBEmpregadocod_emp_funcao: TIntegerField
      FieldName = 'cod_emp_funcao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBEmpregadonm_empregado: TWideStringField
      FieldName = 'nm_empregado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object TBEmpregadonm_funcao: TWideStringField
      FieldName = 'nm_funcao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object TBEmpregadodata_admissao: TDateField
      FieldName = 'data_admissao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      EditMask = '!99/99/0000;1;_'
    end
    object TBEmpregadosalario: TFloatField
      FieldName = 'salario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      currency = True
    end
    object TBEmpregadocomissao: TFloatField
      FieldName = 'comissao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object DSDepartamento: TDataSource
    DataSet = TBDepartamento
    Left = 216
    Top = 24
  end
  object DSFuncao: TDataSource
    DataSet = TBFuncao
    Left = 216
    Top = 80
  end
  object DSEmpregado: TDataSource
    DataSet = TBEmpregado
    Left = 217
    Top = 137
  end
end
