unit UFiltroRelatorioEmpregado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFFiltroRelatorioEmpregado = class(TForm)
    btnVisualizar: TSpeedButton;
    btnSair: TSpeedButton;
    RadioOrdenar: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroRelatorioEmpregado: TFFiltroRelatorioEmpregado;

implementation

{$R *.dfm}

uses URelatorioEmpregados;

procedure TFFiltroRelatorioEmpregado.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFFiltroRelatorioEmpregado.btnVisualizarClick(Sender: TObject);
begin
   FRelatorioEmpregado := TFRelatorioEmpregado.Create(Self);
   FRelatorioEmpregado.QRelatorio.Close;
   FRelatorioEmpregado.QRelatorio.SQL.Clear;
   FRelatorioEmpregado.QRelatorio.SQL.Add('select empregados.*, departamentos.nm_departamento, funcoes.nm_funcao');
   FRelatorioEmpregado.QRelatorio.SQL.Add('from empregados, departamentos, funcoes');
   FRelatorioEmpregado.QRelatorio.SQL.Add('where empregados.cod_departamento = departamentos.id_departamento');
   FRelatorioEmpregado.QRelatorio.SQL.Add('and empregados.cod_emp_funcao = funcoes.id_funcao');
   case RadioOrdenar.ItemIndex of
      0: FRelatorioEmpregado.QRelatorio.SQL.Add('order by empregados.id_empregado');
      1: FRelatorioEmpregado.QRelatorio.SQL.Add('order by empregados.nm_empregado');
      2: FRelatorioEmpregado.QRelatorio.SQL.Add('order by departamentos.nm_departamento');
      3: FRelatorioEmpregado.QRelatorio.SQL.Add('order by empregados.salario');
      4: FRelatorioEmpregado.QRelatorio.SQL.Add('order by empregados.salario desc');
   end;
   FRelatorioEmpregado.QRelatorio.Open;
   case RadioOrdenar.ItemIndex of
      0: FRelatorioEmpregado.txtDescricaoRelatorio.Caption := 'Relatório de empregados ordenados pelo Id.';
      1: FRelatorioEmpregado.txtDescricaoRelatorio.Caption := 'Relatório de empregados ordenados pelo nome do funcionário.';
      2: FRelatorioEmpregado.txtDescricaoRelatorio.Caption := 'Relatório de empregados ordenados pelo nome do departamento.';
      3: FRelatorioEmpregado.txtDescricaoRelatorio.Caption := 'Relatório de empregados ordenados pelo salário.';
      4: FRelatorioEmpregado.txtDescricaoRelatorio.Caption := 'Relatório de empregados ordenados pelo salário em ordem decrescente.';
   end;
   FRelatorioEmpregado.QuickRep1.Prepare;
   FRelatorioEmpregado.QuickRep1.Preview;
end;

end.
