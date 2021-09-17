unit UPesquisaServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPesquisaServico = class(TForm)
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
    Servico: TFDQuery;
    dsServico: TDataSource;
    ServicoCOD_SERVICO: TIntegerField;
    ServicoDESCRICAO: TStringField;
    ServicoVLR_SERVICO: TBCDField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    rbInicio: TRadioButton;
    rbMeio: TRadioButton;
    procedure cmdProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
    procedure cmdCancelaClick(Sender: TObject);
    procedure txtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    wCodservico:Integer;
  end;

var
  FrmPesquisaServico: TFrmPesquisaServico;

implementation

{$R *.dfm}

uses UFuncoes, UDMDados, UServicos;

procedure TFrmPesquisaServico.cmdCancelaClick(Sender: TObject);
begin
  wCodservico:=0;
  close;
end;

procedure TFrmPesquisaServico.cmdOkClick(Sender: TObject);
begin
wCodservico := Servico.FieldByName('COD_SERVICO').AsInteger;
close;
end;

procedure TFrmPesquisaServico.cmdProcurarClick(Sender: TObject);
begin
if txtPesquisa.Text = '' then
    begin
      Mensagem('Favor Informar Uma Descrição');
      txtPesquisa.SetFocus;
      Abort;
    end;

   Servico.Close;

   if rbInicio.Checked then
    Servico.ParamByName('WSERVICO').AsString:=txtPesquisa.Text+'%'
   else if rbMeio.Checked then
    Servico.ParamByName('WSERVICO').AsString:= '%' + txtPesquisa.Text + '%';

   Servico.Open();
end;

procedure TFrmPesquisaServico.FormShow(Sender: TObject);
begin
  Servico.Open();
  txtPesquisa.SetFocus;
end;

procedure TFrmPesquisaServico.grdPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
    cmdOkClick(sender);
end;

procedure TFrmPesquisaServico.txtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
    grdPesquisa.SetFocus;

  if key = VK_RETURN then
  cmdProcurarClick(sender);
end;

end.
