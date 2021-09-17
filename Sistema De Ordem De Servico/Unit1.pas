unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Datasnap.DBClient,Math;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1COD_PRODUTO: TIntegerField;
    FDQuery1DESCRICAO: TStringField;
    FDQuery1VLR_UNITARIO: TFMTBCDField;
    FDQuery1FLG_ATIVO: TStringField;
    FDQuery1winner: TBooleanField;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1nome: TStringField;
    ClientDataSet1selecao: TIntegerField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Umenu, UDMDados;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  (Sender as TDBGrid).DataSource.Dataset.Edit;

  (Sender as TDBGrid).DataSource.Dataset.FieldByName('SELECAO').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.Dataset.FieldByName('SELECAO').AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.Dataset.Post;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);




 var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'selecao' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('selecao').Value = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
 end;


procedure TForm1.FormShow(Sender: TObject);
begin
  FDQuery1.First;
  with ClientDataSet1 do
    begin
      CreateDataSet;
       open;
      while not FDQuery1.Eof do
      begin
      Append;
      ClientDataSet1nome.AsString := FDQuery1DESCRICAO.AsString;
      ClientDataSet1selecao.Value  := 0;
      post;
      FDQuery1.next;
      end;

    end;

 
end;

end.
