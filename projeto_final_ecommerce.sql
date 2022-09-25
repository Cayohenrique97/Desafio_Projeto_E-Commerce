create database ecommerce ;
use ecommerce;


-- Cliente PF
create table ClientePF(
	idClientePF int auto_increment,
    Fname VARCHAR (10),
    Mname VARCHAR (10),
    Lname VARCHAR (10),
    CPF CHAR (11),
    Endereco VARCHAR(45),
    telefone VARCHAR (11),
    constraint unique_cliente_CPF unique (CPF),
    constraint pk_id_cliente_PF primary key (idClientePF)
);

-- adicionar dados em ClientePF
insert into ClientePF
values
	(1,'Fernando','C','Meddici',11111111111,'Rua A','111111111'),
    (2,'Cayo','H','Queiroz',22222222222,'Rua B','222222222'),
	(3,'Vitor','E','Blaques',33333333333,'Rua C','333333333'),
    (4,'Vinicius','E','Blaques',44444444444,'Rua D','444444444'),
    (5,'Lucas','E','Fernandes',55555555555,'Rua E','555555555'),
    (6,'Lucas','C','Pereira',66666666666,'Rua F','666666666'),
    (7,'Joao','V','Alcantara',77777777777,'Rua G','777777777'),
    (8,'Suelio','A','Blaques',88888888888,'Rua H','888888888'),
    (9,'Victor','A','Blaques',99999999999,'Rua I','999999999');
    
select * from ClientePF;

-- Cliente PJ
create table ClientePJ(
	idClientePJ int auto_increment,
    Nome VARCHAR (45),
    CNPJ CHAR (15),
    Endereco VARCHAR(45),    
    constraint unique_cliente_CNPJ unique (CNPJ),
    constraint pk_id_cliente_PF primary key (idClientePJ)
    );
  -- adicionar dados em ClientePJ
insert into ClientePJ
values
	(1,'Empresa A',111111111111111,'Rua 1'),
    (2,'Empresa B',222222222222222,'Rua 2'),
    (3,'Empresa C',333333333333333,'Rua 3'),
    (4,'Empresa D',444444444444444,'Rua 4'),
	(5,'Empresa E',555555555555555,'Rua 5');
  
select * from ClientePJ;
-- Cliente
create table Cliente(
	id_cliente int auto_increment,
    idClientePF int not null,
    idClientePJ int not null,
    constraint pk_cliente primary key (id_cliente),
    constraint fk_idClientePF foreign key (idClientePF) references ClientePF(idClientePF),
    constraint fk_idClientePJ foreign key (idClientePJ) references ClientePJ(idClientePJ)
);

-- adicionar dados em Cliente
insert into Cliente
values
	(1,1,1),
    (2,2,1),
    (3,3,1),
    (4,4,1),
    (5,5,1),
    (6,6,1),
    (7,7,1),
    (8,8,1),
    (9,9,1),
    (10,1,1),
    (11,1,2),
    (12,1,3),
    (13,1,4),
    (14,1,5);    

select * from Cliente;

-- Pedido
create table Pedido(
	idPedido int auto_increment,
    status_Pedido enum('Cancelado','Em Andamento', 'Concluido'),
    descricao VARCHAR (100),
    idCliente int,
    idFormaPagamento int,
    constraint unq_id_pedido unique (idPedido),
    constraint pk_id_pedido primary key (idPedido),
	constraint fk_idCliente_Pedido foreign key (idCliente) references Cliente(id_cliente),
    constraint fk_idFormaPagamento foreign key (idFormaPagamento) references FormaPagamento(idFormaPagamento)
);
-- adicionar dados Pedido
insert into Pedido
values
	(),
    
    
-- BOLETO
create table Boleto(
	idBoleto int auto_increment,
    CodBarras VARCHAR(30),
    constraint unq_idBoleto unique (idBoleto),
    constraint pk_idBoleto primary key (idBoleto)    
);
-- adicionar dados BOLETO
insert into Boleto
values
	(1,'11111111111'),
    (2,'22222222222'),
    (3,'33333333333'),
    (4,'44444444444'),
    (5,'55555555555'),
    (6,'66666666666'),
    (7,'77777777777');
    
    
-- CARTAO 
create table cartao(
	idCartao int auto_increment,
    NomeCartao VARCHAR(30),
    numCartao VARCHAR(15),
    valCartao date,
    tipoCartao enum('Credito', 'Debito'),    
    constraint unq_idCartao unique (idCartao),
    constraint pk_idCartao primary key (idCartao)
);

-- adicionar dados CARTAO 
insert into cartao
values
	(1,'Cartao A','111111111111111','2022-09-23','Credito'),
    (2,'Cartao B','222222222222222','2022-09-23','Debito'),
	(3,'Cartao C','333333333333333','2022-09-23','Credito'),
    (4,'Cartao D','444444444444444','2022-09-23','Debito'),
	(5,'Cartao E','111111111111111','2022-09-23','Credito'),
    (6,'Cartao F','222222222222222','2022-09-23','Debito'),
	(7,'Cartao G','333333333333333','2022-09-23','Credito'),
    (8,'Cartao H','444444444444444','2022-09-23','Debito');

-- FORMA DE PAGAMENTO
create table FormaPagamento(
	idFormaPagamento int auto_increment unique,
    Descricao VARCHAR (45),
    idCartao int,
    idBoleto int,
    constraint pk_idFormaPagamento primary key (idFormaPagamento),
	constraint fk_idFormaPagamentoCartao foreign key (idCartao) references cartao(idCartao),
	constraint fk_idFormaPagamentoBoleto foreign key (idBoleto) references Boleto(idBoleto)
);
-- adicionar dados FORMA DE PAGAMENTO
insert into FormaPagamento
values
	(1,'descricao A', ,2);

-- produto 
create table produto(
	idProduto int auto_increment primary key,
	Pname varchar(45) not null,
	descreption varchar(255) not null,
	classification_kids boolean default false,
	category enum('Electronic','Clothes','Toys','Utilities','Foods') not null,
	dimension varchar(10),
	rating float default 0
);

-- adicionar dados produto
insert into produto
values
	()
    
-- Vendedores
create table vendedores(
	idVendedores int auto_increment unique,
    razaoSocial VARCHAR(30),
    endereco VARCHAR(30),
    constraint pk_idVendedores primary key (idVendedores)
);

-- Produto Vendedor
insert into vendedores
values
	()
create table ProdutoVendedor(
	idVendedores int primary key,
    idProduto int primary key,
    quantidade int,
    constraint fk_idVendedores foreign key (idVendedores) references vendedores(idVendedores),
    constraint fk_idProduto foreign key (idProduto) references protudo(idProduto)
);
-- adicionar dados Produto Vendedor
insert into ProdutoVendedor
values
	()
    
-- Produto Pedido
create table ProdutoPedido(
	idPedido int,
    idProduto int,
    quantidade int,
    frete float,
    primary key (idPedido,idProduto),
	constraint fk_idPedido1 foreign key (idPedido) references pedido(idPedido),
    constraint fk_idProduto1 foreign key (idProduto) references produto(idProduto)
);
-- adicionar dados Produto Pedido
insert into ProdutoPedido
values
	()

-- Estoque
create table estoque(
	idEstoque int auto_increment primary key,
    endereco VARCHAR(30)
);
-- adicionar dados Estoque
insert into estoque
values
	()

-- ESTOQUE PRODUTO
create table estoqueProduto(
	idProduto int ,
	idEstoque int ,
    quantidade int default 1,
    primary key (idProduto,idEstoque),
	constraint fk_idEstoque foreign key (idEstoque) references estoque(idEstoque),
    constraint fk_idProduto2 foreign key (idProduto) references produto(idProduto)
);
-- adicionar dados ESTOQUE PRODUTO
insert into estoqueProduto
values
	()
-- fornecedor
create table fornecedor(
	idFornecedor int auto_increment unique primary key,
    CNPJ VARCHAR(15)    
);

-- adicionar dados fornecedor
insert into fornecedor
values
	()
-- fornecimento

create table fornecimento(
	idFornecedor int,
    idProduto int,
    primary key (idFornecedor,idProduto),
	constraint fk_idFornecedor foreign key (idFornecedor) references fornecedor(idFornecedor),
    constraint fk_idProduto3 foreign key (idProduto) references produto(idProduto)    
);
-- adicionar dados fornecimento
insert into fornecimento
values
	()
    
    
-- query

