unit UConsultaFuncao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFConsultaFuncao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    DBGrid1: TDBGrid;
    QBusca: TZQuery;
    DSBusca: TDataSource;
    QBuscaid_funcao: TIntegerField;
    QBuscanm_funcao: TWideStringField;
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
  FConsultaFuncao: TFConsultaFuncao;

implementation

{$R *.dfm}

uses UMenu, UDM;

procedure TFConsultaFuncao.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFConsultaFuncao.DBGrid1DblClick(Sender: TObject);
begin
  close;
end;

procedure TFConsultaFuncao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFConsultaFuncao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    Close;
  end;
end;

procedure TFConsultaFuncao.Edit1Change(Sender: TObject);
begin
  QBusca.Close;
  QBusca.SQL.Clear;
  QBusca.SQL.Add('SELECT FUNCOES.* FROM FUNCOES ');
  QBusca.SQL.Add('WHERE FUNCOES.NM_FUNCAO LIKE :nome ');
  QBusca.SQL.Add('ORDER BY FUNCOES.NM_FUNCAO ');
  QBusca.ParamByName('nome').Value := '%' + Edit1.Text + '%';
  QBusca.Open;
end;

procedure TFConsultaFuncao.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return) then
  begin
    DBGrid1.SetFocus;
  end;
end;

procedure TFConsultaFuncao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  funcaoConsultada := QBuscaid_funcao.Value;
end;

procedure TFConsultaFuncao.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;

  QBusca.Close;
  QBusca.SQL.Clear;
  QBusca.SQL.Add('SELECT * FROM FUNCOES ');
  QBusca.SQL.Add('ORDER BY FUNCOES.NM_FUNCAO ');
  QBusca.Open;
end;

end.
