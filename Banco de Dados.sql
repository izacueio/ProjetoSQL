-- public.cargo definition

-- Drop table

-- DROP TABLE public.cargo;

CREATE TABLE public.cargo (
	cd_cargo int4 NOT NULL,
	ds_cargo varchar(100) NULL,
	CONSTRAINT cargo_pkey PRIMARY KEY (cd_cargo)
);
-- public.eleicao definition

-- Drop table

-- DROP TABLE public.eleicao;

CREATE TABLE public.eleicao (
	cd_eleicao int4 NOT NULL,
	ds_eleicao varchar(100) NULL,
	ano_eleicao varchar(10) NULL,
	cd_tipo_eleicao int4 NULL,
	nm_tipo_eleicao varchar(100) NULL,
	dt_eleicao date NULL,
	nr_turno int4 NULL,
	CONSTRAINT eleicao_pkey PRIMARY KEY (cd_eleicao)
);

-- public.estado_civil definition

-- Drop table

-- DROP TABLE public.estado_civil;

CREATE TABLE public.estado_civil (
	cd_estado_civil int4 NOT NULL,
	ds_estado_civil varchar(30) NULL,
	CONSTRAINT estado_civil_pkey PRIMARY KEY (cd_estado_civil)
);

-- public.genero definition

-- Drop table

-- DROP TABLE public.genero;

CREATE TABLE public.genero (
	cd_genero int4 NOT NULL,
	ds_genero varchar(30) NULL,
	CONSTRAINT genero_pkey PRIMARY KEY (cd_genero)
);

-- public.grau_instrucao definition

-- Drop table

-- DROP TABLE public.grau_instrucao;

CREATE TABLE public.grau_instrucao (
	cd_grau_instrucao int4 NOT NULL,
	ds_grau_instrucao varchar(30) NULL,
	CONSTRAINT grau_instrucao_pkey PRIMARY KEY (cd_grau_instrucao)
);

-- public.ocupacao definition

-- Drop table

-- DROP TABLE public.ocupacao;

CREATE TABLE public.ocupacao (
	cd_ocupacao int4 NOT NULL,
	ds_ocupacao varchar(30) NULL,
	CONSTRAINT ocupacao_pkey PRIMARY KEY (cd_ocupacao)
);

-- public.partidos definition

-- Drop table

-- DROP TABLE public.partidos;

CREATE TABLE public.partidos (
	nr_partido int4 NOT NULL,
	sg_partido varchar(100) NULL,
	nm_partido varchar(100) NULL,
	CONSTRAINT partidos_pkey PRIMARY KEY (nr_partido)
);


-- public.pleito definition

-- Drop table

-- DROP TABLE public.pleito;

CREATE TABLE public.pleito (
	cd_situacao_candidato_pleito int4 NOT NULL,
	ds_situacao_candidato_pleito varchar(30) NULL,
	CONSTRAINT pleito_pkey PRIMARY KEY (cd_situacao_candidato_pleito)
);

-- public.raca definition

-- Drop table

-- DROP TABLE public.raca;

CREATE TABLE public.raca (
	cd_cor_raca int4 NOT NULL,
	ds_cor_raca varchar(30) NULL,
	CONSTRAINT raca_pkey PRIMARY KEY (cd_cor_raca)
);

-- public.situacao_cand definition

-- Drop table

-- DROP TABLE public.situacao_cand;

CREATE TABLE public.situacao_cand (
	cd_detalhe_situacao_cand int4 NOT NULL,
	ds_detalhe_situacao_cand varchar(30) NULL,
	CONSTRAINT situacao_cand_pkey PRIMARY KEY (cd_detalhe_situacao_cand)
);

-- public.situacao_candidatura definition

-- Drop table

-- DROP TABLE public.situacao_candidatura;

CREATE TABLE public.situacao_candidatura (
	cd_situacao_candidatura int4 NOT NULL,
	ds_situacao_candidatura varchar(30) NULL,
	CONSTRAINT situacao_candidatura_pkey PRIMARY KEY (cd_situacao_candidatura)
);

-- public.turno definition

-- Drop table

-- DROP TABLE public.turno;

CREATE TABLE public.turno (
	cd_sit_tot_turno int4 NOT NULL,
	ds_sit_tot_turno varchar(30) NULL,
	CONSTRAINT turno_pkey PRIMARY KEY (cd_sit_tot_turno)
);

-- public.ue definition

-- Drop table

-- DROP TABLE public.ue;

CREATE TABLE public.ue (
	sg_ue int4 NOT NULL,
	sg_uf varchar(10) NULL,
	nm_ue varchar(100) NULL,
	CONSTRAINT ue_pkey PRIMARY KEY (sg_ue)
);

-- public.urna definition

-- Drop table

-- DROP TABLE public.urna;

CREATE TABLE public.urna (
	cd_situacao_candidato_urna int4 NOT NULL,
	ds_situacao_candidato_urna varchar(30) NULL,
	st_candidato_inserido_urna varchar(10) NULL,
	CONSTRAINT urna_pkey PRIMARY KEY (cd_situacao_candidato_urna)
);

-- public.vagas definition

-- Drop table

-- DROP TABLE public.vagas;

CREATE TABLE public.vagas (
	dt_geracao date NULL,
	hh_geracao varchar(10) NULL,
	dt_posse date NULL,
	qt_vagas int4 NULL,
	cd_eleicao int4 NULL,
	sg_ue int4 NULL,
	cd_cargo int4 NULL,
	CONSTRAINT vagas_cd_cargo_fkey FOREIGN KEY (cd_cargo) REFERENCES public.cargo(cd_cargo),
	CONSTRAINT vagas_cd_eleicao_fkey FOREIGN KEY (cd_eleicao) REFERENCES public.eleicao(cd_eleicao),
	CONSTRAINT vagas_sg_ue_fkey FOREIGN KEY (sg_ue) REFERENCES public.ue(sg_ue)
);


-- public.coligacao definition

-- Drop table

-- DROP TABLE public.coligacao;

CREATE TABLE public.coligacao (
	sq_coligacao int8 NOT NULL,
	dt_geracao date NULL,
	hh_geracao varchar(12) NULL,
	nr_turno int4 NULL,
	tp_agremiacao varchar(100) NULL,
	nm_coligacao varchar(100) NULL,
	ds_composicao_coligacao varchar(200) NULL,
	cd_situacao_legenda varchar(10) NULL,
	ds_situacao varchar(100) NULL,
	cd_eleicao int4 NULL,
	sg_ue int4 NULL,
	cd_cargo int4 NULL,
	nr_partido int4 NULL,
	CONSTRAINT coligacao_pkey PRIMARY KEY (sq_coligacao),
	CONSTRAINT coligacao_cd_cargo_fkey FOREIGN KEY (cd_cargo) REFERENCES public.cargo(cd_cargo),
	CONSTRAINT coligacao_cd_eleicao_fkey FOREIGN KEY (cd_eleicao) REFERENCES public.eleicao(cd_eleicao),
	CONSTRAINT coligacao_nr_partido_fkey FOREIGN KEY (nr_partido) REFERENCES public.partidos(nr_partido),
	CONSTRAINT coligacao_sg_ue_fkey FOREIGN KEY (sg_ue) REFERENCES public.ue(sg_ue)
);
-- public.candidato definition

-- Drop table

-- DROP TABLE public.candidato;

CREATE TABLE public.candidato (
	sq_candidato int4 NOT NULL,
	nr_candidato int4 NULL,
	nm_candidato varchar(50) NULL,
	nm_urna_candidato varchar(50) NULL,
	nm_social_candidato varchar(50) NULL,
	nr_cpf_candidato varchar(50) NULL,
	nm_email varchar(50) NULL,
	dt_geracao date NULL,
	hh_geracao varchar(50) NULL,
	cd_eleicao int4 NULL,
	sg_ue int4 NULL,
	cd_cargo int4 NULL,
	cd_situacao_candidatura int4 NULL,
	cd_detalhe_situacao_cand int4 NULL,
	tp_agremiacao varchar(50) NULL,
	nr_partido int4 NULL,
	sq_coligacao int4 NULL,
	cd_nacionalidade int4 NULL,
	sg_uf_nascimento varchar(50) NULL,
	cd_municipio_nascimento int4 NULL,
	nm_municipio_nascimento varchar(50) NULL,
	dt_nascimento date NULL,
	nr_idade_data_posse varchar(50) NULL,
	nr_titulo_eleitoral_candidato varchar(50) NULL,
	cd_ocupacao int4 NULL,
	cd_cor_raca int4 NULL,
	cd_estado_civil int4 NULL,
	cd_grau_instrucao int4 NULL,
	cd_genero int4 NULL,
	vr_despesa_max_campanha varchar(50) NULL,
	cd_sit_tot_turno int4 NULL,
	st_reeleicao varchar(50) NULL,
	st_declarar_bens varchar(50) NULL,
	nr_protocolo_candidatura int4 NULL,
	nr_processo varchar(50) NULL,
	cd_situacao_candidato_pleito int4 NULL,
	cd_situacao_candidato_urna int4 NULL,
	CONSTRAINT candidato_pkey PRIMARY KEY (sq_candidato),
	CONSTRAINT candidato_cd_cargo_fkey FOREIGN KEY (cd_cargo) REFERENCES public.cargo(cd_cargo),
	CONSTRAINT candidato_cd_cor_raca_fkey FOREIGN KEY (cd_cor_raca) REFERENCES public.raca(cd_cor_raca),
	CONSTRAINT candidato_cd_detalhe_situacao_cand_fkey FOREIGN KEY (cd_detalhe_situacao_cand) REFERENCES public.situacao_cand(cd_detalhe_situacao_cand),
	CONSTRAINT candidato_cd_eleicao_fkey FOREIGN KEY (cd_eleicao) REFERENCES public.eleicao(cd_eleicao),
	CONSTRAINT candidato_cd_estado_civil_fkey FOREIGN KEY (cd_estado_civil) REFERENCES public.estado_civil(cd_estado_civil),
	CONSTRAINT candidato_cd_genero_fkey FOREIGN KEY (cd_genero) REFERENCES public.genero(cd_genero),
	CONSTRAINT candidato_cd_grau_instrucao_fkey FOREIGN KEY (cd_grau_instrucao) REFERENCES public.grau_instrucao(cd_grau_instrucao),
	CONSTRAINT candidato_cd_ocupacao_fkey FOREIGN KEY (cd_ocupacao) REFERENCES public.ocupacao(cd_ocupacao),
	CONSTRAINT candidato_cd_sit_tot_turno_fkey FOREIGN KEY (cd_sit_tot_turno) REFERENCES public.turno(cd_sit_tot_turno),
	CONSTRAINT candidato_cd_situacao_candidato_pleito_fkey FOREIGN KEY (cd_situacao_candidato_pleito) REFERENCES public.pleito(cd_situacao_candidato_pleito),
	CONSTRAINT candidato_cd_situacao_candidato_urna_fkey FOREIGN KEY (cd_situacao_candidato_urna) REFERENCES public.urna(cd_situacao_candidato_urna),
	CONSTRAINT candidato_cd_situacao_candidatura_fkey FOREIGN KEY (cd_situacao_candidatura) REFERENCES public.situacao_candidatura(cd_situacao_candidatura),
	CONSTRAINT candidato_nr_partido_fkey FOREIGN KEY (nr_partido) REFERENCES public.partidos(nr_partido),
	CONSTRAINT candidato_sg_ue_fkey FOREIGN KEY (sg_ue) REFERENCES public.ue(sg_ue),
	CONSTRAINT candidato_sq_coligacao_fkey FOREIGN KEY (sq_coligacao) REFERENCES public.coligacao(sq_coligacao)
);

-- public.cassacao definition

-- Drop table

-- DROP TABLE public.cassacao;

CREATE TABLE public.cassacao (
	id_cassacao serial4 NOT NULL,
	dt_geracao date NULL,
	hh_geracao varchar(30) NULL,
	cd_eleicao int4 NULL,
	sg_ue int4 NULL,
	sq_candidato int4 NULL,
	ds_motivo_cassacao varchar(10) NULL,
	CONSTRAINT cassacao_pkey PRIMARY KEY (id_cassacao),
	CONSTRAINT cassacao_cd_eleicao_fkey FOREIGN KEY (cd_eleicao) REFERENCES public.eleicao(cd_eleicao),
	CONSTRAINT cassacao_sg_ue_fkey FOREIGN KEY (sg_ue) REFERENCES public.ue(sg_ue),
	CONSTRAINT cassacao_sq_candidato_fkey FOREIGN KEY (sq_candidato) REFERENCES public.candidato(sq_candidato)
);






-- public.bem_candidato definition

-- Drop table

-- DROP TABLE public.bem_candidato;

CREATE TABLE public.bem_candidato (
	id_bem_candidato serial4 NOT NULL,
	dt_geracao date NULL,
	hh_geracao varchar(30) NULL,
	sq_candidato int4 NULL,
	cd_eleicao int4 NULL,
	sg_ue int4 NULL,
	nr_ordem_candidato int4 NULL,
	cd_tipo_bem_candidato int4 NULL,
	ds_tipo_bem_candidato varchar(30) NULL,
	ds_bem_candidato varchar(300) NULL,
	vr_bem_candidato varchar(30) NULL,
	dt_ultima_atualizacao date NULL,
	hh_ultima_atualizacao varchar(30) NULL,
	CONSTRAINT bem_candidato_pkey PRIMARY KEY (id_bem_candidato),
	CONSTRAINT bem_candidato_cd_eleicao_fkey FOREIGN KEY (cd_eleicao) REFERENCES public.eleicao(cd_eleicao),
	CONSTRAINT bem_candidato_sg_ue_fkey FOREIGN KEY (sg_ue) REFERENCES public.ue(sg_ue),
	CONSTRAINT bem_candidato_sq_candidato_fkey FOREIGN KEY (sq_candidato) REFERENCES public.candidato(sq_candidato)
);

