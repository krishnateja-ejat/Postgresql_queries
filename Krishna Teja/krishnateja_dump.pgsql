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

--
-- Name: add(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare 
sum integer;
begin 
Select sum(mentor_salary) into sum from public."Teacher";
return sum;
end;
$$;


ALTER FUNCTION public.add() OWNER TO postgres;

--
-- Name: deduction(numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION deduction(gros_sal numeric, dedu numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare
sub numeric(10,2);
begin
sub=gros_sal-dedu;
return sub;
end;
$$;


ALTER FUNCTION public.deduction(gros_sal numeric, dedu numeric) OWNER TO postgres;

--
-- Name: func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION func() RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
i cursor for select * from public."Teacher";
j_row record;
begin
open i;
loop
fetch i into j_row;
if not found then
exit;
end if;
RAISE NOTICE 'Id %,name %,basic_sal %,address %,hra+da %,pf %,gross_sal %,net_sal %',j_row.mentor_id,j_row.mentor_name,j_row.basic_salary,j_row.mentor_address,j_row.hra_da,j_row.pf,j_row.gross_salary,j_row.net_salary;
end loop;
close i;
end;
$$;


ALTER FUNCTION public.func() OWNER TO postgres;

--
-- Name: func(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION func(val numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare
i cursor for select gross_salary from public."Teacher"; 
j_row record;
begin
open i;
loop
fetch i into j_row;
exit when j_row=null;
val=val+1200;
end loop;
close i;
end;
$$;


ALTER FUNCTION public.func(val numeric) OWNER TO postgres;

--
-- Name: gross_salary(integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gross_salary(basic_sal integer, hra numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare 
gross_sal numeric(10,2);
begin
gross_sal=basic_sal+hra;
return gross_sal;
end;
$$;


ALTER FUNCTION public.gross_salary(basic_sal integer, hra numeric) OWNER TO postgres;

--
-- Name: hra(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hra(basic_sal integer) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
declare 
hra_per numeric(10,2);
begin
if (basic_sal > 1000) and  (basic_sal < 2000) then
hra_per=(basic_sal*2)/(100);
elsif (basic_sal > 2000) and  (basic_sal < 3000) then
hra_per=(basic_sal*3)/(100);
elsif (basic_sal > 3000) and  (basic_sal < 5000) then
hra_per=(basic_sal*4)/(100);
else
hra_per=(basic_sal*5)/(100);
end if;
return hra_per;
end;
$$;


ALTER FUNCTION public.hra(basic_sal integer) OWNER TO postgres;

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
    basic_salary integer,
    mentor_address text,
    hra_da numeric(8,2),
    pf numeric(8,2),
    gross_salary numeric(8,2),
    deductions numeric(8,2),
    net_salary numeric(10,2)
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

COPY "Teacher" (mentor_id, mentor_name, basic_salary, mentor_address, hra_da, pf, gross_salary, deductions, net_salary) FROM stdin;
1	Sai	5000	VZA	250.00	500.00	7300.00	6800.00	500.00
2	Ramu	6000	BZA	300.00	500.00	8500.00	8000.00	500.00
3	Hari	3000	TPTY	150.00	500.00	4000.00	3500.00	500.00
4	Raja	3000	HYD	150.00	300.00	3500.00	3200.00	300.00
5	Rajesh	10000	HYD	500.00	500.00	13500.00	13000.00	500.00
\.


--
-- PostgreSQL database dump complete
--

