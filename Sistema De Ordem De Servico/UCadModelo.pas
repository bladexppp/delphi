unit UCadModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmCadModelo = class(TForm)
    TabCadastro: TPageControl;
    CadModelo: TTabSheet;
    Pesquisa: TTabSheet;
    DBNavigator1: TDBNavigator;
    pngBotoes: TPanel;
    pngItens: TPanel;
    dsModelo: TDataSource;
    Modelo: TFDQuery;
    ModeloCOD_MODELO: TIntegerField;
    ModeloDESCRICAO: TStringField;
    ModeloFABRICANTE: TStringField;
    Label1: TLabel;
    txtCodigo: TDBEdit;
    Label2: TLabel;
    txtDescricao: TDBEdit;
    Label3: TLabel;
    txtFabricante: TDBEdit;
    cmdNovo: TBitBtn;
    cmdAltera: TBitBtn;
    cmdConfirma: TBitBtn;
    cmdCancela: TBitBtn;
    cmdExclui: TBitBtn;
    cmdSair: TBitBtn;
    Panel1: TPanel;
    cbPesquisa: TComboBox;
    txtPesquisa: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Habilita(wStatus:boolean);
    procedure cmdNovoClick(Sender: TObject);
    procedure cmdAlteraClick(Sender: TObject);
    procedure cmdConfirmaClick(Sender: TObject);
    procedure cmdCancelaClick(Sender: TObject);
    procedure cmdExcluiClick(Sender: TObject);
    procedure cmdSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtPesquisaChange(Sender: TObject);
    procedure txtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadModelo: TFrmCadModelo;

implementation

{$R *.dfm}

uses UFuncoes, UDMDados;

procedure TFrmCadModelo.cbPesquisaChange(Sender: TObject);
begin
  if cbPesquisa.Text = 'C?digo' then
    begin
      txtPesquisa.Text:='';
      txtPesquisa.NumbersOnly:=true;
    end
  else
    begin
      txtPesquisa.Text:='';
      txtPesquisa.NumbersOnly:=false
    end;
end;

procedure TFrmCadModelo.cmdAlteraClick(Sender: TObject);
begin
  modelo.Edit;
  habilita(false);
  txtDescricao.SetFocus;
end;

procedure TFrmCadModelo.cmdCancelaClick(Sender: TObject);
begin
  modelo.Cancel;
  habilita(true);
  cmdNovo.SetFocus;
end;

procedure TFrmCadModelo.cmdConfirmaClick(Sender: TObject);
begin
if txtDescricao.Text='' then
     begin
       Mensagem('Obrigat?rio Informar A Descri??o');
       txtDescricao.SetFocus;
       abort;
     end;

   if not DMDados.Bdados.InTransaction then
    DMDados.Bdados.StartTransaction;

   try
    modelo.Post;
    DMDados.Bdados.Commit;
   except on E: Exception do
     begin
       Mensagem('Ocorreu um Erro ao Salvar o Registro: ' + E.Message);
       DMDados.Bdados.Rollback;
       abort;
     end;
   end;
   habilita(true);
   cmdNovo.SetFocus;
  if txtCodigo.text='' then
   begin
     modelo.Refresh;
     modelo.Last;
   end;
end;

procedure TFrmCadModelo.cmdExcluiClick(Sender: TObject);
begin
  if Pergunta('Deseja Realmente Apagar Esse Modelo?') then
    modelo.Delete;
end;

procedure TFrmCadModelo.cmdNovoClick(Sender: TObject);
begin
  modelo.Insert;

  Habilita(false);
  txtDescricao.SetFocus;
end;

procedure TFrmCadModelo.cmdSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadModelo.DBGrid1DblClick(Sender: TObject);
begin
TabCadastro.ActivePageIndex:=0;
end;

procedure TFrmCadModelo.FormCreate(Sender: TObject);
begin
  Modelo.Open();
end;

procedure TFrmCadModelo.FormShow(Sender: TObject);
begin
  TabCadastro.ActivePageIndex:=0;

  Habilita(true);
  cmdNovo.Setfocus
end;

procedure TFrmCadModelo.Habilita(wStatus: boolean);
begin
cmdNovo.Enabled                 :=wStatus;
  cmdAltera.Enabled             :=wStatus;
  cmdExclui.Enabled             :=wStatus;
  cmdConfirma.Enabled           :=not wStatus;
  cmdCancela.Enabled            :=not wStatus;
  txtDescricao.Enabled          :=not wStatus;
  txtFabricante.Enabled         :=not wStatus;
end;

procedure TFrmCadModelo.txtPesquisaChange(Sender: TObject);
begin
  if txtPesquisa.Text='' then
  abort;

   if cbPesquisa.text ='C?digo'then
    Modelo.Locate('COD_MODELO',txtPesquisa.Text,[loCaseInsensitive,loPartialKey])
   else
    modelo.Locate('DESCRICAO',txtPesquisa.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFrmCadModelo.txtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if self.Text<>'' then
    begin
      if key=#13 then
        TabCadastro.ActivePageIndex:=0;
    end;
end;

end.
