--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    currency_type_id integer NOT NULL,
    balance numeric NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    users_id integer NOT NULL,
    accounts_id integer NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: currency_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency_type (
    id integer NOT NULL,
    "name " text NOT NULL
);


ALTER TABLE public.currency_type OWNER TO postgres;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    accounts_id_from integer NOT NULL,
    accounts_id_to integer NOT NULL,
    date timestamp with time zone NOT NULL,
    status integer NOT NULL,
    value numeric NOT NULL,
    transactions_type_id integer NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions_type (
    id integer NOT NULL,
    "name " text NOT NULL
);


ALTER TABLE public.transactions_type OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firstname text NOT NULL,
    secondname text NOT NULL,
    thirdname text NOT NULL,
    birthdate timestamp with time zone NOT NULL,
    status integer NOT NULL,
    "username " text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, currency_type_id, balance) FROM stdin;
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, users_id, accounts_id, status) FROM stdin;
\.


--
-- Data for Name: currency_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency_type (id, "name ") FROM stdin;
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, accounts_id_from, accounts_id_to, date, status, value, transactions_type_id) FROM stdin;
\.


--
-- Data for Name: transactions_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions_type (id, "name ") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, firstname, secondname, thirdname, birthdate, status, "username ", password) FROM stdin;
\.


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: currency_type currency_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency_type
    ADD CONSTRAINT currency_type_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: transactions_type transactions_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions_type
    ADD CONSTRAINT transactions_type_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: accounts fk_accounts_currency_type_id_currency_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT fk_accounts_currency_type_id_currency_type_id FOREIGN KEY (currency_type_id) REFERENCES public.currency_type(id) NOT VALID;


--
-- Name: cards fk_cards_accounts_id_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_cards_accounts_id_accounts_id FOREIGN KEY (accounts_id) REFERENCES public.accounts(id) NOT VALID;


--
-- Name: cards fk_cards_users_id_users_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_cards_users_id_users_id FOREIGN KEY (users_id) REFERENCES public.users(id) NOT VALID;


--
-- Name: transactions fk_transactions_accounts_id_from_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_accounts_id_from_accounts_id FOREIGN KEY (accounts_id_from) REFERENCES public.accounts(id) NOT VALID;


--
-- Name: transactions fk_transactions_accounts_id_to_accounts_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_accounts_id_to_accounts_id FOREIGN KEY (accounts_id_to) REFERENCES public.accounts(id) NOT VALID;


--
-- Name: transactions fk_transaktions_transactions_type_id_transactions_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transaktions_transactions_type_id_transactions_type_id FOREIGN KEY (transactions_type_id) REFERENCES public.transactions_type(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

