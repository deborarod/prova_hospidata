unit URelatorioEmpregados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, QRPDFFilt;

type
  TFRelatorioEmpregado = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    txtDescricaoRelatorio: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRelatorio: TZQuery;
    QRelatorioid_empregado: TIntegerField;
    QRelatoriocod_departamento: TIntegerField;
    QRelatoriocod_emp_funcao: TIntegerField;
    QRelatorionm_empregado: TWideStringField;
    QRelatorionm_funcao: TWideStringField;
    QRelatoriodata_admissao: TDateField;
    QRelatoriosalario: TFloatField;
    QRelatoriocomissao: TFloatField;
    QRelatorionm_departamento: TWideStringField;
    QRelatorionm_funcao_1: TWideStringField;
    QRShape3: TQRShape;
    txtQuantidadeListada: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioEmpregado: TFRelatorioEmpregado;
  qtdlistada: Integer;
  cor: boolean;

implementation

{$R *.dfm}

uses UDM;

procedure TFRelatorioEmpregado.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qtdlistada := qtdlistada + 1;

  if cor = true then
  begin
    QRBand3.Color := clInfoBk;
    QRDBText1.Color := clInfoBk;
    QRDBText2.Color := clInfoBk;
    QRDBText3.Color := clInfoBk;
    QRDBText4.Color := clInfoBk;
    QRDBText5.Color := clInfoBk;
    QRDBText6.Color := clInfoBk;
    QRDBText7.Color := clInfoBk;
    cor := false;
  end else
  begin
    QRBand3.Color := clWhite;
    QRDBText1.Color := clWhite;
    QRDBText2.Color := clWhite;
    QRDBText3.Color := clWhite;
    QRDBText4.Color := clWhite;
    QRDBText5.Color := clWhite;
    QRDBText6.Color := clWhite;
    QRDBText7.Color := clWhite;
    cor := true;
  end;
end;

procedure TFRelatorioEmpregado.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   txtQuantidadeListada.Caption := 'Quantidade de Funcionários Listados no Relatório: '+IntToStr(qtdlistada);
end;

procedure TFRelatorioEmpregado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   qtdlistada := 0;
end;

end.
