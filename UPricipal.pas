unit UPricipal;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.Controls, Vcl.Dialogs,
  System.SysUtils, System.Classes,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPrincipal = class(TForm)
    edtNome: TEdit;
    edtQtd: TEdit;
    Salvar: TBitBtn;
    ds_prod: TDataSource;
    DBGrid1: TDBGrid;
    btnDelete: TBitBtn;
    bntEditar: TBitBtn;
    Carregar: TBitBtn;
    procedure SalvarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure bntEditarClick(Sender: TObject);
    procedure CarregarClick(Sender: TObject);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uProduto, dm; // Removeu uProdutoInterface (não está sendo usada diretamente)

{$R *.dfm}

procedure TFrmPrincipal.bntEditarClick(Sender: TObject);
var
  Produto: TProduto;
  ID: Integer;
  Qtd: Integer;
begin
  ID := dm1.qryProd.FieldByName('ID').AsInteger;

  if not TryStrToInt(edtQtd.Text, Qtd) then
  begin
    ShowMessage('Quantidade inválida');
    Exit;
  end;

  Produto := TProduto.Create(dm1.FDConnection1);
  try
    Produto.SetID(ID);
    Produto.SetNome(edtNome.Text);
    Produto.SetQuantidade(Qtd);
    Produto.Edit;

    ShowMessage('Editado com sucesso!');
    Produto.Carregar(dm1.qryProd);

    edtNome.Clear;
    edtQtd.Clear;
  finally
    Produto.Free;
  end;
end;

procedure TFrmPrincipal.btnDeleteClick(Sender: TObject);
var
  Produto: TProduto;
  ID: Integer;
begin
  ID := dm1.qryProd.FieldByName('ID').AsInteger;

  Produto := TProduto.Create(dm1.FDConnection1);
  try
    Produto.SetID(ID);
    Produto.Delete;

    ShowMessage('Deletado com sucesso!');
    Produto.Carregar(dm1.qryProd);
  finally
    Produto.Free;
  end;
end;

procedure TFrmPrincipal.CarregarClick(Sender: TObject);
var
  Produto: TProduto;
begin
  Produto := TProduto.Create(dm1.FDConnection1);
  try
    Produto.Carregar(dm1.qryProd);

    if dm1.qryProd.IsEmpty then
      ShowMessage('Nenhum registro encontrado.')
    else
      ShowMessage('Dados carregados com sucesso.');

  finally
    Produto.Free;
  end;
end;

procedure TFrmPrincipal.SalvarClick(Sender: TObject);
var
  Produto: TProduto;
  Qtd: Integer;
begin
  if not TryStrToInt(edtQtd.Text, Qtd) then
  begin
    ShowMessage('Quantidade inválida');
    Exit;
  end;

  Produto := TProduto.Create(dm1.FDConnection1);
  try
    Produto.SetNome(edtNome.Text);
    Produto.SetQuantidade(Qtd);
    Produto.Post;
    Produto.Carregar(dm1.qryProd); // Atualiza o DBGrid
  finally
    Produto.Free;
  end;

  edtNome.Clear;
  edtQtd.Clear;
end;

end.
