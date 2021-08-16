program TesteHospidata;

uses
  Vcl.Forms,
  UMenu in 'UMenu.pas' {FMenu},
  UDepartamento in 'UDepartamento.pas' {FDepartamento},
  UEmpregado in 'UEmpregado.pas' {FEmpregado},
  UDM in 'UDM.pas' {DM: TDataModule},
  UConsultaDepartamento in 'UConsultaDepartamento.pas' {FConsultaDepartamento},
  UFiltroRelatorioEmpregado in 'UFiltroRelatorioEmpregado.pas' {FFiltroRelatorioEmpregado},
  URelatorioEmpregados in 'URelatorioEmpregados.pas' {FRelatorioEmpregado},
  UConsultaFuncao in 'UConsultaFuncao.pas' {FConsultaFuncao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFConsultaFuncao, FConsultaFuncao);
  Application.Run;
end.
