unit URelatorioOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TFrmRelOrdemServico = class(TForm)
    Consulta: TFDQuery;
    dsConsulta: TDataSource;
    Report: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    OrdemServico: TRLBand;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RLLabel7: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText13: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLLabel11: TRLLabel;
    OrdemServicoItem: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    ConsultaMaterial: TFDQuery;
    dsMaterial: TDataSource;
    Requisicao: TRLBand;
    RLDBText7: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLGroup1: TRLGroup;
    RLGroup2: TRLGroup;
    detailmaterial: TRLSubDetail;
    detailservico: TRLSubDetail;
    CabecalhoMaterial: TRLBand;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ConsultaMaterialCOD_OS: TIntegerField;
    ConsultaMaterialVLR_FINAL_REQUISICAO: TBCDField;
    ConsultaMaterialCOD_PRODUTO: TIntegerField;
    ConsultaMaterialDESCRICAO_MATERIAL: TStringField;
    ConsultaMaterialCOD_REQUISICAO: TIntegerField;
    ConsultaMaterialVLR_UNITARIO_MATERIAL: TBCDField;
    ConsultaMaterialVLR_TOTAL_MATERIAL: TBCDField;
    ConsultaMaterialQUANTIDADE_MATERIAL: TBCDField;
    ConsultaCOD_OS: TIntegerField;
    ConsultaDATA_OS: TDateField;
    ConsultaCOD_CLIENTE: TIntegerField;
    ConsultaNOME: TStringField;
    ConsultaVLR_TOTAL: TBCDField;
    ConsultaOBSERVACAO: TStringField;
    ConsultaCOD_MODELO: TIntegerField;
    ConsultaDESCRICAO_MODELO: TStringField;
    ConsultaDATA_OS_FINAL: TDateField;
    ConsultaVLR_FINAL_SERVICO: TBCDField;
    ConsultaCOD_OS_ITEM: TIntegerField;
    ConsultaVLR_UNITARIO_SERVICO: TBCDField;
    ConsultaQUANTIDADE_SERVICO: TBCDField;
    ConsultaVLR_TOTAL_SERVICO: TBCDField;
    ConsultaCOD_SERVICO: TIntegerField;
    ConsultaDESCRICAO_SERVICO: TStringField;
    FinalRequisicao: TRLBand;
    RLLabel3: TRLLabel;
    DBText1: TDBText;
    FinalServico: TRLBand;
    RLLabel2: TRLLabel;
    DBText2: TDBText;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLDBMemo1: TRLDBMemo;
    RLLabel5: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOrdemServico: TFrmRelOrdemServico;

implementation

{$R *.dfm}

uses UFuncoes, UDMDados;

end.
