program SUE_Tool;

uses
  Vcl.Forms,
  Main_SUE in 'Main_SUE.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
