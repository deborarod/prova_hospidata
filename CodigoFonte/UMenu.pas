unit UMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus;

type
  TFMenu = class(TForm)
    Panel1: TPanel;
    btnDepartamento: TSpeedButton;
    btnRelatorio: TSpeedButton;
    btnSair: TSpeedButton;
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    R1: TMenuItem;
    S2: TMenuItem;
    D1: TMenuItem;
    E1: TMenuItem;
    R2: TMenuItem;
    btnEmpregado: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDepartamentoClick(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure btnEmpregadoClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure R2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;
  departamentoConsultado: integer;
  funcaoConsultada: integer;

implementation

{$R *.dfm}

uses UDepartamento, UEmpregado, UDM, UFiltroRelatorioEmpregado;

procedure TFMenu.btnDepartamentoClick(Sender: TObject);
begin
  FDepartamento := TFDepartamento.Create(Self);
  FDepartamento.ShowModal;
end;

procedure TFMenu.btnEmpregadoClick(Sender: TObject);
begin
  FEmpregado := TFEmpregado.Create(Self);
  FEmpregado.ShowModal;
end;

procedure TFMenu.btnRelatorioClick(Sender: TObject);
begin
   FFiltroRelatorioEmpregado := TFFiltroRelatorioEmpregado.Create(Self);
   FFiltroRelatorioEmpregado.ShowModal;
end;

procedure TFMenu.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFMenu.D1Click(Sender: TObject);
begin
  FDepartamento := TFDepartamento.Create(Self);
  FDepartamento.ShowModal;
end;

procedure TFMenu.E1Click(Sender: TObject);
begin
  FEmpregado := TFEmpregado.Create(Self);
  FEmpregado.ShowModal;
end;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(self);
  DM.TBDepartamento.Open;
  DM.TBFuncao.Open;
  DM.TBEmpregado.Open;
end;

procedure TFMenu.FormShow(Sender: TObject);
begin
   btnRelatorio.Caption := 'Relatório de'+#13+'Empregados';
end;

procedure TFMenu.R2Click(Sender: TObject);
begin
   FFiltroRelatorioEmpregado := TFFiltroRelatorioEmpregado.Create(Self);
   FFiltroRelatorioEmpregado.ShowModal;
end;

procedure TFMenu.S2Click(Sender: TObject);
begin
  close;
end;

end.
