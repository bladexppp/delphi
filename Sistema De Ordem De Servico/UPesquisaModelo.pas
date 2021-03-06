unit UPesquisaModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPesquisaModelo = class(TForm)
    PngFiltros: TPanel;
    Label1: TLabel;
    txtPesquisa: TEdit;
    cmdProcurar: TBitBtn;
    Panel3: TPanel;
    pngBotes: TPanel;
    DBNavigator1: TDBNavigator;
    cmdOk: TBitBtn;
    cmdCancela: TBitBtn;
    grdPesquisa: TDBGrid;
    Modelo: TFDQuery;
    dsModelo: TDataSource;
    ModeloCOD_MODELO: TIntegerField;
    ModeloDESCRICAO: TStringField;
    ModeloFABRICANTE: TStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    rbInicio: TRadioButton;
    rbMeio: TRadioButton;
    procedure cmdCancelaClick(Sender: TObject);
    procedure cmdProcurarClick(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wCodModelo:Integer;
  end;

var
  FrmPesquisaModelo: TFrmPesquisaModelo;

implementation

{$R *.dfm}

uses Umenu, UFuncoes, UDMDados, UOrdemServico, UCadModelo;

procedure TFrmPesquisaModelo.cmdCancelaClick(Sender: TObject);
begin
  wCodModelo:=0;
  close;
end;

procedure TFrmPesquisaModelo.cmdOkClick(Sender: TObject);
begin
wCodModelo := Modelo.FieldByName('COD_MODELO').AsInteger;
close;
end;

procedure TFrmPesquisaModelo.cmdProcurarClick(Sender: TObject);
begin
if txtPesquisa.Text = '' then
    begin
      Mensagem('Favor Informar Um Nome');
      txtPesquisa.SetFocus;
      Abort;
    end;

   Modelo.Close;

   if rbInicio.Checked then
    Modelo.ParamByName('WMODELO').AsString:=txtPesquisa.Text+'%'
   else if rbMeio.Checked then
    Modelo.ParamByName('WMODELO').AsString:= '%' + txtPesquisa.Text + '%';

   Modelo.Open();
end;

procedure TFrmPesquisaModelo.FormShow(Sender: TObject);
begin
  MODELO.Open();
  txtPesquisa.SetFocus;
end;

procedure TFrmPesquisaModelo.grdPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
    cmdOkClick(sender);
end;

procedure TFrmPesquisaModelo.txtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    grdPesquisa.SetFocus;

  if key = VK_RETURN then
  cmdProcurarClick(sender);
end;

end.
