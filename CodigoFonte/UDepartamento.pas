unit UDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.StdCtrls, Vcl.Mask, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFDepartamento = class(TForm)
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
    Qid: TZQuery;
    Qidmax: TIntegerField;
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDepartamento: TFDepartamento;
  novoDepartamento: boolean;
  departamentoConsultado: integer;

implementation

{$R *.dfm}

uses UDM;

procedure TFDepartamento.navegar;
begin
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;
  btnNovo.Enabled := true;
  btnAlterar.Enabled := true;
  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;
  btnExcluir.Enabled := true;
  btnSair.Enabled := true;
  DBNavigator1.Enabled := true;
end;

procedure TFDepartamento.editar;
begin
  DBEdit2.Enabled := true;
  DBEdit3.Enabled := true;
  btnNovo.Enabled := false;
  btnAlterar.Enabled := false;
  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
  btnSair.Enabled := false;
  DBNavigator1.Enabled := false;

  DBEdit2.SetFocus;
end;

procedure TFDepartamento.btnAlterarClick(Sender: TObject);
begin
  novoDepartamento := false;
  DM.TBDepartamento.Edit;
  editar;
end;

procedure TFDepartamento.btnCancelarClick(Sender: TObject);
var departamentoCancelado: integer;
begin
  departamentoCancelado := DM.TBDepartamentoid_departamento.Value;
  if(novoDepartamento = true) then
  begin
    DM.TBDepartamento.Cancel;
    if(DM.TBDepartamento.Locate('id_departamento', departamentoCancelado, [])) then
    begin
      DM.TBDepartamento.Locate('id_departamento', departamentoCancelado, []);
      DM.TBDepartamento.Delete;
      DM.TBDepartamento.ApplyUpdates;
      navegar;
    end;
  end else
  begin
    DM.TBDepartamento.Cancel;
    navegar;
  end;
end;

procedure TFDepartamento.btnExcluirClick(Sender: TObject);
begin
  if(Application.MessageBox('Você realmente deseja excluir o registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes) then
  begin
    DM.TBDepartamento.Delete;
    DM.TBDepartamento.ApplyUpdates;
    navegar;
  end else
  begin
    navegar;
  end;
end;

procedure TFDepartamento.btnNovoClick(Sender: TObject);
var idDepartamento: integer;
begin
  novoDepartamento := true;
  Qid.Close;
  Qid.Open;
  idDepartamento := Qidmax.Value + 1;
  DM.TBDepartamento.Insert;
  DM.TBDepartamentoid_departamento.Value := idDepartamento;
  DM.TBDepartamento.Post;
  DM.TBDepartamento.ApplyUpdates;
  if(DM.TBDepartamento.Locate('id_departamento', idDepartamento, []))then
  begin
    DM.TBDepartamento.Locate('id_departamento', idDepartamento, []);
    DM.TBDepartamento.Edit;
    editar;
  end;
end;

procedure TFDepartamento.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFDepartamento.btnSalvarClick(Sender: TObject);
begin
  DM.TBDepartamento.Post;
  DM.TBDepartamento.ApplyUpdates;
  navegar;
end;

procedure TFDepartamento.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return) or (key = 40) then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFDepartamento.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = 38) then
  begin
    Perform(WM_NEXTDLGCTL, 1, 0);
  end;
end;

procedure TFDepartamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  departamentoConsultado := DM.TBDepartamentoid_departamento.Value;
  if(btnCancelar.Enabled = true) then
  begin
    btnCancelar.Click;
  end;
end;

procedure TFDepartamento.FormShow(Sender: TObject);
begin
  navegar;
end;

end.
