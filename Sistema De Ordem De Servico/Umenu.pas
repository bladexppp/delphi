unit Umenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  TFrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    Cadastro1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Cliente1: TMenuItem;
    Materiasi1: TMenuItem;
    Servios1: TMenuItem;
    Modelos1: TMenuItem;
    Movimento1: TMenuItem;
    OrdemSevio1: TMenuItem;
    Consulta1: TMenuItem;
    OrdemServio1: TMenuItem;
    Sair1: TMenuItem;
    imgClientes: TImage;
    ImgServicos: TImage;
    imgMaterial: TImage;
    imgModelo: TImage;
    imgOrdem: TImage;
    imgFechar: TImage;
    Reltorios1: TMenuItem;
    Materiais1: TMenuItem;
    Inativos1: TMenuItem;
    Novo1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Materiasi1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Modelos1Click(Sender: TObject);
    procedure OrdemSevio1Click(Sender: TObject);
    procedure OrdemServio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Materiais1Click(Sender: TObject);
    procedure Inativos1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses UFuncoes, UDMDados, UCadCliente, UCadProduto, UServicos, UCadModelo,
  UOrdemServico, UPesquisaOrdemServico, URelatorioMateriais, URelatorioInativos,
  Unit1;

procedure TFrmMenu.Cliente1Click(Sender: TObject);
var
wTela:TFrmCadCliente;
begin
  wTela:=TFrmCadCliente.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not Pergunta('Deseja Sair Do Sistema?') then
    abort;
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
try
   DMDados.Bdados.Connected:=true
  except on E: Exception do
   Mensagem('Erro ao conectar com o banco de dados: ' + E.Message);
  end;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := datetostr(Date);
end;

procedure TFrmMenu.Inativos1Click(Sender: TObject);
var
wTela:TFrmRelInativos;
begin
  wTela:=TFrmRelInativos.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.Materiais1Click(Sender: TObject);
begin
  FrmRelMateriais :=TFrmRelMateriais.create(self);

  with FrmRelMateriais do
    begin

      Consulta.Open();
      ReportMat.PreviewModal;
      Free;

    end;
end;

procedure TFrmMenu.Materiasi1Click(Sender: TObject);
var
wTela:TFrmCadProduto;
begin
  wTela:=TFrmCadProduto.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.Modelos1Click(Sender: TObject);
var
wTela:TFrmCadModelo;
begin
  wTela:=TFrmCadModelo.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.Novo1Click(Sender: TObject);
var
wTela:TForm1;
begin
  wTela:=TForm1.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.OrdemServio1Click(Sender: TObject);
var
wTela:TFrmPesquisaOs;
begin
  wTela:=TFrmPesquisaOs.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.OrdemSevio1Click(Sender: TObject);
var
wTela:TFrmOrdemServico;
begin
  wTela:=TFrmOrdemServico.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMenu.Servios1Click(Sender: TObject);
var
wTela:TFrmCadServicos;
begin
  wTela:=TFrmCadServicos.Create(self);
  wTela.ShowModal;
  wTela.Free;

end;

procedure TFrmMenu.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := Timetostr(Time);
end;

end.
