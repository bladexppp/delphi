unit UCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadProduto = class(TForm)
    TabCadastro: TPageControl;
    CadProduto: TTabSheet;
    Pesquisa: TTabSheet;
    DBNavigator1: TDBNavigator;
    PngBotoes: TPanel;
    PngItens: TPanel;
    Material: TFDQuery;
    dsMaterial: TDataSource;
    MaterialCOD_PRODUTO: TIntegerField;
    MaterialDESCRICAO: TStringField;
    MaterialVLR_UNITARIO: TBCDField;
    Label1: TLabel;
    txtCodigo: TDBEdit;
    Label2: TLabel;
    txtDescricao: TDBEdit;
    Label3: TLabel;
    txtVlr_unitario: TDBEdit;
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
    MaterialFLG_ATIVO: TStringField;
    txtStatus: TEdit;
    chkIt: TDBCheckBox;
    cmdSN: TBitBtn;
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
    procedure cmdSNClick(Sender: TObject);
    procedure dsMaterialDataChange(Sender: TObject; Field: TField);
    procedure chkItClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses UDMDados, UFuncoes;

procedure TFrmCadProduto.cbPesquisaChange(Sender: TObject);
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

procedure TFrmCadProduto.chkItClick(Sender: TObject);
begin
    if material.FieldByName('FLG_ATIVO').AsString = 'N' then
begin
  txtStatus.text:='Inativo';
 txtStatus.Font.Color:= clRed;
 end
else
 if material.FieldByName('FLG_ATIVO').AsString = 'S' then
 begin
    txtStatus.text:='Ativo';
    txtStatus.Font.Color:= clGreen;
end;
end;

procedure TFrmCadProduto.cmdAlteraClick(Sender: TObject);
begin
    if material.FieldByName('FLG_ATIVO').AsString = 'N' then
    begin
    Mensagem('Imposivel Alterar! Material Est? Inativo.');
    cmdNovo.SetFocus;
    abort;
    end;

  Material.Edit;
  habilita(false);
  txtDescricao.SetFocus;
end;

procedure TFrmCadProduto.cmdCancelaClick(Sender: TObject);
begin
  Material.Cancel;
  habilita(true);
  cmdNovo.SetFocus;
end;

procedure TFrmCadProduto.cmdConfirmaClick(Sender: TObject);
begin
  if txtDescricao.Text='' then
       begin
         Mensagem('Obrigat?rio Informar A Descri??o');
         txtDescricao.SetFocus;
         abort;
       end;

   if txtVlr_unitario.Text='' then
    begin
      Mensagem('Obrigat?rio Informar um valor');
      txtVlr_unitario.SetFocus;
      abort;
    end;

   if not DMDados.Bdados.InTransaction then
    DMDados.Bdados.StartTransaction;

   try
    Material.Post;
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
     Material.Refresh;
     Material.Last;
   end;
end;

procedure TFrmCadProduto.cmdExcluiClick(Sender: TObject);
begin
 if material.FieldByName('FLG_ATIVO').AsString = 'N' then
    begin
    Mensagem('Imposivel Deletar! Material Est? Inativo.');
    cmdNovo.SetFocus;
    abort;
    end;

  if Pergunta('Deseja Realmente Apagar Esse Material?') then
    Material.Delete;
end;

procedure TFrmCadProduto.cmdNovoClick(Sender: TObject);
begin
  Material.Insert;
  material.FieldByName('FLG_ATIVO').AsString :='S';
  Habilita(false);
  txtDescricao.SetFocus;
end;

procedure TFrmCadProduto.cmdSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadProduto.cmdSNClick(Sender: TObject);
begin
if material.FieldByName('FLG_ATIVO').AsString = 'S' then
begin
  if MessageBox(Application.Handle, 'Este Cliente Est? Ativo' + #013
   + 'Deseja Inativar ?',
  'Confirma Inativa??o', MB_YESNO + MB_ICONQUESTION) = MRYES then
     begin
      material.Edit;
      material.FieldByName('FLG_ATIVO').AsString :='N';
      material.Post;
      //material.Refresh ;
      end
  else
     begin
      abort;
     end;
  end
  else if (material.FieldByName('FLG_ATIVO').AsString = 'N')  or (material.FieldByName('FLG_ATIVO').AsString = '') then
begin
  if MessageBox(Application.Handle, 'Este Cliente Est? Inativo' + #013
 + 'Deseja Reativar ?',
'Confirma Reativa??o', MB_YESNO + MB_ICONQUESTION) = MRYES then
 begin
  material.Edit;
  material.FieldByName('FLG_ATIVO').AsString :='S';
  material.Post;
  //material.Refresh;

end
   else
     begin
      abort;
     end;
 end;
end;

procedure TFrmCadProduto.DBGrid1DblClick(Sender: TObject);
begin
TabCadastro.ActivePageIndex:=0;
end;

procedure TFrmCadProduto.dsMaterialDataChange(Sender: TObject; Field: TField);
begin
    if material.FieldByName('FLG_ATIVO').AsString = 'N' then
begin
  txtStatus.text:='Inativo';
 txtStatus.Font.Color:= clRed;
 end
else
 if material.FieldByName('FLG_ATIVO').AsString = 'S' then
 begin
    txtStatus.text:='Ativo';
    txtStatus.Font.Color:= clGreen;
end;
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
begin
  Material.Open();
end;

procedure TFrmCadProduto.FormShow(Sender: TObject);
begin
  TabCadastro.ActivePageIndex:=0;

  Habilita(true);
  cmdNovo.Setfocus
end;

procedure TFrmCadProduto.Habilita(wStatus: boolean);
begin
  cmdNovo.Enabled               :=wStatus;
  cmdAltera.Enabled             :=wStatus;
  cmdExclui.Enabled             :=wStatus;
  cmdSN.Enabled                 :=wStatus;
  cmdConfirma.Enabled           :=not wStatus;
  cmdCancela.Enabled            :=not wStatus;
  txtDescricao.Enabled          :=not wStatus;
  txtVlr_unitario.Enabled       :=not wStatus;

end;

procedure TFrmCadProduto.txtPesquisaChange(Sender: TObject);
begin
  if txtPesquisa.Text='' then
  abort;

   if cbPesquisa.text ='C?digo'then
    Material.Locate('COD_PRODUTO',txtPesquisa.Text,[loCaseInsensitive,loPartialKey])
   else
    Material.Locate('DESCRICAO',txtPesquisa.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFrmCadProduto.txtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if self.Text<>'' then
    begin
      if key=#13 then
        TabCadastro.ActivePageIndex:=0;
    end;
end;

end.
