--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11
-- Dumped by pg_dump version 13.11

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    articleid integer NOT NULL,
    articlefamily character varying(100) NOT NULL,
    articlename character varying(100) NOT NULL,
    articledetail text,
    articleunit character varying(50),
    articlepv_det numeric(15,2) NOT NULL,
    articlepv_gros numeric(15,2) NOT NULL,
    articlepv_rev numeric(15,2) NOT NULL,
    articlepa numeric(15,2) NOT NULL,
    quantity integer
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: article_articleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_articleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_articleid_seq OWNER TO postgres;

--
-- Name: article_articleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_articleid_seq OWNED BY public.article.articleid;


--
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    bill_id integer NOT NULL,
    bill_number character varying(100) NOT NULL,
    bill_total_price numeric(15,2),
    bill_date date,
    remise numeric(15,2),
    id_customer integer,
    customer_name character varying(100)
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- Name: bill_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_bill_id_seq OWNER TO postgres;

--
-- Name: bill_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_bill_id_seq OWNED BY public.bill.bill_id;


--
-- Name: bill_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_detail (
    bill_detail_id integer NOT NULL,
    quantity character varying(100) NOT NULL,
    unite_price numeric(15,2),
    amount numeric(15,2),
    bill_id integer,
    article_id integer
);


ALTER TABLE public.bill_detail OWNER TO postgres;

--
-- Name: bill_detail_bill_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_detail_bill_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_detail_bill_detail_id_seq OWNER TO postgres;

--
-- Name: bill_detail_bill_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_detail_bill_detail_id_seq OWNED BY public.bill_detail.bill_detail_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customerid integer NOT NULL,
    customername character varying(100) NOT NULL,
    customerlastname character varying(100),
    customer_contact character varying(21),
    customercode character varying(10)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customerid_seq OWNER TO postgres;

--
-- Name: customer_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customerid_seq OWNED BY public.customer.customerid;


--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stock_id integer NOT NULL,
    quantity_in_stock numeric(10,2) NOT NULL,
    stock_location character varying(100),
    stock_add_date date,
    article_id integer
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_stock_id_seq OWNER TO postgres;

--
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock.stock_id;


--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    storeid integer NOT NULL,
    storename character varying(100) NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- Name: store_storeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_storeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_storeid_seq OWNER TO postgres;

--
-- Name: store_storeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_storeid_seq OWNED BY public.store.storeid;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplierid integer NOT NULL,
    suppliername character varying(100) NOT NULL,
    supplierlastname character varying(100),
    supplier_contact character varying(21)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: supplier_supplierid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplierid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_supplierid_seq OWNER TO postgres;

--
-- Name: supplier_supplierid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplierid_seq OWNED BY public.supplier.supplierid;


--
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    articleid integer NOT NULL,
    articlefamily character varying(100),
    articlename character varying(100),
    articledetail text,
    articleunit character varying(50),
    articlepv_det numeric(15,2),
    articlepv_gros numeric(15,2),
    articlepv_rev numeric(15,2),
    articlepa numeric(15,2),
    quantity integer
);


ALTER TABLE public.test OWNER TO postgres;

--
-- Name: test_testid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_testid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_testid_seq OWNER TO postgres;

--
-- Name: test_testid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_testid_seq OWNED BY public.test.articleid;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    userid integer NOT NULL,
    useragentcode character varying(100),
    username character varying(100) NOT NULL,
    usertype character varying(100) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_userid_seq OWNER TO postgres;

--
-- Name: user_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_userid_seq OWNED BY public."user".userid;


--
-- Name: article articleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN articleid SET DEFAULT nextval('public.article_articleid_seq'::regclass);


--
-- Name: bill bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill ALTER COLUMN bill_id SET DEFAULT nextval('public.bill_bill_id_seq'::regclass);


--
-- Name: bill_detail bill_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_detail ALTER COLUMN bill_detail_id SET DEFAULT nextval('public.bill_detail_bill_detail_id_seq'::regclass);


--
-- Name: customer customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customerid SET DEFAULT nextval('public.customer_customerid_seq'::regclass);


--
-- Name: stock stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN stock_id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);


--
-- Name: store storeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store ALTER COLUMN storeid SET DEFAULT nextval('public.store_storeid_seq'::regclass);


--
-- Name: supplier supplierid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplierid SET DEFAULT nextval('public.supplier_supplierid_seq'::regclass);


--
-- Name: test articleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN articleid SET DEFAULT nextval('public.test_testid_seq'::regclass);


--
-- Name: user userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT nextval('public.user_userid_seq'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (articleid, articlefamily, articlename, articledetail, articleunit, articlepv_det, articlepv_gros, articlepv_rev, articlepa, quantity) FROM stdin;
70	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	0
8	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	0
9	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2.5m	Feuille	21500.00	21500.00	21500.00	19500.00	0
10	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	0
11	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	0
12	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2.5m	Feuille	27300.00	26300.00	26300.00	25300.00	0
13	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	0
14	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	0
15	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2.5m	Feuille	30200.00	29200.00	29200.00	28200.00	0
16	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	0
17	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	0
18	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2.5m	Feuille	35500.00	34500.00	34500.00	33500.00	0
19	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	0
20	Pinceaux & rouleaux	Pinceaux	1"	Pièce	1000.00	1000.00	800.00	600.00	0
21	Pinceaux & rouleaux	Pinceaux	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	0
22	Pinceaux & rouleaux	Pinceaux	2"	Pièce	2000.00	2000.00	16000.00	1300.00	0
23	Pinceaux & rouleaux	Pinceaux	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	0
24	Pinceaux & rouleaux	Pinceaux	3"	Pièce	3000.00	3000.00	2500.00	2000.00	0
25	Pinceaux & rouleaux	Pinceaux	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	0
26	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	0
27	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	0
28	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	0
29	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	0
30	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	0
31	White spirit & Diluante	Diluante	416	Tube	12000.00	12000.00	11500.00	11000.00	0
32	White spirit & Diluante	Diluante	700	Tube	11000.00	11000.00	10500.00	10000.00	0
33	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	0
34	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	0
35	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	0
36	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	0
37	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	0
38	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	0
39	Peinture à l"huile&Anti-rouille	Glycero		Boite 250g	7000.00	6500.00	6200.00	6000.00	0
40	Peinture à l"huile&Anti-rouille	Kapci		Boite 1kg	22000.00	21500.00	21200.00	21000.00	0
41	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	0
42	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	0
43	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	0
44	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	Boite 1kg	18000.00	16000.00	15500.00	14500.00	0
45	Ciment et fer	Ciment	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	0
46	Ciment et fer	Ciment	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	0
47	Ciment et fer	Ciment	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	0
48	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	0
49	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	0
50	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	0
51	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	0
52	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	0
53	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	0
54	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	0
55	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	0
56	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	0
57	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	0
58	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	0
59	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	0
60	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	0
61	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	0
62	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	0
63	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	0
64	Huile&Graisse&liquide frein	Liquide 55		Boite	11000.00	10000.00	9500.00	9000.00	0
65	Huile&Graisse&liquide frein	Liquide E5		Boite	11000.00	10000.00	9500.00	9000.00	0
66	Recuit & pointe	Recuit		kg	10000.00	9000.00	9000.00	6500.00	0
67	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	0
68	Recuit & pointe	Pointe	tôle	kg	10000.00	9000.00	9000.00	7800.00	0
69	Recuit & pointe	Pointe	tête d"homme	kg	12000.00	12000.00	12000.00	9000.00	0
71	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	0
72	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	0
73	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	0
74	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	0
75	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	0
76	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	0
79	Peinture à l'eau et teinte	Teinte	Uniteinte	flacon	3000.00	3000.00	2800.00	2500.00	0
77	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	0
78	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	0
\.


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill (bill_id, bill_number, bill_total_price, bill_date, remise, id_customer, customer_name) FROM stdin;
27	1	137000.00	2023-09-11	2000.00	0	test
28	2	137000.00	2023-09-11	2000.00	0	test
29	3	6000.00	2023-09-11	500.00	0	test
30	5	233333.00	2023-08-09	500.00	1	HAHA
31	6	6000.00	2023-09-11	200.00	0	ttt
32	7	6000.00	2023-09-11	0.00	0	ttt
33	8	6000.00	2023-09-11	5.00	0	ttt
34	9	6000.00	2023-09-11	5.00	0	yy
35	10	3000.00	2023-09-11	4.00	0	tt
36	10	3000.00	2023-09-11	4.00	0	tt
37	10	3000.00	2023-09-11	0.00	0	t
38	10	3000.00	2023-09-11	0.00	0	eee
39	10	3000.00	2023-09-11	0.00	0	eee
40	10	3000.00	2023-09-11	0.00	0	eee
41	10	3000.00	2023-09-11	0.00	0	eee
42	10	3000.00	2023-09-11	0.00	0	eee
43	10	3000.00	2023-09-11	0.00	0	eee
\.


--
-- Data for Name: bill_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill_detail (bill_detail_id, quantity, unite_price, amount, bill_id, article_id) FROM stdin;
16	5	3000.00	15000.00	27	79
17	4	13000.00	52000.00	27	61
18	2	35000.00	70000.00	27	47
19	5	3000.00	15000.00	28	79
20	4	13000.00	52000.00	28	61
21	2	35000.00	70000.00	28	47
22	2	3000.00	6000.00	29	79
23	1	3000.00	3000.00	38	79
24	1	3000.00	3000.00	39	79
25	1	3000.00	3000.00	40	79
26	1	3000.00	3000.00	41	79
27	1	3000.00	3000.00	42	79
28	1	3000.00	3000.00	43	79
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customerid, customername, customerlastname, customer_contact, customercode) FROM stdin;
1	RANAIVO	Richard2	0324367489	000004
11	RAKOTO	Soa	0324561789	0007
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (stock_id, quantity_in_stock, stock_location, stock_add_date, article_id) FROM stdin;
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (storeid, storename) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplierid, suppliername, supplierlastname, supplier_contact) FROM stdin;
1	RAKOTO	Bernard	0324165478
3	testF2	testeee	34254355
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (articleid, articlefamily, articlename, articledetail, articleunit, articlepv_det, articlepv_gros, articlepv_rev, articlepa, quantity) FROM stdin;
6889	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6890	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6891	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6892	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6893	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6894	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6895	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6896	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6897	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6898	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6899	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6900	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6901	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6902	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6903	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6904	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6905	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6906	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6907	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6908	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6909	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6910	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6911	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6912	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6913	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6914	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6915	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6916	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6917	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6918	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6919	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6920	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6921	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6922	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6923	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6924	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6925	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6926	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6927	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6928	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6929	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6930	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6931	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6932	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6933	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6934	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6935	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6936	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6937	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6938	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6939	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6940	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6941	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6942	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6943	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6944	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6945	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6946	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6947	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6948	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6949	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6950	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6951	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6952	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7753	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
6953	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6954	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6955	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6956	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6957	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6958	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6959	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6960	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6961	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6962	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6963	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6964	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6965	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6966	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6967	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6968	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6969	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6970	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6971	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6972	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6973	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6974	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6975	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6976	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6977	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6978	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6979	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6980	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6981	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6982	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6983	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6984	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6985	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6986	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6987	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
6988	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
6989	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
6990	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
6991	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
6992	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
6993	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
6994	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
6995	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
6996	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
6997	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
6998	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
6999	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7000	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7001	Tourelle&Papier Abrasif&disque	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7002	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7003	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7004	Tourelle&Papier Abrasif&disque	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7005	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7006	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7007	Tourelle&Papier Abrasif&disque	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7008	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7009	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7010	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7011	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7012	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7013	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7014	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7015	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7016	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7017	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7018	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7019	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7020	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7021	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7022	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7023	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7024	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7025	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7026	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7027	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7028	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7029	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7030	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7031	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7032	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7033	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7034	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7035	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7036	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7037	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7038	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7039	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7040	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7041	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7042	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7043	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7044	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7045	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7046	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7047	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7048	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7049	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7050	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7051	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7052	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7053	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7054	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7055	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7056	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7057	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7058	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7059	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7060	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7061	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7062	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7063	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7064	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7065	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7066	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7067	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7068	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7069	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7070	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7071	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7072	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7073	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7074	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7075	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7076	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7077	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7078	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7079	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7080	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7081	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7082	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7083	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7084	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7085	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7086	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7087	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7088	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7089	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7090	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7091	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7092	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7093	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7094	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7095	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7096	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7097	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7098	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7099	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7100	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7101	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7102	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7103	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7104	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7105	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7106	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7107	Tourelle&Papier Abrasif&disque	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7108	Tourelle&Papier Abrasif&disque	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7109	Tourelle&Papier Abrasif&disque	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7110	Tourelle&Papier Abrasif&disque	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7111	Tourelle&Papier Abrasif&disque	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7112	Tourelle&Papier Abrasif&disque	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7113	Tourelle&Papier Abrasif&disque	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7114	Tourelle&Papier Abrasif&disque	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7115	Tourelle&Papier Abrasif&disque	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7116	Tourelle&Papier Abrasif&disque	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7117	Tourelle&Papier Abrasif&disque	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7118	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7119	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7120	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7121	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7122	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7123	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7124	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7125	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7126	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7127	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7128	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7129	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7130	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7131	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7132	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7133	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7134	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7135	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7136	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7137	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7138	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7139	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7140	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7141	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7142	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7143	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7144	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7145	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7146	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7147	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7148	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7149	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7150	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7151	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7152	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7153	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7154	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7155	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7156	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7157	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7158	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7159	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7160	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7161	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7162	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7163	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7164	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7165	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7166	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7167	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7168	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7169	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7170	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7171	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7172	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7173	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7174	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7175	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7176	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7177	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7178	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7179	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7180	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7181	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7182	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7183	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7184	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7185	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7186	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7187	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7188	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7189	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7190	Tourelle&Papier Abrasif&disque	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7191	Tourelle&Papier Abrasif&disque	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7192	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7193	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7194	Tourelle&Papier Abrasif&disque	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7195	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7196	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7197	Tourelle&Papier Abrasif&disque	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7198	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7199	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7200	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7201	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7202	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7203	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7204	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7205	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7206	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7207	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7208	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7209	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7210	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7211	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7212	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7213	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7214	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7215	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7216	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7217	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7218	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7219	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7220	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7221	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7222	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7223	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7224	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7225	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7226	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7227	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7228	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7229	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7230	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7231	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7232	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7233	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7234	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7235	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7236	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7237	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7238	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7239	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7240	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7241	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7242	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7243	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7244	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7245	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7246	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7247	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7248	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7249	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7250	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7251	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7252	Tourelle&Papier Abrasif&disque	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7253	Tourelle&Papier Abrasif&disque	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7254	Tourelle&Papier Abrasif&disque	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7255	Tourelle&Papier Abrasif&disque	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7256	Tourelle&Papier Abrasif&disque	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7257	Tourelle&Papier Abrasif&disque	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7258	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7259	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7260	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7261	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7262	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7263	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7264	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7265	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7266	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7267	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7268	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7269	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7270	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7271	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7272	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7273	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7274	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7275	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7276	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7277	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7278	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7279	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7280	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7281	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7282	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7283	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7284	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7285	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7286	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7287	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7288	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7289	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7290	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7291	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7292	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7293	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7294	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7295	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7296	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7297	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7298	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7299	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7300	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7301	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7302	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7303	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7304	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7305	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7306	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7307	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7308	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7309	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7310	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7311	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7312	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7313	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7314	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7315	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7316	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7317	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7318	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7319	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7320	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7321	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7322	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7323	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7324	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7325	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7326	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7327	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7328	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7329	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7330	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7331	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7332	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7333	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7334	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7335	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7336	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7337	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7338	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7339	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7340	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7341	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7342	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7343	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7344	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7345	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7346	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7347	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7348	Tourelle&Papier Abrasif&disque	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7349	Tourelle&Papier Abrasif&disque	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7350	Tourelle&Papier Abrasif&disque	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7351	Tourelle&Papier Abrasif&disque	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7352	Tourelle&Papier Abrasif&disque	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7353	Tourelle&Papier Abrasif&disque	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7354	Tourelle&Papier Abrasif&disque	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7355	Tourelle&Papier Abrasif&disque	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7356	Tourelle&Papier Abrasif&disque	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7357	Tourelle&Papier Abrasif&disque	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7358	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7359	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7360	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7361	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7362	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7363	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7364	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7365	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7366	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7367	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7368	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7369	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7370	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7371	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7372	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7373	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7374	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7375	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7376	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7377	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7378	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7379	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7380	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7381	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7382	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7383	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7384	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7385	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7386	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7387	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7388	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7389	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7390	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7391	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7392	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7393	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7394	Tourelle&Papier Abrasif&disque	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
7395	Tourelle&Papier Abrasif&disque	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
7396	Tourelle&Papier Abrasif&disque	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
7397	Tourelle&Papier Abrasif&disque	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
7398	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7399	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7400	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7401	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7402	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7403	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7404	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7405	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7406	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7407	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7408	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7409	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7410	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7411	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7412	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7413	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7414	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7415	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7416	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7417	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7418	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7419	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7420	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7421	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7422	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7423	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7424	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7425	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7426	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7427	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7428	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7429	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7430	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7431	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7432	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7433	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7434	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7435	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7436	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7437	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7438	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7439	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7440	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7441	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7442	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7443	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7444	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7445	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7446	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7447	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7448	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7449	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7450	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7451	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7452	Tourelle&Papier Abrasif&disque	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
7453	Tourelle&Papier Abrasif&disque	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
7454	Tourelle&Papier Abrasif&disque	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
7455	Tourelle&Papier Abrasif&disque	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
7456	Tourelle&Papier Abrasif&disque	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
7457	Tourelle&Papier Abrasif&disque	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
7458	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7459	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7460	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7461	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7462	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7463	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7464	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7465	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7466	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7467	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7468	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7469	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7470	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7471	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7472	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7473	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7474	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7475	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7476	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7477	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7478	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7479	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7480	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7481	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7482	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7483	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7484	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7485	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7486	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7487	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7488	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7489	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7490	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7491	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7492	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7493	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7494	Tourelle&Papier Abrasif&disque	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
7495	Tourelle&Papier Abrasif&disque	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
7496	Tourelle&Papier Abrasif&disque	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
7497	Tourelle&Papier Abrasif&disque	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
7498	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7499	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7500	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7501	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7502	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7503	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7504	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7505	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7506	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7507	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7508	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7509	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7510	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7511	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7512	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7513	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7514	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7515	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7516	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7517	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7518	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7519	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7520	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7521	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7522	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7523	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7524	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7525	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7526	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7527	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7528	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7529	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7530	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7531	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7532	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7533	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7534	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7535	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7536	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7537	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7538	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7539	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7540	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7541	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7542	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7543	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7544	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7545	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7546	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7547	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7548	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7549	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7550	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7551	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7552	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7553	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7554	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7555	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7556	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7557	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7558	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7559	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7560	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7561	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7562	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7563	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7564	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7565	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7566	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7567	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7568	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7569	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7570	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7571	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7572	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7573	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7574	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7575	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7576	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7577	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7578	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7579	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7580	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7581	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7582	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7583	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7584	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7585	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7586	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7587	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7588	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7589	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7590	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7591	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7592	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7593	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7594	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7595	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7596	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7597	Tourelle&Papier Abrasif&disque	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
7598	Tourelle&Papier Abrasif&disque	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
7599	Tourelle&Papier Abrasif&disque	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
7754	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7600	Tourelle&Papier Abrasif&disque	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
7601	Tourelle&Papier Abrasif&disque	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
7602	Tourelle&Papier Abrasif&disque	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
7603	Tourelle&Papier Abrasif&disque	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
7604	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
7605	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
7606	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
7607	Tourelle&Papier Abrasif&disque	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
7608	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7609	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7610	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7611	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7612	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7613	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7614	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7615	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7616	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7617	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7618	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7619	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7620	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7621	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7622	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7623	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7624	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7625	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7626	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7627	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7628	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7629	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7630	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7631	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7632	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7633	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7634	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7635	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7636	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7637	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7638	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7639	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7640	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7641	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7642	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7643	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7644	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7645	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7646	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7647	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7648	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7649	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7650	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7651	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7652	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7653	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7654	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7655	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7656	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7657	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7658	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7659	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7660	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7661	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7662	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7663	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7664	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7665	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7666	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7667	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7668	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7669	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7670	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7671	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7672	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7673	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7674	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7675	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7676	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7677	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7678	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7679	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7680	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7681	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7682	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7683	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7684	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7685	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7686	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7687	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7688	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7689	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7690	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7691	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7692	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7693	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7694	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7695	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7696	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7697	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7698	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7699	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7700	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7701	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7702	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7703	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7704	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7705	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7706	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7707	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7708	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7709	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7710	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7711	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7712	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7713	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7714	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7715	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7716	Pinceaux & rouleaux	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
7717	Pinceaux & rouleaux	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
7718	Pinceaux & rouleaux	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
7719	Pinceaux & rouleaux	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
7720	Pinceaux & rouleaux	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
7721	Pinceaux & rouleaux	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
7722	Pinceaux & rouleaux	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
7723	Pinceaux & rouleaux	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
7724	Pinceaux & rouleaux	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
7725	Pinceaux & rouleaux	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
7726	Pinceaux & rouleaux	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
7727	Pinceaux & rouleaux	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
7728	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7729	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7730	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7731	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7732	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7733	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7734	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7735	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7736	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7737	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7738	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7739	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7740	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7741	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7742	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7743	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7744	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7745	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7746	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7747	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7748	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7749	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7750	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7751	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7752	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7755	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7756	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7757	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7758	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7759	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7760	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7761	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7762	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7763	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7764	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7765	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7766	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7767	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7768	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7769	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7770	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7771	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7772	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7773	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7774	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7775	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7776	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7777	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7778	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7779	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7780	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7781	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7782	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7783	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7784	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7785	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7786	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7787	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7788	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7789	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7790	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7791	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7792	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7793	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7794	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7795	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7796	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7797	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7798	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7799	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7800	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7801	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7802	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7803	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7804	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7805	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7806	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7807	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7808	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7809	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7810	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7811	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7812	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7813	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7814	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7815	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7816	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7817	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7818	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7819	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7820	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7821	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7822	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7823	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7824	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7825	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7826	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7827	Pinceaux & rouleaux	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
7828	Pinceaux & rouleaux	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
7829	Pinceaux & rouleaux	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
7830	Pinceaux & rouleaux	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
7831	Pinceaux & rouleaux	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
7832	Pinceaux & rouleaux	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
7833	Pinceaux & rouleaux	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
7834	Pinceaux & rouleaux	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
7835	Pinceaux & rouleaux	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
7836	Pinceaux & rouleaux	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
7837	Pinceaux & rouleaux	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
7838	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7839	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7840	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7841	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7842	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7843	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7844	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7845	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7846	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7847	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7848	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7849	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7850	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7851	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7852	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7853	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7854	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7855	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7856	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7857	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7858	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7859	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7860	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7861	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7862	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7863	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7864	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7865	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7866	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7867	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7868	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7869	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7870	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7871	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7872	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7873	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7874	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7875	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7876	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7877	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7878	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7879	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7880	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7881	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7882	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7883	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7884	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7885	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7886	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7887	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7888	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7889	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7890	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7891	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7892	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7893	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7894	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7895	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7896	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7897	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7898	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7899	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7900	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7901	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7902	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7903	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7904	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7905	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7906	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7907	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7908	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7909	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7910	Pinceaux & rouleaux	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
7911	Pinceaux & rouleaux	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
7912	Pinceaux & rouleaux	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
7913	Pinceaux & rouleaux	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
7914	Pinceaux & rouleaux	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
7915	Pinceaux & rouleaux	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
7916	Pinceaux & rouleaux	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
7917	Pinceaux & rouleaux	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
7918	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7919	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7920	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7921	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7922	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7923	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7924	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7925	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7926	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7927	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7928	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7929	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7930	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7931	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7932	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7933	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7934	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7935	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7936	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7937	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7938	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7939	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7940	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7941	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7942	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7943	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7944	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7945	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7946	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7947	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7948	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7949	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7950	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7951	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7952	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7953	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7954	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7955	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7956	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7957	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7958	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7959	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7960	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7961	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7962	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7963	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7964	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7965	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7966	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7967	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7968	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7969	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7970	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7971	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7972	Pinceaux & rouleaux	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
7973	Pinceaux & rouleaux	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
7974	Pinceaux & rouleaux	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
7975	Pinceaux & rouleaux	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
7976	Pinceaux & rouleaux	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
7977	Pinceaux & rouleaux	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
7978	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7979	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7980	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7981	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7982	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7983	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7984	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7985	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7986	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7987	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7988	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7989	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
7990	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
7991	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
7992	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
7993	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
7994	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
7995	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
7996	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7997	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
7998	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
7999	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8000	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8001	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8002	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8003	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8004	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8005	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8006	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8007	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8008	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8009	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8010	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8011	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8012	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8013	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8014	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8015	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8016	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8017	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8018	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8019	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8020	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8021	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8022	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8023	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8024	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8025	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8026	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8027	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8028	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8029	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8030	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8031	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8032	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8033	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8034	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8035	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8036	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8037	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8038	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8039	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8040	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8041	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8042	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8043	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8044	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8045	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8046	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8047	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8048	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8049	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8050	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8051	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8052	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8053	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8054	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8055	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8056	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8057	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8058	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8059	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8060	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8061	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8062	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8063	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8064	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8065	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8066	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8067	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8068	Pinceaux & rouleaux	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8069	Pinceaux & rouleaux	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8070	Pinceaux & rouleaux	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8071	Pinceaux & rouleaux	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8072	Pinceaux & rouleaux	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8073	Pinceaux & rouleaux	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8074	Pinceaux & rouleaux	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8075	Pinceaux & rouleaux	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8076	Pinceaux & rouleaux	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8077	Pinceaux & rouleaux	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8078	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8079	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8080	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8081	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8082	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8083	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8084	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8085	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8086	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8087	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8088	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8089	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8090	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8091	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8092	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8093	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8094	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8095	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8096	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8097	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8098	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8099	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8100	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8101	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8102	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8103	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8104	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8105	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8106	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8107	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8108	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8109	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8110	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8111	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8112	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8113	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8114	Pinceaux & rouleaux	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8115	Pinceaux & rouleaux	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8116	Pinceaux & rouleaux	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8117	Pinceaux & rouleaux	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8118	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8119	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8120	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8121	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8122	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8123	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8124	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8125	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8126	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8127	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8128	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8129	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8130	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8131	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8132	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8133	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8134	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8135	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8136	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8137	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8138	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8139	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8140	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8141	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8142	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8143	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8144	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8145	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8146	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8147	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8148	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8149	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8150	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8151	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8152	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8153	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8154	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8155	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8156	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8157	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8158	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8159	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8160	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8161	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8162	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8163	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8164	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8165	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8166	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8167	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8168	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8169	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8170	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8171	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8172	Pinceaux & rouleaux	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8173	Pinceaux & rouleaux	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8174	Pinceaux & rouleaux	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8175	Pinceaux & rouleaux	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8176	Pinceaux & rouleaux	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8177	Pinceaux & rouleaux	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8178	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8179	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8180	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8181	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8182	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8183	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8184	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8185	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8186	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8187	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8188	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8189	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8190	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8191	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8192	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8193	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8194	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8195	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8196	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8197	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8198	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8199	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8200	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8201	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8202	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8203	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8204	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8205	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8206	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8207	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8208	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8209	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8210	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8211	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8212	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8213	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8214	Pinceaux & rouleaux	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8215	Pinceaux & rouleaux	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8216	Pinceaux & rouleaux	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8217	Pinceaux & rouleaux	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8218	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8219	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8220	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8221	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8222	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8223	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8224	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8225	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8226	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8227	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8228	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8229	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8230	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8231	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8232	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8233	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8234	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8235	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8236	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8237	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8238	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8239	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8240	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8241	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8242	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8243	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8244	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8245	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8246	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8247	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8248	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8249	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8250	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8251	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8252	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8253	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8254	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8255	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8256	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8257	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8258	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8259	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8260	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8261	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8262	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8263	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8264	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8265	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8266	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8267	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8268	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8269	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8270	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8271	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8272	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8273	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8274	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8275	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8276	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8277	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8278	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8279	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8280	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8281	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8282	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8283	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8284	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8285	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8286	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8287	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8288	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8289	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8290	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8291	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8292	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8293	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8294	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8295	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8296	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8297	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8298	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8299	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8300	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8301	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8302	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8303	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8304	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8305	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8306	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8307	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8308	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8309	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8310	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8311	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8312	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8313	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8314	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8315	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8316	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8317	Pinceaux & rouleaux	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8318	Pinceaux & rouleaux	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8319	Pinceaux & rouleaux	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8320	Pinceaux & rouleaux	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8321	Pinceaux & rouleaux	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8322	Pinceaux & rouleaux	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8323	Pinceaux & rouleaux	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8324	Pinceaux & rouleaux	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8325	Pinceaux & rouleaux	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8326	Pinceaux & rouleaux	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8327	Pinceaux & rouleaux	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8328	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8329	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8330	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8331	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8332	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8333	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8334	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8335	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8336	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8337	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8338	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8339	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8340	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8341	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8342	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8343	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8344	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8345	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8346	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8347	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8348	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8349	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8350	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8351	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8352	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8353	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8354	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8355	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8356	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8357	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8358	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8359	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8360	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8361	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8362	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8363	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8364	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8365	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8366	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8367	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8368	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8369	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8370	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8371	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8372	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8373	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8374	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8375	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8376	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8377	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8378	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8379	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8380	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8381	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8382	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8383	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8384	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8385	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8386	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8387	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8388	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8389	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8390	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8391	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8392	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8393	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8394	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8395	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8396	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8397	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8398	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8399	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8400	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8401	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8402	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8403	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8404	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8405	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8406	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8407	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8408	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8409	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8410	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8411	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8412	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8413	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8414	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8415	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8416	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8417	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8418	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8419	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8420	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8421	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8422	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8423	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8424	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8425	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8426	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8427	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8428	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8429	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8430	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8431	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8432	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8433	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8434	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8435	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8436	White spirit & Diluante	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
8437	White spirit & Diluante	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
8438	White spirit & Diluante	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
8439	White spirit & Diluante	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
8440	White spirit & Diluante	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
8441	White spirit & Diluante	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
8442	White spirit & Diluante	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
8443	White spirit & Diluante	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
8444	White spirit & Diluante	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
8445	White spirit & Diluante	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
8446	White spirit & Diluante	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
8447	White spirit & Diluante	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
8448	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8449	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8450	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8451	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8452	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8453	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8454	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8455	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8456	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8457	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8458	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8459	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8460	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8461	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8462	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8463	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8464	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8465	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8466	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8467	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8468	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8469	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8470	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8471	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8472	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8473	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8474	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8475	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8476	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8477	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8478	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8479	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8480	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8481	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8482	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8483	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8484	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8485	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8486	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8487	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8488	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8489	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8490	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8491	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8492	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8493	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8494	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8495	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8496	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8497	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8498	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8499	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8500	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8501	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8502	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8503	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8504	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8505	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8506	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8507	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8508	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8509	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8510	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8511	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8512	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8513	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8514	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8515	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8516	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8517	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8518	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8519	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8520	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8521	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8522	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8523	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8524	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8525	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8526	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8527	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8528	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8529	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8530	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8531	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8532	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8533	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8534	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8535	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8536	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8537	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8538	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8539	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8540	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8541	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8542	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8543	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8544	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8545	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8546	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8547	White spirit & Diluante	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
8548	White spirit & Diluante	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
8549	White spirit & Diluante	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
8550	White spirit & Diluante	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
8551	White spirit & Diluante	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
8552	White spirit & Diluante	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
8553	White spirit & Diluante	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
8554	White spirit & Diluante	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
8555	White spirit & Diluante	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
8556	White spirit & Diluante	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
8557	White spirit & Diluante	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
8558	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8559	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8560	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8561	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8562	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8563	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8564	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8565	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8566	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8567	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8568	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8569	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8570	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8571	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8572	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8573	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8574	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8575	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8576	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8577	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8578	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8579	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8580	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8581	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8582	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8583	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8584	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8585	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8586	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8587	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8588	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8589	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8590	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8591	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8592	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8593	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8594	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8595	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8596	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8597	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8598	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8599	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8600	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8601	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8602	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8603	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8604	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8605	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8606	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8607	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8608	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8609	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8610	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8611	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8612	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8613	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8614	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8615	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8616	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8617	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8618	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8619	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8620	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8621	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8622	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8623	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8624	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8625	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8626	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8627	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8628	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8629	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8630	White spirit & Diluante	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
8631	White spirit & Diluante	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
8632	White spirit & Diluante	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
8633	White spirit & Diluante	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
8634	White spirit & Diluante	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
8635	White spirit & Diluante	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
8636	White spirit & Diluante	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
8637	White spirit & Diluante	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
8638	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8639	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8640	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8641	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8642	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8643	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8644	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8645	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8646	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8647	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8648	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8649	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8650	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8651	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8652	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8653	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8654	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8655	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8656	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8657	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8658	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8659	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8660	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8661	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8662	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8663	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8664	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8665	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8666	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8667	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8668	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8669	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8670	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8671	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8672	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8673	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8674	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8675	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8676	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8677	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8678	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8679	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8680	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8681	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8682	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8683	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8684	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8685	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8686	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8687	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8688	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8689	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8690	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8691	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8692	White spirit & Diluante	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
8693	White spirit & Diluante	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
8694	White spirit & Diluante	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
8695	White spirit & Diluante	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
8696	White spirit & Diluante	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
8697	White spirit & Diluante	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
8698	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8699	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8700	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8701	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8702	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8703	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8704	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8705	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8706	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8707	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8708	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8709	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8710	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8711	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8712	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8713	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8714	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8715	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8716	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8717	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8718	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8719	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8720	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8721	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8722	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8723	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8724	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8725	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8726	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8727	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8728	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8729	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8730	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8731	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8732	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8733	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8734	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8735	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8736	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8737	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8738	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8739	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8740	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8741	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8742	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8743	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8744	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8745	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8746	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8747	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8748	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8749	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8750	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8751	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8752	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8753	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8754	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8755	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8756	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8757	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8758	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8759	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8760	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8761	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8762	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8763	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8764	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8765	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8766	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8767	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8768	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8769	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8770	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8771	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8772	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8773	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8774	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8775	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8776	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8777	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8778	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8779	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8780	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8781	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8782	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8783	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8784	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8785	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8786	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8787	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8788	White spirit & Diluante	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
8789	White spirit & Diluante	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
8790	White spirit & Diluante	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
8791	White spirit & Diluante	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
8792	White spirit & Diluante	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
8793	White spirit & Diluante	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
8794	White spirit & Diluante	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
8795	White spirit & Diluante	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
8796	White spirit & Diluante	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8797	White spirit & Diluante	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
8798	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8799	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8800	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8801	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8802	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8803	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8804	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8805	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8806	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8807	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8808	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8809	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8810	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8811	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8812	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8813	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8814	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8815	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8816	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8817	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8818	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8819	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8820	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8821	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8822	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8823	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8824	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8825	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8826	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8827	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8828	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8829	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8830	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8831	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8832	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8833	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8834	White spirit & Diluante	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
8835	White spirit & Diluante	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
8836	White spirit & Diluante	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
8837	White spirit & Diluante	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
8838	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8839	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8840	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8841	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8842	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8843	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8844	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8845	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8846	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8847	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8848	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8849	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8850	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8851	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8852	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8853	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8854	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8855	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8856	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8857	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8858	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8859	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8860	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8861	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8862	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8863	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8864	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8865	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8866	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8867	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8868	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8869	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8870	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8871	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8872	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8873	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8874	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8875	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8876	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8877	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8878	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8879	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8880	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8881	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8882	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8883	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8884	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8885	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8886	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8887	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8888	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8889	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8890	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8891	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8892	White spirit & Diluante	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
8893	White spirit & Diluante	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
8894	White spirit & Diluante	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
8895	White spirit & Diluante	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
8896	White spirit & Diluante	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
8897	White spirit & Diluante	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
8898	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8899	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8900	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8901	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8902	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8903	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8904	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8905	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8906	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8907	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8908	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8909	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8910	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8911	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8912	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8913	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8914	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8915	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8916	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8917	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8918	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8919	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8920	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8921	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8922	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8923	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8924	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8925	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8926	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8927	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8928	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8929	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8930	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8931	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8932	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8933	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8934	White spirit & Diluante	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
8935	White spirit & Diluante	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
8936	White spirit & Diluante	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
8937	White spirit & Diluante	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
8938	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8939	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8940	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8941	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8942	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8943	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8944	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8945	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8946	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8947	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8948	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8949	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8950	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8951	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8952	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8953	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8954	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8955	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8956	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8957	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8958	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8959	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8960	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8961	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8962	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8963	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8964	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8965	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8966	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8967	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8968	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8969	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8970	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8971	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8972	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8973	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8974	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8975	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8976	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8977	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8978	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8979	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8980	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8981	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8982	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8983	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8984	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8985	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8986	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8987	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8988	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
8989	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
8990	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
8991	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
8992	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
8993	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
8994	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
8995	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
8996	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
8997	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
8998	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
8999	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9000	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9001	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9002	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9003	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9004	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9005	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9006	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9007	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9008	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9009	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9010	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9011	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9012	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9013	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9014	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9015	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9016	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9017	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9018	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9019	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9020	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9021	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9022	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9023	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9024	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9025	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9026	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9027	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9028	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9029	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9030	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9031	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9032	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9033	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9034	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9035	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9036	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9037	White spirit & Diluante	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9038	White spirit & Diluante	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9039	White spirit & Diluante	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9040	White spirit & Diluante	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9041	White spirit & Diluante	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9042	White spirit & Diluante	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9043	White spirit & Diluante	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9044	White spirit & Diluante	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9045	White spirit & Diluante	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9046	White spirit & Diluante	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9047	White spirit & Diluante	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9048	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9049	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9050	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9051	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9052	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9053	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9054	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9055	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9056	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9057	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9058	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9059	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9060	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9061	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9062	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9063	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9064	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9065	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9066	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9067	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9068	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9069	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9070	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9071	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9072	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9073	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9074	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9075	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9076	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9077	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9078	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9079	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9080	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9081	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9082	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9083	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9084	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9085	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9086	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9087	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9088	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9089	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9090	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9091	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9092	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9093	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9094	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9095	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9096	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9097	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9098	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9099	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9100	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9101	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9102	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9103	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9104	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9105	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9106	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9107	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9108	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9109	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9110	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9111	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9112	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9113	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9114	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9115	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9116	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9117	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9118	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9119	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9120	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9121	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9122	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9123	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9124	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9125	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9126	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9127	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9128	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9129	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9130	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9131	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9132	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9133	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9134	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9135	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9136	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9920	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9137	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9138	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9139	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9140	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9141	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9142	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9143	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9144	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9145	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9146	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9147	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9148	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9149	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9150	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9151	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9152	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9153	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9154	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9155	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9156	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9157	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9158	Peinture à l"huile&Anti-rouille	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9159	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9160	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9161	Peinture à l"huile&Anti-rouille	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9162	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9163	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9164	Peinture à l"huile&Anti-rouille	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9165	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9166	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9167	Peinture à l"huile&Anti-rouille	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9168	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9169	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9170	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9171	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9172	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9173	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9174	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9175	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9176	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9177	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9178	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9179	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9180	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9181	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9182	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9183	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9184	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9185	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9186	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9187	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9188	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9189	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9190	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9191	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9192	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9193	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9194	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9195	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9196	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9197	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9198	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9199	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9200	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9201	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9202	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9203	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9204	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9205	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9206	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9207	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9208	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9209	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9210	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9211	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9212	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9213	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9214	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9215	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9216	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9217	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9218	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9219	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9220	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9221	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9222	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9223	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9224	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9225	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9226	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9227	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9228	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9229	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9230	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9231	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9232	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9233	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9234	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9235	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9236	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9237	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9238	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9239	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9240	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9241	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9242	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9243	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9244	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9245	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9246	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9247	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9248	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9249	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9250	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9251	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9252	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9253	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9254	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9255	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9256	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9257	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9258	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9259	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9260	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9261	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9262	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9263	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9264	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9265	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9266	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9267	Peinture à l"huile&Anti-rouille	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9268	Peinture à l"huile&Anti-rouille	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9269	Peinture à l"huile&Anti-rouille	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9270	Peinture à l"huile&Anti-rouille	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9271	Peinture à l"huile&Anti-rouille	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9272	Peinture à l"huile&Anti-rouille	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9273	Peinture à l"huile&Anti-rouille	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9274	Peinture à l"huile&Anti-rouille	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9275	Peinture à l"huile&Anti-rouille	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9276	Peinture à l"huile&Anti-rouille	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9277	Peinture à l"huile&Anti-rouille	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9278	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9279	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9280	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9281	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9282	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9283	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9284	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9285	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9286	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9287	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9288	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9289	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9290	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9291	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9292	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9293	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9294	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9295	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9296	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9297	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9298	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9299	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9300	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9301	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9302	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9303	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9304	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9305	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9306	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9307	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9308	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9309	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9310	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9311	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9312	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9313	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9314	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9315	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9316	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9317	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9318	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9319	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9320	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9321	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9322	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9323	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9324	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9325	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9326	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9327	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9328	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9329	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9330	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9331	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9332	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9333	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9334	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9335	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9336	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9337	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9338	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9339	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9340	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9341	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9342	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9343	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9344	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9345	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9346	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9347	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9348	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9349	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9350	Peinture à l"huile&Anti-rouille	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9351	Peinture à l"huile&Anti-rouille	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
9352	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
9353	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
9354	Peinture à l"huile&Anti-rouille	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
9355	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
9356	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
9357	Peinture à l"huile&Anti-rouille	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
9358	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9359	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9360	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9361	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9362	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9363	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9364	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9365	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9366	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9367	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9368	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9369	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9370	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9371	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9372	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9373	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9374	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9375	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9376	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9377	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9378	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9379	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9380	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9381	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9382	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9383	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9384	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9385	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9386	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9387	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9388	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9389	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9390	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9391	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9392	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9393	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9394	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9395	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9396	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9397	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9398	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9399	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9400	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9401	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9402	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9403	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9404	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9405	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9406	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9407	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9408	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9409	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9410	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9411	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9412	Peinture à l"huile&Anti-rouille	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
9413	Peinture à l"huile&Anti-rouille	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
9414	Peinture à l"huile&Anti-rouille	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
9415	Peinture à l"huile&Anti-rouille	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
9416	Peinture à l"huile&Anti-rouille	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
9417	Peinture à l"huile&Anti-rouille	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
9418	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9419	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9420	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9421	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9422	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9423	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9424	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9425	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9426	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9427	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9428	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9429	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9430	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9431	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9432	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9433	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9434	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9435	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9436	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9437	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9438	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9439	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9440	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9441	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9442	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9443	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9444	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9445	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9446	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9447	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9448	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9449	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9450	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9451	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9452	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9453	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9454	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9455	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9456	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9457	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9458	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9459	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9460	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9461	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9462	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9463	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9464	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9465	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9466	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9467	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9468	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9469	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9470	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9471	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9472	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9473	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9474	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9475	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9476	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9477	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9478	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9479	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9480	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9481	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9482	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9483	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9484	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9485	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9486	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9487	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9488	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9489	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9490	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9491	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9492	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9493	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9494	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9495	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9496	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9497	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9498	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9499	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9500	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9501	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9502	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9503	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9504	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9505	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9506	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9507	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9508	Peinture à l"huile&Anti-rouille	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
9509	Peinture à l"huile&Anti-rouille	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
9510	Peinture à l"huile&Anti-rouille	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
9511	Peinture à l"huile&Anti-rouille	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
9512	Peinture à l"huile&Anti-rouille	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
9513	Peinture à l"huile&Anti-rouille	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
9514	Peinture à l"huile&Anti-rouille	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
9515	Peinture à l"huile&Anti-rouille	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
9516	Peinture à l"huile&Anti-rouille	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9517	Peinture à l"huile&Anti-rouille	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
9518	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9519	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9520	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9521	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9522	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9523	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9524	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9525	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9526	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9527	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9528	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9529	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9530	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9531	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9532	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9533	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9534	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9535	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9536	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9537	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9538	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9539	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9540	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9541	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9542	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9543	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9544	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9545	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9546	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9547	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9548	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9549	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9550	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9551	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9552	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9553	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9554	Peinture à l"huile&Anti-rouille	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
9555	Peinture à l"huile&Anti-rouille	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
9556	Peinture à l"huile&Anti-rouille	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
9557	Peinture à l"huile&Anti-rouille	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
9558	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9559	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9560	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9561	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9562	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9563	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9564	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9565	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9566	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9567	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9568	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9569	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9570	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9571	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9572	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9573	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9574	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9575	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9576	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9577	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9578	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9579	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9580	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9581	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9582	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9583	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9584	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9585	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9586	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9587	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9588	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9589	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9590	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9591	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9592	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9593	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9594	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9595	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9596	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9597	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9598	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9599	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9600	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9601	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9602	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9603	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9604	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9605	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9606	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9607	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9608	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9609	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9610	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9611	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9612	Peinture à l"huile&Anti-rouille	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
9613	Peinture à l"huile&Anti-rouille	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
9614	Peinture à l"huile&Anti-rouille	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
9615	Peinture à l"huile&Anti-rouille	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
9616	Peinture à l"huile&Anti-rouille	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
9617	Peinture à l"huile&Anti-rouille	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
9618	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9619	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9620	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9621	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9622	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9623	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9624	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9625	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9626	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9627	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9628	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9629	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9630	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9631	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9632	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9633	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9634	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9635	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9636	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9637	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9638	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9639	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9640	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9641	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9642	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9643	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9644	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9645	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9646	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9647	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9648	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9649	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9650	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9651	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9652	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9653	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9654	Peinture à l"huile&Anti-rouille	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
9655	Peinture à l"huile&Anti-rouille	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
9656	Peinture à l"huile&Anti-rouille	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
9657	Peinture à l"huile&Anti-rouille	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
9658	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9659	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9660	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9661	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9662	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9663	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9664	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9665	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9666	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9667	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9668	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9669	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9670	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9671	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9672	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9673	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9674	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9675	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9676	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9677	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9678	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9679	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9680	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9681	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9682	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9683	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9684	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9685	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9686	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9687	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9688	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9689	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9690	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9691	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9692	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9693	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9694	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9695	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9696	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9697	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9698	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9699	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9700	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9701	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9702	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9703	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9704	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9705	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9706	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9921	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9707	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9708	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9709	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9710	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9711	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9712	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9713	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9714	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9715	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9716	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9717	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9718	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9719	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9720	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9721	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9722	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9723	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9724	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9725	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9726	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9727	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9728	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9729	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9730	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9731	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9732	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9733	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9734	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9735	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9736	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9737	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9738	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9739	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9740	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9741	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9742	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9743	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9744	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9745	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9746	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9747	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9748	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9749	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9750	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9751	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9752	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9753	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9754	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9755	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9756	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9757	Peinture à l"huile&Anti-rouille	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
9758	Peinture à l"huile&Anti-rouille	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
9759	Peinture à l"huile&Anti-rouille	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
9760	Peinture à l"huile&Anti-rouille	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
9761	Peinture à l"huile&Anti-rouille	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
9762	Peinture à l"huile&Anti-rouille	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
9763	Peinture à l"huile&Anti-rouille	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
9764	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
9765	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
9766	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
9767	Peinture à l"huile&Anti-rouille	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
9768	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9769	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9770	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9771	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9772	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9773	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9774	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9775	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9776	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9777	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9778	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9779	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9780	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9781	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9782	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9783	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9784	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9785	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9786	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9787	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9788	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9789	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9790	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9791	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9792	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9793	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9794	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9795	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9796	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9797	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9798	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9799	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9800	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9801	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9802	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9803	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9804	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9805	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9806	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9807	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9808	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9809	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9810	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9811	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9812	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9813	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9814	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9815	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9816	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9817	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9818	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9819	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9820	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9821	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9822	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9823	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9824	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9825	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9826	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9827	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9828	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9829	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9830	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9831	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9832	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9833	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9834	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9835	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9836	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9837	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9838	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9839	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9840	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9841	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9842	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9843	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9844	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9845	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9846	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9847	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9848	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9849	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9850	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9851	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9852	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9853	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9854	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9855	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9856	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9857	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9858	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9859	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9860	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9861	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9862	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9863	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9864	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9865	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9866	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9867	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9868	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9869	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9870	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9871	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9872	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9873	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9874	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9875	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9876	Huile&Graisse&liquide frein	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
9877	Huile&Graisse&liquide frein	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
9878	Huile&Graisse&liquide frein	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
9879	Huile&Graisse&liquide frein	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
9880	Huile&Graisse&liquide frein	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
9881	Huile&Graisse&liquide frein	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
9882	Huile&Graisse&liquide frein	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
9883	Huile&Graisse&liquide frein	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
9884	Huile&Graisse&liquide frein	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
9885	Huile&Graisse&liquide frein	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
9886	Huile&Graisse&liquide frein	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
9887	Huile&Graisse&liquide frein	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
9888	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9889	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9890	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9891	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9892	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9893	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9894	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9895	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9896	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9897	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9898	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9899	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9900	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9901	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9902	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9903	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9904	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9905	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9906	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9907	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9908	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9909	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9910	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9911	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9912	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9913	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9914	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9915	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9916	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9917	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9918	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9919	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9922	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9923	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9924	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9925	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9926	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9927	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9928	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9929	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9930	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9931	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9932	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9933	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9934	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9935	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9936	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9937	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9938	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9939	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9940	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9941	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9942	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9943	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9944	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9945	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9946	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9947	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9948	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9949	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9950	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9951	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9952	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9953	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9954	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9955	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9956	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9957	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9958	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9959	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9960	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9961	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9962	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9963	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9964	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9965	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9966	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9967	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9968	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9969	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9970	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9971	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9972	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9973	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9974	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9975	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9976	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9977	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9978	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9979	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9980	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9981	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9982	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9983	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9984	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9985	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9986	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9987	Huile&Graisse&liquide frein	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
9988	Huile&Graisse&liquide frein	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
9989	Huile&Graisse&liquide frein	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
9990	Huile&Graisse&liquide frein	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
9991	Huile&Graisse&liquide frein	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
9992	Huile&Graisse&liquide frein	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
9993	Huile&Graisse&liquide frein	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
9994	Huile&Graisse&liquide frein	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
9995	Huile&Graisse&liquide frein	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
9996	Huile&Graisse&liquide frein	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
9997	Huile&Graisse&liquide frein	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
9998	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
9999	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10000	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10001	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10002	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10003	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10004	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10005	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10006	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10007	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10008	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10009	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10010	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10011	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10012	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10013	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10014	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10015	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10016	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10017	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10018	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10019	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10020	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10021	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10022	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10023	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10024	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10025	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10026	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10027	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10028	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10029	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10030	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10031	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10032	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10033	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10034	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10035	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10036	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10037	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10038	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10039	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10040	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10041	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10042	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10043	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10044	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10045	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10046	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10047	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10048	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10049	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10050	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10051	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10052	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10053	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10054	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10055	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10056	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10057	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10058	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10059	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10060	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10061	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10062	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10063	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10064	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10065	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10066	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10067	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10068	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10069	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10070	Huile&Graisse&liquide frein	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10071	Huile&Graisse&liquide frein	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10072	Huile&Graisse&liquide frein	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10073	Huile&Graisse&liquide frein	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10074	Huile&Graisse&liquide frein	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10075	Huile&Graisse&liquide frein	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10076	Huile&Graisse&liquide frein	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10077	Huile&Graisse&liquide frein	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10078	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10079	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10080	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10081	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10082	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10083	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10084	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10085	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10086	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10087	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10088	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10089	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10090	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10091	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10092	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10093	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10094	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10095	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10096	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10097	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10098	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10099	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10100	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10101	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10102	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10103	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10104	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10105	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10106	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10107	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10108	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10109	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10110	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10111	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10112	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10113	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10114	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10115	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10116	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10117	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10118	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10119	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10120	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10121	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10122	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10123	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10124	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10125	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10126	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10127	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10128	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10129	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10130	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10131	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10132	Huile&Graisse&liquide frein	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10133	Huile&Graisse&liquide frein	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10134	Huile&Graisse&liquide frein	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10135	Huile&Graisse&liquide frein	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10136	Huile&Graisse&liquide frein	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10137	Huile&Graisse&liquide frein	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10138	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10139	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10140	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10141	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10142	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10143	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10144	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10145	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10146	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10147	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10148	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10149	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10150	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10151	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10152	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10153	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10154	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10155	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10156	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10157	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10158	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10159	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10160	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10161	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10162	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10163	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10164	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10165	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10166	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10167	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10168	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10169	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10170	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10171	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10172	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10173	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10174	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10175	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10176	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10177	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10178	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10179	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10180	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10181	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10182	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10183	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10184	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10185	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10186	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10187	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10188	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10189	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10190	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10191	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10192	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10193	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10194	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10195	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10196	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10197	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10198	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10199	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10200	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10201	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10202	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10203	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10204	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10205	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10206	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10207	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10208	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10209	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10210	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10211	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10212	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10213	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10214	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10215	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10216	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10217	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10218	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10219	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10220	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10221	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10222	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10223	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10224	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10225	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10226	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10227	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10228	Huile&Graisse&liquide frein	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10229	Huile&Graisse&liquide frein	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10230	Huile&Graisse&liquide frein	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10231	Huile&Graisse&liquide frein	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10232	Huile&Graisse&liquide frein	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10233	Huile&Graisse&liquide frein	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10234	Huile&Graisse&liquide frein	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10235	Huile&Graisse&liquide frein	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10236	Huile&Graisse&liquide frein	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10237	Huile&Graisse&liquide frein	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10238	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10239	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10240	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10241	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10242	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10243	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10244	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10245	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10246	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10247	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10248	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10249	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10250	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10251	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10252	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10253	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10254	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10255	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10256	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10257	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10258	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10259	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10260	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10261	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10262	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10263	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10264	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10265	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10266	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10267	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10268	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10269	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10270	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10271	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10272	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10273	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10274	Huile&Graisse&liquide frein	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10275	Huile&Graisse&liquide frein	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10276	Huile&Graisse&liquide frein	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10277	Huile&Graisse&liquide frein	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10278	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10279	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10280	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10281	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10282	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10283	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10284	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10285	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10286	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10287	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10288	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10289	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10290	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10291	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10292	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10293	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10294	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10295	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10296	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10297	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10298	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10299	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10300	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10301	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10302	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10303	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10304	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10305	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10306	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10307	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10308	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10309	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10310	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10311	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10312	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10313	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10314	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10315	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10316	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10317	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10318	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10319	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10320	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10321	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10322	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10323	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10324	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10325	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10326	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10327	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10328	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10329	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10330	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10331	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10332	Huile&Graisse&liquide frein	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10333	Huile&Graisse&liquide frein	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
10334	Huile&Graisse&liquide frein	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
10335	Huile&Graisse&liquide frein	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
10336	Huile&Graisse&liquide frein	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
10337	Huile&Graisse&liquide frein	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
10338	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10339	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10340	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10341	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10342	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10343	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10344	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10345	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10346	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10347	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10348	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10349	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10350	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10351	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10352	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10353	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10354	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10355	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10356	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10357	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10358	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10359	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10360	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10361	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10362	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10363	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10364	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10365	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10366	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10367	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10368	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10369	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10370	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10371	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10372	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10373	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10374	Huile&Graisse&liquide frein	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
10375	Huile&Graisse&liquide frein	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
10376	Huile&Graisse&liquide frein	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
10377	Huile&Graisse&liquide frein	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
10378	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10379	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10380	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10381	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10382	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10383	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10384	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10385	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10386	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10387	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10388	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10389	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10390	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10391	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10392	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10393	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10394	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10395	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10396	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10397	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10398	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10399	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10400	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10401	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10402	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10403	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10404	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10405	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10406	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10407	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10408	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10409	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10410	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10411	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10412	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10413	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10414	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10415	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10416	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10417	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10418	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10419	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10420	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10421	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10422	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10423	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10424	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10425	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10426	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10427	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10428	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10429	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10430	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10431	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10432	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10433	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10434	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10435	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10436	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10437	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10438	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10439	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10440	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10441	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10442	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10443	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10444	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10445	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10446	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10447	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10448	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10449	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10450	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10451	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10452	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10453	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10454	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10455	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10456	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10457	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10458	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10459	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10460	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10461	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10462	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10463	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10464	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10465	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10466	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10467	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10468	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10469	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10470	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10471	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10472	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10473	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10474	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10475	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10476	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10477	Huile&Graisse&liquide frein	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
10478	Huile&Graisse&liquide frein	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
10479	Huile&Graisse&liquide frein	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
10480	Huile&Graisse&liquide frein	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
10481	Huile&Graisse&liquide frein	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
10482	Huile&Graisse&liquide frein	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
10483	Huile&Graisse&liquide frein	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
10484	Huile&Graisse&liquide frein	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
10485	Huile&Graisse&liquide frein	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
10486	Huile&Graisse&liquide frein	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
10487	Huile&Graisse&liquide frein	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
10488	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10489	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10490	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10491	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10492	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10493	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10494	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10495	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10496	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10497	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10498	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10499	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10500	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10501	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10502	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10503	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10504	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10505	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10506	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10507	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10508	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10509	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10510	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10511	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10512	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10513	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10674	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10514	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10515	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10516	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10517	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10518	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10519	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10520	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10521	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10522	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10523	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10524	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10525	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10526	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10527	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10528	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10529	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10530	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10531	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10532	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10533	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10534	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10535	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10536	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10537	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10538	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10539	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10540	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10541	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10542	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10543	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10544	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10545	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10546	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10547	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10548	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10549	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10550	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10551	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10552	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10553	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10554	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10555	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10556	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10557	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10558	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10559	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10560	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10561	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10562	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10563	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10564	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10565	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10566	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10567	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10568	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10569	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10570	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10571	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10572	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10573	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10574	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10575	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10576	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10577	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10578	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10579	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10580	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10581	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10582	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10583	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10584	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10585	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10586	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10587	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10588	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10589	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10590	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10591	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10592	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10593	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10594	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10595	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10596	Recuit & pointe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
10597	Recuit & pointe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
10598	Recuit & pointe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
10599	Recuit & pointe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
10600	Recuit & pointe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
10601	Recuit & pointe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
10602	Recuit & pointe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
10603	Recuit & pointe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
10604	Recuit & pointe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
10605	Recuit & pointe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
10606	Recuit & pointe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
10607	Recuit & pointe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
10608	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10609	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10610	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10611	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10612	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10613	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10614	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10615	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10616	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10617	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10618	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10619	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10620	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10621	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10622	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10623	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10624	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10625	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10626	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10627	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10628	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10629	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10630	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10631	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10632	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10633	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10634	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10635	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10636	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10637	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10638	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10639	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10640	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10641	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10642	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10643	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10644	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10645	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10646	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10647	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10648	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10649	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10650	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10651	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10652	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10653	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10654	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10655	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10656	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10657	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10658	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10659	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10660	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10661	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10662	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10663	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10664	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10665	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10666	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10667	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10668	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10669	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10670	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10671	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10672	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10673	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10675	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10676	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10677	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10678	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10679	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10680	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10681	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10682	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10683	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10684	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10685	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10686	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10687	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10688	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10689	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10690	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10691	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10692	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10693	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10694	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10695	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10696	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10697	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10698	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10699	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10700	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10701	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10702	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10703	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10704	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10705	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10706	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10707	Recuit & pointe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
10708	Recuit & pointe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
10709	Recuit & pointe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
10710	Recuit & pointe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
10711	Recuit & pointe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
10712	Recuit & pointe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
10713	Recuit & pointe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
10714	Recuit & pointe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
10715	Recuit & pointe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
10716	Recuit & pointe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
10717	Recuit & pointe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
10718	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10719	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10720	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10721	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10722	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10723	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10724	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10725	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10726	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10727	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10728	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10729	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10730	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10731	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10732	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10733	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10734	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10735	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10736	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10737	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10738	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10739	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10740	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10741	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10742	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10743	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10744	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10745	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10746	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10747	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10748	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10749	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10750	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10751	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10752	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10753	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10754	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10755	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10756	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10757	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10758	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10759	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10760	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10761	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10762	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10763	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10764	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10765	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10766	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10767	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10768	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10769	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10770	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10771	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10772	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10773	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10774	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10775	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10776	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10777	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10778	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10779	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10780	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10781	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10782	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10783	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10784	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10785	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10786	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10787	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10788	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10789	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10790	Recuit & pointe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
10791	Recuit & pointe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
10792	Recuit & pointe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
10793	Recuit & pointe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
10794	Recuit & pointe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
10795	Recuit & pointe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
10796	Recuit & pointe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
10797	Recuit & pointe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
10798	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10799	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10800	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10801	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10802	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10803	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10804	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10805	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10806	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10807	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10808	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10809	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10810	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10811	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10812	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10813	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10814	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10815	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10816	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10817	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10818	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10819	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10820	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10821	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10822	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10823	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10824	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10825	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10826	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10827	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10828	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10829	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10830	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10831	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10832	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10833	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10834	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10835	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10836	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10837	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10838	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10839	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10840	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10841	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10842	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10843	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10844	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10845	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10846	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10847	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10848	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10849	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10850	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10851	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10852	Recuit & pointe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
10853	Recuit & pointe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
10854	Recuit & pointe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
10855	Recuit & pointe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
10856	Recuit & pointe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
10857	Recuit & pointe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
10858	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10859	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10860	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10861	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10862	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10863	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10864	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10865	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10866	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10867	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10868	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10869	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10870	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10871	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10872	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10873	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10874	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10875	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10876	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10877	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10878	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10879	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10880	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10881	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10882	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10883	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10884	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10885	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10886	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10887	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10888	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10889	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10890	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10891	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10892	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10893	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10894	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10895	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10896	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10897	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10898	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10899	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10900	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10901	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10902	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10903	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10904	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10905	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10906	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10907	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10908	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10909	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10910	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10911	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10912	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10913	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10914	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10915	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10916	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10917	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10918	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10919	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10920	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10921	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10922	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10923	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10924	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10925	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10926	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10927	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10928	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10929	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10930	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10931	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10932	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10933	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10934	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10935	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10936	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10937	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10938	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10939	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10940	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10941	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10942	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10943	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10944	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10945	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10946	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10947	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10948	Recuit & pointe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
10949	Recuit & pointe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
10950	Recuit & pointe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
10951	Recuit & pointe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
10952	Recuit & pointe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
10953	Recuit & pointe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
10954	Recuit & pointe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
10955	Recuit & pointe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
10956	Recuit & pointe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10957	Recuit & pointe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
10958	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10959	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10960	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10961	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10962	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10963	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10964	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10965	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10966	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10967	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10968	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10969	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10970	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10971	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10972	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10973	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10974	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10975	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10976	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10977	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10978	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10979	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10980	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10981	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10982	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10983	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10984	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10985	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10986	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10987	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10988	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10989	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10990	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10991	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10992	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10993	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10994	Recuit & pointe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
10995	Recuit & pointe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
10996	Recuit & pointe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
10997	Recuit & pointe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
10998	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
10999	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11000	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11001	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11002	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11003	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11004	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11005	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11006	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11007	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11008	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11009	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11010	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11011	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11012	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11013	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11014	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11015	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11016	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11017	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11018	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11019	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11020	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11021	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11022	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11023	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11024	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11025	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11026	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11027	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11028	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11029	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11030	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11031	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11032	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11033	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11034	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11035	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11036	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11037	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11038	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11039	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11040	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11041	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11042	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11043	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11044	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11045	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11046	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11047	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11048	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11049	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11050	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11051	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11052	Recuit & pointe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11053	Recuit & pointe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11054	Recuit & pointe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11055	Recuit & pointe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11056	Recuit & pointe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11057	Recuit & pointe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11058	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11059	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11060	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11061	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11062	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11063	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11064	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11065	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11066	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11067	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11068	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11069	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11070	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11071	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11072	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11073	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11074	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11075	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11076	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11077	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11078	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11079	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11080	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11081	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11082	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11083	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11084	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11085	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11086	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11087	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11088	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11089	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11090	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11091	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11092	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11093	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11094	Recuit & pointe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11095	Recuit & pointe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11096	Recuit & pointe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11097	Recuit & pointe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11098	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11099	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11100	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11101	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11102	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11103	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11104	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11105	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11106	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11107	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11108	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11109	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11110	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11111	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11112	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11113	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11114	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11115	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11116	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11117	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11118	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11119	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11120	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11121	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11122	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11123	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11124	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11125	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11126	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11127	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11128	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11129	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11130	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11131	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11132	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11133	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11134	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11135	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11136	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11137	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11138	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11139	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11140	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11141	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11142	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11143	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11144	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11145	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11146	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11147	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11148	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11149	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11150	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11151	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11152	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11153	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11154	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11155	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11156	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11157	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11158	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11159	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11160	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11161	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11162	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11163	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11164	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11165	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11166	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11167	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11168	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11169	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11170	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11171	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11172	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11173	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11174	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11175	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11176	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11177	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11178	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11179	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11180	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11181	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11182	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11183	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11184	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11185	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11186	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11187	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11188	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11189	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11190	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11191	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11192	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11193	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11194	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11195	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11196	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11197	Recuit & pointe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11198	Recuit & pointe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11199	Recuit & pointe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11200	Recuit & pointe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11201	Recuit & pointe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11202	Recuit & pointe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11203	Recuit & pointe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11204	Recuit & pointe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11205	Recuit & pointe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11206	Recuit & pointe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11207	Recuit & pointe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11208	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11209	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11210	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11211	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11212	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11213	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11214	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11215	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11216	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11217	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11218	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11219	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11220	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11221	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11222	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11223	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11224	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11225	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11226	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11227	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11228	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11229	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11230	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11231	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11232	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11233	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11234	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11235	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11236	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11237	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11238	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11239	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11240	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11241	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11242	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11243	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11244	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11245	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11246	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11247	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11248	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11249	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11250	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11251	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11252	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11253	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11254	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11255	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11256	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11257	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11258	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11259	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11260	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11261	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11262	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11263	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11264	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11265	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11266	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11267	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11268	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11269	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11270	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11271	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11272	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11273	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11274	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11275	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11276	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11277	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11278	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11279	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11280	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11281	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11282	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11283	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11284	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11285	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11286	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11287	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11288	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11289	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11290	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11291	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11292	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11293	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11294	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11295	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11296	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11297	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11298	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11299	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11300	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11301	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11302	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11303	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11304	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11305	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11306	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11307	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11308	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11309	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11310	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11311	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11312	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11313	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11314	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11315	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11316	Mastic et bombe	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11317	Mastic et bombe	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11318	Mastic et bombe	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11319	Mastic et bombe	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11320	Mastic et bombe	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11321	Mastic et bombe	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11322	Mastic et bombe	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11323	Mastic et bombe	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11324	Mastic et bombe	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11325	Mastic et bombe	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11326	Mastic et bombe	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11327	Mastic et bombe	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11328	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11329	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11330	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11331	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11332	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11333	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11334	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11335	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11336	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11337	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11338	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11339	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11340	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11341	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11342	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11343	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11344	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11345	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11346	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11347	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11348	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11349	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11350	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11351	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11352	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11353	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11354	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11355	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11356	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11357	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11358	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11359	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11360	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11361	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11362	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11363	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11364	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11365	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11366	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11367	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11368	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11369	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11370	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11371	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11372	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11373	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11374	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11375	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11376	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11377	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11378	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11379	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11380	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11381	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11382	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11383	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11384	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11385	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11386	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11387	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11388	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11389	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11390	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11391	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11392	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11393	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11394	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11395	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11396	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11397	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11398	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11399	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11400	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11401	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11402	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11403	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11404	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11405	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11406	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11407	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11408	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11409	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11410	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11411	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11412	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11413	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11414	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11415	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11416	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11417	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11418	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11419	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11420	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11421	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11422	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11423	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11424	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11425	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11426	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11427	Mastic et bombe	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11428	Mastic et bombe	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
11429	Mastic et bombe	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
11430	Mastic et bombe	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
11431	Mastic et bombe	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
11432	Mastic et bombe	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
11433	Mastic et bombe	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
11434	Mastic et bombe	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
11435	Mastic et bombe	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
11436	Mastic et bombe	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
11437	Mastic et bombe	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
11438	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11439	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11440	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11441	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11442	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11443	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11444	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11445	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11446	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11447	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11448	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11449	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11450	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11451	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11452	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11453	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11454	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11455	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11456	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11457	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11458	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11459	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11460	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11461	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11462	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11463	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11464	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11465	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11466	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11467	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11468	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11469	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11470	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11471	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11472	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11473	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11474	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11475	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11476	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11477	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11478	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11479	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11480	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11481	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11482	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11483	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11484	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11485	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11486	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11487	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11488	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11489	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11490	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11491	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11492	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11493	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11494	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11495	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11496	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11497	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11498	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11499	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11500	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11501	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11502	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11503	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11504	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11505	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11506	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11507	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11508	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11509	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11510	Mastic et bombe	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
11511	Mastic et bombe	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
11512	Mastic et bombe	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
11513	Mastic et bombe	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
11514	Mastic et bombe	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
11515	Mastic et bombe	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
11516	Mastic et bombe	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
11517	Mastic et bombe	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
11518	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11519	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11520	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11521	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11522	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11523	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11524	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11525	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11526	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11527	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11528	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11529	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11530	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11531	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11532	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11533	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11534	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11535	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11536	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11537	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11538	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11539	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11540	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11541	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11542	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11543	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11544	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11545	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11546	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11547	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11548	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11549	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11550	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11551	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11552	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11553	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11554	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11555	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11556	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11557	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11558	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11559	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11560	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11561	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11562	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11563	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11564	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11565	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11566	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11567	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11568	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11569	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11570	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11571	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11572	Mastic et bombe	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
11573	Mastic et bombe	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
11574	Mastic et bombe	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
11575	Mastic et bombe	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
11576	Mastic et bombe	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
11577	Mastic et bombe	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
11578	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11579	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11580	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11581	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11582	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11583	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11584	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11585	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11586	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11587	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11588	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11589	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11590	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11591	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11592	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11593	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11594	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11595	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11596	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11597	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11598	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11599	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11600	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11601	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11602	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11603	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11604	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11605	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11606	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11607	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11608	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11609	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11610	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11611	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11612	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11613	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11614	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11615	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11616	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11617	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11618	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11619	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11620	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11621	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11622	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11623	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11624	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11625	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11626	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11627	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11628	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11629	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11630	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11631	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11632	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11633	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11634	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11635	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11636	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11637	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11638	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11639	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11640	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11641	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11642	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11643	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11644	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11645	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11646	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11647	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11648	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11649	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11650	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11651	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11652	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11653	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11654	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11655	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11656	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11657	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11658	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11659	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11660	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11661	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11662	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11663	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11664	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11665	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11666	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11667	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11668	Mastic et bombe	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
11669	Mastic et bombe	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
11670	Mastic et bombe	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
11671	Mastic et bombe	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
11672	Mastic et bombe	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
11673	Mastic et bombe	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
11674	Mastic et bombe	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
11675	Mastic et bombe	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
11676	Mastic et bombe	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11677	Mastic et bombe	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
11678	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11679	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11680	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11681	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11682	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11683	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11684	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11685	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11686	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11687	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11688	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11689	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11690	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11691	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11692	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11693	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11694	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11695	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11696	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11697	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11698	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11699	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11700	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11701	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11702	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11703	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11704	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11705	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11706	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11707	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11708	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11709	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11710	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11711	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11712	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11713	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11714	Mastic et bombe	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
11715	Mastic et bombe	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
11716	Mastic et bombe	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
11717	Mastic et bombe	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
11718	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11719	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11720	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11721	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11722	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11723	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11724	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11725	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11726	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11727	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11728	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11729	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11730	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11731	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11732	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11733	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11734	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11735	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11736	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11737	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11738	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11739	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11740	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11741	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11742	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11743	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11744	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11745	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11746	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11747	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11748	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11749	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11750	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11751	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11752	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11753	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11754	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11755	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11756	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11757	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11758	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11759	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11760	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11761	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11762	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11763	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11764	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11765	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11766	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11767	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11768	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11769	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11770	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11771	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11772	Mastic et bombe	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
11773	Mastic et bombe	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
11774	Mastic et bombe	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
11775	Mastic et bombe	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
11776	Mastic et bombe	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
11777	Mastic et bombe	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
11778	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11779	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11780	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11781	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11782	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11783	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11784	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11785	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11786	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11787	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11788	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11789	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11790	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11791	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11792	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11793	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11794	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11795	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11796	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11797	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11798	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11799	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11800	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11801	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11802	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11803	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11804	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11805	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11806	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11807	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11808	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11809	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11810	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11811	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11812	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11813	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11814	Mastic et bombe	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
11815	Mastic et bombe	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
11816	Mastic et bombe	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
11817	Mastic et bombe	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
11818	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11819	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11820	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11821	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11822	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11823	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11824	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11825	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11826	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11827	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11828	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11829	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11830	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11831	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11832	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11833	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11834	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11835	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11836	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11837	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11838	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11839	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11840	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11841	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11842	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11843	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11844	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11845	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11846	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11847	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11848	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11849	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11850	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11851	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11852	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11853	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11854	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11855	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11856	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11857	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11858	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11859	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11860	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11861	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11862	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11863	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11864	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11865	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11866	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11867	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11868	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11869	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11870	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11871	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11872	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11873	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11874	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11875	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11876	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11877	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11878	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11879	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11880	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11881	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11882	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11883	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11884	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11885	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11886	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11887	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11888	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11889	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11890	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11891	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11892	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11893	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11894	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11895	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11896	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11897	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11898	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11899	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11900	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11901	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11902	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11903	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11904	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11905	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11906	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11907	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11908	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11909	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11910	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11911	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11912	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11913	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11914	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11915	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11916	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11917	Mastic et bombe	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
11918	Mastic et bombe	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
11919	Mastic et bombe	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
11920	Mastic et bombe	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
11921	Mastic et bombe	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
11922	Mastic et bombe	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
11923	Mastic et bombe	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
11924	Mastic et bombe	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
11925	Mastic et bombe	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
11926	Mastic et bombe	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
11927	Mastic et bombe	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
11928	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11929	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11930	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11931	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11932	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11933	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11934	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11935	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11936	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11937	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11938	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11939	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11940	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11941	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11942	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11943	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11944	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11945	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11946	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11947	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11948	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11949	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11950	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11951	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11952	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11953	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11954	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11955	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11956	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11957	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11958	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11959	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11960	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11961	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11962	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11963	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11964	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11965	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11966	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11967	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11968	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11969	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11970	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11971	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11972	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11973	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11974	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11975	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
11976	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11977	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11978	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11979	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11980	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11981	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11982	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11983	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11984	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11985	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11986	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11987	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12059	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
11988	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
11989	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
11990	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
11991	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
11992	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
11993	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
11994	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
11995	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
11996	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
11997	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
11998	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
11999	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12000	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12001	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12002	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12003	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12004	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12005	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12006	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12007	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12008	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12009	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12010	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12011	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12012	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12013	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12014	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12015	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12016	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12017	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12018	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12019	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12020	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12021	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12022	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12023	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12024	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12025	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12026	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12027	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12028	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12029	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12030	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12031	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12032	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12033	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12034	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12035	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12036	Peinture à l'eau et teinte	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12037	Peinture à l'eau et teinte	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12038	Peinture à l'eau et teinte	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12039	Peinture à l'eau et teinte	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12040	Peinture à l'eau et teinte	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12041	Peinture à l'eau et teinte	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12042	Peinture à l'eau et teinte	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12043	Peinture à l'eau et teinte	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12044	Peinture à l'eau et teinte	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12045	Peinture à l'eau et teinte	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12046	Peinture à l'eau et teinte	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12047	Peinture à l'eau et teinte	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12048	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12049	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12050	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12051	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12052	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12053	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12054	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12055	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12056	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12057	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12058	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12060	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12061	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12062	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12063	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12064	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12065	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12066	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12067	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12068	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12069	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12070	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12071	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12072	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12073	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12074	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12075	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12076	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12077	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12078	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12079	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12080	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12081	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12082	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12083	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12084	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12085	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12086	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12087	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12088	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12089	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12090	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12091	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12092	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12093	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12094	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12095	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12096	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12097	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12098	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12099	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12100	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12101	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12102	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12103	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12104	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12105	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12106	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12107	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12108	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12109	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12110	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12111	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12112	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12113	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12114	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12115	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12116	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12117	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12118	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12119	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12120	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12121	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12122	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12123	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12124	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12125	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12126	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12127	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12128	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12129	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12130	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12131	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12132	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12133	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12134	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12135	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12136	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12137	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12138	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12139	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12140	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12141	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12142	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12143	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12144	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12145	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12146	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12147	Peinture à l'eau et teinte	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12148	Peinture à l'eau et teinte	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12149	Peinture à l'eau et teinte	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12150	Peinture à l'eau et teinte	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12151	Peinture à l'eau et teinte	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12152	Peinture à l'eau et teinte	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12153	Peinture à l'eau et teinte	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12154	Peinture à l'eau et teinte	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12155	Peinture à l'eau et teinte	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12156	Peinture à l'eau et teinte	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12157	Peinture à l'eau et teinte	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12158	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12159	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12160	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12161	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12162	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12163	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12164	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12165	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12166	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12167	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12168	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12169	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12170	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12171	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12172	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12173	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12174	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12175	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12176	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12177	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12178	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12179	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12180	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12181	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12182	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12183	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12184	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12185	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12186	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12187	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12188	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12189	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12190	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12191	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12192	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12193	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12194	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12195	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12196	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12197	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12198	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12199	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12200	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12201	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12202	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12203	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12204	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12205	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12206	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12207	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12208	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12209	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12210	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12211	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12212	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12213	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12214	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12215	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12216	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12217	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12218	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12219	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12220	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12221	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12222	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12223	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12224	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12225	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12226	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12227	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12228	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12229	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12230	Peinture à l'eau et teinte	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12231	Peinture à l'eau et teinte	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12232	Peinture à l'eau et teinte	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12233	Peinture à l'eau et teinte	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12234	Peinture à l'eau et teinte	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12235	Peinture à l'eau et teinte	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12236	Peinture à l'eau et teinte	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12237	Peinture à l'eau et teinte	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12238	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12239	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12240	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12241	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12242	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12243	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12244	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12245	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12246	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12247	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12248	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12249	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12250	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12251	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12252	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12253	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12254	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12255	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12256	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12257	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12258	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12259	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12260	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12261	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12262	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12263	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12264	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12265	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12266	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12267	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12268	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12269	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12270	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12271	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12272	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12273	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12274	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12275	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12276	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12277	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12278	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12279	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12280	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12281	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12282	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12283	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12284	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12285	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12286	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12287	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12288	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12289	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12290	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12291	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12292	Peinture à l'eau et teinte	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12293	Peinture à l'eau et teinte	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12294	Peinture à l'eau et teinte	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12295	Peinture à l'eau et teinte	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12296	Peinture à l'eau et teinte	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12297	Peinture à l'eau et teinte	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12298	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12299	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12300	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12301	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12302	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12303	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12304	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12305	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12306	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12307	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12308	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12309	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12310	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12311	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12312	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12313	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12314	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12315	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12316	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12317	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12318	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12319	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12320	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12321	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12322	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12323	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12324	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12325	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12326	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12327	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12328	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12329	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12330	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12331	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12332	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12333	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12334	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12335	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12336	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12337	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12338	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12339	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12340	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12341	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12342	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12343	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12344	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12345	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12346	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12347	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12348	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12349	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12350	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12351	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12352	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12353	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12354	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12355	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12356	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12357	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12358	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12434	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12359	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12360	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12361	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12362	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12363	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12364	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12365	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12366	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12367	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12368	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12369	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12370	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12371	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12372	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12373	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12374	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12375	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12376	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12377	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12378	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12379	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12380	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12381	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12382	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12383	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12384	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12385	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12386	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12387	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12388	Peinture à l'eau et teinte	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
12389	Peinture à l'eau et teinte	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
12390	Peinture à l'eau et teinte	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
12391	Peinture à l'eau et teinte	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
12392	Peinture à l'eau et teinte	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
12393	Peinture à l'eau et teinte	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
12394	Peinture à l'eau et teinte	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
12395	Peinture à l'eau et teinte	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
12396	Peinture à l'eau et teinte	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12397	Peinture à l'eau et teinte	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
12398	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12399	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12400	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12401	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12402	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12403	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12404	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12405	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12406	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12407	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12408	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12409	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12410	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12411	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12412	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12413	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12414	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12415	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12416	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12417	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12418	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12419	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12420	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12421	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12422	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12423	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12424	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12425	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12426	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12427	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12428	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12429	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12430	Peinture à l'eau et teinte	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
12431	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12432	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12433	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12435	Peinture à l'eau et teinte	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
12436	Peinture à l'eau et teinte	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
12437	Peinture à l'eau et teinte	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
12438	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12439	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12440	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12441	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12442	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12443	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12444	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12445	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12446	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12447	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12448	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12449	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12450	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12451	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12452	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12453	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12454	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12455	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12456	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12457	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12458	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12459	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12460	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12461	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12462	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12463	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12464	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12465	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12466	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12467	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12468	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12469	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12470	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12471	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12472	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12473	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12474	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12475	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12476	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12477	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12478	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12479	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12480	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12481	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12482	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12483	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12484	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12485	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12486	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12487	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12488	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12489	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12490	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12491	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12492	Peinture à l'eau et teinte	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
12493	Peinture à l'eau et teinte	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
12494	Peinture à l'eau et teinte	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
12495	Peinture à l'eau et teinte	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
12496	Peinture à l'eau et teinte	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
12497	Peinture à l'eau et teinte	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
12498	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12499	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12500	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12501	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12502	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12503	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12504	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12505	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12506	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12507	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12508	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12509	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12510	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12511	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12512	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12513	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12514	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12515	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12516	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12517	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12518	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12519	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12520	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12521	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12522	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12523	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12524	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12525	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12526	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12527	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12528	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12529	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12530	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12531	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12532	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12533	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12534	Peinture à l'eau et teinte	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
12535	Peinture à l'eau et teinte	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
12536	Peinture à l'eau et teinte	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
12537	Peinture à l'eau et teinte	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
12538	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12539	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12540	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12541	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12542	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12543	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12544	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12545	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12546	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12547	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12548	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12549	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12550	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12551	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12552	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12553	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12554	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12555	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12556	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12557	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12558	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12559	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12560	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12561	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12562	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12563	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12564	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12565	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12566	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12567	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12568	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12569	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12570	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12571	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12572	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12573	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12574	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12575	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12576	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12577	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12578	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12579	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12580	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12581	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12582	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12583	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12584	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12585	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12586	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12587	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12588	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12589	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12590	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12591	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12592	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12593	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12594	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12595	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12596	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12597	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12598	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12599	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12600	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12601	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12602	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12603	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12604	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12605	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12606	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12607	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12608	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12609	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12610	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12611	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12612	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12613	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12614	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12615	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12616	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12617	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12618	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12619	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12620	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12621	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12622	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12623	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12624	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12625	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12626	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12627	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12628	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12629	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12630	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12631	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12632	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12633	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12634	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12635	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12636	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12637	Peinture à l'eau et teinte	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
12638	Peinture à l'eau et teinte	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
12639	Peinture à l'eau et teinte	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
12640	Peinture à l'eau et teinte	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
12641	Peinture à l'eau et teinte	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
12642	Peinture à l'eau et teinte	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
12643	Peinture à l'eau et teinte	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
12644	Peinture à l'eau et teinte	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
12645	Peinture à l'eau et teinte	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
12646	Peinture à l'eau et teinte	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
12647	Peinture à l'eau et teinte	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
12648	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12650	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12651	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12652	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12653	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12654	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12655	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12656	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12657	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12658	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12659	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12660	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12661	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12662	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12663	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12664	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12665	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12666	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12667	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12668	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12669	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12670	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12671	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12672	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12673	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12674	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12675	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12676	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12677	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12678	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12679	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12680	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12681	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12682	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12683	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12684	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12685	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12686	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12687	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12688	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12689	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12690	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12691	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12692	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12693	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12694	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12695	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12696	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12697	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12698	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12699	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12700	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12701	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12702	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12703	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12704	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12705	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12706	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12707	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12708	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12709	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12710	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12711	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12712	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12713	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12714	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12715	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12716	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12717	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12718	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12719	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12720	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12721	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12722	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12723	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12724	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12725	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12726	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12727	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12728	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12729	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12730	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12731	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12732	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12733	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12734	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12735	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12736	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12737	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12738	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12739	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12740	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12741	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12742	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12743	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12744	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12745	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12746	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12747	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12748	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12749	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12750	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12751	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12752	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12753	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12754	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12755	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12756	Ciment et fer	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	\N
12757	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	\N
12758	Ciment et fer	Tôle Alu 0,14	3m	Feuille	25400.00	24400.00	24400.00	23400.00	\N
12759	Ciment et fer	Tôle Alu 0,18	2m	Feuille	22100.00	21100.00	21100.00	20400.00	\N
12760	Ciment et fer	Tôle Alu 0,18	2,5m	Feuille	27300.00	26300.00	26300.00	25300.00	\N
12761	Ciment et fer	Tôle Alu 0,18	3m	Feuille	32300.00	31300.00	31300.00	30300.00	\N
12762	Ciment et fer	Tôle Alu 0,20	2m	Feuille	24400.00	23400.00	23400.00	22400.00	\N
12763	Ciment et fer	Tôle Alu 0,20	2,5m	Feuille	30200.00	29200.00	29200.00	28200.00	\N
12764	Ciment et fer	Tôle Alu 0,20	3m	Feuille	35700.00	34700.00	34700.00	33700.00	\N
12765	Ciment et fer	Tôle Alu 0,25	2m	Feuille	28800.00	27800.00	27800.00	26800.00	\N
12766	Ciment et fer	Tôle Alu 0,25	2,5m	Feuille	35500.00	34500.00	34500.00	33500.00	\N
12767	Ciment et fer	Tôle Alu 0,25	3m	Feuille	42200.00	41200.00	41200.00	40200.00	\N
12768	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12769	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12770	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12771	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12772	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12773	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12774	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12775	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12776	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12777	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12778	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12779	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12780	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12781	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12782	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12783	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12784	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12785	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12786	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12787	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12788	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12789	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12790	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12791	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12792	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12793	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12794	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12795	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12796	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12797	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12798	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12799	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12800	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12801	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12802	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12803	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12804	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12805	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12806	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12807	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12808	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12809	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12810	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12811	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12812	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12813	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12814	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12815	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12816	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12817	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12818	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12819	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12820	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12821	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12822	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12823	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12824	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12825	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12826	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12827	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12828	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12829	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12830	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12831	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12832	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12833	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12834	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12835	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12836	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12837	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12838	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12839	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12840	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12841	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12842	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12843	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12844	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12845	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12846	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12847	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12848	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12849	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12850	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12851	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12852	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12853	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12854	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12855	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12856	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12857	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12858	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12859	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12860	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12861	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12862	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12863	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12864	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12865	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12866	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12867	Ciment et fer	Pinceaux 	1"	Pièce	1000.00	1000.00	800.00	600.00	\N
12868	Ciment et fer	Pinceaux 	1/2"	Pièce	1500.00	1500.00	1200.00	1000.00	\N
12869	Ciment et fer	Pinceaux 	2"	Pièce	2000.00	2000.00	16000.00	1300.00	\N
12870	Ciment et fer	Pinceaux 	5/2"	Pièce	2500.00	2500.00	2000.00	1800.00	\N
12871	Ciment et fer	Pinceaux 	3"	Pièce	3000.00	3000.00	2500.00	2000.00	\N
12872	Ciment et fer	Pinceaux 	7/2"	Pièce	3500.00	3500.00	3000.00	2500.00	\N
12873	Ciment et fer	Rouleaux	4"	Pièce	3500.00	3000.00	2800.00	2500.00	\N
12874	Ciment et fer	Rouleaux	5"	Pièce	4000.00	3500.00	3000.00	2800.00	\N
12875	Ciment et fer	Rouleaux	7"	Pièce	5500.00	5000.00	4800.00	4200.00	\N
12876	Ciment et fer	Rouleaux	9"	Pièce	6500.00	6000.00	5800.00	5500.00	\N
12877	Ciment et fer	Rouleaux	10"	Pièce	7500.00	7000.00	6800.00	6000.00	\N
12878	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12879	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12880	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12881	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12882	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12883	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12884	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12885	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12886	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12887	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12888	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12889	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12890	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12891	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12892	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12893	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12894	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12895	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12896	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12897	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12898	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12899	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12900	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12901	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12902	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12903	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12904	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12905	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12906	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12907	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12908	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12909	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12910	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12911	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12912	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12913	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12914	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12915	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12916	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12917	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12918	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12919	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12920	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12921	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12922	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12923	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12924	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12925	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12926	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12927	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12928	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12929	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12930	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12931	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12932	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12933	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12934	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12935	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12936	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12937	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12938	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12939	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12940	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12941	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12942	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12943	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12944	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12945	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12946	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12947	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12948	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12949	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12950	Ciment et fer	Diluante 	416	Tube	12000.00	12000.00	11500.00	11000.00	\N
12951	Ciment et fer	Diluante 	700	Tube	11000.00	11000.00	10500.00	10000.00	\N
12952	Ciment et fer	White spirit	Blanc	1L	4500.00	4000.00	3600.00	3200.00	\N
12953	Ciment et fer	White spirit	Blanc	1/2l	2500.00	2500.00	2000.00	1700.00	\N
12954	Ciment et fer	White spirit	Blanc	1/4l	1800.00	1500.00	1300.00	1200.00	\N
12955	Ciment et fer	White spirit	Rouge	1l	4000.00	3500.00	3500.00	3000.00	\N
12956	Ciment et fer	White spirit	Rouge	1/2l	2000.00	2000.00	1800.00	1600.00	\N
12957	Ciment et fer	White spirit	Rouge	1/4l	1500.00	1500.00	1300.00	1100.00	\N
12958	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12959	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12960	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12961	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12962	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12963	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12964	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12965	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12966	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12967	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12968	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12969	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12970	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12971	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12972	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12973	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12974	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12975	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12976	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12977	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12978	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12979	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12980	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12981	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12982	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12983	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12984	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12985	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12986	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12987	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12988	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12989	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12990	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12991	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12992	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12993	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
12994	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
12995	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
12996	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
12997	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
12998	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
12999	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
13000	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
13001	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
13002	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
13003	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
13004	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
13005	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
13006	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
13007	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
13008	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
13009	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
13010	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
13011	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
13012	Ciment et fer	Glycero	NaN	Boite 250g	7000.00	6500.00	6200.00	6000.00	\N
13013	Ciment et fer	Kapci	NaN	Boite 1kg	22000.00	21500.00	21200.00	21000.00	\N
13014	Ciment et fer	Batilac	Blanc	Boite 1kg	20000.00	19000.00	17000.00	16000.00	\N
13015	Ciment et fer	Batilac	couleur	Boite 1kg	19000.00	18500.00	16500.00	15500.00	\N
13016	Ciment et fer	Anti-rouille	Egycoat	Boite 1kg	14000.00	14000.00	13500.00	13000.00	\N
13017	Ciment et fer	Anti-rouille	Golden	boite 1kg	18000.00	16000.00	15500.00	14500.00	\N
13018	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13019	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13020	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13021	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13022	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13023	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13024	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13025	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13026	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13027	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13028	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13029	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13030	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13031	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13032	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13033	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13034	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13035	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13036	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13037	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13038	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13039	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13040	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13041	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13042	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13043	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13044	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13045	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13046	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13047	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13048	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13049	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13050	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13051	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13052	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13053	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13054	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13055	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13056	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13057	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13058	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13059	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13060	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13061	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13062	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13063	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13064	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13065	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13066	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13067	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13068	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13069	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13070	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13071	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13072	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13073	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13074	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13075	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13076	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13077	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13078	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13079	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13080	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13081	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13082	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13083	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13084	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13085	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13086	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13087	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13088	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13089	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13090	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13091	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13092	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13093	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13094	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13095	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13096	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13097	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13098	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13099	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13100	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13101	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13102	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13103	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13104	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13105	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13106	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13107	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13108	Ciment et fer	Huile 40	Elite	bidon	52000.00	52000.00	51000.00	50000.00	\N
13109	Ciment et fer	Huile 40	Select	bidon	54000.00	54000.00	53000.00	51500.00	\N
13110	Ciment et fer	Huile 90	Elite	bidon	70000.00	70000.00	69000.00	65000.00	\N
13111	Ciment et fer	Huile 140	Elite	bidon	79000.00	79000.00	78000.00	75000.00	\N
13112	Ciment et fer	Huile ATF	Boss	bidon	13000.00	13000.00	12500.00	12000.00	\N
13113	Ciment et fer	Huile ATF	Euro	bidon	13000.00	13000.00	12500.00	12000.00	\N
13114	Ciment et fer	Graisse	Boss	Boite	18000.00	18000.00	17500.00	16500.00	\N
13115	Ciment et fer	Graisse	Euro	Boite	17000.00	17000.00	16500.00	15500.00	\N
13116	Ciment et fer	Liquide 55	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13117	Ciment et fer	Liquide E5	NaN	Boite	11000.00	10000.00	9500.00	9000.00	\N
13118	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13119	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13120	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13121	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13122	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13123	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13124	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13125	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13126	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13127	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13128	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13129	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13130	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13131	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13132	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13133	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13134	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13135	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13136	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13137	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13138	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13139	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13140	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13141	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13142	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13143	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13144	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13145	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13146	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13147	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13148	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13149	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13150	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13151	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13152	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13153	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13154	Ciment et fer	Recuit	NaN	kg	10000.00	9000.00	9000.00	6500.00	\N
13155	Ciment et fer	Pointe	tête plate	kg	8000.00	7000.00	6500.00	5400.00	\N
13156	Ciment et fer	Pointe 	tôle	kg	10000.00	9000.00	9000.00	7800.00	\N
13157	Ciment et fer	Pointe 	tête d'homme	kg	12000.00	12000.00	12000.00	9000.00	\N
13158	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13159	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13160	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13161	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13162	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13163	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13164	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13165	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13166	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13167	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13168	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13169	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13170	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13171	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13172	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13173	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13174	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13175	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13176	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13177	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13178	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13179	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13180	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13181	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13182	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13183	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13184	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13185	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13186	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13187	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13188	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13189	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13190	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13191	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13192	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13193	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13194	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13195	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13196	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13197	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13198	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13199	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13200	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13201	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13202	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13203	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13204	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13205	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13206	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13207	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13208	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13209	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13210	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13211	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13212	Ciment et fer	Mastic KAPCI	1kg	boite	25000.00	25000.00	24500.00	23500.00	\N
13213	Ciment et fer	Mastic KAPCI	2kg	boite	34000.00	34000.00	33600.00	32000.00	\N
13214	Ciment et fer	Fibre	1kg	boite	28000.00	28000.00	28000.00	26500.00	\N
13215	Ciment et fer	Après	1kg	boite	23000.00	23000.00	23000.00	22000.00	\N
13216	Ciment et fer	Bombe	Freder	tube	5500.00	5500.00	5500.00	5000.00	\N
13217	Ciment et fer	Bombe	Spray Paint	tube	7500.00	7500.00	7500.00	6000.00	\N
13218	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13219	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13220	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13221	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13222	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13223	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13224	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13225	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13226	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13227	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13228	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13229	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13230	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13231	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13232	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13233	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13234	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13235	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13236	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13237	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13238	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13239	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13240	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13241	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13242	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13243	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13244	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13245	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13246	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13247	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13248	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13249	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13250	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13251	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13252	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13253	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13254	Ciment et fer	3F1 Color	4kg	boite	17000.00	16000.00	13000.00	10600.00	\N
13255	Ciment et fer	3F1 Color	10kg	boite	27000.00	26000.00	24500.00	23200.00	\N
13256	Ciment et fer	3F1 Color	30kg	boite	47000.00	46000.00	44000.00	41300.00	\N
13257	Ciment et fer	Teinte	Uniteinte 	flacon	3000.00	3000.00	2800.00	2500.00	\N
13258	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13259	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13260	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13261	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13262	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13263	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13264	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13265	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13266	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13267	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13268	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13269	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13270	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13271	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13272	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13273	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13274	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13275	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13276	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13277	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13278	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13279	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13280	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13281	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13282	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13283	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13284	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13285	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13286	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13287	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13288	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13289	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13290	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13291	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13292	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13293	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13294	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13295	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13296	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13297	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13298	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13299	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13300	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13301	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13302	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13303	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13304	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13305	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13306	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13307	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13308	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13309	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13310	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13311	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13312	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13313	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13314	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13315	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13316	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13317	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13318	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13319	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13320	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13321	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13322	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13323	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13324	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13325	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13326	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13327	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13328	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13329	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13330	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13331	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13332	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13333	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13334	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13335	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13336	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13337	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13338	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13339	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13340	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13341	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13342	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13343	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13344	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13345	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13346	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13347	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13348	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13349	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13350	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13351	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13352	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13353	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13354	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13355	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13356	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13357	Ciment et fer	Ciment 	LOVA	Sac	33000.00	33000.00	32800.00	32600.00	\N
13358	Ciment et fer	Ciment 	Orimbato	Sac	37500.00	37500.00	37200.00	37000.00	\N
13359	Ciment et fer	Ciment 	Lafange	Sac	35000.00	34500.00	34200.00	34000.00	\N
13360	Ciment et fer	Fer JR	Diam 6	tige	15000.00	14500.00	14500.00	14000.00	\N
13361	Ciment et fer	Fer JR	Diam 8	tige	18000.00	17500.00	17500.00	17000.00	\N
13362	Ciment et fer	Fer JR	Diam 10	tige	27500.00	27000.00	26800.00	25800.00	\N
13363	Ciment et fer	Fer JR	Diam 12	tige	39500.00	39000.00	39000.00	37700.00	\N
13364	Ciment et fer	Fer Tunkey	Diam 6	tige	18500.00	18000.00	17500.00	17000.00	\N
13365	Ciment et fer	Fer Tunkey	Diam 8	tige	26500.00	25500.00	25500.00	25000.00	\N
13366	Ciment et fer	Fer Tunkey	Diam 10	tige	44000.00	43000.00	43000.00	41500.00	\N
13367	Ciment et fer	Fer Tunkey	Diam 12	tige	63000.00	62000.00	61500.00	59500.00	\N
13368	test	tes	testtes	teste	6.00	7.00	7.00	8.00	9
6888	Tourelle&Papier Abrasif&disque	Tôle Alu 0,14	2m	Feuille	17600.00	16600.00	16600.00	15600.00	10
12649	Ciment et fer	Tôle Alu 0,14	2,5m	Feuille	21500.00	21500.00	21500.00	19500.00	5
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (userid, useragentcode, username, usertype, password) FROM stdin;
2	12	test	admin	test
11	0004	admin	admin	admin
3	0001	sedra	agent	sedra
\.


--
-- Name: article_articleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_articleid_seq', 79, true);


--
-- Name: bill_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_bill_id_seq', 43, true);


--
-- Name: bill_detail_bill_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_detail_bill_detail_id_seq', 28, true);


--
-- Name: customer_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customerid_seq', 11, true);


--
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_stock_id_seq', 1, false);


--
-- Name: store_storeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_storeid_seq', 1, false);


--
-- Name: supplier_supplierid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplierid_seq', 4, true);


--
-- Name: test_testid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_testid_seq', 13368, true);


--
-- Name: user_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_userid_seq', 11, true);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (articleid);


--
-- Name: bill_detail bill_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_detail
    ADD CONSTRAINT bill_detail_pkey PRIMARY KEY (bill_detail_id);


--
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (bill_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customerid);


--
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stock_id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (storeid);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplierid);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (articleid);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (userid);


--
-- Name: bill_detail fk_relation_bill_article; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_detail
    ADD CONSTRAINT fk_relation_bill_article FOREIGN KEY (article_id) REFERENCES public.article(articleid);


--
-- Name: bill_detail fk_relation_bill_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_detail
    ADD CONSTRAINT fk_relation_bill_detail FOREIGN KEY (bill_id) REFERENCES public.bill(bill_id);


--
-- Name: stock fk_relation_stock_article; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT fk_relation_stock_article FOREIGN KEY (article_id) REFERENCES public.article(articleid);


--
-- PostgreSQL database dump complete
--

