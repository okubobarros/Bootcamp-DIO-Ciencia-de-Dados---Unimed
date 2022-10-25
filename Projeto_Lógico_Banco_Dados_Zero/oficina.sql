create database oficina;

use oficina;

create table cliente (
	idcliente int auto_increment primary key,
    nome varchar(40) not null,
    endereco varchar(70),
    contato varchar(45),    
    documento varchar(30)
 );
 
create table veiculo (
	idveiculo int auto_increment primary key,
    idcliente int,
    placa char(7),
    modelo varchar(40),
    marca varchar(40),
    ano int,
    cor varchar(20),
    constraint fk_veiculo_cliente foreign key (idcliente) references cliente (idcliente)    
); 

create table mecanico (
	idmecanico int auto_increment primary key,
    idveiculo int not null,
    nome varchar(45) not null,
    endereco varchar(60),
    especialidade varchar(50),
    constraint fk_mecanico_veiculo foreign key (idveiculo) references veiculo (idveiculo)
);

create table ordemservico (
	idordemservico int auto_increment primary key,
    dataemissao date,
    desconto float,
    status varchar(50),
    dataconclusao date,
    autorizada boolean
);

create table mecanico_ordemservico (
	idmecanico int,
    idordemservico int,
    constraint fk_ordemservico_mecanico foreign key (idmecanico) references mecanico(idmecanico),
    constraint fk_ordemservico_ordemservico foreign key (idordemservico) references ordemservico(idordemservico)
);

create table peca (
	idpeca int auto_increment primary key,
    descricao varchar(45) not null,
    modelocarro varchar(45) not null,
    anocarro int not null,
    valor float not null
);

create table item_ordemservico (
	idordemservico int not null,
    itemordemservico int not null,
    valor float not null,
    desconto float,
    primary key pk_ordem_itemservico (idordemservico,itemordemservico),
    constraint fk_itemordemservico foreign key (idordemservico) references 
		ordemservico (idordemservico)
);

alter table item_ordemservico add tipo boolean;

create table maodeobra (
	idmaoobra int auto_increment primary key not null,
    itemordemservico int not null,
    descricao varchar(60) not null,
    valor float not null
);

show tables;