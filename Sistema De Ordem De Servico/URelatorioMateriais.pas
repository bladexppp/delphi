unit URelatorioMateriais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelMateriais = class(TForm)
    ReportMat: TRLReport;
    Consulta: TFDQuery;
    dsConsulta: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand6: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    ConsultaCOD_PRODUTO: TIntegerField;
    ConsultaDESCRICAO: TStringField;
    ConsultaVLR_UNITARIO: TBCDField;
    ConsultaFLG_ATIVO: TStringField;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMateriais: TFrmRelMateriais;

implementation

{$R *.dfm}

uses UDMDados, UFuncoes;

end.
