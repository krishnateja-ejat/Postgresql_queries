--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Student" (
    std_id integer,
    std_name text,
    std_age integer,
    std_address text,
    sub_id integer,
    sub_marks integer
);


ALTER TABLE "Student" OWNER TO postgres;

--
-- Name: Subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Subjects" (
    sub_id integer,
    sub_name text
);


ALTER TABLE "Subjects" OWNER TO postgres;

--
-- Name: Teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Teacher" (
    mentor_id integer,
    mentor_name text,
    mentor_salary integer,
    mentor_address text,
    sub_id integer
);


ALTER TABLE "Teacher" OWNER TO postgres;

--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Student" (std_id, std_name, std_age, std_address, sub_id, sub_marks) FROM stdin;
1	Krishna	21	HYD	3	95
2	Teja	22	TPTY	2	55
3	Ravi	22	RJY	1	60
4	Raju	23	BZA	2	45
5	Rahim	24	VZA	4	75
\.


--
-- Data for Name: Subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Subjects" (sub_id, sub_name) FROM stdin;
1	C
2	JAVA
3	DBMS
4	DS
5	OS
6	Python
\.


--
-- Data for Name: Teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Teacher" (mentor_id, mentor_name, mentor_salary, mentor_address, sub_id) FROM stdin;
1	Sai	5000	VZA	4
2	Ramu	6000	BZA	2
3	Hari	3000	TPTY	1
4	Raja	8000	HYD	3
5	Rajesh	10000	HYD	1
\.


--
-- PostgreSQL database dump complete
--

