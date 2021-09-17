unit URelatorioInativosClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelCliInativo = class(TForm)
    ReportInativoCli: TRLReport;
    Consulta: TFDQuery;
    dsCosulta: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLBand6: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand3: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    ConsultaCOD_CLIENTE: TIntegerField;
    ConsultaNOME: TStringField;
    ConsultaCPF: TStringField;
    ConsultaDATA_NASCIMENTO: TDateField;
    ConsultaEMAIL: TStringField;
    ConsultaENDERECO: TStringField;
    ConsultaNUMERO: TStringField;
    ConsultaBAIRRO: TStringField;
    ConsultaSEXO: TStringField;
    ConsultaTELEFONE: TStringField;
    ConsultaFLG_ATIVO: TStringField;
    ConsultaCIDADE: TStringField;
    ConsultaCEP: TStringField;
    ConsultaUF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCliInativo: TFrmRelCliInativo;

implementation

{$R *.dfm}

uses UDMDados, UFuncoes;

end.
