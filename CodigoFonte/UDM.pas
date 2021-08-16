unit UDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TDM = class(TDataModule)
    ZConnection1: TZConnection;
    TBDepartamento: TZTable;
    TBDepartamentoid_departamento: TIntegerField;
    TBDepartamentonm_departamento: TWideStringField;
    TBDepartamentonm_local: TWideStringField;
    TBFuncao: TZTable;
    TBFuncaoid_funcao: TIntegerField;
    TBFuncaonm_funcao: TWideStringField;
    TBEmpregado: TZTable;
    TBEmpregadoid_empregado: TIntegerField;
    TBEmpregadocod_departamento: TIntegerField;
    TBEmpregadocod_emp_funcao: TIntegerField;
    TBEmpregadonm_empregado: TWideStringField;
    TBEmpregadonm_funcao: TWideStringField;
    TBEmpregadodata_admissao: TDateField;
    TBEmpregadosalario: TFloatField;
    TBEmpregadocomissao: TFloatField;
    DSDepartamento: TDataSource;
    DSFuncao: TDataSource;
    DSEmpregado: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
