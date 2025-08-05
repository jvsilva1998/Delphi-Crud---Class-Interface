program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FrmPrincipal},
  uProduto in 'class\uProduto.pas',
  uProdutoInterface in 'interface\uProdutoInterface.pas',
  dm in 'data_module\dm.pas' {dm1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(Tdm1, dm1);
  Application.Run;
end.
