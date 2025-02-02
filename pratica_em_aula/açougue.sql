create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
id bigint auto_increment,
descricao varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert into tb_categoria (descricao, ativo) values ("bovino", true);
insert into tb_categoria (descricao, ativo) values ("suino", true);
insert into tb_categoria (descricao, ativo) values ("aves", true);
insert into tb_categoria (descricao, ativo) values ("pertence feijoada", true);
insert into tb_categoria (descricao, ativo) values ("imbutidos", true);
insert into tb_categoria (descricao, ativo) values ("soja", true);
insert into tb_categoria (descricao, ativo) values ("outros", true);

select * from tb_categoria;

create table tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
preco decimal(6,2) not null,
qtproduto int not null,
dtvalidade date,
categoria_id bigint,
primary key (id),
foreign key (categoria_id) references tb_categoria (id)
);

insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("asa", 40.00, 30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("picanha", 20.00, 30, "2021-11-08", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("coxa de frango", 20.00, 30, "2021-11-07", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("bacon", 30.00, 30, "2021-11-09", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("hamburguer", 60.00, 30, "2021-09-07", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("cupim", 20.00, 30, "2021-11-10", 1);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("peito de frango", 25.00, 30, "2021-11-09", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("orelha de porco", 20.00, 30, "2021-11-07", 4);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("salame", 18.00, 30, "2021-11-21", 5);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("medalhao", 50.00, 30, "2021-11-15", 3);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("mocoto", 20.00, 30, "2021-10-05", 2);
insert into tb_produtos (nome, preco, qtProduto, dtvalidade, categoria_id) values ("chuleta", 20.00, 30, "2021-10-07", 1);
insert into tb_produtos (nome, preco, qtProduto) values ("acendedor de churrasqueira", 20.00, 30);
insert into tb_produtos (nome, preco, qtProduto) values ("soprador de churrasqueira", 35.00, 30);

select * from tb_produtos;

select * from tb_produtos order by nome;

select * from tb_produtos order by nome, preco desc;

-- operadores lógicos and, or, not
select * from tb_produtos where preco > 20 and categoria_id = 1;

select * from tb_produtos where preco > 20 or categoria_id = 1;

select * from tb_produtos where not categoria_id = 1;

-- operadores in (mostra o que está dentro) e between (mostra o que está entre)
select * from tb_produtos where preco between 20 and 40;

select * from tb_produtos  where dtvalidade between "2021-11-07" and "2021-11-15";

-- selecionar item por texto através de %
select * from tb_produtos where nome like "%ha";

select * from tb_produtos where nome like "ha%";

select * from tb_produtos where nome like "%ha%";

-- matemática
select count(*) from tb_produtos;
-- count = conta os itens

select count(categoria_id) from tb_produtos;

select sum(preco) from tb_produtos; 
-- sum = soma

select avg(preco) from tb_produtos group by categoria_id; 
-- avg = média aritmética de valores
-- group by = média de preço de acordo com a categoria

select max(preco) as maior_preco from tb_produtos; 
-- as = apelida o que você quer mostrar
-- max = puxa o maior valor

select min(preco) as menor_preco from tb_produtos;
-- min = puxa o menor valor

/* inner join = o resultado trará somente as linhas comuns entre as 2 tabelas, ligadas
pelos campos em questão da pesquisa. se houver valor nulo, essa opção não irá aparecer */
select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao 
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.categoria_id; -- tabela_(pk) = tabela_(fk)

/* left join = retorna registros da tabela esquerda e os registros correspondentes da
 tabela direita */
select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao 
from tb_produtos left join tb_categoria 
on tb_categoria.id = tb_produtos.categoria_id;

/* right join = retorna registros da tavela da direita e os registros correspondentes da 
tabela esquerda */ 
select tb_produtos.nome, tb_produtos.preco, tb_categoria.descricao 
from tb_produtos right join tb_categoria 
on tb_categoria.id = tb_produtos.categoria_id;