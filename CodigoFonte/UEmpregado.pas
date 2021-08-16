unit UEmpregado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFEmpregado = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    btnConsultarDepartamento: TSpeedButton;
    btnConsultarFuncao: TSpeedButton;
    Qid: TZQuery;
    Qidmax: TIntegerField;
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure navegar;
    procedure editar;
    procedure btnSairClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarDepartamentoClick(Sender: TObject);
    procedure btnConsultarFuncaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmpregado: TFEmpregado;
  novoEmpregado: boolean;

implementation

{$R *.dfm}

uses UDM, UConsultaDepartamento, UMenu, UConsultaFuncao;

procedure TFEmpregado.navegar;
begin
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;
  DBEdit4.Enabled := false;
  DBEdit6.Enabled := false;
  DBEdit7.Enabled := false;
  DBEdit8.Enabled := false;
  DBLookupComboBox1.Enabled := false;
  DBLookupComboBox2.Enabled := false;
  btnConsultarDepartamento.Enabled := false;
  btnConsultarFuncao.Enabled := false;
  btnNovo.Enabled := true;
  btnAlterar.Enabled := true;
  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;
  btnExcluir.Enabled := true;
  btnSair.Enabled := true;
  DBNavigator1.Enabled := true;
end;

procedure TFEmpregado.editar;
begin
  DBEdit2.Enabled := true;
  DBEdit3.Enabled := true;
  DBEdit4.Enabled := true;
  DBEdit6.Enabled := true;
  DBEdit7.Enabled := true;
  DBEdit8.Enabled := true;
  DBLookupComboBox1.Enabled := true;
  DBLookupComboBox2.Enabled := true;
  btnConsultarDepartamento.Enabled := true;
  btnConsultarFuncao.Enabled := true;
  btnNovo.Enabled := false;
  btnAlterar.Enabled := false;
  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
  btnSair.Enabled := false;
  DBNavigator1.Enabled := false;

  DBEdit2.SetFocus;
end;

procedure TFEmpregado.btnAlterarClick(Sender: TObject);
begin
  novoEmpregado := false;
  DM.TBEmpregado.Edit;
  editar;
end;

procedure TFEmpregado.btnCancelarClick(Sender: TObject);
var empregadoCancelado: integer;
begin
  DM.TBEmpregado.Cancel;
  navegar;
end;

procedure TFEmpregado.btnConsultarDepartamentoClick(Sender: TObject);
begin
  FConsultaDepartamento := TFConsultaDepartamento.Create(Self);
  FConsultaDepartamento.ShowModal;
  DM.TBDepartamento.Locate('id_departamento', departamentoConsultado, []);
  DM.TBEmpregadocod_departamento.Value := departamentoConsultado;
end;

procedure TFEmpregado.btnConsultarFuncaoClick(Sender: TObject);
begin
  FConsultaFuncao := TFConsultaFuncao.Create(Self);
  FConsultaFuncao.ShowModal;
  DM.TBFuncao.Locate('id_funcao', funcaoConsultada, []);
  DM.TBEmpregadocod_emp_funcao.Value := funcaoConsultada;
end;

procedure TFEmpregado.btnExcluirClick(Sender: TObject);
begin
  if(Application.MessageBox('Você realmente deseja excluir o registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes) then
  begin
    DM.TBEmpregado.Delete;
    DM.TBEmpregado.ApplyUpdates;
    navegar;
  end else
  begin
    navegar;
  end;
end;

procedure TFEmpregado.btnNovoClick(Sender: TObject);
var idEmpregado: integer;
begin
  novoEmpregado := true;
  Qid.Close;
  Qid.Open;
  idEmpregado := Qidmax.Value + 1;
  DM.TBEmpregado.Insert;
  DM.TBEmpregadoid_empregado.Value := idEmpregado;
  editar;
end;

procedure TFEmpregado.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFEmpregado.btnSalvarClick(Sender: TObject);
begin
  if(DM.TBDepartamento.Locate('id_departamento', DM.TBEmpregadocod_departamento.Value, []))then
  begin
    if(DM.TBFuncao.Locate('id_funcao', DM.TBEmpregadocod_emp_funcao.Value, []))then
    begin
      DM.TBFuncao.Locate('id_funcao', DM.TBEmpregadocod_emp_funcao.Value, []);
      DM.TBEmpregadonm_funcao.Value :=  DM.TBFuncaonm_funcao.Value;
      DM.TBEmpregado.ApplyUpdates;
      navegar;
    end else
    begin
      ShowMessage('Informe a Função do Empregado!');
    end;
  end else
  begin
    ShowMessage('Informe o Departamento do Empregado!');
  end;

end;

procedure TFEmpregado.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return) or (key = 40) then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFEmpregado.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = 38) then
  begin
    Perform(WM_NEXTDLGCTL, 1, 0);
  end;
end;

procedure TFEmpregado.DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return) or (key = 40) then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
  end else
  if(key = 38) then
  begin
    Perform(WM_NEXTDLGCTL, 1, 0);
  end;
end;

procedure TFEmpregado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if(btnCancelar.Enabled = true) then
  begin
    btnCancelar.Click;
  end;
end;

procedure TFEmpregado.FormShow(Sender: TObject);
begin
  navegar;
end;

end.
