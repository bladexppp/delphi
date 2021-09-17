unit UFuncoes;

interface

uses
Vcl.Dialogs,Vcl.Controls;

procedure Mensagem(wMensagem: string);
function Pergunta(wMensagem:string):Boolean;

implementation

procedure  Mensagem(wMensagem: string);
  begin
   MessageDlg(wMensagem,mtInformation, [mbOk],0);
  end;

function Pergunta(wMensagem:string):Boolean;
begin

 if MessageDlg(wMensagem,mtConfirmation,[mbYes,mbNo],0,mbNo)= mrYes then
  result:=True
 else
  result:=False;
end;
end.
