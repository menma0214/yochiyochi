--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: facilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facilities (
    id bigint NOT NULL,
    title character varying,
    name character varying,
    furigana character varying,
    address character varying,
    business_hours character varying,
    fee character varying,
    target_age character varying,
    environment character varying,
    request text,
    contact character varying,
    facility_url text,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    video character varying
);


ALTER TABLE public.facilities OWNER TO postgres;

--
-- Name: facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facilities_id_seq OWNER TO postgres;

--
-- Name: facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facilities_id_seq OWNED BY public.facilities.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.places (
    id bigint NOT NULL,
    facility_id bigint NOT NULL,
    address character varying,
    latitude double precision,
    longitude double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.places OWNER TO postgres;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.places_id_seq OWNER TO postgres;

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- Name: playground_equipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playground_equipments (
    id bigint NOT NULL,
    facility_id bigint NOT NULL,
    title character varying,
    kind character varying,
    target_age character varying,
    installation character varying,
    remarks text,
    image character varying,
    video character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.playground_equipments OWNER TO postgres;

--
-- Name: playground_equipments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playground_equipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playground_equipments_id_seq OWNER TO postgres;

--
-- Name: playground_equipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playground_equipments_id_seq OWNED BY public.playground_equipments.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    facility_id bigint NOT NULL,
    title character varying,
    body text,
    rate double precision,
    image character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    crypted_password character varying,
    child_age character varying,
    child_sexgit character varying,
    child_personality character varying,
    child_trend character varying,
    "like" character varying,
    role integer DEFAULT 0 NOT NULL,
    salt character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: facilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities ALTER COLUMN id SET DEFAULT nextval('public.facilities_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- Name: playground_equipments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playground_equipments ALTER COLUMN id SET DEFAULT nextval('public.playground_equipments_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-06-14 11:02:10.013331	2024-06-14 11:02:10.013338
\.


--
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facilities (id, title, name, furigana, address, business_hours, fee, target_age, environment, request, contact, facility_url, image, created_at, updated_at, video) FROM stdin;
1	test施設1	test施設名1	\N	千葉県浦安市舞浜2-1-2	9:00~17:00	\N	\N	\N	\N	\N	\N	\N	2024-06-19 23:17:33.570798	2024-06-19 23:17:33.570798	\N
2	サンプル施設２	施設2	シセツ	東京都新宿区	10:00~17:00	100円	１歳〜	屋内	駐車場なし	TEL: 03-0000-0000	https://xxx.com	sample.png	2024-06-26 12:01:00.148966	2024-06-26 17:32:46.085243	\N
3	サンプル施設3	施設3	シセツ	東京都新宿区	10:00~17:00	100円	１歳〜	屋内	駐車場なし	TEL: 03-0000-0000	https://xxx.com	sample.png	2024-06-26 12:08:16.232929	2024-06-27 05:44:08.45804	\N
4	サンプル施設４	サンプル施設４	\N	\N	9:00~17:00	\N	\N	\N	\N	\N	\N	sample.png	2024-06-27 05:58:29.538132	2024-06-27 06:01:35.732854	\N
5	千葉県民ならココ！	ふなばしアンデルセン公園	フナバシアンデルセンコウエン	〒274-0054 千葉県船橋市金堀町５２５	平日：9時30分～16時00分 土日：9時30分～17時00分	１００円〜９００円	２歳〜	屋外大型アスレチック、一部屋内施設あり	有料駐車場有	TEL.047-457-6627	https://www.park-funabashi.or.jp/and/	funabashi.jpg	2024-06-30 10:41:27.614487	2024-06-30 22:45:37.865482	\N
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.places (id, facility_id, address, latitude, longitude, created_at, updated_at) FROM stdin;
5	5	千葉県船橋市金堀町５２５	35.76068868387069	140.06156501825188	2024-06-30 10:58:08.116438	2024-06-30 10:58:08.116438
\.


--
-- Data for Name: playground_equipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playground_equipments (id, facility_id, title, kind, target_age, installation, remarks, image, video, created_at, updated_at) FROM stdin;
1	1	テスト設備	滑り台	1歳〜３歳	\N	\N	\N	\N	2024-06-21 01:23:44.930761	2024-06-21 01:23:44.930761
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, facility_id, title, body, rate, image, created_at, updated_at) FROM stdin;
25	1	1	テスト	テストテスト更新してみたよ	\N	Yochiyochi_logo.png	2024-06-21 06:04:19.179125	2024-06-28 00:06:59.173873
26	1	1	aaa	aaa	\N	yochiyochi.png	2024-06-28 13:43:47.680617	2024-06-28 13:46:58.774453
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20240607141920
20240611142238
20240611142604
20240611150607
20240614112226
20240615091845
20240630102358
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, crypted_password, child_age, child_sexgit, child_personality, child_trend, "like", role, salt, created_at, updated_at) FROM stdin;
1	test	test@test.com	$2a$10$kVr5FIfRneiMXWJTS61MD.efuiqWGJ4SA74V.nVorWcnG7GOHNTUC	\N	\N	\N	\N	\N	0	boosveveXtzyxmh-MqDV	2024-06-14 11:57:45.630988	2024-06-14 11:57:45.630988
2	test1	test1@test1.com	$2a$10$F08LNq7v2GdbcqONLbpD9O4gipDAmUNOhzCBNhDKtqIPiHs7EvJ5G	\N	\N	\N	\N	\N	0	VhmwWbGsi8E6aTybTnki	2024-06-21 11:59:54.296966	2024-06-21 11:59:54.296966
\.


--
-- Name: facilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facilities_id_seq', 5, true);


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.places_id_seq', 1, false);


--
-- Name: playground_equipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playground_equipments_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: facilities facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: playground_equipments playground_equipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playground_equipments
    ADD CONSTRAINT playground_equipments_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_places_on_facility_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_places_on_facility_id ON public.places USING btree (facility_id);


--
-- Name: index_playground_equipments_on_facility_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_playground_equipments_on_facility_id ON public.playground_equipments USING btree (facility_id);


--
-- Name: index_reviews_on_facility_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_facility_id ON public.reviews USING btree (facility_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: playground_equipments fk_rails_2549d902d6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playground_equipments
    ADD CONSTRAINT fk_rails_2549d902d6 FOREIGN KEY (facility_id) REFERENCES public.facilities(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_b733fa946d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_b733fa946d FOREIGN KEY (facility_id) REFERENCES public.facilities(id);


--
-- Name: places fk_rails_defe66eaa5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT fk_rails_defe66eaa5 FOREIGN KEY (facility_id) REFERENCES public.facilities(id);


--
-- PostgreSQL database dump complete
--

