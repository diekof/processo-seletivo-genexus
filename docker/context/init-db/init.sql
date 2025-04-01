--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-27 20:46:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 216 (class 1259 OID 16393)
-- Name: cid_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cid_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cid_id OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16394)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade (
    cid_id integer DEFAULT nextval('public.cid_id'::regclass) NOT NULL,
    cid_nome character varying(200) NOT NULL,
    cid_uf character(2) NOT NULL
);


ALTER TABLE public.cidade OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16400)
-- Name: end_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.end_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.end_id OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16401)
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    end_id integer DEFAULT nextval('public.end_id'::regclass) NOT NULL,
    end_tipo_logradouro character varying(50) NOT NULL,
    end_logradouro character varying(200) NOT NULL,
    end_numero integer NOT NULL,
    end_bairro character varying(100) NOT NULL,
    cid_id integer NOT NULL
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16421)
-- Name: fp_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fp_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fp_id OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16422)
-- Name: foto_pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foto_pessoa (
    fp_id integer DEFAULT nextval('public.fp_id'::regclass) NOT NULL,
    pes_id integer NOT NULL,
    fp_data date NOT NULL,
    fp_bucket character varying(255) NOT NULL,
    fp_hash character varying(50) NOT NULL,
    fp_blob bytea NOT NULL
);


ALTER TABLE public.foto_pessoa OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16436)
-- Name: lot_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lot_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lot_id OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16437)
-- Name: lotacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lotacao (
    lot_id integer DEFAULT nextval('public.lot_id'::regclass) NOT NULL,
    pes_id integer NOT NULL,
    unid_id integer NOT NULL,
    lot_data_lotacao date NOT NULL,
    lot_data_remocao date NOT NULL,
    lot_portaria character varying(100) NOT NULL
);


ALTER TABLE public.lotacao OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16451)
-- Name: pes_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pes_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pes_id OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16452)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    pes_id integer DEFAULT nextval('public.pes_id'::regclass) NOT NULL,
    pes_nome character varying(200) NOT NULL,
    pes_data_nascimento date NOT NULL,
    pes_sexo character varying(9) NOT NULL,
    pes_mae character varying(200) NOT NULL,
    pes_pai character varying(200) NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16445)
-- Name: pessoa_endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa_endereco (
    pes_id integer NOT NULL,
    end_id integer NOT NULL
);


ALTER TABLE public.pessoa_endereco OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16431)
-- Name: servidor_efetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servidor_efetivo (
    servidor_efetivopes_id integer NOT NULL,
    se_matricula character varying(20) NOT NULL
);


ALTER TABLE public.servidor_efetivo OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16385)
-- Name: servidor_temporarioid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servidor_temporarioid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servidor_temporarioid OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16386)
-- Name: servidor_temporario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servidor_temporario (
    servidor_temporarioid integer DEFAULT nextval('public.servidor_temporarioid'::regclass) NOT NULL,
    servidor_temporariopesid integer NOT NULL,
    st_data_admissao date NOT NULL,
    st_data_demissao date
);


ALTER TABLE public.servidor_temporario OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16414)
-- Name: unid_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unid_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.unid_id OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16415)
-- Name: unidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidade (
    unid_id integer DEFAULT nextval('public.unid_id'::regclass) NOT NULL,
    unid_nome character varying(200) NOT NULL,
    unid_sigla character varying(20) NOT NULL
);


ALTER TABLE public.unidade OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16408)
-- Name: unidade_endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidade_endereco (
    unid_id integer NOT NULL,
    end_id integer NOT NULL
);


ALTER TABLE public.unidade_endereco OWNER TO postgres;

--
-- TOC entry 3424 (class 0 OID 16394)
-- Dependencies: 217
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cidade VALUES (1, 'Acorizal', 'MT');
INSERT INTO public.cidade VALUES (2, 'Água Boa', 'MT');
INSERT INTO public.cidade VALUES (3, 'Alta Floresta', 'MT');
INSERT INTO public.cidade VALUES (4, 'Alto Araguaia', 'MT');
INSERT INTO public.cidade VALUES (5, 'Alto Boa Vista', 'MT');
INSERT INTO public.cidade VALUES (6, 'Alto Garças', 'MT');
INSERT INTO public.cidade VALUES (7, 'Alto Paraguai', 'MT');
INSERT INTO public.cidade VALUES (8, 'Alto Taquari', 'MT');
INSERT INTO public.cidade VALUES (9, 'Apiacás', 'MT');
INSERT INTO public.cidade VALUES (10, 'Araguaiana', 'MT');
INSERT INTO public.cidade VALUES (11, 'Araguainha', 'MT');
INSERT INTO public.cidade VALUES (12, 'Araputanga', 'MT');
INSERT INTO public.cidade VALUES (13, 'Arenápolis', 'MT');
INSERT INTO public.cidade VALUES (14, 'Aripuanã', 'MT');
INSERT INTO public.cidade VALUES (15, 'Barão de Melgaço', 'MT');
INSERT INTO public.cidade VALUES (16, 'Barra do Bugres', 'MT');
INSERT INTO public.cidade VALUES (17, 'Barra do Garças', 'MT');
INSERT INTO public.cidade VALUES (18, 'Bom Jesus do Araguaia', 'MT');
INSERT INTO public.cidade VALUES (19, 'Brasnorte', 'MT');
INSERT INTO public.cidade VALUES (20, 'Cáceres', 'MT');
INSERT INTO public.cidade VALUES (21, 'Campinápolis', 'MT');
INSERT INTO public.cidade VALUES (22, 'Campo Novo do Parecis', 'MT');
INSERT INTO public.cidade VALUES (23, 'Campo Verde', 'MT');
INSERT INTO public.cidade VALUES (24, 'Campos de Júlio', 'MT');
INSERT INTO public.cidade VALUES (25, 'Canabrava do Norte', 'MT');
INSERT INTO public.cidade VALUES (26, 'Canarana', 'MT');
INSERT INTO public.cidade VALUES (27, 'Carlinda', 'MT');
INSERT INTO public.cidade VALUES (28, 'Castanheira', 'MT');
INSERT INTO public.cidade VALUES (29, 'Chapada dos Guimarães', 'MT');
INSERT INTO public.cidade VALUES (30, 'Cláudia', 'MT');
INSERT INTO public.cidade VALUES (31, 'Cocalinho', 'MT');
INSERT INTO public.cidade VALUES (32, 'Colíder', 'MT');
INSERT INTO public.cidade VALUES (33, 'Colniza', 'MT');
INSERT INTO public.cidade VALUES (34, 'Comodoro', 'MT');
INSERT INTO public.cidade VALUES (35, 'Confresa', 'MT');
INSERT INTO public.cidade VALUES (36, 'Conquista D''Oeste', 'MT');
INSERT INTO public.cidade VALUES (37, 'Cotriguaçu', 'MT');
INSERT INTO public.cidade VALUES (38, 'Cuiabá', 'MT');
INSERT INTO public.cidade VALUES (39, 'Curvelândia', 'MT');
INSERT INTO public.cidade VALUES (40, 'Denise', 'MT');
INSERT INTO public.cidade VALUES (41, 'Diamantino', 'MT');
INSERT INTO public.cidade VALUES (42, 'Dom Aquino', 'MT');
INSERT INTO public.cidade VALUES (43, 'Feliz Natal', 'MT');
INSERT INTO public.cidade VALUES (44, 'Figueirópolis D''Oeste', 'MT');
INSERT INTO public.cidade VALUES (45, 'Gaúcha do Norte', 'MT');
INSERT INTO public.cidade VALUES (46, 'General Carneiro', 'MT');
INSERT INTO public.cidade VALUES (47, 'Glória D''Oeste', 'MT');
INSERT INTO public.cidade VALUES (48, 'Guarantã do Norte', 'MT');
INSERT INTO public.cidade VALUES (49, 'Guiratinga', 'MT');
INSERT INTO public.cidade VALUES (50, 'Indiavaí', 'MT');
INSERT INTO public.cidade VALUES (51, 'Ipiranga do Norte', 'MT');
INSERT INTO public.cidade VALUES (52, 'Itanhangá', 'MT');
INSERT INTO public.cidade VALUES (53, 'Itaúba', 'MT');
INSERT INTO public.cidade VALUES (54, 'Itiquira', 'MT');
INSERT INTO public.cidade VALUES (55, 'Jaciara', 'MT');
INSERT INTO public.cidade VALUES (56, 'Jangada', 'MT');
INSERT INTO public.cidade VALUES (57, 'Jauru', 'MT');
INSERT INTO public.cidade VALUES (58, 'Juara', 'MT');
INSERT INTO public.cidade VALUES (59, 'Juína', 'MT');
INSERT INTO public.cidade VALUES (60, 'Juruena', 'MT');
INSERT INTO public.cidade VALUES (61, 'Juscimeira', 'MT');
INSERT INTO public.cidade VALUES (62, 'Lambari D''Oeste', 'MT');
INSERT INTO public.cidade VALUES (63, 'Lucas do Rio Verde', 'MT');
INSERT INTO public.cidade VALUES (64, 'Luciara', 'MT');
INSERT INTO public.cidade VALUES (65, 'Marcelândia', 'MT');
INSERT INTO public.cidade VALUES (66, 'Matupá', 'MT');
INSERT INTO public.cidade VALUES (67, 'Mirassol d''Oeste', 'MT');
INSERT INTO public.cidade VALUES (68, 'Nobres', 'MT');
INSERT INTO public.cidade VALUES (69, 'Nortelândia', 'MT');
INSERT INTO public.cidade VALUES (70, 'Nossa Senhora do Livramento', 'MT');
INSERT INTO public.cidade VALUES (71, 'Nova Bandeirantes', 'MT');
INSERT INTO public.cidade VALUES (72, 'Nova Brasilândia', 'MT');
INSERT INTO public.cidade VALUES (73, 'Nova Canaã do Norte', 'MT');
INSERT INTO public.cidade VALUES (74, 'Nova Guarita', 'MT');
INSERT INTO public.cidade VALUES (75, 'Nova Lacerda', 'MT');
INSERT INTO public.cidade VALUES (76, 'Nova Marilândia', 'MT');
INSERT INTO public.cidade VALUES (77, 'Nova Maringá', 'MT');
INSERT INTO public.cidade VALUES (78, 'Nova Monte Verde', 'MT');
INSERT INTO public.cidade VALUES (79, 'Nova Mutum', 'MT');
INSERT INTO public.cidade VALUES (80, 'Nova Olímpia', 'MT');
INSERT INTO public.cidade VALUES (81, 'Nova Santa Helena', 'MT');
INSERT INTO public.cidade VALUES (82, 'Nova Ubiratã', 'MT');
INSERT INTO public.cidade VALUES (83, 'Nova Xavantina', 'MT');
INSERT INTO public.cidade VALUES (84, 'Novo Horizonte do Norte', 'MT');
INSERT INTO public.cidade VALUES (85, 'Novo Mundo', 'MT');
INSERT INTO public.cidade VALUES (86, 'Novo Santo Antônio', 'MT');
INSERT INTO public.cidade VALUES (87, 'Novo São Joaquim', 'MT');
INSERT INTO public.cidade VALUES (88, 'Paranaíta', 'MT');
INSERT INTO public.cidade VALUES (89, 'Paranatinga', 'MT');
INSERT INTO public.cidade VALUES (90, 'Pedra Preta', 'MT');
INSERT INTO public.cidade VALUES (91, 'Peixoto de Azevedo', 'MT');
INSERT INTO public.cidade VALUES (92, 'Planalto da Serra', 'MT');
INSERT INTO public.cidade VALUES (93, 'Poconé', 'MT');
INSERT INTO public.cidade VALUES (94, 'Pontal do Araguaia', 'MT');
INSERT INTO public.cidade VALUES (95, 'Ponte Branca', 'MT');
INSERT INTO public.cidade VALUES (96, 'Pontes e Lacerda', 'MT');
INSERT INTO public.cidade VALUES (97, 'Porto Alegre do Norte', 'MT');
INSERT INTO public.cidade VALUES (98, 'Porto dos Gaúchos', 'MT');
INSERT INTO public.cidade VALUES (99, 'Porto Esperidião', 'MT');
INSERT INTO public.cidade VALUES (100, 'Porto Estrela', 'MT');
INSERT INTO public.cidade VALUES (101, 'Poxoréu', 'MT');
INSERT INTO public.cidade VALUES (102, 'Primavera do Leste', 'MT');
INSERT INTO public.cidade VALUES (103, 'Querência', 'MT');
INSERT INTO public.cidade VALUES (104, 'Reserva do Cabaçal', 'MT');
INSERT INTO public.cidade VALUES (105, 'Ribeirão Cascalheira', 'MT');
INSERT INTO public.cidade VALUES (106, 'Ribeirãozinho', 'MT');
INSERT INTO public.cidade VALUES (107, 'Rio Branco', 'MT');
INSERT INTO public.cidade VALUES (108, 'Rondolândia', 'MT');
INSERT INTO public.cidade VALUES (109, 'Rondonópolis', 'MT');
INSERT INTO public.cidade VALUES (110, 'Rosário Oeste', 'MT');
INSERT INTO public.cidade VALUES (111, 'Salto do Céu', 'MT');
INSERT INTO public.cidade VALUES (112, 'Santa Carmem', 'MT');
INSERT INTO public.cidade VALUES (113, 'Santa Cruz do Xingu', 'MT');
INSERT INTO public.cidade VALUES (114, 'Santa Rita do Trivelato', 'MT');
INSERT INTO public.cidade VALUES (115, 'Santa Terezinha', 'MT');
INSERT INTO public.cidade VALUES (116, 'Santo Afonso', 'MT');
INSERT INTO public.cidade VALUES (117, 'Santo Antônio do Leste', 'MT');
INSERT INTO public.cidade VALUES (118, 'Santo Antônio do Leverger', 'MT');
INSERT INTO public.cidade VALUES (119, 'São Félix do Araguaia', 'MT');
INSERT INTO public.cidade VALUES (120, 'São José do Povo', 'MT');
INSERT INTO public.cidade VALUES (121, 'São José do Rio Claro', 'MT');
INSERT INTO public.cidade VALUES (122, 'São José do Xingu', 'MT');
INSERT INTO public.cidade VALUES (123, 'São José dos Quatro Marcos', 'MT');
INSERT INTO public.cidade VALUES (124, 'São Pedro da Cipa', 'MT');
INSERT INTO public.cidade VALUES (125, 'Sapezal', 'MT');
INSERT INTO public.cidade VALUES (126, 'Serra Nova Dourada', 'MT');
INSERT INTO public.cidade VALUES (127, 'Sinop', 'MT');
INSERT INTO public.cidade VALUES (128, 'Sorriso', 'MT');
INSERT INTO public.cidade VALUES (129, 'Tabaporã', 'MT');
INSERT INTO public.cidade VALUES (130, 'Tangará da Serra', 'MT');
INSERT INTO public.cidade VALUES (131, 'Tapurah', 'MT');
INSERT INTO public.cidade VALUES (132, 'Terra Nova do Norte', 'MT');
INSERT INTO public.cidade VALUES (133, 'Tesouro', 'MT');
INSERT INTO public.cidade VALUES (134, 'Torixoréu', 'MT');
INSERT INTO public.cidade VALUES (135, 'União do Sul', 'MT');
INSERT INTO public.cidade VALUES (136, 'Vale de São Domingos', 'MT');
INSERT INTO public.cidade VALUES (137, 'Várzea Grande', 'MT');
INSERT INTO public.cidade VALUES (138, 'Vera', 'MT');
INSERT INTO public.cidade VALUES (139, 'Vila Bela da Santíssima Trindade', 'MT');
INSERT INTO public.cidade VALUES (140, 'Vila Rica', 'MT');


--
-- TOC entry 3426 (class 0 OID 16401)
-- Dependencies: 219
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3431 (class 0 OID 16422)
-- Dependencies: 224
-- Data for Name: foto_pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3434 (class 0 OID 16437)
-- Dependencies: 227
-- Data for Name: lotacao; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3437 (class 0 OID 16452)
-- Dependencies: 230
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3435 (class 0 OID 16445)
-- Dependencies: 228
-- Data for Name: pessoa_endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3432 (class 0 OID 16431)
-- Dependencies: 225
-- Data for Name: servidor_efetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3422 (class 0 OID 16386)
-- Dependencies: 215
-- Data for Name: servidor_temporario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3429 (class 0 OID 16415)
-- Dependencies: 222
-- Data for Name: unidade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3427 (class 0 OID 16408)
-- Dependencies: 220
-- Data for Name: unidade_endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 216
-- Name: cid_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cid_id', 140, true);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 218
-- Name: end_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.end_id', 1, false);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 223
-- Name: fp_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fp_id', 1, false);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 226
-- Name: lot_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lot_id', 1, false);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 229
-- Name: pes_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pes_id', 1, false);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 214
-- Name: servidor_temporarioid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servidor_temporarioid', 1, false);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 221
-- Name: unid_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unid_id', 1, false);


--
-- TOC entry 3252 (class 2606 OID 16399)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (cid_id);


--
-- TOC entry 3254 (class 2606 OID 16406)
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (end_id);


--
-- TOC entry 3262 (class 2606 OID 16429)
-- Name: foto_pessoa foto_pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto_pessoa
    ADD CONSTRAINT foto_pessoa_pkey PRIMARY KEY (fp_id);


--
-- TOC entry 3269 (class 2606 OID 16442)
-- Name: lotacao lotacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT lotacao_pkey PRIMARY KEY (lot_id);


--
-- TOC entry 3272 (class 2606 OID 16449)
-- Name: pessoa_endereco pessoa_endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_endereco
    ADD CONSTRAINT pessoa_endereco_pkey PRIMARY KEY (pes_id, end_id);


--
-- TOC entry 3274 (class 2606 OID 16459)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (pes_id);


--
-- TOC entry 3265 (class 2606 OID 16435)
-- Name: servidor_efetivo servidor_efetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servidor_efetivo
    ADD CONSTRAINT servidor_efetivo_pkey PRIMARY KEY (servidor_efetivopes_id);


--
-- TOC entry 3250 (class 2606 OID 16391)
-- Name: servidor_temporario servidor_temporario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servidor_temporario
    ADD CONSTRAINT servidor_temporario_pkey PRIMARY KEY (servidor_temporarioid);


--
-- TOC entry 3258 (class 2606 OID 16412)
-- Name: unidade_endereco unidade_endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade_endereco
    ADD CONSTRAINT unidade_endereco_pkey PRIMARY KEY (unid_id, end_id);


--
-- TOC entry 3260 (class 2606 OID 16420)
-- Name: unidade unidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT unidade_pkey PRIMARY KEY (unid_id);


--
-- TOC entry 3255 (class 1259 OID 16407)
-- Name: iendereco; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iendereco ON public.endereco USING btree (cid_id);


--
-- TOC entry 3263 (class 1259 OID 16430)
-- Name: ifoto_pessoa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ifoto_pessoa ON public.foto_pessoa USING btree (pes_id);


--
-- TOC entry 3266 (class 1259 OID 16443)
-- Name: ilotacao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ilotacao ON public.lotacao USING btree (pes_id);


--
-- TOC entry 3267 (class 1259 OID 16444)
-- Name: ilotacao1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ilotacao1 ON public.lotacao USING btree (unid_id);


--
-- TOC entry 3270 (class 1259 OID 16450)
-- Name: ipessoa_endereco1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ipessoa_endereco1 ON public.pessoa_endereco USING btree (end_id);


--
-- TOC entry 3248 (class 1259 OID 16392)
-- Name: iservidor_temporario1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iservidor_temporario1 ON public.servidor_temporario USING btree (servidor_temporariopesid);


--
-- TOC entry 3256 (class 1259 OID 16413)
-- Name: iunidade_endereco1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iunidade_endereco1 ON public.unidade_endereco USING btree (end_id);


--
-- TOC entry 3275 (class 2606 OID 16470)
-- Name: lotacao ilotacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT ilotacao FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id);


--
-- TOC entry 3276 (class 2606 OID 16475)
-- Name: lotacao ilotacao1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT ilotacao1 FOREIGN KEY (unid_id) REFERENCES public.unidade(unid_id);


--
-- TOC entry 3277 (class 2606 OID 16460)
-- Name: pessoa_endereco ipessoa_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_endereco
    ADD CONSTRAINT ipessoa_endereco FOREIGN KEY (pes_id) REFERENCES public.pessoa(pes_id);


--
-- TOC entry 3278 (class 2606 OID 16465)
-- Name: pessoa_endereco ipessoa_endereco1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_endereco
    ADD CONSTRAINT ipessoa_endereco1 FOREIGN KEY (end_id) REFERENCES public.endereco(end_id);


-- Completed on 2025-03-27 20:46:05

--
-- PostgreSQL database dump complete
--

