unit uProdutoInterface;

interface

type
  IProduto = interface
    procedure SetNome(const Nome: string);
    procedure SetQuantidade(const Quantidade: Integer);
  end;

implementation

end.

