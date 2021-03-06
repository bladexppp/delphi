unit UCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadCliente = class(TForm)
    TabCadastro: TPageControl;
    CadCliente: TTabSheet;
    Pesquisa: TTabSheet;
    Cliente: TFDQuery;
    DsCliente: TDataSource;
    DBNavigator1: TDBNavigator;
    PngBotoesCad: TPanel;
    PngIten: TPanel;
    ClienteCOD_CLIENTE: TIntegerField;
    ClienteNOME: TStringField;
    ClienteCPF: TStringField;
    ClienteDATA_NASCIMENTO: TDateField;
    ClienteEMAIL: TStringField;
    ClienteENDERECO: TStringField;
    ClienteNUMERO: TStringField;
    ClienteBAIRRO: TStringField;
    ClienteSEXO: TStringField;
    ClienteFLG_ATIVO: TStringField;
    ClienteCIDADE: TStringField;
    ClienteCEP: TStringField;
    Label1: TLabel;
    txtCodigo: TDBEdit;
    Label2: TLabel;
    txtNome: TDBEdit;
    Label3: TLabel;
    txtData: TDBEdit;
    Label4: TLabel;
    txtCPF: TDBEdit;
    Label5: TLabel;
    txtEndereco: TDBEdit;
    Label6: TLabel;
    txtNumero: TDBEdit;
    Label7: TLabel;
    txtBairro: TDBEdit;
    Label8: TLabel;
    txtCidade: TDBEdit;
    Label9: TLabel;
    txtCep: TDBEdit;
    Label10: TLabel;
    txtEmail: TDBEdit;
    ClienteTELEFONE: TStringField;
    Label11: TLabel;
    txtTelefone: TDBEdit;
    Label12: TLabel;
    cbSexo: TComboBox;
    cmdAltera: TBitBtn;
    cmdConfirma: TBitBtn;
    cmdSair: TBitBtn;
    cmdNovo: TBitBtn;
    cmdCancela: TBitBtn;
    cmdExclui: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    cbPesquisa: TComboBox;
    txtPesquisa: TEdit;
    cmdStatus: TEdit;
    cmdSN: TBitBtn;
    chkIt: TDBCheckBox;
    ClienteUF: TStringField;
    Label13: TLabel;
    txtUf: TDBEdit;
    procedure DsClienteDataChange(Sender: TObject; Field: TField);
    procedure cmdSairClick(Sender: TObject);
    procedure Habilita(wStatus:boolean);
    procedure FormShow(Sender: TObject);
    procedure cmdNovoClick(Sender: TObject);
    procedure cmdAlteraClick(Sender: TObject);
    procedure cmdConfirmaClick(Sender: TObject);
    procedure cmdCancelaClick(Sender: TObject);
    procedure cmdExcluiClick(Sender: TObject);
    procedure ClienteBeforePost(DataSet: TDataSet);
    procedure txtPesquisaChange(Sender: TObject);
    procedure txtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure cbPesquisaChange(Sender: TObject);
    procedure chkAtivoClick(Sender: TObject);
    procedure cmdSNClick(Sender: TObject);
    procedure chkItClick(Sender: TObject);
    procedure cmdStatusChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;

implementation

{$R *.dfm}

uses UDMDados, UFuncoes;

procedure TFrmCadCliente.cmdSNClick(Sender: TObject);
begin
//   if not DMDados.Bdados.InTransaction then
//    DMDados.Bdados.StartTransaction;

if Cliente.FieldByName('FLG_ATIVO').AsString = 'S' then
begin
  if MessageBox(Application.Handle, 'Este Cliente Est? Ativo' + #013
   + 'Deseja Inativar ?',
  'Confirma inativa??o', MB_YESNO + MB_ICONQUESTION) = MRYES then
     begin
      Cliente.Edit;
      Cliente.FieldByName('FLG_ATIVO').AsString :='N';
      Cliente.Post;
      cliente.Refresh ;
      end
  else
     begin
      abort;
     end;
  end
  else if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
begin
  if MessageBox(Application.Handle, 'Este Cliente Est? Inativo' + #013
 + 'Deseja Reativar ?',
'Confirma Reativa??o', MB_YESNO + MB_ICONQUESTION) = MRYES then
 begin
  Cliente.Edit;
  Cliente.FieldByName('FLG_ATIVO').AsString :='S';
  Cliente.Post;
  cliente.Refresh;
  //DMDados.Bdados.Commit;
end
   else
     begin
      abort;
     end;
 end;

 //DMDados.Bdados.Commit;
end;

procedure TFrmCadCliente.cbPesquisaChange(Sender: TObject);
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

procedure TFrmCadCliente.chkAtivoClick(Sender: TObject);
begin
//if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
//begin
//  cmdStatus.text:='Inativo';
// cmdStatus.Font.Color:= clRed;
// end
//else
// if Cliente.FieldByName('FLG_ATIVO').AsString = 'S' then
// begin
//    cmdStatus.text:='Ativo';
//    cmdStatus.Font.Color:= clGreen;
//end;
end;

procedure TFrmCadCliente.chkItClick(Sender: TObject);
begin
if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
begin
  cmdStatus.text:='Inativo';
 cmdStatus.Font.Color:= clRed;
 end
else

 begin
    cmdStatus.text:='Ativo';
    cmdStatus.Font.Color:= clGreen;
end;
end;

procedure TFrmCadCliente.ClienteBeforePost(DataSet: TDataSet);
begin
 if cbSexo.ItemIndex = 0 then
    Cliente.FieldByName('SEXO').AsString:='F'
   else if cbSexo.ItemIndex = 1 then
    Cliente.FieldByName('SEXO').AsString:='M';
end;

procedure TFrmCadCliente.cmdAlteraClick(Sender: TObject);
begin
  if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
    begin
      Mensagem('Imposivel Alterar! Cliente Est? Inativo.');
      cmdNovo.SetFocus;
      abort;
    end;

  Cliente.Edit;
  habilita(false);
  txtNome.SetFocus;
end;

procedure TFrmCadCliente.cmdCancelaClick(Sender: TObject);
begin
  Cliente.Cancel;
  habilita(true);
  cmdNovo.SetFocus;
end;

procedure TFrmCadCliente.cmdConfirmaClick(Sender: TObject);
begin
  if txtNome.Text='' then
     begin
       Mensagem('Obrigat?rio Informar O Nome');
       txtNome.SetFocus;
       abort;
     end;

  if Cliente.FieldByName('CPF').text='' then
    begin
      Mensagem('Obrigat?rio Informar O CPF');
      txtCPF.SetFocus;
      abort;
    end;
     if Cliente.FieldByName('Telefone').text='' then
    begin
      Mensagem('Obrigat?rio Informar O Telefone');
      txtTelefone.SetFocus;
      abort;
    end;

   if Cliente.Locate( 'cpf', txtcpf.Text, [loCaseInsensitive, loPartialKey] ) then
  Begin
    Mensagem ('CPF ja cadastrado');
    txtcpf.SetFocus;
    Abort;
    //exit;
  end;
   if not DMDados.Bdados.InTransaction then
    DMDados.Bdados.StartTransaction;

   try
    Cliente.Post;
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
     Cliente.Refresh;
     Cliente.Last;
   end;
end;

procedure TFrmCadCliente.cmdExcluiClick(Sender: TObject);
begin
    if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
    begin
    Mensagem('Imposivel Deletar! Cliente Est? Inativo.');
    cmdNovo.SetFocus;
    abort;
    end;

  if Pergunta('Deseja Realmente Apagar Esse Cliente?') then
    Cliente.Delete;
end;

procedure TFrmCadCliente.cmdNovoClick(Sender: TObject);
begin
  Cliente.Insert;
  cliente.FieldByName('FLG_ATIVO').AsString :='S';
  Habilita(false);
  txtNome.SetFocus;
end;

procedure TFrmCadCliente.cmdSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadCliente.cmdStatusChange(Sender: TObject);
begin
//if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
//begin
//  cmdStatus.text:='Inativo';
// cmdStatus.Font.Color:= clRed;
// end
//else
// if Cliente.FieldByName('FLG_ATIVO').AsString = 'S' then
// begin
//    cmdStatus.text:='Ativo';
//    cmdStatus.Font.Color:= clGreen;
//end;
end;

procedure TFrmCadCliente.DBGrid1DblClick(Sender: TObject);
begin
TabCadastro.ActivePageIndex:=0;
end;

procedure TFrmCadCliente.DsClienteDataChange(Sender: TObject; Field: TField);
begin
    if Cliente.FieldByName('SEXO').AsString ='M' then
    cbSexo.ItemIndex:=1
  else if Cliente.FieldByName('SEXO').AsString ='F' then
    cbSexo.ItemIndex:=0;

    if Cliente.FieldByName('FLG_ATIVO').AsString = 'N' then
      begin
        cmdStatus.text:='Inativo';
       cmdStatus.Font.Color:= clRed;
      end
    else
    if Cliente.FieldByName('FLG_ATIVO').AsString = 'S' then
     begin
        cmdStatus.text:='Ativo';
        cmdStatus.Font.Color:= clGreen;
     end;
end;

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
  TabCadastro.ActivePageIndex:=0;
  Cliente.Open;
  Habilita(true);
  cmdNovo.Setfocus
end;

procedure TFrmCadCliente.Habilita(wStatus: boolean);
begin
  cmdNovo.Enabled                 :=wStatus;
  cmdAltera.Enabled               :=wStatus;
  cmdExclui.Enabled               :=wStatus;
  cmdSN.Enabled                   :=wStatus;
  cmdConfirma.Enabled             :=not wStatus;
  cmdCancela.Enabled              :=not wStatus;
  txtNome.Enabled                 :=not wStatus;
  txtCPF.Enabled                  :=not wStatus;
  txtEndereco.Enabled             :=not wStatus;
  txtNumero.Enabled               :=not wStatus;
  txtBairro.Enabled               :=not wStatus;
  txtCidade.Enabled               :=not wStatus;
  txtCep.Enabled                  :=not wStatus;
  txtTelefone.Enabled             :=not wStatus;
  txtEmail.Enabled                :=not wStatus;
  txtData.Enabled                 :=not wStatus;
  cbSexo.Enabled                  :=not wStatus;
  txtUf.Enabled                   :=not wStatus;

end;

procedure TFrmCadCliente.txtPesquisaChange(Sender: TObject);
begin
  if txtPesquisa.Text='' then
  abort;

   if cbPesquisa.text ='C?digo'then
    cliente.Locate('COD_CLIENTE',txtPesquisa.Text,[loCaseInsensitive,loPartialKey])
   else
    cliente.Locate('NOME',txtPesquisa.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFrmCadCliente.txtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if self.Text<>'' then
    begin
      if key=#13 then
        TabCadastro.ActivePageIndex:=0;
    end;
end;

end.
