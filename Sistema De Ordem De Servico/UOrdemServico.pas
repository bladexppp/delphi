unit UOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmOrdemServico = class(TForm)
    TabOs: TPageControl;
    DBNavigator1: TDBNavigator;
    Totais: TTabSheet;
    Servico: TTabSheet;
    Materiais: TTabSheet;
    PngBotoesCad: TPanel;
    cmdAltera: TBitBtn;
    cmdConfirma: TBitBtn;
    cmdSair: TBitBtn;
    cmdCancela: TBitBtn;
    cmdExclui: TBitBtn;
    cmdNovo: TBitBtn;
    pngTotalItens: TPanel;
    FraCliente: TGroupBox;
    txtCliente: TDBEdit;
    txtNomeCliente: TEdit;
    cmdPesqCliente: TButton;
    OS: TFDQuery;
    dsOS: TDataSource;
    OSCOD_OS: TIntegerField;
    OSCOD_CLIENTE: TIntegerField;
    OSSITUACAO: TStringField;
    OSVLR_TOTAL: TBCDField;
    OSDATA_OS: TDateField;
    OSOBSERVACAO: TStringField;
    OSCOD_MODELO: TIntegerField;
    FraModelo: TGroupBox;
    txtModelo: TDBEdit;
    cmdPesquisaModelo: TButton;
    txtDescModelo: TEdit;
    ItemOs: TFDQuery;
    dsItemOs: TDataSource;
    Requisicao: TFDQuery;
    dsRequisicao: TDataSource;
    ItemOsCOD_OS: TIntegerField;
    ItemOsCOD_OS_ITEM: TIntegerField;
    ItemOsCOD_SERVICO: TIntegerField;
    ItemOsVLR_UNITARIO_SERVICO: TBCDField;
    ItemOsQUANTIDADE_SERVICO: TBCDField;
    ItemOsVLR_TOTAL_SERVICO: TBCDField;
    ItemOsDESCRICAO_SERVICO: TStringField;
    RequisicaoCOD_OS: TIntegerField;
    RequisicaoCOD_REQUISICAO: TIntegerField;
    RequisicaoCOD_PRODUTO: TIntegerField;
    RequisicaoDESCRICAO_MATERIAL: TStringField;
    RequisicaoQUANTIDADE_MATERIAL: TBCDField;
    RequisicaoVLR_UNITARIO_MATERIAL: TBCDField;
    RequisicaoVLR_TOTAL_MATERIAL: TBCDField;
    Label1: TLabel;
    txtCodigo: TDBEdit;
    Label2: TLabel;
    txtSituacao: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtValor_Total_Final: TDBEdit;
    txtObservacao: TDBMemo;
    Label6: TLabel;
    OSDATA_OS_FINAL: TDateField;
    ItensServico: TPanel;
    TotalServico: TPanel;
    BarraServico: TPanel;
    grdServico: TDBGrid;
    txtDataFim: TDBEdit;
    txtDataInicio: TDBEdit;
    FraServicos: TGroupBox;
    Label7: TLabel;
    txtServico: TEdit;
    txtDescServico: TEdit;
    cmdPesquisaServicos: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    txtQuantidade: TEdit;
    txtvlr_unitario_servico: TEdit;
    txtvlr_total_servico: TEdit;
    cmdIncluirServico: TButton;
    Label11: TLabel;
    txtvlr_final_servico: TDBEdit;
    ItemOsValor_Total_Final_Servico: TAggregateField;
    OSVLR_FINAL_SERVICO: TBCDField;
    OSVLR_FINAL_REQUISICAO: TBCDField;
    ItemOsVLR_FINAL_SERVICO: TIntegerField;
    SOMASERVICO: TFDQuery;
    SOMASERVICOSUM: TBCDField;
    ItemMaterial: TPanel;
    BarraMaterial: TPanel;
    TotalMaterial: TPanel;
    Label12: TLabel;
    grdMaterial: TDBGrid;
    FraMaterial: TGroupBox;
    Label13: TLabel;
    txtMaterial: TEdit;
    txtDescMaterial: TEdit;
    cmdPesquisaMateriais: TButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    txtQuantidadeMaterial: TEdit;
    txtvlr_unitario_material: TEdit;
    txtvlr_total_material: TEdit;
    cmdIncluirMaterial: TButton;
    txtvlr_final_material: TDBEdit;
    RequisicaoValor_Total_Final_Material: TAggregateField;
    cmdImprimir: TBitBtn;
    cmdDeleteItem: TSpeedButton;
    cmdMateriaisDelete: TSpeedButton;
    cmdFinaliza: TBitBtn;
    procedure cmdPesqClienteClick(Sender: TObject);
    procedure txtClienteChange(Sender: TObject);
    procedure txtClienteExit(Sender: TObject);
    procedure txtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure txtModeloChange(Sender: TObject);
    procedure txtModeloExit(Sender: TObject);
    procedure txtModeloKeyPress(Sender: TObject; var Key: Char);
    procedure cmdPesquisaModeloClick(Sender: TObject);
    procedure cmdSairClick(Sender: TObject);
    procedure cmdNovoClick(Sender: TObject);
    procedure cmdConfirmaClick(Sender: TObject);
    procedure dsOSDataChange(Sender: TObject; Field: TField);
    procedure Habilita(wStatus:boolean);
    procedure cmdCancelaClick(Sender: TObject);
    procedure cmdAlteraClick(Sender: TObject);
    procedure cmdExcluiClick(Sender: TObject);
    procedure cmdPesquisaServicosClick(Sender: TObject);
    procedure txtServicoChange(Sender: TObject);
    procedure txtServicoExit(Sender: TObject);
    procedure txtServicoKeyPress(Sender: TObject; var Key: Char);
    procedure cmdIncluirServicoClick(Sender: TObject);
    procedure txtQuantidadeExit(Sender: TObject);
    procedure txtvlr_unitario_servicoExit(Sender: TObject);
    procedure txtObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure cmdPesquisaMateriaisClick(Sender: TObject);
    procedure txtMaterialChange(Sender: TObject);
    procedure txtMaterialExit(Sender: TObject);
    procedure txtMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure txtQuantidadeMaterialExit(Sender: TObject);
    procedure txtvlr_unitario_materialExit(Sender: TObject);
    procedure cmdIncluirMaterialClick(Sender: TObject);
    function CheckDate(Sender: TField; Text: String): Boolean;
    procedure OSDATA_OSSetText(Sender: TField; const Text: string);
    procedure OSDATA_OS_FINALSetText(Sender: TField; const Text: string);
    procedure cmdImprimirClick(Sender: TObject);
    procedure cmdDeleteItemClick(Sender: TObject);

    procedure cmdMateriaisDeleteClick(Sender: TObject);
    procedure cmdFinalizaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    wcodos:integer;
  end;

var
  FrmOrdemServico: TFrmOrdemServico;

implementation

{$R *.dfm}

uses UFuncoes, UDMDados, UPesquisaCliente, UPesquisaModelo, UPesquisaServico,
  UPesquisaMaterial, URelatorioOrdemServico;

procedure TFrmOrdemServico.cmdDeleteItemClick(Sender: TObject);
begin
  ItemOs.Delete;
  ItemOs.ApplyUpdates();
  ItemOs.CommitUpdates;
end;

function TFrmOrdemServico.CheckDate(Sender: TField; Text: String): Boolean;
begin
Result := False;
  if (Text = ' / / ') or (Text = ' / / ') then
      begin
        Sender.Clear;
        Result := True;
      end
  else
    begin

      try
        Sender.AsString := Text;
        Result := True;
      except
        MessageDlg('Data Inv?lida !!!', mtInformation,[mbOk],0 );

        if Screen.Cursor = crHourGlass then
          begin
          Screen.Cursor := crDefault;
          end;

      end;
    end;
end;

procedure TFrmOrdemServico.cmdAlteraClick(Sender: TObject);
begin
  if os.FieldByName('SITUACAO').AsString='Finalizado' then
    begin
      Mensagem('Imposivel Alterar! Ordem De Servi?o Encontra-se Finalizada');
      cmdNovo.SetFocus;
      abort;
    end;

  OS.Edit;
  habilita(false);
  txtDataInicio.SetFocus;
end;

procedure TFrmOrdemServico.cmdCancelaClick(Sender: TObject);
begin
      os.Cancel;
    //OrcamentoItem.Cancel;
    //OrcamentoItem.Refresh;
  habilita(true);
  cmdNovo.SetFocus;
end;

procedure TFrmOrdemServico.cmdConfirmaClick(Sender: TObject);
var
codos,codositem,codrequisicao:integer;

begin
  {$REGION 'VALIDA??O DE DADOS ORCAMENTARIO'}

    if txtCliente.Text='' then
      begin
        Mensagem('Obrigat?rio Informar O Cliente');
        txtCliente.SetFocus;
        abort;
      end;

    if txtModelo.Text ='' then
     begin
       Mensagem('Obrigat?rio Informar O Modelo');
       txtModelo.SetFocus;
       abort;
     end;

    if os.FieldByName('DATA_OS').AsDateTime > os.FieldByName('DATA_OS_FINAL').AsDateTime then
      begin
        Mensagem('Data inicial se encontra maior que a data final');
        txtDataInicio.SetFocus;
        abort;
      end;

      if itemos.FieldByName('Valor_Total_Final_Servico').IsNull then
        begin
          Mensagem('Obrigatorio Informar Um Servi?o');
          TabOs.ActivePage := Servico;
          txtServico.SetFocus;
          abort;
        end;

      if requisicao.FieldByName('Valor_Total_Final_Material').IsNull then
        begin
          Mensagem('Obrigatorio Informar Um Material');
          TabOs.ActivePage := Materiais;
          txtMaterial.SetFocus;
          abort;
        end;
  {$ENDREGION}

  if os.FieldByName('COD_OS').AsInteger = -1 then
    begin
     codOs:=DMDados.Bdados.ExecSQLScalar('SELECT COALESCE(MAX(COD_OS),0) + 1 FROM ORDEMSERVICO');
     Os.FieldByName('COD_OS').AsInteger:=codOs;
     codositem:=1;
     codrequisicao:=1;
    end
    else
    begin
      codOS        :=OS.FieldByName('COD_OS').AsInteger;
      codositem    := DMDados.Bdados.ExecSQLScalar('SELECT COALESCE (MAX(COD_OS_ITEM)   ,0)   +1 FROM ORDEMSERVICO_ITEM WHERE COD_OS = :COD_OS',[codOS]);
      codrequisicao:= DMDados.Bdados.ExecSQLScalar('SELECT COALESCE (MAX(COD_REQUISICAO),0)   +1 FROM REQUISICAO        WHERE COD_OS = :cod_os_req',[codOS]);
    end;

   try




         OS.FieldByName('VLR_FINAL_SERVICO').AsFloat        :=itemos.FieldByName('Valor_Total_Final_Servico').VALUE;
         OS.FieldByName('VLR_FINAL_REQUISICAO').AsFloat     :=Requisicao.FieldByName('Valor_Total_Final_Material').VALUE;
         os.FieldByName('vlr_total').AsFloat                :=os.FieldByName('VLR_FINAL_SERVICO').AsFloat +  os.FieldByName('VLR_FINAL_REQUISICAO').AsFloat;

        ItemOs.First;
          while not ItemOs.Eof do
            begin
              if ItemOs.FieldByName('COD_OS').AsInteger = -1 then
                begin
                  ItemOs.Edit;
                  ItemOs.FieldByName('COD_OS').AsInteger:=codos;
                  ItemOs.FieldByName('COD_OS_ITEM').AsInteger:=codositem;
                  ItemOs.Post;
                end;
                ItemOs.Next;
                inc(codositem);
            end;


         Requisicao.First;
          while not Requisicao.Eof do
            begin
              if Requisicao.FieldByName('COD_OS').AsInteger=-1 then
                begin
                  Requisicao.Edit;
                  Requisicao.FieldByName('COD_OS').AsInteger:=codos;
                  Requisicao.FieldByName('COD_REQUISICAO').AsInteger:=codrequisicao;
                  Requisicao.Post;
                end;
                Requisicao.Next;
                inc(codrequisicao);
            end;

      os.ApplyUpdates();
      os.CommitUpdates;
      ItemOs.ApplyUpdates();
      ItemOs.CommitUpdates;
      Requisicao.ApplyUpdates();
      Requisicao.CommitUpdates;

     except on E: Exception do
       begin
         Mensagem('Ocorreu um Erro ao Salvar o Registro: ' + E.Message);
         DMDados.Bdados.Rollback;
         abort;
       end;
   end;

   habilita(true);
   cmdNovo.SetFocus;

end;

procedure TFrmOrdemServico.cmdExcluiClick(Sender: TObject);
begin
   if os.FieldByName('SITUACAO').AsString='Finalizado' then
    begin
      Mensagem('Imposivel Deletar! Ordem De Servi?o Encontra-se Finalizada');
      cmdNovo.SetFocus;
      abort;
    end;

  if Pergunta('Deseja Realmente Apagar Essa Ordem De Servi?o?') then
    begin

//      if OrcamentoItem.RecordCount>0 then
//        begin
//
//          if Pergunta('O or?amento possui itens deseja excluir mesmo assim?') then
//            begin
//              DMDados.Bdados.ExecSQL('DELETE FROM ORCAMENTO_ITEM WHERE COD_ORCAMENTO = :WORCAMENTO',[txtCodigo.Text]);
              os.Delete;
              os.ApplyUpdates();
              os.CommitUpdates;
//            end;
//
//        end;
    end;
end;

procedure TFrmOrdemServico.cmdFinalizaClick(Sender: TObject);
begin
  if os.FieldByName('SITUACAO').AsString = 'Aberto' then
  begin
    if Pergunta('Deseja Realmente Finalizar Essa Ordem De Servi?o?') then
    begin
      os.Edit;
      os.FieldByName('SITUACAO').AsString:='Finalizado';
      os.FieldByName('DATA_OS_FINAL').AsDateTime:=date;
      os.ApplyUpdates();
      os.CommitUpdates;
    end
    else
    abort;
  end;
end;

procedure TFrmOrdemServico.cmdImprimirClick(Sender: TObject);
begin
  if txtCodigo.Text ='' then
    abort;

  FrmRelOrdemServico :=TFrmRelOrdemServico.create(self);
  with FrmRelOrdemServico do
    begin
      Consulta.ParamByName('COD_ORDEMSERVICO').AsInteger:=strtoint(txtCodigo.Text);
      Consulta.Open();
            ConsultaMaterial.ParamByName('COD_os').AsInteger:=strtoint(txtCodigo.Text);
      ConsultaMaterial.Open();
      Report.PreviewModal;
      Free;
    end;
end;

procedure TFrmOrdemServico.cmdIncluirMaterialClick(Sender: TObject);
var
  wQuery:TFDQuery;
  WCodMaterial:integer;
begin
{$REGION 'VALIDA??O DE Dados'}
  if txtMaterial.Text='' then
    begin
      Mensagem('Obrigat?rio Informar O Material!');
      txtMaterial.SetFocus;
      abort;
    end;
    if txtQuantidadeMaterial.Text='' then
    begin
      Mensagem('Obrigat?rio Informar A Quantidade!');
      txtQuantidadeMaterial.SetFocus;
      abort;
    end;
    if txtvlr_unitario_material.Text='' then
    begin
      Mensagem('Obrigat?rio Informar O Valor Unit?rio!');
      txtvlr_unitario_material.SetFocus;
      abort;
    end;
     {$ENDREGION}


  WCodMaterial:=DMDados.Bdados.ExecSQLScalar('SELECT COALESCE (MAX(COD_REQUISICAO),0)+1 FROM REQUISICAO WHERE COD_OS = :COD_OS_req',[txtCodigo.Text]);



      with  Requisicao do
        begin
          try
            Append;
            FieldByName('COD_OS').AsInteger                     :=strtoint(txtCodigo.Text);
            fieldbyname('COD_REQUISICAO').AsInteger                :=WCodMaterial;
            fieldbyname('COD_PRODUTO').AsInteger                :=strtoint(txtMaterial.Text);
            FieldByName('DESCRICAO_MATERIAL').AsString           :=txtDescMaterial.Text;
            FieldByName('QUANTIDADE_MATERIAL').AsInteger         :=strtoint(txtQuantidadeMaterial.Text);
            FieldByName('VLR_UNITARIO_MATERIAL').AsFloat         :=strtofloat(txtvlr_unitario_material.Text);
            FieldByName('VLR_TOTAL_MATERIAL').AsFloat            :=strtofloat(StringReplace (txtvlr_total_material.Text,'.','',[rfReplaceAll]));
            Post;

          except on E: Exception do
            begin
              cancel;
              Mensagem('Erro ao incluir registro' + e.Message);
              abort
            end;

          end;
        end;

       txtMaterial.Text          :='';
       txtDescMaterial.Text      :='';
       txtQuantidadeMaterial.Text       :='';
       txtvlr_unitario_material.Text      :='';
       txtvlr_total_material.Text  :='';
       txtMaterial.SetFocus;

end;

procedure TFrmOrdemServico.cmdIncluirServicoClick(Sender: TObject);
var
  wQuery:TFDQuery;
  WCodOsItem:integer;
begin
{$REGION 'VALIDA??O DE Dados'}
  if txtServico.Text='' then
    begin
      Mensagem('Obrigat?rio Informar O Servi?o!');
      txtServico.SetFocus;
      abort;
    end;
    if txtQuantidade.Text='' then
    begin
      Mensagem('Obrigat?rio Informar A Quantidade!');
      txtQuantidade.SetFocus;
      abort;
    end;
    if txtvlr_unitario_servico.Text='' then
    begin
      Mensagem('Obrigat?rio Informar O Valor Unit?rio!');
      txtvlr_unitario_servico.SetFocus;
      abort;
    end;
     {$ENDREGION}


  WCodOsItem:=DMDados.Bdados.ExecSQLScalar('SELECT COALESCE (MAX(COD_OS_ITEM),0)+1 FROM ORDEMSERVICO_ITEM WHERE COD_OS = :COD_OS',[txtCodigo.Text]);



      with  ITEMOS do
        begin
          try
            Append;
            FieldByName('COD_OS').AsInteger                     :=strtoint(txtCodigo.Text);
            fieldbyname('COD_OS_ITEM').AsInteger                :=WCodOsItem;
            fieldbyname('COD_SERVICO').AsInteger                :=strtoint(txtServico.Text);
            FieldByName('DESCRICAO_SERVICO').AsString           :=txtDescServico.Text;
            FieldByName('QUANTIDADE_SERVICO').AsInteger         :=strtoint(txtQuantidade.Text);
            FieldByName('VLR_UNITARIO_SERVICO').AsFloat         :=strtofloat(txtvlr_unitario_servico.Text);
            FieldByName('VLR_TOTAL_SERVICO').AsFloat            :=strtofloat(StringReplace (txtvlr_total_servico.Text,'.','',[rfReplaceAll]));
            Post;

          except on E: Exception do
            begin
              cancel;
              Mensagem('Erro ao incluir registro' + e.Message);
              abort
            end;

          end;
        end;

       txtServico.Text          :='';
       txtDescServico.Text      :='';
       txtQuantidade.Text       :='';
       txtvlr_unitario_servico.Text      :='';
       txtvlr_total_servico.Text  :='';
       txtservico.SetFocus;
end;

procedure TFrmOrdemServico.cmdMateriaisDeleteClick(Sender: TObject);
begin
  Requisicao.Delete;
  Requisicao.ApplyUpdates();
  Requisicao.CommitUpdates;
end;



procedure TFrmOrdemServico.cmdNovoClick(Sender: TObject);
begin
  os.Insert;
  os.FieldByName('COD_OS').AsInteger:=-1;
  os.FieldByName('SITUACAO').AsString:='Aberto';
  os.FieldByName('DATA_OS').AsDateTime:=date;
  os.FieldByName('DATA_OS_FINAL').AsDateTime:=date;
  Habilita(false);
  txtDataInicio.SetFocus;

end;

procedure TFrmOrdemServico.cmdPesqClienteClick(Sender: TObject);
var
wTela:TFrmPesquisaCliente;
begin
  wTela:=TFrmPesquisaCliente.Create(self);
  wTela.ShowModal;

  if wTela.wCodCliente=0 then
    begin
      txtCliente.Text:='';
      txtNomeCliente.Text:='';
    end
  else
      txtCliente.Text:=inttostr(wTela.wCodCliente);

  wTela.Free;
 ;
end;

procedure TFrmOrdemServico.cmdPesquisaMateriaisClick(Sender: TObject);
var
wTela:TFrmPesquisaMaterial;
begin
  wTela:=TFrmPesquisaMaterial.Create(self);
  wTela.ShowModal;

  if wTela.wCodmaterial=0 then
    begin
      txtMaterial.Text:='';
      txtDescMaterial.Text:='';
    end
  else
      txtMaterial.Text:=inttostr(wTela.wCodmaterial);

  wTela.Free;

end;

procedure TFrmOrdemServico.cmdPesquisaModeloClick(Sender: TObject);

var
wTela:TFrmPesquisaModelo;
begin
  wTela:=TFrmPesquisaModelo.Create(self);
  wTela.ShowModal;

  if wTela.wCodModelo=0 then
    begin
      txtCliente.Text:='';
      txtNomeCliente.Text:='';
    end
  else
      txtModelo.Text:=inttostr(wTela.wCodModelo);

  wTela.Free;

end;

procedure TFrmOrdemServico.cmdPesquisaServicosClick(Sender: TObject);
var
wTela:TFrmPesquisaServico;
begin
  wTela:=TFrmPesquisaServico.Create(self);
  wTela.ShowModal;

  if wTela.wCodservico=0 then
    begin
      txtServico.Text:='';
      txtDescServico.Text:='';
    end
  else
      txtServico.Text:=inttostr(wTela.wCodservico);

  wTela.Free;

end;

procedure TFrmOrdemServico.cmdSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmOrdemServico.dsOSDataChange(Sender: TObject; Field: TField);
begin
  if not itemos.UpdatesPending then
    begin
      itemos.Close;
      itemos.ParamByName('COD_OS').AsInteger:=os.FieldByName('COD_OS').AsInteger;
      itemos.Open();
    end;

    if not Requisicao.UpdatesPending then
    begin
      Requisicao.Close;
      Requisicao.ParamByName('cod_os_req').AsInteger:=os.FieldByName('COD_OS').AsInteger;
      Requisicao.Open();
    end;
end;

procedure TFrmOrdemServico.FormShow(Sender: TObject);
begin

  TabOs.ActivePageIndex:=0;
  OS.Open();
  ItemOs.Open();

  Requisicao.Open();
  Habilita(true);
  cmdNovo.Setfocus;


  if wcodos>0 then
    begin

      if os.Active then
      begin
        os.Filtered:=false;
        os.Filter:=' COD_OS = ' + inttostr(wcodos);
        os.Filtered:=true;
      end;

    end;
end;

procedure TFrmOrdemServico.Habilita(wStatus: boolean);
begin
  cmdNovo.Enabled                 :=    wStatus;
  cmdAltera.Enabled               :=    wStatus;
  cmdExclui.Enabled               :=    wStatus;
  cmdFinaliza.Enabled             :=    wStatus;
  cmdImprimir.Enabled             :=    wStatus;
  cmdPesqCliente.Enabled          :=not wStatus;
  cmdConfirma.Enabled             :=not wStatus;
  cmdCancela.Enabled              :=not wStatus;
  txtDataInicio.Enabled           :=not wStatus;
  txtDataFim.Enabled              :=not wStatus;
  txtCliente.Enabled              :=not wStatus;
  txtNomeCliente.Enabled          :=not wStatus;
  txtModelo.Enabled               :=not wStatus;
  txtDescModelo.Enabled           :=not wStatus;
  txtObservacao.Enabled           :=not wStatus;
  cmdPesqCliente.Enabled          :=not wStatus;
  cmdPesquisaModelo.Enabled       :=not wStatus;
  txtServico.Enabled              :=not wStatus;
  txtDescServico.Enabled          :=not wStatus;
  txtQuantidade.Enabled           :=not wStatus;
  txtvlr_unitario_servico.Enabled :=not wStatus;
  grdServico.Enabled              :=not wStatus;
  cmdPesquisaServicos.Enabled     :=not wStatus;
  cmdIncluirServico.Enabled       :=not wStatus;
  txtMaterial.Enabled             :=not wStatus;
  txtDescMaterial.Enabled         :=not wStatus;
  txtQuantidadeMaterial.Enabled   :=not wStatus;
  txtvlr_unitario_material.Enabled:=not wStatus;
  cmdPesquisaMateriais.Enabled    :=not wStatus;
  cmdIncluirMaterial.Enabled      :=not wStatus;
  grdMaterial.Enabled             :=not wStatus;
  cmdDeleteItem.Enabled           :=not wStatus;
  cmdMateriaisDelete.Enabled      :=not wStatus;
end;

procedure TFrmOrdemServico.OSDATA_OSSetText(Sender: TField; const Text: string);
begin
if not ( CheckDate(Sender,Text) ) then begin
Abort;
end;
end;

procedure TFrmOrdemServico.OSDATA_OS_FINALSetText(Sender: TField;
  const Text: string);
begin
if not ( CheckDate(Sender,Text) ) then begin
Abort;
end;
end;

procedure TFrmOrdemServico.txtClienteChange(Sender: TObject);

var
wQuery:TFDQuery;
begin
  if txtCliente.Text='' then
    txtNomeCliente.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT NOME FROM CLIENTE WHERE COD_CLIENTE = :WCLIENTE AND FLG_ATIVO =''S'' ');
      wQuery.ParamByName('WCLIENTE').AsInteger:= strtoint(txtCliente.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtNomeCliente.Text := wQuery.FieldByName('NOME').AsString;
        end;
      wQuery.Close;
    end;
    //txtCliente.SetFocus;
end;

procedure TFrmOrdemServico.txtClienteExit(Sender: TObject);
var
wQuery:TFDQuery;
begin
  if txtCliente.Text='' then
    txtNomeCliente.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT NOME FROM CLIENTE WHERE COD_CLIENTE = :WCLIENTE AND FLG_ATIVO =''S''');
      wQuery.ParamByName('WCLIENTE').AsInteger:= strtoint(txtCliente.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtNomeCliente.Text := wQuery.FieldByName('NOME').AsString;
        end
      else
      begin
        txtNomeCliente.Text:='';
        txtCliente.SetFocus;
        Mensagem('Cliente n?o encontrado');
        abort;
      end;
      wQuery.Close;
    end;

end;

procedure TFrmOrdemServico.txtClienteKeyPress(Sender: TObject; var Key: Char);
begin
if txtCliente.Text = '' then
    if key = #13 then
     cmdPesqClienteClick(sender)
end;

procedure TFrmOrdemServico.txtMaterialChange(Sender: TObject);

var
wQuery:TFDQuery;
begin
  if txtMaterial.Text='' then
    txtDescMaterial.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT DESCRICAO FROM MATERIAL WHERE COD_PRODUTO = :WMATERIAL AND FLG_ATIVO =''S''');
      wQuery.ParamByName('WMATERIAL').AsInteger:= strtoint(txtMaterial.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtDescMaterial.Text := wQuery.FieldByName('DESCRICAO').AsString;
        end;
      wQuery.Close;
    end;
    txtMaterial.SetFocus;
end;

procedure TFrmOrdemServico.txtMaterialExit(Sender: TObject);
var
wQuery:TFDQuery;
begin
  if txtMaterial.Text='' then
    txtDescMaterial.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT DESCRICAO, VLR_UNITARIO FROM MATERIAL WHERE COD_PRODUTO = :WMATERIAL AND FLG_ATIVO =''S''');
      wQuery.ParamByName('WMATERIAL').AsInteger:= strtoint(txtMaterial.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtDescMaterial.Text := wQuery.FieldByName('DESCRICAO').AsString;
          txtvlr_unitario_material.Text:=  formatfloat('#,##0.00',wQuery.FieldByName('VLR_UNITARIO').asfloat);
        end
      else
      begin
        txtDescMaterial.Text:='';
        txtvlr_unitario_material.Text:='';
        txtMaterial.SetFocus;
        Mensagem('Material n?o encontrado');
        abort;
      end;
      wQuery.Close;
    end;

end;

procedure TFrmOrdemServico.txtMaterialKeyPress(Sender: TObject; var Key: Char);
begin
if txtMaterial.Text = '' then
    if key = #13 then
     cmdPesquisaMateriaisclick(sender)
end;

procedure TFrmOrdemServico.txtModeloChange(Sender: TObject);
var
wQuery:TFDQuery;
begin
  if txtModelo.Text='' then
    txtDescModelo.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT DESCRICAO FROM MODELO WHERE COD_MODELO = :WMODELO ');
      wQuery.ParamByName('WMODELO').AsInteger:= strtoint(txtModelo.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtDescModelo.Text := wQuery.FieldByName('DESCRICAO').AsString;
        end;
      wQuery.Close;
    end;

end;

procedure TFrmOrdemServico.txtModeloExit(Sender: TObject);

var
wQuery:TFDQuery;
begin
  if txtModelo.Text='' then
    txtDescModelo.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT DESCRICAO FROM MODELO WHERE COD_MODELO = :WMODELO ');
      wQuery.ParamByName('WMODELO').AsInteger:= strtoint(txtModelo.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtDescModelo.Text := wQuery.FieldByName('DESCRICAO').AsString;
        end
      else
      begin
        txtDescModelo.Text:='';
        txtModelo.SetFocus;
        Mensagem('Modelo n?o encontrado');
        abort;
      end;
      wQuery.Close;
    end;
end;

procedure TFrmOrdemServico.txtModeloKeyPress(Sender: TObject; var Key: Char);
begin
if txtModelo.Text = '' then
    if key = #13 then
     cmdPesquisaModeloclick(sender)
end;

procedure TFrmOrdemServico.txtObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmOrdemServico.txtQuantidadeExit(Sender: TObject);
begin
 if (txtQuantidade.Text<>'') and (txtvlr_unitario_servico.Text <> '') then
    txtvlr_total_servico.Text := FormatFloat('#,##0.00',strtofloat(txtQuantidade.Text)*strtofloat(txtvlr_unitario_servico.Text))
  else
  txtvlr_total_servico.Text:='';
end;

procedure TFrmOrdemServico.txtQuantidadeMaterialExit(Sender: TObject);
begin
 if (txtQuantidadeMaterial.Text<>'') and (txtvlr_unitario_material.Text <> '') then
    txtvlr_total_material.Text := FormatFloat('#,##0.00',strtofloat(txtQuantidadeMaterial.Text)*strtofloat(txtvlr_unitario_material.Text))
  else
  txtvlr_total_material.Text:='';
end;

procedure TFrmOrdemServico.txtServicoChange(Sender: TObject);

var
wQuery:TFDQuery;
begin
  if txtServico.Text='' then
    txtDescServico.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT DESCRICAO FROM SERVICO WHERE COD_SERVICO = :WSERVICO ');
      wQuery.ParamByName('WSERVICO').AsInteger:= strtoint(txtServico.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtDescServico.Text := wQuery.FieldByName('DESCRICAO').AsString;
        end;
      wQuery.Close;
    end;
    txtServico.SetFocus;
end;

procedure TFrmOrdemServico.txtServicoExit(Sender: TObject);
var
wQuery:TFDQuery;
begin
  if txtServico.Text='' then
    txtDescServico.Text:=''
  else
    begin
      wQuery:=TFDQuery.Create(Application);
      wQuery.Connection := DMDados.Bdados;
      wQuery.Close;
      wQuery.SQL.Add(' SELECT DESCRICAO, VLR_SERVICO FROM SERVICO WHERE COD_SERVICO = :WSERVICO ');
      wQuery.ParamByName('WSERVICO').AsInteger:= strtoint(txtServico.Text);
      wQuery.open;
      if not wQuery.Eof then
        begin
          txtDescServico.Text := wQuery.FieldByName('DESCRICAO').AsString;
          txtvlr_unitario_servico.Text:=  formatfloat('#,##0.00',wQuery.FieldByName('VLR_SERVICO').asfloat);
        end
      else
      begin
        txtDescServico.Text:='';
        txtvlr_unitario_servico.Text:='';
        txtServico.SetFocus;
        Mensagem('Servi?o n?o encontrado');
        abort;
      end;
      wQuery.Close;
    end;

end;

procedure TFrmOrdemServico.txtServicoKeyPress(Sender: TObject; var Key: Char);
begin
if txtServico.Text = '' then
    if key = #13 then
     cmdPesquisaServicosclick(sender)
end;

procedure TFrmOrdemServico.txtvlr_unitario_materialExit(Sender: TObject);
var
wValor:double;
begin

  //Validar Campos
  try
    if txtvlr_unitario_material.Text<>'' then
    wValor:= strtofloat(txtvlr_unitario_material.Text);
  except on E:Exception do
    begin
      Mensagem('Valor Inv?lido!');
      abort;
    end;
  end;
  if (txtQuantidadeMaterial.Text<>'') and (txtvlr_unitario_material.Text <> '') then
    txtvlr_total_material.Text := FormatFloat('#,##0.00',strtofloat(txtQuantidadeMaterial.Text)*strtofloat(txtvlr_unitario_material.Text))
  else
  txtvlr_total_material.Text:='';

end;

procedure TFrmOrdemServico.txtvlr_unitario_servicoExit(Sender: TObject);

var
wValor:double;
begin

  //Validar Campos
  try
    if txtvlr_unitario_servico.Text<>'' then
    wValor:= strtofloat(txtvlr_unitario_servico.Text);
  except on E:Exception do
    begin
      Mensagem('Valor Inv?lido!');
      abort;
    end;
  end;
  if (txtQuantidade.Text<>'') and (txtvlr_unitario_servico.Text <> '') then
    txtvlr_total_servico.Text := FormatFloat('#,##0.00',strtofloat(txtQuantidade.Text)*strtofloat(txtvlr_unitario_servico.Text))
  else
  txtvlr_total_servico.Text:='';
end;

end.
