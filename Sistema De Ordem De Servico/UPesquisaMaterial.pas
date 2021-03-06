unit UPesquisaMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPesquisaMaterial = class(TForm)
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
    Material: TFDQuery;
    dsMaterial: TDataSource;
    MaterialCOD_PRODUTO: TIntegerField;
    MaterialDESCRICAO: TStringField;
    MaterialVLR_UNITARIO: TBCDField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    rbInicio: TRadioButton;
    rbMeio: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure cmdCancelaClick(Sender: TObject);
    procedure cmdProcurarClick(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
    procedure txtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    wCodmaterial:Integer;
  end;

var
  FrmPesquisaMaterial: TFrmPesquisaMaterial;

implementation

{$R *.dfm}

uses Umenu, UFuncoes, UOrdemServico, UDMDados, UCadModelo;

procedure TFrmPesquisaMaterial.cmdCancelaClick(Sender: TObject);
begin
  wCodmaterial:=0;
  close;
end;

procedure TFrmPesquisaMaterial.cmdOkClick(Sender: TObject);
begin
wCodmaterial := material.FieldByName('COD_PRODUTO').AsInteger;
close;

end;

procedure TFrmPesquisaMaterial.cmdProcurarClick(Sender: TObject);
begin
if txtPesquisa.Text = '' then
    begin
      Mensagem('Favor Informar Uma Descri??o');
      txtPesquisa.SetFocus;
      Abort;
    end;

   material.Close;

   if rbInicio.Checked then
    material.ParamByName('WMATERIAL').AsString:=txtPesquisa.Text+'%'
   else if rbMeio.Checked then
    material.ParamByName('WMATERIAL').AsString:= '%' + txtPesquisa.Text + '%';

   material.Open();
end;

procedure TFrmPesquisaMaterial.FormShow(Sender: TObject);
begin
  Material.Open();
  txtPesquisa.SetFocus;
end;

procedure TFrmPesquisaMaterial.grdPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_RETURN then
    cmdOkClick(sender);
end;

procedure TFrmPesquisaMaterial.txtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_DOWN then
    grdPesquisa.SetFocus;

  if key = VK_RETURN then
  cmdProcurarClick(sender);
end;

end.
