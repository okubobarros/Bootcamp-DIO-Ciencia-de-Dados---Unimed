use oficina;

insert into cliente (nome, endereco, contato) values
	('Cliente 1','Endereco cliente 1','contato cliente 1'),
	('Cliente 2','Endereco cliente 2','contato cliente 2'),
	('Cliente 3','Endereco cliente 3','contato cliente 3'),
    ('Cliente 4','Endereco cliente 4','contato cliente 4'),
    ('Cliente 5','Endereco cliente 5','contato cliente 5'),
    ('Cliente 6','Endereco cliente 6','contato cliente 6');
    
select * from cliente;

insert into veiculo (idcliente,placa, modelo, marca, ano, cor) values
    (2,'AAA0110','modelo 1','marca 1',2019,'cor 1'),
    (5,'EEE0550','modelo 5','marca 5',2007,'cor 5'),
    (4,'DDD0110','modelo 4','marca 4',1999,'cor 4'),
    (3,'CCC0330','modelo 3','marca 3',2000,'cor 3'),
    (1,'AAA0760','modelo 1','marca 1',2009,'cor 1');
    
select * from veiculo;    
select c.nome as Cliente, c.contato as Contato, v.placa, v.modelo from cliente c, veiculo v 
	where  c.idcliente = v.idcliente;

desc mecanico;
    
insert into mecanico (idveiculo, nome, endereco, especialidade) values
	(4,'mecanico 4','endereco mecanico 4','especialidade mecanico 4'),
    (1,'mecanico 1','endereco mecanico 1','especialidade mecanico 1'),
    (3,'mecanico 3','endereco mecanico 3','especialidade mecanico 3'),
    (2,'mecanico 2','endereco mecanico 2','especialidade mecanico 2');
    
select * from mecanico;
select m.nome,m.especialidade,v.placa,v.marca from mecanico as m, veiculo as v 
	where m.idveiculo = v.idveiculo;
select m.nome,m.especialidade,v.placa,v.marca from mecanico m inner join veiculo v
	where m.idveiculo = v.idveiculo;
    

insert into ordemservico (dataemissao, desconto, status, dataconclusao, autorizada) values
	('2022-09-03',11,'status ordem servico 1','2022-10-04',true),
    ('2022-07-03',2,'status ordem servico 2','2022-09-04',true),
    ('2022-09-13',0,'status ordem servico 3','2022-11-01',true),
    ('2022-09-15',21,'status ordem servico 4','2022-09-30',false),
    ('2022-09-22',31,'status ordem servico 5','2022-09-27',true);

select * from ordemservico;

select * from mecanico; 
    
insert into mecanico_ordemservico values
	(2,6),
    (1,7),
    (3,8),
    (4,9),
    (2,10);

insert into peca (descricao, modelocarro, anocarro, valor) values
	('Peca 1','modelo carro 1',2020,111.11),
    ('Peca 3','modelo carro 3',2000,33),
    ('Peca 2','modelo carro 2',2010,2.12),
    ('Peca 5','modelo carro 5',1998,55.5),
    ('Peca 4','modelo carro 4',1975,4.44),
    ('Peca 6','modelo carro 6',1997,66);

select * from peca;

delete from peca where idpeca > 6;

insert into item_ordemservico (idordemservico, itemordemservico, valor , desconto) values
	(6,1,11.11,0),
    (6,2,22,2),
    (7,1,7,0),
    (8,1,88,0),
    (8,2,67,0),
    (8,3,111,0),
    (9,1,99,9),
    (10,1,100,10);
    
select * from item_ordemservico;

select o.idordemservico, i.itemordemservico,i.valor,i.desconto from ordemservico o, 
	item_ordemservico i where o.idordemservico = i.idordemservico;
    
 insert into maodeobra (itemordemservico, descricao, valor) values
	(1,'descricao mao de obra 1',111),
    (2,'descricao mao de obra 2',22),
    (3,'descricao mao de obra 3',33.33),
    (4,'descricao mao de obra 4',444);

select * from maodeobra;