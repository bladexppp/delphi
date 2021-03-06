unit UPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls;

type
  TFrmPesquisaCliente = class(TForm)
    PngFiltros: TPanel;
    pngBotes: TPanel;
    Panel3: TPanel;
    grdPesquisa: TDBGrid;
    Cliente: TFDQuery;
    dsCliente: TDataSource;
    txtPesquisa: TEdit;
    Label1: TLabel;
    cmdProcurar: TBitBtn;
    DBNavigator1: TDBNavigator;
    cmdOk: TBitBtn;
    cmdCancela: TBitBtn;
    ClienteCOD_CLIENTE: TIntegerField;
    ClienteNOME: TStringField;
    ClienteCPF: TStringField;
    ClienteDATA_NASCIMENTO: TDateField;
    ClienteEMAIL: TStringField;
    ClienteENDERECO: TStringField;
    ClienteNUMERO: TStringField;
    ClienteBAIRRO: TStringField;
    ClienteSEXO: TStringField;
    ClienteTELEFONE: TStringField;
    ClienteFLG_ATIVO: TStringField;
    ClienteCIDADE: TStringField;
    ClienteCEP: TStringField;
    GroupBox1: TGroupBox;
    rbInicio: TRadioButton;
    rbMeio: TRadioButton;
    Label2: TLabel;
    procedure cmdProcurarClick(Sender: TObject);
    procedure txtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmdOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdCancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wCodCliente:Integer;
  end;

var
  FrmPesquisaCliente: TFrmPesquisaCliente;

implementation

{$R *.dfm}

uses UFuncoes, UCadCliente, UDMDados, UOrdemServico;

procedure TFrmPesquisaCliente.cmdCancelaClick(Sender: TObject);
begin
  wCodCliente:=0;
  close;
end;

procedure TFrmPesquisaCliente.cmdOkClick(Sender: TObject);
begin
wCodCliente := Cliente.FieldByName('COD_CLIENTE').AsInteger;

close;

end;

procedure TFrmPesquisaCliente.cmdProcurarClick(Sender: TObject);
begin
if txtPesquisa.Text = '' then
    begin
      Mensagem('Favor Informar Um Nome');
      txtPesquisa.SetFocus;
      Abort;
    end;

   Cliente.Close;

   if rbInicio.Checked then
    Cliente.ParamByName('WNOME').AsString:=txtPesquisa.Text+'%'
   else if rbMeio.Checked then
    Cliente.ParamByName('WNOME').AsString:= '%' + txtPesquisa.Text + '%';

   Cliente.Open();

end;

procedure TFrmPesquisaCliente.FormShow(Sender: TObject);
begin
  cliente.Open();
  txtPesquisa.SetFocus;
end;

procedure TFrmPesquisaCliente.grdPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
    cmdOkClick(sender);
end;

procedure TFrmPesquisaCliente.txtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    grdPesquisa.SetFocus;

  if key = VK_RETURN then
  cmdProcurarClick(sender);
end;

end.
