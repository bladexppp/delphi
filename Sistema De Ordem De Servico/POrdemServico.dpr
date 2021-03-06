program POrdemServico;

uses
  Vcl.Forms,
  controls,
  sysutils,
  Umenu in 'Umenu.pas' {FrmMenu},
  UFuncoes in 'UFuncoes.pas',
  UDMDados in 'UDMDados.pas' {DMDados: TDataModule},
  UCadCliente in 'UCadCliente.pas' {FrmCadCliente},
  UCadProduto in 'UCadProduto.pas' {FrmCadProduto},
  UServicos in 'UServicos.pas' {FrmCadServicos},
  UCadModelo in 'UCadModelo.pas' {FrmCadModelo},
  UOrdemServico in 'UOrdemServico.pas' {FrmOrdemServico},
  UPesquisaCliente in 'UPesquisaCliente.pas' {FrmPesquisaCliente},
  UPesquisaModelo in 'UPesquisaModelo.pas' {FrmPesquisaModelo},
  UPesquisaServico in 'UPesquisaServico.pas' {FrmPesquisaServico},
  UPesquisaMaterial in 'UPesquisaMaterial.pas' {FrmPesquisaMaterial},
  URelatorioOrdemServico in 'URelatorioOrdemServico.pas' {FrmRelOrdemServico},
  UPesquisaOrdemServico in 'UPesquisaOrdemServico.pas' {FrmPesquisaOs},
  ULogin in 'ULogin.pas' {frmLogin},
  URelatorioMateriais in 'URelatorioMateriais.pas' {FrmRelMateriais},
  URelatorioInativos in 'URelatorioInativos.pas' {FrmRelInativos},
  URelatorioInativosClientes in 'URelatorioInativosClientes.pas' {FrmRelCliInativo},
  URelatorioInativosMateriais in 'URelatorioInativosMateriais.pas' {FrmRelMatInativo},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDados, DMDados);
  Application.CreateForm(TfrmLogin, frmLogin);
  if FrmLogin.ShowModal=mrok then  //caso o retorno na tela seja OK
    begin
      FreeAndNil(frmlogin);//Libera o form de login da mem?ria
      Application.CreateForm(TFrmMenu,FrmMenu); //Cria Janela Main
      Application.Run;//Roda a aplica??o
    end
  else//Caso o retorno da tela de login seja mrCancel ent?o
  Application.Terminate;//Encerra a aplica??o
  Application.Run;
end.
