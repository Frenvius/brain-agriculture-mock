--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Crop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Crop" (
    id integer NOT NULL,
    label text NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public."Crop" OWNER TO postgres;

--
-- Name: CropRelation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CropRelation" (
    id integer NOT NULL,
    "cropId" integer NOT NULL,
    "farmId" integer NOT NULL
);


ALTER TABLE public."CropRelation" OWNER TO postgres;

--
-- Name: CropRelation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CropRelation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."CropRelation_id_seq" OWNER TO postgres;

--
-- Name: CropRelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CropRelation_id_seq" OWNED BY public."CropRelation".id;


--
-- Name: Crop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Crop_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Crop_id_seq" OWNER TO postgres;

--
-- Name: Crop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Crop_id_seq" OWNED BY public."Crop".id;


--
-- Name: Farm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Farm" (
    id integer NOT NULL,
    name text NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    area double precision NOT NULL,
    "usefulArea" double precision NOT NULL,
    "vegetationArea" double precision NOT NULL,
    "producerId" integer NOT NULL
);


ALTER TABLE public."Farm" OWNER TO postgres;

--
-- Name: Farm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Farm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Farm_id_seq" OWNER TO postgres;

--
-- Name: Farm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Farm_id_seq" OWNED BY public."Farm".id;


--
-- Name: Producer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Producer" (
    id integer NOT NULL,
    name text NOT NULL,
    "taxDocument" character varying(14) NOT NULL
);


ALTER TABLE public."Producer" OWNER TO postgres;

--
-- Name: Producer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Producer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Producer_id_seq" OWNER TO postgres;

--
-- Name: Producer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Producer_id_seq" OWNED BY public."Producer".id;


--
-- Name: Crop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crop" ALTER COLUMN id SET DEFAULT nextval('public."Crop_id_seq"'::regclass);


--
-- Name: CropRelation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CropRelation" ALTER COLUMN id SET DEFAULT nextval('public."CropRelation_id_seq"'::regclass);


--
-- Name: Farm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Farm" ALTER COLUMN id SET DEFAULT nextval('public."Farm_id_seq"'::regclass);


--
-- Name: Producer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Producer" ALTER COLUMN id SET DEFAULT nextval('public."Producer_id_seq"'::regclass);


--
-- Data for Name: Crop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Crop" (id, label, active) VALUES (1, 'Soy', true);
INSERT INTO public."Crop" (id, label, active) VALUES (2, 'Corn', true);
INSERT INTO public."Crop" (id, label, active) VALUES (3, 'Cotton', true);
INSERT INTO public."Crop" (id, label, active) VALUES (4, 'Coffee', true);
INSERT INTO public."Crop" (id, label, active) VALUES (5, 'Sugarcane', true);


--
-- Data for Name: CropRelation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (2, 1, 1);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (3, 2, 2);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (4, 4, 2);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (7, 3, 4);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (8, 4, 4);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (9, 4, 5);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (11, 1, 6);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (12, 5, 6);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (13, 4, 6);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (14, 4, 7);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (15, 3, 7);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (16, 2, 7);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (17, 1, 8);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (18, 4, 8);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (19, 3, 8);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (20, 5, 9);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (21, 1, 9);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (22, 2, 9);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (23, 5, 10);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (24, 2, 10);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (25, 4, 11);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (26, 3, 11);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (27, 5, 11);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (28, 5, 12);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (29, 4, 12);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (30, 2, 12);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (31, 5, 13);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (32, 3, 13);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (33, 1, 13);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (34, 1, 14);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (35, 3, 14);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (36, 5, 15);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (37, 1, 15);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (38, 4, 16);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (39, 3, 16);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (40, 3, 17);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (41, 4, 17);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (42, 4, 18);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (43, 3, 18);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (44, 1, 18);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (45, 2, 19);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (46, 4, 19);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (47, 3, 19);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (48, 3, 20);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (49, 2, 20);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (50, 5, 20);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (51, 4, 21);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (52, 2, 21);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (53, 3, 21);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (54, 2, 22);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (55, 1, 22);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (56, 4, 22);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (57, 3, 23);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (58, 4, 23);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (59, 4, 24);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (60, 1, 24);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (61, 5, 24);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (62, 2, 25);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (63, 5, 25);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (64, 5, 26);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (65, 4, 26);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (66, 3, 26);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (67, 4, 27);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (68, 5, 27);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (69, 1, 27);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (70, 2, 28);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (71, 1, 28);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (72, 5, 29);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (73, 1, 29);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (74, 3, 30);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (75, 4, 30);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (76, 5, 30);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (77, 3, 31);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (78, 4, 31);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (79, 2, 31);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (80, 1, 32);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (81, 5, 32);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (82, 3, 32);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (83, 4, 33);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (84, 1, 33);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (85, 5, 33);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (86, 1, 34);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (87, 5, 34);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (88, 2, 34);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (89, 3, 35);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (90, 5, 35);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (91, 4, 36);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (92, 2, 36);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (93, 2, 37);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (94, 5, 37);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (95, 3, 37);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (96, 3, 38);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (97, 5, 38);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (98, 1, 39);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (99, 2, 39);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (100, 4, 39);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (101, 5, 40);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (102, 3, 40);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (103, 1, 40);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (104, 2, 41);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (105, 1, 41);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (106, 4, 41);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (107, 2, 42);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (108, 1, 42);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (109, 4, 42);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (110, 3, 43);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (111, 2, 43);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (112, 2, 44);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (113, 5, 44);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (114, 1, 45);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (115, 2, 45);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (116, 4, 46);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (117, 2, 46);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (118, 3, 46);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (119, 5, 47);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (120, 3, 47);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (121, 5, 48);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (122, 2, 48);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (123, 2, 49);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (124, 1, 49);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (125, 3, 49);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (126, 3, 50);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (127, 2, 50);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (1, 5, 1);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (10, 5, 5);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (6, 3, 3);
INSERT INTO public."CropRelation" (id, "cropId", "farmId") VALUES (5, 1, 3);


--
-- Data for Name: Farm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (36, 'Pharmacon Farms', 'Fortaleza', 'Ceará', 289, 105, 20, 36);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (25, 'Ronelon Farms', 'Aparecida de Goiânia', 'Goiás', 270, 138, 10, 25);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (33, 'Emergent Farms', 'Patos', 'Paraíba', 660, 321, 51, 33);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (46, 'Glasstep Farms', 'Salvador', 'Bahia', 752, 216, 32, 46);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (22, 'Eweville Farms', 'Trindade', 'Goiás', 258, 66, 12, 22);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (37, 'Candecor Farms', 'Sapé', 'Paraná', 701, 391, 64, 37);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (32, 'Enomen Farms', 'Santa Rita', 'Paraíba', 468, 63, 11, 32);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (39, 'Buzzworks Farms', 'São José dos Campos', 'São Paulo', 398, 211, 29, 39);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (13, 'Ecrater Farms', 'Chapecó', 'Santa Catarina', 243, 109, 12, 13);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (1, 'Fitcore Farms', 'Araguaína', 'Tocantins', 648, 329, 38, 1);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (49, 'Tubalum Farms', 'Camaçari', 'Bahia', 347, 142, 21, 49);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (8, 'Billmed Farms', 'Imperatriz', 'Maranhão', 556, 67, 12, 8);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (48, 'Ziggles Farms', 'Vitória da Conquista', 'Bahia', 295, 136, 10, 48);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (43, 'Shopabout Farms', 'Cajazeiras', 'Paraná', 807, 286, 22, 43);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (50, 'Talendula Farms', 'Porto Nacional', 'Tocantins', 398, 161, 20, 50);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (35, 'Prismatic Farms', 'Araguatins', 'Tocantins', 754, 174, 23, 35);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (47, 'Isologia Farms', 'Feira de Santana', 'Bahia', 722, 375, 65, 47);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (26, 'Roughies Farms', 'Formosa', 'Goiás', 454, 99, 14, 26);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (27, 'Digial Farms', 'Valparaíso de Goiás', 'Goiás', 905, 305, 37, 27);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (17, 'Viocular Farms', 'Santa Maria', 'Rio Grande do Sul', 357, 116, 23, 17);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (44, 'Limozen Farms', 'Sousa', 'Paraná', 776, 231, 40, 44);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (19, 'Megall Farms', 'Paraíso do Tocantins', 'Tocantins', 446, 211, 30, 19);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (40, 'Zedalis Farms', 'Olinda', 'Pernambuco', 784, 217, 28, 40);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (11, 'Egypto Farms', 'Florianópolis', 'Santa Catarina', 803, 198, 17, 11);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (9, 'Emtrac Farms', 'Balneário Camboriú', 'Santa Catarina', 612, 170, 30, 9);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (20, 'Genekom Farms', 'Águas Lindas de Goiás', 'Goiás', 296, 152, 31, 20);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (16, 'Radiantix Farms', 'Caxias do Sul', 'Rio Grande do Sul', 889, 264, 47, 16);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (6, 'Magmina Farms', 'Colinas do Tocantins', 'Tocantins', 190, 59, 11, 6);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (28, 'Kangle Farms', 'Anápolis', 'Goiás', 192, 55, 11, 28);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (2, 'Comvex Farms', 'Palmas', 'Tocantins', 455, 74, 10, 2);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (45, 'Portaline Farms', 'Miracema do Tocantins', 'Tocantins', 411, 133, 21, 45);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (3, 'Norsul Farms', 'Parintins', 'Amazonas', 572, 331, 42, 3);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (30, 'Quantalia Farms', 'Bayeux', 'Paraíba', 644, 362, 12, 30);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (4, 'Terascape Farms', 'Itacoatiara', 'Amazonas', 811, 161, 28, 4);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (23, 'Balooba Farms', 'Luziânia', 'Goiás', 358, 162, 18, 23);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (34, 'Plasmos Farms', 'Guaraí', 'Tocantins', 135, 56, 11, 34);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (21, 'Orboid Farms', 'Goiânia', 'Goiás', 671, 111, 22, 21);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (14, 'Cormoran Farms', 'Gurupi', 'Tocantins', 732, 55, 10, 14);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (42, 'Cinaster Farms', 'Guarabira', 'Paraná', 507, 255, 20, 42);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (31, 'Sustenza Farms', 'João Pessoa', 'Paraíba', 361, 176, 31, 31);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (12, 'Spacewax Farms', 'Blumenau', 'Santa Catarina', 790, 151, 14, 12);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (5, 'Aquoavo Farms', 'Manaus', 'Amazonas', 930, 77, 10, 5);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (29, 'Suretech Farms', 'Campina Grande', 'Paraíba', 799, 50, 10, 29);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (15, 'Xth Farms', 'Pelotas', 'Rio Grande do Sul', 951, 275, 53, 15);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (18, 'Blanet Farms', 'Porto Alegre', 'Rio Grande do Sul', 817, 71, 12, 18);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (38, 'Comtent Farms', 'Campinas', 'São Paulo', 697, 297, 19, 38);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (24, 'Plasto Farms', 'Rio Verde', 'Goiás', 586, 236, 22, 24);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (41, 'Harmoney Farms', 'Recife', 'Pernambuco', 183, 109, 17, 41);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (7, 'Enersave Farms', 'São Luís', 'Maranhão', 579, 307, 30, 7);
INSERT INTO public."Farm" (id, name, city, state, area, "usefulArea", "vegetationArea", "producerId") VALUES (10, 'Talkola Farms', 'Joinville', 'Santa Catarina', 503, 83, 14, 10);


--
-- Data for Name: Producer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (1, 'Cotton Shelton', '56814576210');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (34, 'Rojas Horn', '60740087606');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (3, 'Frieda Thornton', '49816696908');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (31, 'Bridget Hunter', '78237501985');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (2, 'Dudley Bass', '24056934100');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (36, 'Hyde Edwards', '23783801001');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (13, 'Etta Mclaughlin', '01029159033');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (12, 'Cleveland Daugherty', '43183463580');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (47, 'Bonnie Patton', '68157797268');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (29, 'Lawson Sheppard', '87552081694');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (44, 'Fowler David', '11337606782');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (50, 'Goff Keith', '18048530031');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (32, 'Park Mcmillan', '52666754626');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (23, 'Carter Hale', '03364404216');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (43, 'Hillary Hawkins', '17088939118');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (11, 'Virgie Pollard', '70277003369');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (46, 'Vera Buckner', '03211904085');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (41, 'Rita Caldwell', '17623793098');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (7, 'Jo Reilly', '21106787200');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (21, 'Neva Mays', '80759033315');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (49, 'Guerra Allen', '01945898119');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (24, 'Camille Moreno', '77004044297');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (48, 'Dena Schneider', '30569366402');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (19, 'Freida Medina', '35641034495');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (4, 'Susanne Leach', '75879876144');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (40, 'Leta Norman', '37545773012');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (15, 'Bowers Peterson', '07366570290');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (33, 'Garrett Britt', '89185262374');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (17, 'Janell Marquez', '31066909920');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (6, 'Kelly George', '61588532674');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (28, 'Debora Bernard', '49562812502');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (18, 'Harrington Jacobs', '77142535687');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (8, 'Marianne Chase', '99516165346');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (14, 'Henderson Mccray', '18056559302');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (22, 'Camacho Walters', '82459155646');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (37, 'Young Roberson', '51042571856');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (42, 'Chase Gould', '51980666563');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (27, 'Greer Acevedo', '55186979880');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (38, 'Melinda Black', '40047481439');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (9, 'Chan Nguyen', '37039604698');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (16, 'Faye Hernandez', '14200999730');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (39, 'Santos Odonnell', '09923676463');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (20, 'Evangeline Daniels', '46416272903');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (35, 'Valeria Chang', '26824780189');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (45, 'Rivas Guy', '67747649169');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (26, 'Marguerite Snider', '64562127821');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (30, 'George Walls', '86941062720');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (10, 'Wright Collins', '96267954765');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (5, 'Wall Freeman', '61667208900');
INSERT INTO public."Producer" (id, name, "taxDocument") VALUES (25, 'Gay Hurst', '38980435258');


--
-- Name: CropRelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CropRelation_id_seq"', 128, false);


--
-- Name: Crop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Crop_id_seq"', 1, false);


--
-- Name: Farm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Farm_id_seq"', 51, false);


--
-- Name: Producer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Producer_id_seq"', 51, false);


--
-- Name: CropRelation CropRelation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CropRelation"
    ADD CONSTRAINT "CropRelation_pkey" PRIMARY KEY (id);


--
-- Name: Crop Crop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crop"
    ADD CONSTRAINT "Crop_pkey" PRIMARY KEY (id);


--
-- Name: Farm Farm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Farm"
    ADD CONSTRAINT "Farm_pkey" PRIMARY KEY (id);


--
-- Name: Producer Producer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Producer"
    ADD CONSTRAINT "Producer_pkey" PRIMARY KEY (id);


--
-- Name: Farm_producerId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Farm_producerId_key" ON public."Farm" USING btree ("producerId");


--
-- Name: Producer_taxDocument_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Producer_taxDocument_key" ON public."Producer" USING btree ("taxDocument");


--
-- Name: CropRelation CropRelation_cropId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CropRelation"
    ADD CONSTRAINT "CropRelation_cropId_fkey" FOREIGN KEY ("cropId") REFERENCES public."Crop"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CropRelation CropRelation_farmId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CropRelation"
    ADD CONSTRAINT "CropRelation_farmId_fkey" FOREIGN KEY ("farmId") REFERENCES public."Farm"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Farm Farm_producerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Farm"
    ADD CONSTRAINT "Farm_producerId_fkey" FOREIGN KEY ("producerId") REFERENCES public."Producer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

