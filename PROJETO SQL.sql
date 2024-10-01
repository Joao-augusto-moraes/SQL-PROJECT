drop database if exists loja_vinhos;
create database loja_vinhos;

create table loja_vinhos.regional (
cod_regiao bigint,
nome_regiao varchar(100),
descricao_regiao text,
primary key (cod_regiao)
);

create table loja_vinhos.vinicola (
cod_vinicola bigint,
nome_vinicola varchar (100),
descricao_vinicola text,
fone_vinicola varchar (15),
email_vinicola varchar (100),
cod_regiao bigint,
primary key (cod_vinicola),
foreign key (cod_regiao) references loja_vinhos.regional (cod_regiao)
);

create table loja_vinhos.vinhos (
cod_vinhos bigint,
nome_vinhos varchar(50),
tipo_vinhos varchar(30),
ano_vinhos int,
descricao_vinhos text,
cod_vinicola bigint,
primary key (cod_vinhos),
foreign key (cod_vinicola) references loja_vinhos.vinicola (cod_vinicola)
);

insert into loja_vinhos.regional (cod_regiao, nome_regiao, descricao_regiao) values
(1, "Sul da França", "Região fria e chuvosa"),
(2,"Costa Galícia","Região quente da Espanha"),
(3,"Sul da Italia","Regiào do Mediterraneo"),
(4,"Norte da Italia","Região amena da italia"),
(5, "Centro da Espanha","Região de Madri");

insert into loja_vinhos.vinhos (cod_vinhos, nome_vinhos, tipo_vinhos, ano_vinhos, descricao_vinhos, cod_vinicola) values
(1, "Côte d’Azur", "Vinho tinto seco", 1989, "Vinho que remete a costa da França", 1),
(2, "Malibu", "Vinho branco seco", 2001, "Vinho criado em conjunto com outras vinicolas", 2),
(3, "Firenze", "Vinho tinto comum", 1999, "Vinho refrescante com notas de frutas citricas", 3),
(4, "Mosquino","Vinho branco comum", 1984, "Vinho que representa o inverno italiano", 4),
(5, "Marqués", "Vinho Rosé", 1976, "Vinho encorpado que representa o povo catalão", 5);

insert into loja_vinhos.vinicola (cod_vinicola, nome_vinicola, descricao_vinicola, fone_vinicola, email_vinicola, cod_regiao) values
(1, "Rosa do Sul", "Vinicola familiar", "000000000000000", "rosadosul@yahoo.com", 1),
(2, "Del Rey", "Vinicola Antiga", "111111111111111", "delreyvinhosesspanha@gmail.com", 2),
(3, "Vino buono", "Antiga vinicola Italiana" ,"222222222222222", "vinobuono@gmail.com", 3),
(4, "Vino Milano", "Vinicola norte italiana", "333333333333333", "milanoitalia@gmail.com", 4),
(5, "El toro", "Mais antiga vinicola espanhola", "444444444444444", "Eltorovinhos@gmail.com", 5);

SELECT loja_vinhos.vinhos.nome_vinhos, loja_vinhos.vinhos.ano_vinhos, loja_vinhos.vinicola.nome_vinicola, loja_vinhos.regional.nome_regiao
FROM loja_vinhos.vinhos
JOIN loja_vinhos.vinicola ON loja_vinhos.vinhos.cod_vinicola = loja_vinhos.vinicola.cod_vinicola
JOIN loja_vinhos.regional ON loja_vinhos.vinicola.cod_regiao= loja_vinhos.regional.cod_regiao;