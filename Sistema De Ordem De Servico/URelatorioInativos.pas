unit URelatorioInativos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelInativos = class(TForm)
    Panel1: TPanel;
    cmdInativoCliente: TBitBtn;
    cmdInativoMateriais: TBitBtn;
    procedure cmdInativoClienteClick(Sender: TObject);
    procedure cmdInativoMateriaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelInativos: TFrmRelInativos;

implementation

{$R *.dfm}

uses URelatorioInativosClientes, URelatorioInativosMateriais;

procedure TFrmRelInativos.cmdInativoClienteClick(Sender: TObject);
begin
  FrmRelCliInativo :=TFrmRelCliInativo.create(self);

  with FrmRelCliInativo do
    begin

      Consulta.Open();
      ReportInativoCli.PreviewModal;
      Free;

    end;
end;

procedure TFrmRelInativos.cmdInativoMateriaisClick(Sender: TObject);
begin
  FrmRelMatInativo :=TFrmRelMatInativo.create(self);

  with FrmRelMatInativo do
    begin

      Consulta.Open();
      ReportInativoMat.PreviewModal;
      Free;

    end;
end;

end.
