unit UConsultaDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Buttons,
  Vcl.StdCtrls;

type
  TFConsultaDepartamento = class(TForm)
    DBGrid1: TDBGrid;
    QBusca: TZQuery;
    DSBusca: TDataSource;
    QBuscaid_departamento: TIntegerField;
    QBuscanm_departamento: TWideStringField;
    QBuscanm_local: TWideStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaDepartamento: TFConsultaDepartamento;

implementation

{$R *.dfm}

uses UDM, UMenu;

procedure TFConsultaDepartamento.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFConsultaDepartamento.DBGrid1DblClick(Sender: TObject);
begin
  close;
end;

procedure TFConsultaDepartamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not odd(QBusca.RecNo) then
  begin
    if not (gdselected in state) then
    begin
      DBGrid1.Canvas.Brush.Color := TColor($FFEFE0);
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;
end;

procedure TFConsultaDepartamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    Close;
  end;
end;

procedure TFConsultaDepartamento.Edit1Change(Sender: TObject);
begin
  QBusca.Close;
  QBusca.SQL.Clear;
  QBusca.SQL.Add('SELECT DEPARTAMENTOS.* FROM DEPARTAMENTOS ');
  QBusca.SQL.Add('WHERE DEPARTAMENTOS.NM_DEPARTAMENTO LIKE :nome ');
  QBusca.SQL.Add('ORDER BY DEPARTAMENTOS.NM_DEPARTAMENTO ');
  QBusca.ParamByName('nome').Value := '%' + Edit1.Text + '%';
  QBusca.Open;
end;

procedure TFConsultaDepartamento.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return) then
  begin
    DBGrid1.SetFocus;
  end;
end;

procedure TFConsultaDepartamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  departamentoConsultado := QBuscaid_departamento.Value;
end;

procedure TFConsultaDepartamento.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;

  QBusca.Close;
  QBusca.SQL.Clear;
  QBusca.SQL.Add('SELECT * FROM DEPARTAMENTOS ');
  QBusca.SQL.Add('ORDER BY DEPARTAMENTOS.NM_DEPARTAMENTO ');
  QBusca.Open;
end;

end.
