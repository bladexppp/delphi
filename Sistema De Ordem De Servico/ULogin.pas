unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cmdOk: TBitBtn;
    cmdCancel: TBitBtn;
    txtSenha: TLabeledEdit;
    txtUsuario: TLabeledEdit;
    Usuario: TFDQuery;
    UsuarioCONSTANT: TIntegerField;
    imgClientes: TImage;
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UFuncoes, UDMDados;

procedure TfrmLogin.cmdCancelClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmLogin.cmdOkClick(Sender: TObject);
begin
 if txtUsuario.Text='' then
    begin
      Mensagem('Informar O Usu?rio');
      txtUsuario.SetFocus;
      abort;
    end;

  if txtSenha.Text='' then
     begin
       Mensagem('Informar A Senha');
       txtSenha.SetFocus;
       abort;
     end;
  with usuario do
    begin
      ParamByName('WUSUARIO').AsString:= txtUsuario.Text;
      ParamByName('WSENHA').AsString:= txtSenha.Text;
      open;
      if eof then
        begin
          close;
          Mensagem('Usu?rio Ou Senha Inv?lido');
          abort;
        end
      else
      Close;
    end;
ModalResult:=mrok;
end;

end.
