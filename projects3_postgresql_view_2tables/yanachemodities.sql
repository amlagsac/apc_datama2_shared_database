--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10

-- Started on 2019-12-02 08:30:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16753)
-- Name: amlagsac; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA amlagsac;


ALTER SCHEMA amlagsac OWNER TO datama2mi181;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 222 (class 1259 OID 16833)
-- Name: _client; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._client (
    id integer NOT NULL,
    client_fname character varying(45) DEFAULT NULL::character varying,
    client_lname character varying(45) DEFAULT NULL::character varying,
    client_initial character varying(3) DEFAULT NULL::character varying,
    client_address character varying(255) DEFAULT NULL::character varying,
    client_contact character varying(9) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._client OWNER TO datama2mi181;

--
-- TOC entry 223 (class 1259 OID 16841)
-- Name: _client_has_commodities; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._client_has_commodities (
    id integer NOT NULL,
    client_id character varying(1) DEFAULT NULL::character varying,
    commodities_id character varying(1) DEFAULT NULL::character varying,
    commodities_employee_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._client_has_commodities OWNER TO datama2mi181;

--
-- TOC entry 224 (class 1259 OID 16847)
-- Name: _client_has_commodities_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._client_has_commodities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._client_has_commodities_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 224
-- Name: _client_has_commodities_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._client_has_commodities_id_seq OWNED BY amlagsac._client_has_commodities.id;


--
-- TOC entry 225 (class 1259 OID 16849)
-- Name: _client_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._client_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 225
-- Name: _client_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._client_id_seq OWNED BY amlagsac._client.id;


--
-- TOC entry 226 (class 1259 OID 16851)
-- Name: _commodities; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._commodities (
    id integer NOT NULL,
    com_type character varying(45) DEFAULT NULL::character varying,
    com_validity character varying(45) DEFAULT NULL::character varying,
    com_worth character varying(45) DEFAULT NULL::character varying,
    com_quantity smallint,
    com_brand character varying(45) DEFAULT NULL::character varying,
    employee_id smallint
);


ALTER TABLE amlagsac._commodities OWNER TO datama2mi181;

--
-- TOC entry 227 (class 1259 OID 16858)
-- Name: _commodities_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._commodities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._commodities_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 227
-- Name: _commodities_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._commodities_id_seq OWNED BY amlagsac._commodities.id;


--
-- TOC entry 228 (class 1259 OID 16860)
-- Name: _contract; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._contract (
    id integer NOT NULL,
    con_signed character varying(45) DEFAULT NULL::character varying,
    con_date character varying(45) DEFAULT NULL::character varying,
    con_expiration character varying(45) DEFAULT NULL::character varying,
    client_id character varying(45) DEFAULT NULL::character varying,
    employee_id character varying(45) DEFAULT NULL::character varying,
    employee_client_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._contract OWNER TO datama2mi181;

--
-- TOC entry 229 (class 1259 OID 16869)
-- Name: _contract_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._contract_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 229
-- Name: _contract_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._contract_id_seq OWNED BY amlagsac._contract.id;


--
-- TOC entry 230 (class 1259 OID 16871)
-- Name: _delivery; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._delivery (
    id integer NOT NULL,
    del_cour character varying(45) DEFAULT NULL::character varying,
    del_data_receive character varying(45) DEFAULT NULL::character varying,
    client_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._delivery OWNER TO datama2mi181;

--
-- TOC entry 231 (class 1259 OID 16877)
-- Name: _delivery_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._delivery_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 231
-- Name: _delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._delivery_id_seq OWNED BY amlagsac._delivery.id;


--
-- TOC entry 232 (class 1259 OID 16879)
-- Name: _employee; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._employee (
    id integer NOT NULL,
    emp_fname character varying(45) DEFAULT NULL::character varying,
    emp_lname character varying(45) DEFAULT NULL::character varying,
    emp_initial character varying(3) DEFAULT NULL::character varying,
    emp_address character varying(255) DEFAULT NULL::character varying,
    emp_dob character varying(19) DEFAULT NULL::character varying,
    client_id smallint,
    financial_report_id smallint
);


ALTER TABLE amlagsac._employee OWNER TO datama2mi181;

--
-- TOC entry 233 (class 1259 OID 16887)
-- Name: _employee_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._employee_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 233
-- Name: _employee_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._employee_id_seq OWNED BY amlagsac._employee.id;


--
-- TOC entry 234 (class 1259 OID 16889)
-- Name: _financial_report; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._financial_report (
    id integer NOT NULL,
    fr_amount character varying(45) DEFAULT NULL::character varying,
    fr_date character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._financial_report OWNER TO datama2mi181;

--
-- TOC entry 235 (class 1259 OID 16894)
-- Name: _financial_report_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._financial_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._financial_report_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 235
-- Name: _financial_report_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._financial_report_id_seq OWNED BY amlagsac._financial_report.id;


--
-- TOC entry 236 (class 1259 OID 16896)
-- Name: _salary; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._salary (
    id integer NOT NULL,
    sal_amount character varying(45) DEFAULT NULL::character varying,
    sal_received character varying(45) DEFAULT NULL::character varying,
    employee_id character varying(45) DEFAULT NULL::character varying,
    employee_client_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._salary OWNER TO datama2mi181;

--
-- TOC entry 237 (class 1259 OID 16903)
-- Name: _salary_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._salary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._salary_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 237
-- Name: _salary_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._salary_id_seq OWNED BY amlagsac._salary.id;


--
-- TOC entry 238 (class 1259 OID 16905)
-- Name: _training; Type: TABLE; Schema: amlagsac; Owner: datama2mi181
--

CREATE TABLE amlagsac._training (
    id integer NOT NULL,
    trai_location character varying(45) DEFAULT NULL::character varying,
    trai_num_employ character varying(45) DEFAULT NULL::character varying,
    employee_id character varying(45) DEFAULT NULL::character varying,
    employee_client_id character varying(45) DEFAULT NULL::character varying,
    employee_financial_report_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE amlagsac._training OWNER TO datama2mi181;

--
-- TOC entry 239 (class 1259 OID 16913)
-- Name: _training_id_seq; Type: SEQUENCE; Schema: amlagsac; Owner: datama2mi181
--

CREATE SEQUENCE amlagsac._training_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amlagsac._training_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 239
-- Name: _training_id_seq; Type: SEQUENCE OWNED BY; Schema: amlagsac; Owner: datama2mi181
--

ALTER SEQUENCE amlagsac._training_id_seq OWNED BY amlagsac._training.id;


--
-- TOC entry 240 (class 1259 OID 16915)
-- Name: sales; Type: VIEW; Schema: amlagsac; Owner: datama2mi181
--

CREATE VIEW amlagsac.sales AS
 SELECT _employee.emp_fname,
    _employee.emp_lname,
    _commodities.com_type,
    _commodities.com_worth,
    _commodities.com_quantity,
    _commodities.com_brand
   FROM (amlagsac._employee
     JOIN amlagsac._commodities ON ((_commodities.employee_id = _employee.id)));


ALTER TABLE amlagsac.sales OWNER TO datama2mi181;

--
-- TOC entry 346 (class 1259 OID 22946)
-- Name: sales2; Type: VIEW; Schema: amlagsac; Owner: datama2mi181
--

CREATE VIEW amlagsac.sales2 AS
 SELECT _employee.emp_fname,
    _employee.emp_lname,
    _commodities.com_type,
    _commodities.com_worth,
    _commodities.com_quantity,
    _commodities.com_brand
   FROM (amlagsac._employee
     JOIN amlagsac._commodities ON ((_commodities.employee_id = _employee.id)));


ALTER TABLE amlagsac.sales2 OWNER TO datama2mi181;

--
-- TOC entry 3117 (class 2604 OID 16919)
-- Name: _client id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._client ALTER COLUMN id SET DEFAULT nextval('amlagsac._client_id_seq'::regclass);


--
-- TOC entry 3121 (class 2604 OID 16920)
-- Name: _client_has_commodities id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._client_has_commodities ALTER COLUMN id SET DEFAULT nextval('amlagsac._client_has_commodities_id_seq'::regclass);


--
-- TOC entry 3126 (class 2604 OID 16921)
-- Name: _commodities id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._commodities ALTER COLUMN id SET DEFAULT nextval('amlagsac._commodities_id_seq'::regclass);


--
-- TOC entry 3133 (class 2604 OID 16922)
-- Name: _contract id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._contract ALTER COLUMN id SET DEFAULT nextval('amlagsac._contract_id_seq'::regclass);


--
-- TOC entry 3137 (class 2604 OID 16923)
-- Name: _delivery id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._delivery ALTER COLUMN id SET DEFAULT nextval('amlagsac._delivery_id_seq'::regclass);


--
-- TOC entry 3143 (class 2604 OID 16924)
-- Name: _employee id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._employee ALTER COLUMN id SET DEFAULT nextval('amlagsac._employee_id_seq'::regclass);


--
-- TOC entry 3146 (class 2604 OID 16925)
-- Name: _financial_report id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._financial_report ALTER COLUMN id SET DEFAULT nextval('amlagsac._financial_report_id_seq'::regclass);


--
-- TOC entry 3151 (class 2604 OID 16926)
-- Name: _salary id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._salary ALTER COLUMN id SET DEFAULT nextval('amlagsac._salary_id_seq'::regclass);


--
-- TOC entry 3157 (class 2604 OID 16927)
-- Name: _training id; Type: DEFAULT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._training ALTER COLUMN id SET DEFAULT nextval('amlagsac._training_id_seq'::regclass);


--
-- TOC entry 3305 (class 0 OID 16833)
-- Dependencies: 222
-- Data for Name: _client; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--

INSERT INTO amlagsac._client VALUES (1, 'Andre', 'Lagsac', 'M.', 'Makati City', '895-65-65');
INSERT INTO amlagsac._client VALUES (2, 'Christian', 'Maning', 'P.', 'Makati City', '821-76-36');


--
-- TOC entry 3306 (class 0 OID 16841)
-- Dependencies: 223
-- Data for Name: _client_has_commodities; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--



--
-- TOC entry 3309 (class 0 OID 16851)
-- Dependencies: 226
-- Data for Name: _commodities; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--

INSERT INTO amlagsac._commodities VALUES (1, 'Service', '2019-10-30', 'P500,000', 200, 'Pall', 1);
INSERT INTO amlagsac._commodities VALUES (2, 'Equipment', '2019-10-28', 'P1,000,000', 500, 'B2B', 1);
INSERT INTO amlagsac._commodities VALUES (3, 'Service', '2019-10-27', 'P250,000', 100, 'Everpure', 1);
INSERT INTO amlagsac._commodities VALUES (4, 'Equipment', '2019-10-23', 'P50,000', 10, '3M', 1);


--
-- TOC entry 3311 (class 0 OID 16860)
-- Dependencies: 228
-- Data for Name: _contract; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--



--
-- TOC entry 3313 (class 0 OID 16871)
-- Dependencies: 230
-- Data for Name: _delivery; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--



--
-- TOC entry 3315 (class 0 OID 16879)
-- Dependencies: 232
-- Data for Name: _employee; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--

INSERT INTO amlagsac._employee VALUES (1, 'Kyla', 'Lapid', 'C.', 'Taguig City', '523-12-99', 1, 1);


--
-- TOC entry 3317 (class 0 OID 16889)
-- Dependencies: 234
-- Data for Name: _financial_report; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--



--
-- TOC entry 3319 (class 0 OID 16896)
-- Dependencies: 236
-- Data for Name: _salary; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--



--
-- TOC entry 3321 (class 0 OID 16905)
-- Dependencies: 238
-- Data for Name: _training; Type: TABLE DATA; Schema: amlagsac; Owner: datama2mi181
--



--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 224
-- Name: _client_has_commodities_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._client_has_commodities_id_seq', 1, false);


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 225
-- Name: _client_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._client_id_seq', 2, true);


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 227
-- Name: _commodities_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._commodities_id_seq', 4, true);


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 229
-- Name: _contract_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._contract_id_seq', 1, false);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 231
-- Name: _delivery_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._delivery_id_seq', 1, false);


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 233
-- Name: _employee_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._employee_id_seq', 1, true);


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 235
-- Name: _financial_report_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._financial_report_id_seq', 1, false);


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 237
-- Name: _salary_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._salary_id_seq', 1, false);


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 239
-- Name: _training_id_seq; Type: SEQUENCE SET; Schema: amlagsac; Owner: datama2mi181
--

SELECT pg_catalog.setval('amlagsac._training_id_seq', 1, false);


--
-- TOC entry 3161 (class 2606 OID 16929)
-- Name: _client_has_commodities _client_has_commodities_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._client_has_commodities
    ADD CONSTRAINT _client_has_commodities_pkey PRIMARY KEY (id);


--
-- TOC entry 3159 (class 2606 OID 16931)
-- Name: _client _client_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._client
    ADD CONSTRAINT _client_pkey PRIMARY KEY (id);


--
-- TOC entry 3163 (class 2606 OID 16933)
-- Name: _commodities _commodities_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._commodities
    ADD CONSTRAINT _commodities_pkey PRIMARY KEY (id);


--
-- TOC entry 3165 (class 2606 OID 16935)
-- Name: _contract _contract_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._contract
    ADD CONSTRAINT _contract_pkey PRIMARY KEY (id);


--
-- TOC entry 3167 (class 2606 OID 16937)
-- Name: _delivery _delivery_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._delivery
    ADD CONSTRAINT _delivery_pkey PRIMARY KEY (id);


--
-- TOC entry 3169 (class 2606 OID 16939)
-- Name: _employee _employee_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._employee
    ADD CONSTRAINT _employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3171 (class 2606 OID 16941)
-- Name: _financial_report _financial_report_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._financial_report
    ADD CONSTRAINT _financial_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3173 (class 2606 OID 16943)
-- Name: _salary _salary_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._salary
    ADD CONSTRAINT _salary_pkey PRIMARY KEY (id);


--
-- TOC entry 3175 (class 2606 OID 16945)
-- Name: _training _training_pkey; Type: CONSTRAINT; Schema: amlagsac; Owner: datama2mi181
--

ALTER TABLE ONLY amlagsac._training
    ADD CONSTRAINT _training_pkey PRIMARY KEY (id);


-- Completed on 2019-12-02 08:30:40

--
-- PostgreSQL database dump complete
--

