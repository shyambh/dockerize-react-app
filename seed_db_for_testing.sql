--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-17 07:38:58

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
-- TOC entry 212 (class 1259 OID 16428)
-- Name: Articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Articles" (
    slug character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    body text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserEmail" character varying(255)
);


ALTER TABLE public."Articles" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16451)
-- Name: Comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comments" (
    id integer NOT NULL,
    body text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ArticleSlug" character varying(255),
    "UserEmail" character varying(255)
);


ALTER TABLE public."Comments" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16450)
-- Name: Comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comments_id_seq" OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 214
-- Name: Comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comments_id_seq" OWNED BY public."Comments".id;


--
-- TOC entry 218 (class 1259 OID 16513)
-- Name: Favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Favourites" (
    "UserEmail" character varying(255) NOT NULL,
    "ArticleSlug" character varying(255) NOT NULL
);


ALTER TABLE public."Favourites" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16496)
-- Name: Followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Followers" (
    "UserEmail" character varying(255) NOT NULL,
    "followerEmail" character varying(255) NOT NULL
);


ALTER TABLE public."Followers" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16479)
-- Name: TagList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TagList" (
    "ArticleSlug" character varying(255) NOT NULL,
    "TagName" character varying(255) NOT NULL
);


ALTER TABLE public."TagList" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16445)
-- Name: Tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tags" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."Tags" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16413)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    bio text,
    image text,
    password character varying(255) NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: text_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.text_test (
    id integer NOT NULL,
    x text,
    y text
);


ALTER TABLE public.text_test OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: text_test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.text_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.text_test_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 209
-- Name: text_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.text_test_id_seq OWNED BY public.text_test.id;


--
-- TOC entry 3194 (class 2604 OID 16454)
-- Name: Comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments" ALTER COLUMN id SET DEFAULT nextval('public."Comments_id_seq"'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16399)
-- Name: text_test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.text_test ALTER COLUMN id SET DEFAULT nextval('public.text_test_id_seq'::regclass);


--
-- TOC entry 3406 (class 0 OID 16428)
-- Dependencies: 212
-- Data for Name: Articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Articles" (slug, title, description, body, "createdAt", "updatedAt", "UserEmail") VALUES ('first-article-by-test-user--', 'First Article By Test User 1', 'Its a dummy article', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-01-09 14:43:56.214+05:45', '2022-01-09 14:43:56.214+05:45', 'testuser1@test.com');


--
-- TOC entry 3409 (class 0 OID 16451)
-- Dependencies: 215
-- Data for Name: Comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Comments" (id, body, "createdAt", "updatedAt", "ArticleSlug", "UserEmail") VALUES (1, 'my comments', '2022-01-09 15:51:12.906+05:45', '2022-01-09 15:51:12.948+05:45', 'first-article-by-test-user--', 'bhattaraishyam@gmail.com');
INSERT INTO public."Comments" (id, body, "createdAt", "updatedAt", "ArticleSlug", "UserEmail") VALUES (2, 'second comment', '2022-01-15 11:39:02.927+05:45', '2022-01-15 11:39:03.172+05:45', 'first-article-by-test-user--', 'testuser1@test.com');


--
-- TOC entry 3412 (class 0 OID 16513)
-- Dependencies: 218
-- Data for Name: Favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Favourites" ("UserEmail", "ArticleSlug") VALUES ('bhattaraishyam@gmail.com', 'first-article-by-test-user--');


--
-- TOC entry 3411 (class 0 OID 16496)
-- Dependencies: 217
-- Data for Name: Followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Followers" ("UserEmail", "followerEmail") VALUES ('testuser1@test.com', 'bhattaraishyam@gmail.com');


--
-- TOC entry 3410 (class 0 OID 16479)
-- Dependencies: 216
-- Data for Name: TagList; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TagList" ("ArticleSlug", "TagName") VALUES ('first-article-by-test-user--', 'dog');
INSERT INTO public."TagList" ("ArticleSlug", "TagName") VALUES ('first-article-by-test-user--', 'animal');


--
-- TOC entry 3407 (class 0 OID 16445)
-- Dependencies: 213
-- Data for Name: Tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tags" (name) VALUES ('dog');
INSERT INTO public."Tags" (name) VALUES ('animal');
INSERT INTO public."Tags" (name) VALUES ('training');
INSERT INTO public."Tags" (name) VALUES ('dragons');


--
-- TOC entry 3405 (class 0 OID 16413)
-- Dependencies: 211
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('bhattaraishyam@gmail.com', 'shyambh', NULL, NULL, '$2b$10$f3q5KeR8W6VYwGp8JWkxRuiANA5NjwAoPsLNn4L1USG64sVIjKr3e');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1@test.com', 'testuser1', NULL, NULL, '$2b$10$iRf8nXJHj1/UP.69uQbq8ej.7AXEsRX/.u4HsHBflCxGrw7Zg8Ide');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1641723060624@test.com', 'testuser1641723060624', NULL, NULL, '$2b$10$FYXLq0V/TcPGFsCD9Fwc3eZCVQDy7vKRcg8Md7Clu6DtlZJcLI7qy');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1641723228868@test.com', 'testuser1641723228868', NULL, NULL, '$2b$10$apXfvnn7QCibFg3V2PKAiuXppOd/HKVQJo0etLWAyJisC97FmhXk2');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1641723259405@test.com', 'testuser1641723259405', NULL, NULL, '$2b$10$0jKEHyCxKGGaSMXbAjYZTuQKZzmBl7o1tfx9xyHsMOgcTaOVoJ30m');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1641723301375@test.com', 'testuser1641723301375', NULL, NULL, '$2b$10$vgFQFMoIDVUoTmul7ydrhuDzFvpkeIINvVrvc/uExDdSW7sD4Wo3m');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1642052592657@test.com', 'testuser1642052592657', NULL, NULL, '$2b$10$YpR2ysr9bodN5Wov9MqpZ.ZlLIbKYVhuIKqpwaDziCXv5ITSyIq6W');
INSERT INTO public."Users" (email, username, bio, image, password) VALUES ('testuser1642052760823@test.com', 'testuser1642052760823', NULL, NULL, '$2b$10$lQtKUMqDkw3YUmTDHca8UuVPmIhp5kz9xC.uB3BIkemYFg3haBcyS');


--
-- TOC entry 3404 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: text_test; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 214
-- Name: Comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comments_id_seq"', 2, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 209
-- Name: text_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.text_test_id_seq', 1, false);


--
-- TOC entry 3244 (class 2606 OID 16434)
-- Name: Articles Articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Articles"
    ADD CONSTRAINT "Articles_pkey" PRIMARY KEY (slug);


--
-- TOC entry 3248 (class 2606 OID 16458)
-- Name: Comments Comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16519)
-- Name: Favourites Favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favourites"
    ADD CONSTRAINT "Favourites_pkey" PRIMARY KEY ("UserEmail", "ArticleSlug");


--
-- TOC entry 3252 (class 2606 OID 16502)
-- Name: Followers Followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Followers"
    ADD CONSTRAINT "Followers_pkey" PRIMARY KEY ("UserEmail", "followerEmail");


--
-- TOC entry 3250 (class 2606 OID 16485)
-- Name: TagList TagList_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagList"
    ADD CONSTRAINT "TagList_pkey" PRIMARY KEY ("ArticleSlug", "TagName");


--
-- TOC entry 3246 (class 2606 OID 16449)
-- Name: Tags Tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tags"
    ADD CONSTRAINT "Tags_pkey" PRIMARY KEY (name);


--
-- TOC entry 3198 (class 2606 OID 16419)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (email);


--
-- TOC entry 3200 (class 2606 OID 17314)
-- Name: Users Users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- TOC entry 3202 (class 2606 OID 17316)
-- Name: Users Users_username_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key1" UNIQUE (username);


--
-- TOC entry 3204 (class 2606 OID 17334)
-- Name: Users Users_username_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key10" UNIQUE (username);


--
-- TOC entry 3206 (class 2606 OID 17336)
-- Name: Users Users_username_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key11" UNIQUE (username);


--
-- TOC entry 3208 (class 2606 OID 17338)
-- Name: Users Users_username_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key12" UNIQUE (username);


--
-- TOC entry 3210 (class 2606 OID 17340)
-- Name: Users Users_username_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key13" UNIQUE (username);


--
-- TOC entry 3212 (class 2606 OID 17342)
-- Name: Users Users_username_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key14" UNIQUE (username);


--
-- TOC entry 3214 (class 2606 OID 17344)
-- Name: Users Users_username_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key15" UNIQUE (username);


--
-- TOC entry 3216 (class 2606 OID 17346)
-- Name: Users Users_username_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key16" UNIQUE (username);


--
-- TOC entry 3218 (class 2606 OID 17348)
-- Name: Users Users_username_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key17" UNIQUE (username);


--
-- TOC entry 3220 (class 2606 OID 17350)
-- Name: Users Users_username_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key18" UNIQUE (username);


--
-- TOC entry 3222 (class 2606 OID 17352)
-- Name: Users Users_username_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key19" UNIQUE (username);


--
-- TOC entry 3224 (class 2606 OID 17318)
-- Name: Users Users_username_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key2" UNIQUE (username);


--
-- TOC entry 3226 (class 2606 OID 17354)
-- Name: Users Users_username_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key20" UNIQUE (username);


--
-- TOC entry 3228 (class 2606 OID 17356)
-- Name: Users Users_username_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key21" UNIQUE (username);


--
-- TOC entry 3230 (class 2606 OID 17320)
-- Name: Users Users_username_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key3" UNIQUE (username);


--
-- TOC entry 3232 (class 2606 OID 17322)
-- Name: Users Users_username_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key4" UNIQUE (username);


--
-- TOC entry 3234 (class 2606 OID 17324)
-- Name: Users Users_username_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key5" UNIQUE (username);


--
-- TOC entry 3236 (class 2606 OID 17326)
-- Name: Users Users_username_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key6" UNIQUE (username);


--
-- TOC entry 3238 (class 2606 OID 17328)
-- Name: Users Users_username_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key7" UNIQUE (username);


--
-- TOC entry 3240 (class 2606 OID 17330)
-- Name: Users Users_username_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key8" UNIQUE (username);


--
-- TOC entry 3242 (class 2606 OID 17332)
-- Name: Users Users_username_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key9" UNIQUE (username);


--
-- TOC entry 3196 (class 2606 OID 16403)
-- Name: text_test text_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.text_test
    ADD CONSTRAINT text_test_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 17357)
-- Name: Articles Articles_UserEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Articles"
    ADD CONSTRAINT "Articles_UserEmail_fkey" FOREIGN KEY ("UserEmail") REFERENCES public."Users"(email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3256 (class 2606 OID 17362)
-- Name: Comments Comments_ArticleSlug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_ArticleSlug_fkey" FOREIGN KEY ("ArticleSlug") REFERENCES public."Articles"(slug) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3257 (class 2606 OID 17367)
-- Name: Comments Comments_UserEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_UserEmail_fkey" FOREIGN KEY ("UserEmail") REFERENCES public."Users"(email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3263 (class 2606 OID 16525)
-- Name: Favourites Favourites_ArticleSlug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favourites"
    ADD CONSTRAINT "Favourites_ArticleSlug_fkey" FOREIGN KEY ("ArticleSlug") REFERENCES public."Articles"(slug) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3262 (class 2606 OID 16520)
-- Name: Favourites Favourites_UserEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favourites"
    ADD CONSTRAINT "Favourites_UserEmail_fkey" FOREIGN KEY ("UserEmail") REFERENCES public."Users"(email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3260 (class 2606 OID 16503)
-- Name: Followers Followers_UserEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Followers"
    ADD CONSTRAINT "Followers_UserEmail_fkey" FOREIGN KEY ("UserEmail") REFERENCES public."Users"(email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3261 (class 2606 OID 16508)
-- Name: Followers Followers_followerEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Followers"
    ADD CONSTRAINT "Followers_followerEmail_fkey" FOREIGN KEY ("followerEmail") REFERENCES public."Users"(email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3258 (class 2606 OID 16486)
-- Name: TagList TagList_ArticleSlug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagList"
    ADD CONSTRAINT "TagList_ArticleSlug_fkey" FOREIGN KEY ("ArticleSlug") REFERENCES public."Articles"(slug) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3259 (class 2606 OID 16491)
-- Name: TagList TagList_TagName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagList"
    ADD CONSTRAINT "TagList_TagName_fkey" FOREIGN KEY ("TagName") REFERENCES public."Tags"(name) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-01-17 07:38:59

--
-- PostgreSQL database dump complete
--

