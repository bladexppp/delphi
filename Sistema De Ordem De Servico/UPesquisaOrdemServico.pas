unit UPesquisaOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPesquisaOs = class(TForm)
    PngFiltros: TPanel;
    Panel2: TPanel;
    PngBotoes: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtDataAnt: TDateTimePicker;
    txtDataDep: TDateTimePicker;
    Label2: TLabel;
    FraCliente: TGroupBox;
    txtNomeCliente: TEdit;
    cmdPesqCliente: TButton;
    FraServicos: TGroupBox;
    Label7: TLabel;
    txtServico: TEdit;
    txtDescServico: TEdit;
    cmdPesquisaServicos: TButton;
    txtCliente: TEdit;
    Label3: TLabel;
    cmdProcurar: TBitBtn;
    cmdOk: TBitBtn;
    cmdSair: TBitBtn;
    PngOs: TPanel;
    grdOS: TDBGrid;
    OrdemServico: TFDQuery;
    dsOrdemservico: TDataSource;
    ItemOs: TFDQuery;
    dsItem: TDataSource;
    OrdemServicoCOD_OS: TIntegerField;
    OrdemServicoDATA_OS: TDateField;
    OrdemServicoDATA_OS_FINAL: TDateField;
    OrdemServicoCOD_CLIENTE: TIntegerField;
    OrdemServicoNOME: TStringField;
    OrdemServicoVLR_TOTAL: TBCDField;
    pngItemOs: TPanel;
    grdItemOs: TDBGrid;
    procedure cmdSairClick(Sender: TObject);
    procedure txtClienteChange(Sender: TObject);
    procedure txtClienteExit(Sender: TObject);
    procedure txtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure cmdPesqClienteClick(Sender: TObject);
    procedure txtServicoChange(Sender: TObject);
    procedure txtServicoExit(Sender: TObject);
    procedure txtServicoKeyPress(Sender: TObject; var Key: Char);
    procedure cmdPesquisaServicosClick(Sender: TObject);
    procedure cmdProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
    procedure grdOSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdItemOsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmPesquisaOs: TFrmPesquisaOs;

implementation

{$R *.dfm}

uses UDMDados, UFuncoes, UOrdemServico, UPesquisaCliente, UPesquisaMaterial,
  UPesquisaModelo, UPesquisaServico;

procedure TFrmPesquisaOs.cmdOkClick(Sender: TObject);
var
  wtela:TFrmOrdemServico;
begin
  if  OrdemServico.FieldByName('COD_OS').Asstring = '' then
    begin
      Mensagem('Nenhum Or?amento Selecionado');
      abort;
    end;

    wtela:=TFrmOrdemServico.Create(self);
    wtela.wcodos:=OrdemServico.FieldByName('COD_os').AsInteger;
    wtela.ShowModal;
    wtela.Free;

end;

procedure TFrmPesquisaOs.cmdPesqClienteClick(Sender: TObject);
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
  txtCliente.SetFocus;
end;

procedure TFrmPesquisaOs.cmdPesquisaServicosClick(Sender: TObject);
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
 txtServico.SetFocus;
end;

procedure TFrmPesquisaOs.cmdProcurarClick(Sender: TObject);
begin


  if txtDataAnt.Date > txtDataDep.date then
      begin
        Mensagem('Data inicial se encontra maior que a data final!');
        txtDataAnt.SetFocus;
        abort;
      end;

  if txtDataDep.date <  txtDataAnt.Date then
      begin
        Mensagem('Data final se encontra menor que a data inicial!');
        txtDataDep.SetFocus;
        abort;
      end;
   with ordemservico do
    begin
      ItemOs.Close;
      close;
      params.ClearValues();
      ParamByName('DATA_INICIAL').AsDate :=txtDataAnt.Date;
      ParamByName('DATA_FINAL').AsDate   :=txtDataDep.Date;
      if txtcliente.Text<>'' then
      ParamByName('COD_CLIENTE').AsInteger:=strtoint(txtCliente.Text);
     if txtservico.Text<>'' then
      BEGIN
        MacroByName('SERVICO').AsRaw:=      ' AND exists(SELECT 1                          '+
                                            ' FROM ORDEMSERVICO_ITEM ITE                      '+
                                            ' WHERE ITE.cod_OS = ORC.cod_OS  '+
                                           ' AND ITE.cod_SERVICO = :COD_SERVICO  )';
     ParamByName('cod_servico').AsInteger:=STRTOINT(txtservico.Text);
      END;
      open;
      ItemOs.Open();
    end;

end;

procedure TFrmPesquisaOs.cmdSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPesquisaOs.FormShow(Sender: TObject);
begin
txtDataAnt.Date:=date;
txtDataDep.Date:=date;
end;

procedure TFrmPesquisaOs.grdItemOsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Shift = [ssCtrl]) and (Key = 46) then

  Key := 0;
end;

procedure TFrmPesquisaOs.grdOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Shift = [ssCtrl]) and (Key = 46) then

  Key := 0;
end;

procedure TFrmPesquisaOs.txtClienteChange(Sender: TObject);
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
end;

procedure TFrmPesquisaOs.txtClienteExit(Sender: TObject);
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

procedure TFrmPesquisaOs.txtClienteKeyPress(Sender: TObject; var Key: Char);
begin
if txtCliente.Text = '' then
    if key = #13 then
     cmdPesqClienteClick(sender)
end;

procedure TFrmPesquisaOs.txtServicoChange(Sender: TObject);
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

end;

procedure TFrmPesquisaOs.txtServicoExit(Sender: TObject);
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
          //txtvlr_unitario_servico.Text:=  formatfloat('#,##0.00',wQuery.FieldByName('VLR_SERVICO').asfloat);
        end
      else
      begin
        txtDescServico.Text:='';
        //txtvlr_unitario_servico.Text:='';
        txtServico.SetFocus;
        Mensagem('Servi?o n?o encontrado');
        abort;
      end;
      wQuery.Close;
    end;

end;

procedure TFrmPesquisaOs.txtServicoKeyPress(Sender: TObject; var Key: Char);
begin
if txtServico.Text = '' then
    if key = #13 then
     cmdPesquisaServicosclick(sender)
end;

end.
