--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: billing; Type: SCHEMA; Schema: -; Owner: fadi
--

CREATE SCHEMA billing;


ALTER SCHEMA billing OWNER TO fadi;

SET search_path = billing, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clients; Type: TABLE; Schema: billing; Owner: fadi
--

CREATE TABLE clients (
    clients_no integer NOT NULL,
    first_name character varying(15),
    last_name character varying(15),
    address character varying(30),
    city character varying(20),
    state character varying(20),
    country character varying(25)
);


ALTER TABLE clients OWNER TO fadi;

--
-- Name: clients_clients_no_seq; Type: SEQUENCE; Schema: billing; Owner: fadi
--

CREATE SEQUENCE clients_clients_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_clients_no_seq OWNER TO fadi;

--
-- Name: clients_clients_no_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: fadi
--

ALTER SEQUENCE clients_clients_no_seq OWNED BY clients.clients_no;


--
-- Name: invoices; Type: TABLE; Schema: billing; Owner: fadi
--

CREATE TABLE invoices (
    invoice_no integer NOT NULL,
    "paid$" integer,
    "unpaid$" integer,
    "refund$" integer,
    "credit_bal$" integer,
    signup_date date,
    due_date date
);


ALTER TABLE invoices OWNER TO fadi;

--
-- Name: invoices_invoice_no_seq; Type: SEQUENCE; Schema: billing; Owner: fadi
--

CREATE SEQUENCE invoices_invoice_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invoices_invoice_no_seq OWNER TO fadi;

--
-- Name: invoices_invoice_no_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: fadi
--

ALTER SEQUENCE invoices_invoice_no_seq OWNED BY invoices.invoice_no;


--
-- Name: orders; Type: TABLE; Schema: billing; Owner: fadi
--

CREATE TABLE orders (
    order_no integer NOT NULL,
    order_id integer,
    invoice_no integer,
    plan_no integer,
    clients_no integer
);


ALTER TABLE orders OWNER TO fadi;

--
-- Name: orders_order_no_seq; Type: SEQUENCE; Schema: billing; Owner: fadi
--

CREATE SEQUENCE orders_order_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_order_no_seq OWNER TO fadi;

--
-- Name: orders_order_no_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: fadi
--

ALTER SEQUENCE orders_order_no_seq OWNED BY orders.order_no;


--
-- Name: plan_details; Type: TABLE; Schema: billing; Owner: fadi
--

CREATE TABLE plan_details (
    plan_de_no integer NOT NULL,
    price integer,
    billing_cycle character varying(20),
    status character varying(10)
);


ALTER TABLE plan_details OWNER TO fadi;

--
-- Name: plan_details_plan_de_no_seq; Type: SEQUENCE; Schema: billing; Owner: fadi
--

CREATE SEQUENCE plan_details_plan_de_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_details_plan_de_no_seq OWNER TO fadi;

--
-- Name: plan_details_plan_de_no_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: fadi
--

ALTER SEQUENCE plan_details_plan_de_no_seq OWNED BY plan_details.plan_de_no;


--
-- Name: plans; Type: TABLE; Schema: billing; Owner: fadi
--

CREATE TABLE plans (
    plan_no integer NOT NULL,
    plan_name character varying(30),
    plan_details integer
);


ALTER TABLE plans OWNER TO fadi;

--
-- Name: plans_plan_no_seq; Type: SEQUENCE; Schema: billing; Owner: fadi
--

CREATE SEQUENCE plans_plan_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plans_plan_no_seq OWNER TO fadi;

--
-- Name: plans_plan_no_seq; Type: SEQUENCE OWNED BY; Schema: billing; Owner: fadi
--

ALTER SEQUENCE plans_plan_no_seq OWNED BY plans.plan_no;


--
-- Name: clients_no; Type: DEFAULT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY clients ALTER COLUMN clients_no SET DEFAULT nextval('clients_clients_no_seq'::regclass);


--
-- Name: invoice_no; Type: DEFAULT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY invoices ALTER COLUMN invoice_no SET DEFAULT nextval('invoices_invoice_no_seq'::regclass);


--
-- Name: order_no; Type: DEFAULT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY orders ALTER COLUMN order_no SET DEFAULT nextval('orders_order_no_seq'::regclass);


--
-- Name: plan_de_no; Type: DEFAULT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY plan_details ALTER COLUMN plan_de_no SET DEFAULT nextval('plan_details_plan_de_no_seq'::regclass);


--
-- Name: plan_no; Type: DEFAULT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY plans ALTER COLUMN plan_no SET DEFAULT nextval('plans_plan_no_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: billing; Owner: fadi
--

COPY clients (clients_no, first_name, last_name, address, city, state, country) FROM stdin;
1	Bob	Orton	25 G	Los Vega	California	U.S
2	Martain	Moole	37L	Los Angeles	California	U.S
\.


--
-- Name: clients_clients_no_seq; Type: SEQUENCE SET; Schema: billing; Owner: fadi
--

SELECT pg_catalog.setval('clients_clients_no_seq', 2, true);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: billing; Owner: fadi
--

COPY invoices (invoice_no, "paid$", "unpaid$", "refund$", "credit_bal$", signup_date, due_date) FROM stdin;
1	18	0	0	0	2011-08-08	2012-08-09
2	21	0	0	30	2012-05-02	2014-05-03
\.


--
-- Name: invoices_invoice_no_seq; Type: SEQUENCE SET; Schema: billing; Owner: fadi
--

SELECT pg_catalog.setval('invoices_invoice_no_seq', 2, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: billing; Owner: fadi
--

COPY orders (order_no, order_id, invoice_no, plan_no, clients_no) FROM stdin;
1	1188290	1	1	2
2	7274821	2	2	1
\.


--
-- Name: orders_order_no_seq; Type: SEQUENCE SET; Schema: billing; Owner: fadi
--

SELECT pg_catalog.setval('orders_order_no_seq', 2, true);


--
-- Data for Name: plan_details; Type: TABLE DATA; Schema: billing; Owner: fadi
--

COPY plan_details (plan_de_no, price, billing_cycle, status) FROM stdin;
1	7	6 month	Active
2	6	3 month	Active
\.


--
-- Name: plan_details_plan_de_no_seq; Type: SEQUENCE SET; Schema: billing; Owner: fadi
--

SELECT pg_catalog.setval('plan_details_plan_de_no_seq', 2, true);


--
-- Data for Name: plans; Type: TABLE DATA; Schema: billing; Owner: fadi
--

COPY plans (plan_no, plan_name, plan_details) FROM stdin;
1	Linux Basic	2
2	ASP.NET Basic	1
\.


--
-- Name: plans_plan_no_seq; Type: SEQUENCE SET; Schema: billing; Owner: fadi
--

SELECT pg_catalog.setval('plans_plan_no_seq', 2, true);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clients_no);


--
-- Name: invoices_pkey; Type: CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (invoice_no);


--
-- Name: plan_details_pkey; Type: CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY plan_details
    ADD CONSTRAINT plan_details_pkey PRIMARY KEY (plan_de_no);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (plan_no);


--
-- Name: orders_clients_no_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_clients_no_fkey FOREIGN KEY (clients_no) REFERENCES clients(clients_no);


--
-- Name: orders_invoice_no_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_invoice_no_fkey FOREIGN KEY (invoice_no) REFERENCES invoices(invoice_no);


--
-- Name: orders_plan_no_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_plan_no_fkey FOREIGN KEY (plan_no) REFERENCES plans(plan_no);


--
-- Name: plans_plan_details_fkey; Type: FK CONSTRAINT; Schema: billing; Owner: fadi
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_plan_details_fkey FOREIGN KEY (plan_details) REFERENCES plan_details(plan_de_no);


--
-- PostgreSQL database dump complete
--
