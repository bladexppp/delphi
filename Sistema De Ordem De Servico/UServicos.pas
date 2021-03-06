unit UServicos;

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
  TFrmCadServicos = class(TForm)
    TabCadastro: TPageControl;
    CadServico: TTabSheet;
    Pesquisa: TTabSheet;
    DBNavigator1: TDBNavigator;
    pngBotoes: TPanel;
    pngItens: TPanel;
    Servicos: TFDQuery;
    dsServicos: TDataSource;
    ServicosCOD_SERVICO: TIntegerField;
    ServicosDESCRICAO: TStringField;
    ServicosVLR_SERVICO: TBCDField;
    Label1: TLabel;
    txtCodigo: TDBEdit;
    Label2: TLabel;
    txtDescricao: TDBEdit;
    Label3: TLabel;
    txtVlr_Unitario: TDBEdit;
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
    procedure cmdSairClick(Sender: TObject);
     procedure Habilita(wStatus:boolean);
    procedure FormShow(Sender: TObject);
    procedure cmdNovoClick(Sender: TObject);
    procedure cmdAlteraClick(Sender: TObject);
    procedure cmdConfirmaClick(Sender: TObject);
    procedure cmdCancelaClick(Sender: TObject);
    procedure cmdExcluiClick(Sender: TObject);
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
  FrmCadServicos: TFrmCadServicos;

implementation

{$R *.dfm}

uses UDMDados, UFuncoes;

procedure TFrmCadServicos.cbPesquisaChange(Sender: TObject);
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

procedure TFrmCadServicos.cmdAlteraClick(Sender: TObject);
begin
  Servicos.Edit;
  habilita(false);
  txtDescricao.SetFocus;
end;

procedure TFrmCadServicos.cmdCancelaClick(Sender: TObject);
begin
  Servicos.Cancel;
  habilita(true);
  cmdNovo.SetFocus;
end;

procedure TFrmCadServicos.cmdConfirmaClick(Sender: TObject);
  begin
  if txtDescricao.Text='' then
       begin
         Mensagem('Obrigat?rio Informar A Descri??o');
         txtDescricao.SetFocus;
         abort;
       end;

   if txtVlr_Unitario.Text='' then
    begin
      Mensagem('Obrigatorio Informar Um Valor');
      txtVlr_Unitario.SetFocus;
      abort;
    end;

   if not DMDados.Bdados.InTransaction then
    DMDados.Bdados.StartTransaction;

   try
    Servicos.Post;
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
     Servicos.Refresh;
     Servicos.Last;
   end;
end;

procedure TFrmCadServicos.cmdExcluiClick(Sender: TObject);
begin
  if Pergunta('Deseja Realmente Apagar Esse Servi?o?') then
    Servicos.Delete;
end;

procedure TFrmCadServicos.cmdNovoClick(Sender: TObject);
begin
  Servicos.Insert;

  Habilita(false);
  txtDescricao.SetFocus;
end;

procedure TFrmCadServicos.cmdSairClick(Sender: TObject);
begin
close;
end;

procedure TFrmCadServicos.DBGrid1DblClick(Sender: TObject);
begin
TabCadastro.ActivePageIndex:=0;
end;

procedure TFrmCadServicos.FormCreate(Sender: TObject);
begin
  Servicos.Open();
end;

procedure TFrmCadServicos.FormShow(Sender: TObject);
begin
  TabCadastro.ActivePageIndex:=0;

  Habilita(true);
  cmdNovo.Setfocus
end;

procedure TFrmCadServicos.Habilita(wStatus: boolean);
begin
  cmdNovo.Enabled               :=wStatus;
  cmdAltera.Enabled             :=wStatus;
  cmdExclui.Enabled             :=wStatus;
  cmdConfirma.Enabled           :=not wStatus;
  cmdCancela.Enabled            :=not wStatus;
  txtDescricao.Enabled          :=not wStatus;
  txtVlr_unitario.Enabled       :=not wStatus;
end;

procedure TFrmCadServicos.txtPesquisaChange(Sender: TObject);
begin
  if txtPesquisa.Text='' then
  abort;

   if cbPesquisa.text ='C?digo'then
    servicos.Locate('COD_SERVICO',txtPesquisa.Text,[loCaseInsensitive,loPartialKey])
   else
    servicos.Locate('DESCRICAO',txtPesquisa.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFrmCadServicos.txtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if self.Text<>'' then
    begin
      if key=#13 then
        TabCadastro.ActivePageIndex:=0;
    end;
end;

end.
