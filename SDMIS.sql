--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-12-23 13:32:03

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
-- TOC entry 206 (class 1259 OID 17334)
-- Name: gis_block; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gis_block (
    block_id integer NOT NULL,
    district_id integer NOT NULL,
    block character varying(50) NOT NULL,
    block_code character varying(10),
    pincode integer,
    created_by character varying(128) DEFAULT 'System'::character varying NOT NULL,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by character varying(128),
    modified_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(2) DEFAULT 'A'::character varying NOT NULL,
    location_type character varying
);


ALTER TABLE public.gis_block OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17344)
-- Name: gis_block_block_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gis_block_block_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gis_block_block_id_seq OWNER TO postgres;

--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 207
-- Name: gis_block_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gis_block_block_id_seq OWNED BY public.gis_block.block_id;


--
-- TOC entry 204 (class 1259 OID 17313)
-- Name: gis_district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gis_district (
    district_id integer NOT NULL,
    state_id integer NOT NULL,
    district_name character varying(30) NOT NULL,
    district_code character varying(10),
    std_code integer NOT NULL,
    created_by character varying(128) DEFAULT 'System'::character varying NOT NULL,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by character varying(128),
    modified_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(2) DEFAULT 'A'::character varying NOT NULL
);


ALTER TABLE public.gis_district OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17320)
-- Name: gis_district_district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gis_district_district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gis_district_district_id_seq OWNER TO postgres;

--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 205
-- Name: gis_district_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gis_district_district_id_seq OWNED BY public.gis_district.district_id;


--
-- TOC entry 202 (class 1259 OID 17297)
-- Name: gis_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gis_state (
    state_id integer NOT NULL,
    state_name character varying(30) NOT NULL,
    state_code character varying(10),
    created_by character varying(128) DEFAULT 'System'::character varying NOT NULL,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by character varying(128),
    modified_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(2) DEFAULT 'A'::character varying NOT NULL
);


ALTER TABLE public.gis_state OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17304)
-- Name: gis_state_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gis_state_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gis_state_state_id_seq OWNER TO postgres;

--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 203
-- Name: gis_state_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gis_state_state_id_seq OWNED BY public.gis_state.state_id;


--
-- TOC entry 225 (class 1259 OID 17445)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 34404)
-- Name: master_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_config (
    record_id bigint NOT NULL,
    state_code character varying(10),
    config_type character varying(10),
    district_level boolean,
    block_level boolean,
    school_level boolean,
    status character varying(2),
    created_by character varying(45),
    created_time date,
    modified_by character varying(45),
    modified_time date
);


ALTER TABLE public.master_config OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25625)
-- Name: mst_class_section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_class_section (
    record_id bigint NOT NULL,
    class_name character varying(45),
    section_name character(45),
    status character(2),
    created_by character varying(45),
    created_time date,
    modified_by character varying(45),
    modified_time date,
    school_id bigint,
    udise_code character varying
);


ALTER TABLE public.mst_class_section OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17428)
-- Name: mst_moi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_moi (
    record_id bigint NOT NULL,
    moi character varying(120)
);


ALTER TABLE public.mst_moi OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17422)
-- Name: mst_mother_tongue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_mother_tongue (
    record_id bigint NOT NULL,
    language_name character varying(45)
);


ALTER TABLE public.mst_mother_tongue OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17417)
-- Name: mst_religion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_religion (
    record_id bigint NOT NULL,
    religion_name character varying(45)
);


ALTER TABLE public.mst_religion OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17412)
-- Name: mst_social_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_social_category (
    record_id bigint NOT NULL,
    category_name character varying(100)
);


ALTER TABLE public.mst_social_category OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17359)
-- Name: std_basic_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_basic_details (
    record_id bigint NOT NULL,
    student_id bigint,
    admission_num bigint,
    date_of_admission date,
    aadhar_num bigint,
    std_name character varying,
    father_name character varying,
    mother_name character varying,
    gender character varying,
    social_category bigint,
    religion bigint,
    mother_tongue bigint,
    child_homeless bigint,
    state_id bigint,
    district_id bigint,
    city_id bigint,
    locality_id bigint,
    belong_bpl bigint,
    disadvantage_group bigint,
    type_of_disability bigint,
    status character varying(10),
    created_by character varying,
    created_time date,
    modified_by character varying,
    modified_time date,
    date_of_birth date,
    class_section_id bigint,
    "udise_code`" character varying(12),
    state_code character varying(10),
    district_code character varying(10),
    block_code character varying(10),
    category_id bigint,
    management_id bigint,
    edu_type bigint,
    locality character varying(45)
);


ALTER TABLE public.std_basic_details OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17433)
-- Name: std_basic_details_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.std_basic_details_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.std_basic_details_record_id OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17367)
-- Name: std_class_section_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_class_section_mapping (
    record_id bigint NOT NULL,
    student_id bigint,
    status character varying(2),
    created_by character varying(45),
    created_time date,
    class_name character varying(45),
    section character varying(125),
    mst_cls_sec_id bigint,
    udise_code character varying(12),
    state_code character varying(10),
    district_code character varying(10),
    block_code character varying(10)
);


ALTER TABLE public.std_class_section_mapping OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17380)
-- Name: std_education_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_education_details (
    record_id bigint NOT NULL,
    student_id bigint,
    free_edu character varying(2),
    class_attend bigint,
    moi bigint,
    academic_year character varying(25),
    created_by character varying(45),
    created_time date,
    modified_by character varying,
    modified_time date,
    status_prev character varying(45),
    class_prev_year character varying(5),
    study_in_class character varying
);


ALTER TABLE public.std_education_details OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17435)
-- Name: std_education_details_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.std_education_details_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.std_education_details_record_id OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17388)
-- Name: std_incentive_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_incentive_details (
    record_id bigint NOT NULL,
    student_id bigint,
    academic_year character varying(25),
    facility_cwsn character varying(2),
    num_of_uniform_set integer,
    free_text_book integer,
    free_transport_facility integer,
    free_escort_facility integer,
    free_bicycle integer,
    free_hostal_facility integer,
    special_training integer,
    created_by character varying,
    created_time date,
    modified_by character varying,
    modified_time date
);


ALTER TABLE public.std_incentive_details OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17439)
-- Name: std_incentive_details_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.std_incentive_details_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.std_incentive_details_record_id OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17396)
-- Name: std_result_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_result_details (
    record_id bigint NOT NULL,
    student_id bigint,
    academic_year character varying(25),
    last_result bigint,
    mark_obtain bigint,
    schooling_status character varying(20),
    stream character varying(25),
    created_by character varying,
    created_time date,
    modified_by character varying,
    modified_time date
);


ALTER TABLE public.std_result_details OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17441)
-- Name: std_result_details_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.std_result_details_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.std_result_details_record_id OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17372)
-- Name: std_school_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_school_mapping (
    record_id bigint NOT NULL,
    school_id bigint,
    udise_code character varying,
    student_id bigint,
    status character varying,
    created_by character varying,
    created_time date
);


ALTER TABLE public.std_school_mapping OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17443)
-- Name: std_section_class_mapping_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.std_section_class_mapping_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.std_section_class_mapping_record_id OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17404)
-- Name: std_vocational_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.std_vocational_detail (
    record_id bigint NOT NULL,
    student_id bigint,
    academic_year character varying(20),
    trade character varying(45),
    job_role character varying(45),
    nsqf_level integer,
    student_opted_for character varying(45),
    placement_status integer,
    salary_offered bigint,
    created_by character varying(45),
    created_time date,
    modified_by character varying,
    modified_time date
);


ALTER TABLE public.std_vocational_detail OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17437)
-- Name: std_vocational_detail_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.std_vocational_detail_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.std_vocational_detail_record_id OWNER TO postgres;

--
-- TOC entry 2787 (class 2604 OID 17346)
-- Name: gis_block block_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_block ALTER COLUMN block_id SET DEFAULT nextval('public.gis_block_block_id_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 17322)
-- Name: gis_district district_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_district ALTER COLUMN district_id SET DEFAULT nextval('public.gis_district_district_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 17306)
-- Name: gis_state state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_state ALTER COLUMN state_id SET DEFAULT nextval('public.gis_state_state_id_seq'::regclass);


--
-- TOC entry 2964 (class 0 OID 17334)
-- Dependencies: 206
-- Data for Name: gis_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gis_block (block_id, district_id, block, block_code, pincode, created_by, created_time, modified_by, modified_time, status, location_type) FROM stdin;
44435	667	twestttt	453453	\N	NLMA.001	2018-11-29 17:20:06.077025	NLMA.001	2018-11-29 17:20:06.077025	A	RU
44436	667	yyyyyyyyyy	777777	\N	NLMA.001	2018-11-29 17:20:28.101885	NLMA.001	2018-11-29 17:20:28.101885	A	RU
38482	198	GUNNAUR	1004	\N	System	2018-10-24 11:34:41.360697		2018-10-24 11:34:41.360697	A	RU
4204	666	campbell_panchayat	90421	\N	system	2018-10-29 12:46:40.40574	NLMA.001	2018-10-29 12:46:40.40574	A	RU
39873	340	BOROBAZAR	2502	\N	System	2018-10-24 11:34:41.360697	NLMA.001	2018-10-24 11:34:41.360697	A	RU
44437	448	Ashok Nagar	567535	\N	NLMA.001	2018-11-30 11:30:02.053584	NLMA.001	2018-11-30 11:30:02.053584	A	RU
44439	341	Mayur	111111	\N	NLMA.001	2018-11-30 11:31:08.418082	NLMA.001	2018-11-30 11:31:08.418082	A	RU
44432	666	test	587461	\N	NLMA.001	2018-10-29 12:53:00.458843	DLMA666.001	2018-10-29 12:53:00.458843	A	RU
44433	631	MunicipalityOne	000001	\N	NLMA.001	2018-10-30 13:15:08.364967	NLMA.001	2018-10-30 13:15:08.364967	A	\N
44454	666	Mayur vihar222	567539	\N	DLMA666.001	2018-11-30 12:12:15.716259	DLMA666.001	2018-11-30 12:12:15.716259	A	RU
44443	666	Mayur vihar	567534	\N	DLMA666.001	2018-11-30 12:06:01.381172	DLMA666.001	2018-11-30 12:06:01.381172	A	RU
44444	666	Shahdara	567577	\N	DLMA666.001	2018-11-30 12:06:31.199424	DLMA666.001	2018-11-30 12:06:31.199424	A	RU
44445	666	Atari	766765	\N	DLMA666.001	2018-11-30 12:07:29.113853	DLMA666.001	2018-11-30 12:07:29.113853	A	RU
44448	666	BORO	567531	\N	DLMA666.001	2018-11-30 12:08:47.386387	DLMA666.001	2018-11-30 12:08:47.386387	A	RU
44449	666	Barnala12	567510	\N	DLMA666.001	2018-11-30 12:09:34.117727	DLMA666.001	2018-11-30 12:09:34.117727	A	RU
44450	666	Shahdara1	567522	\N	DLMA666.001	2018-11-30 12:11:15.479645	DLMA666.001	2018-11-30 12:11:15.479645	A	RU
44441	666	Ashok Nagar222222	567536	\N	DLMA666.001	2018-11-30 12:05:33.090837	NLMA.001	2018-11-30 12:05:33.090837	A	RU
44455	666	Ashok Nagar231	567321	\N	DLMA666.001	2018-11-30 12:13:10.104991	DLMA666.001	2018-11-30 12:13:10.104991	A	RU
44453	666	Ashok Nagar112	567111	\N	DLMA666.001	2018-11-30 12:11:55.625861	NLMA.001	2018-11-30 12:11:55.625861	A	RU
43816	666	CAMPBELL BAY	666662	\N	System	2018-10-24 11:34:41.360697	DLMA666.001	2018-10-24 11:34:41.360697	A	RU
44456	666	BORO1	567235	\N	DLMA666.001	2018-11-30 12:35:17.688819	DLMA666.001	2018-11-30 12:35:17.688819	A	RU
44458	666	Ashok Nagar44	567335	\N	DLMA666.001	2018-11-30 12:36:19.803955	NLMA.001	2018-11-30 12:36:19.803955	A	RU
44460	666	Ashok Nagar888845	675675	\N	DLMA666.001	2018-11-30 12:37:32.838038	NLMA.001	2018-11-30 12:37:32.838038	A	RU
44459	666	Ashok Nagar333	565535	\N	DLMA666.001	2018-11-30 12:37:02.392963	NLMA.001	2018-11-30 12:37:02.392963	A	RU
44457	666	Ashok Nagar111	527535	\N	DLMA666.001	2018-11-30 12:35:44.370145	NLMA.001	2018-11-30 12:35:44.370145	A	RU
44466	713	Ashok Nagar11	567543	\N	SLMA33.001	2018-11-30 12:56:52.160855	SLMA33.001	2018-11-30 12:56:52.160855	A	\N
44434	573	Anantapur block	927390	\N	NLMA.001	2018-11-14 11:13:30.228529	NLMA.001	2018-11-14 11:13:30.228529	A	RU
44468	429	Aamdi	253106	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44469	122	Abu Road	248774	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44470	692	ACHAMPET	263214	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44471	391	Adityapur	253166	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44472	579	Adoni	251792	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44473	628	Adoor	252253	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44474	600	Afzalpur	251849	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44475	301	Agartala  Municipal  Corporation	249785	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44476	430	Ahiwara	250635	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44477	503	Ahmadabad	251096	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44478	589	AINAPUR	276618	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44479	553	Ajara	251630	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44480	93	Ajmer	248788	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44481	540	Akola	251312	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44482	592	ALAMELA	276540	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44483	618	Alappuzha	252247	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44484	127	Aligarh	249025	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44485	579	Allagadda	253272	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44486	619	Aluva	252211	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44487	582	Amadalavalasa	251699	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44488	576	Amalapuram	251735	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44489	304	Amarpur Nagar Panchayat	249797	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44490	440	Ambagarh Chowki	250631	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44491	71	Ambala	248491	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44492	298	Ambassa Municipal Council	249802	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44493	441	Ambikapur	250588	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44494	586	AMINAGAD	276597	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44495	504	Amreli	251157	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44496	35	Amritsar	248273	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44497	505	Anand	251174	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44498	50	Anandpur Sahib	248317	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44499	573	ANANTAPUR	248112	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44500	689	Andole Jogipet	260558	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44501	619	Angamaly	252208	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44502	505	Anklav	251182	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44503	507	Anklesvar	251225	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44504	612	Ankola	251906	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44505	621	Anthur	272915	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44506	589	ARABHAVI	276577	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44507	448	Arjunda	253155	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44508	601	Arsikere	252010	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44509	129	Ashrafpur Kichhauchha	249398	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44510	99	Asind	248808	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44511	80	Assandh	248519	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44512	580	Atmakur	258033	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44513	579	Atmakur (Kurnool)	253270	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44514	587	ATTIBELE	276539	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44515	629	Attingal	252258	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44516	591	Aurad	251866	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44517	542	Aurangabad	251428	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44518	513	Babra	253147	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44519	428	Bade Bacheli	250670	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44520	672	Badepally	263216	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44521	46	Badhni Kalan	248344	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44522	464	Badonee	277237	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44523	575	BADVEL	248111	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44524	586	Bagalkot	251839	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44525	613	Bagepalli	251981	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44526	113	Baggar	248684	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44527	465	Bagli	250874	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44528	26	BAIJNATH PAPROLA	274797	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44529	436	Baikunthpur	250579	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44530	589	Bail Hongal	251827	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44531	495	Bairad	263211	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44532	48	Balachaur	248315	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44533	608	BALAGANUR	276523	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44534	530	Balasinor	251184	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44535	590	Ballari	251927	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44536	448	Balod	250642	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44537	604	Bangarapet	251987	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44538	95	Banswara	248835	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44539	513	Bantwa	251143	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44540	561	Baramati	251536	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44541	438	Baramkela	253276	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44542	390	Barharwa	277137	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44543	105	Bari	248712	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44544	102	Bari Sadri	248843	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44545	52	Barnala	248378	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44546	350	Barrackpur	250132	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44547	214	BARSOI	276406	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44548	428	Barsoor	253215	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44549	535	Barwala	253241	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44550	426	Bastar	248143	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44551	40	Batala	248264	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44552	36	Bathinda	248367	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
38037	88	RAI	558	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44553	503	Bavla	251109	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44554	85	Bawal	248571	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44555	72	Bawani Khera	248549	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44556	93	Beawar	248790	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44557	102	Begun	248837	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44558	586	BELAGALI	276529	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44559	589	Belagavi	251824	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44560	300	Belonia Municipal Council	249798	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44561	452	Bemetara	250632	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44562	77	Beri	248558	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44563	452	Berla	253152	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44564	506	Bhabhar	253103	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44565	46	Bhagha Purana	248345	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44566	605	BHAGYANAGARA	276604	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44567	442	BHAIRAMGARH	253245	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44568	429	Bhakhara	253107	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44569	591	Bhalki	251865	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44570	507	Bharuch	251222	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44571	166	Bharwari	249361	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44572	446	Bhatapara	250651	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44573	446	Bhatgaon	253114	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44574	508	Bhavnagar	251165	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44575	522	Bhayavadar	251123	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44576	430	Bhilai	250639	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44577	430	Bhilai Charoda	250638	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44578	99	Bhilwara	248812	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44579	585	Bhimavaram	251741	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44580	189	Bhinga	249412	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44581	459	Bhopal	250946	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44582	442	BHOPALPATNAM	253246	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44583	514	Bhuj	251047	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44584	559	Bhum	251567	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44585	616	Bicholim	252075	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44586	614	BIDADI	276526	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44587	591	Bidar	251867	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44588	103	Bidasar	248678	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44589	114	Bilara	248762	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44590	23	Bilaspur	248239	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44591	427	Bilaspur	250616	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44592	518	Bilimora	251251	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44593	439	Birgaon	253179	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44594	303	Bishalgarh Municipal Council	261690	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44595	113	Bissau	248681	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44596	584	Bobbili	251702	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44597	434	BODLA	273466	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44598	427	Bodri	250621	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44599	587	BOMMASANDRA	276537	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44600	503	Bopal-ghuma	276439	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44601	589	BORAGAON	276583	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44602	505	Borsad	251180	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44603	535	Botad	251163	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44604	45	Budhlada	248373	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44605	602	Byadgi	251917	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44606	617	Canacona	252100	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44607	592	CHADACHANA	276559	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44608	561	Chakan	251520	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44609	515	Chaklasi	251188	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44610	630	Chalakudy	252205	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44611	595	Challakere	251933	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44612	593	Chamarajanagar	252054	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44613	68	CHAMIYALA	277163	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44614	61	Champawat	248451	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44615	587	CHANDAPURA	276533	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44616	624	Changanassery	252239	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44617	597	Channagiri	251943	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44618	614	Channapatna	253185	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44619	601	Channarayapatna	252016	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44620	372	Chas	248056	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44621	462	Chaurai	251009	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44622	630	Chavakkad	252181	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44623	618	Chengannur	252249	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44624	637	Chennai	252294	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44625	589	CHENNAMMANA KITTUR	276578	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44626	627	Cherpulassery	272906	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44627	618	Cherthala	252242	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44628	103	Chhapar	248679	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44629	521	Chhaya	251139	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44630	440	Chhuriya	253112	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44631	613	Chik Ballapur	251979	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44632	448	Chikhlakasa	253157	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44633	545	Chikhli	251304	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44634	594	Chikkamagaluru	251965	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44635	610	Chiknayakanhalli	251968	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44636	589	Chikodi	251811	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44637	581	chimakurthy	253274	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44638	589	CHINCHALI	276568	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44639	613	Chintamani	251983	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44640	70	Chinyalisaur	262842	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44641	581	Chirala	251763	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44642	113	Chirawa	248687	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44643	436	Chirimiri	250578	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44644	375	CHIRKUNDA	248055	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44645	600	Chitapur	251853	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44646	595	Chitradurga	251934	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44647	102	Chittaurgarh	248839	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44648	574	CHITTOOR	248122	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44649	627	Chittur-Thathamangalam	252178	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44650	513	Chorvad	251151	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44651	525	Chotila	253137	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44652	447	Churra	253181	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44653	103	Churu	248673	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44654	575	Cuddapah	251782	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44655	617	Cuncolim	252095	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44656	617	Curchorem Cacora	252096	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44657	526	Dabhoi	251213	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44658	510	Dahod	251199	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44659	515	Dakor	251190	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44660	448	Dalli Rajhara	250643	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44661	428	Dantewada	250669	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44662	41	Dasua	248300	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44663	511	Dehgam	251088	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44664	374	DEOGHAR	248049	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44665	53	Dera Bassi	248405	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44666	608	Devadurga	251874	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44667	592	DEVARAHIPPARAGI	276558	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44668	510	Devgadbaria	251200	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44669	452	Devkar	253151	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44670	430	Dhamdha	250634	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44671	429	DHAMTARI	248062	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44672	503	Dhandhuka	251110	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44673	506	Dhanera	251053	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44674	438	Dharamjaigarh	250592	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44675	46	Dharamkot	248346	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44676	527	Dharampur	251261	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44677	26	Dharamshala	248211	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44678	40	Dhariwal	248262	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44679	299	Dharmanagar Municipal Council	249803	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44680	573	DHARMAVARAM	248115	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44681	105	Dhaulpur	248713	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44682	503	Dholka	251108	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44683	522	Dhoraji	251125	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44684	525	Dhrangadhra	251112	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44685	547	Dhule	251282	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44686	117	Didwana	248748	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44687	40	Dinanagar	248259	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44688	588	Dod Ballapur	251992	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44689	384	Domchanch	277135	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44690	448	Dondi	253156	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44691	440	Dongargaon	250630	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44692	440	Dongargarh	250628	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44693	444	Dornapal	253218	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44694	690	DUBBAK	260709	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44695	106	Dungarpur	248831	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44696	430	Durg	250640	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44697	619	Eloor	252218	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44698	624	Erattupetta	272892	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44699	624	Ettumanoor	272891	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44700	589	EXAMBA	276575	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44701	75	Farrukhnagar	248574	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44702	40	Fatehgarh Churian	248263	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44703	55	Fazilka	248354	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44704	625	Feroke	272900	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44705	447	Fingeswar	253180	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44706	39	Firozpur	248351	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44707	599	Gadag-Betigeri	251888	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44708	535	Gadhada	251164	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44709	693	GADWAL	248103	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44710	68	GAJA	277164	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44711	88	Ganaur	248528	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44712	440	Gandai	250625	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44713	605	Gangawati	251881	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44714	427	Gaurella	250610	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44715	613	Gauribidanur	251978	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44716	428	Geedam	250668	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44717	68	Ghansali	262832	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44718	438	Gharghoda	250593	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44719	581	Giddalur	257869	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44720	379	Giridih	250349	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44721	38	Gobindgarh	248329	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44722	589	Gokak	251818	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
38201	114	BAP	722	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44723	576	Gollaprolu	277316	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44724	522	Gondal	251122	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44725	573	Gooty	251797	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44726	549	Goregaon	251510	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44727	610	Gubbi	251974	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44728	650	Gudalur	252639	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44729	613	Gudibanda	251980	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44730	578	Gudivada	251747	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44731	579	Gudur (kurnool)	251773	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44732	563	Guhagar	251604	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44733	69	GULARBOJ	277162	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44734	448	Gunderdehi	253154	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44735	593	Gundlupet	252053	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44736	573	GUNTAKAL	248113	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44737	577	Guntur	251757	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44738	40	Gurdaspur	248260	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44739	487	Gurh	250799	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44740	615	Gurmatkal	251862	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44741	75	Gurugram	248576	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44742	448	Gurur	253158	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44743	630	Guruvayoor	252184	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44744	602	GUTTAL	276521	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44745	590	HAGARIBOMMANAHALLI	276535	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44746	612	Haliyal	251901	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44747	591	HALLIKEDA (B)	276603	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44748	519	Halol	251196	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44749	532	Halvad	251111	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44750	602	Hangal	251915	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44751	471	Harda	250967	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44752	597	Harihar	251938	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44753	520	Harij	251061	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44754	589	HAROGERI	276569	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44755	601	Hassan	252012	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44756	168	Hata	249455	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44757	91	Hathin	248587	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44758	608	Hatti	251873	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44759	587	HEBBUGODI	276463	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44760	523	Himatnagar Seva Sadan 	251074	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44761	573	HINDUPUR	248118	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44762	602	Hirekerur	251918	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44763	76	Hisar	248546	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44764	595	Holalkere	251935	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44765	591	Homnabad	251868	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44766	597	Honnali	251942	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44767	590	Hosapete	251922	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44768	595	Hosdurga	251936	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44769	41	Hoshiarpur	248308	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44770	598	Hubballi-Dharwad	251893	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44771	607	Hunsur	252043	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44772	669	Hyderabad	251664	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44773	582	Ichchapuram	251696	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44774	523	Idar	251072	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44775	592	Indi	251843	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44776	80	Indri	248516	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44777	630	Irinjalakuda	252204	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44778	621	Iritty	272890	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44779	612	JAALI	276572	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44780	597	Jagalur	251940	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44781	426	Jagdalpur	250665	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44782	99	Jahazpur	248813	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44783	55	Jalalabad	248353	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44784	575	Jammalamadugu	251780	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44785	512	Jamnagar	251133	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44786	430	Jamul	250636	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44787	585	jangareddigudem	257906	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44788	522	Jasdan	251121	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44789	160	Jaunpur	249505	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44790	26	Jawalamukhi	248216	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44791	26	Jawali	275535	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44792	522	Jetpur Navagadh	251126	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44793	600	Jevargi	251858	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44794	436	Jhagrakhand	250582	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44795	510	Jhalod	251197	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44796	113	Jhunjhunun	248683	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44797	587	JIGANI	276464	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44798	301	Jirania Nagar Panchayat	261687	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44799	114	Jodhpur	248760	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44800	78	Julana	248534	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44801	513	Junagadh	251147	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44802	611	KAAPU	276573	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44803	589	KABBUR	276483	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44804	573	KADIRI	248116	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44805	594	Kadur	251964	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44806	305	Kailashahar Municipal Council	249804	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44807	576	Kakinada	251731	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44808	615	KAKKERA	276560	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44809	600	KALABURAGI CITY CORPORATION	248127	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44810	619	Kalamassery	252224	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44811	555	Kalameshwar	251342	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44812	86	Kalanaur	248556	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44813	589	KALLOLLI	276576	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44814	511	Kalol	251081	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44815	631	Kalpetta	252155	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44816	692	KALWAKURTHY	258029	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44817	573	Kalyandurg	251799	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44818	298	Kamalpur Nagar Panchayat	273718	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44819	586	KAMATAGI	276531	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44820	614	Kanakapura	251999	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44821	605	KANAKGIRI	276599	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44822	581	Kandukur	251768	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44823	622	Kanhangad	252110	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44824	581	kanigiri	253295	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44825	82	Kanina	248563	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44826	515	Kanjajari	253226	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44827	589	KANKANAVADI	276567	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44828	621	Kannur	252125	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44829	515	Kapadvanj	251183	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44830	102	Kapasan	248840	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44831	605	KARATAGI	276496	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44832	115	Karauli	248717	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44833	526	Karjan	251215	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44834	80	Karnal	248517	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44835	30	Karsog	276625	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44836	623	Karunagappally	259707	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44837	612	Karwar	251900	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44838	622	Kasaragod	252108	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44839	446	Kasdol	250645	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44840	515	Kathlal	253225	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44841	620	Kattappana	272883	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44842	608	KAVITAL	276522	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44843	434	Kawardha	250623	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44844	618	Kayamkulam	252248	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44845	93	Kekri	248793	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44846	615	KEMBHAVI	276516	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44847	513	Keshod	251149	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44848	440	Khairagarh municipality	262094	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44849	505	Khambhat	251179	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44850	671	KHAMMAM	248105	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44851	589	Khanapur	251825	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44852	364	Kharagpur	250232	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44853	53	Kharar	248324	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44854	88	Kharkhoda	248530	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44855	438	Kharsia	250595	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44856	515	Kheda	251186	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44857	113	Khetri	248690	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44858	314	Khliehriat	279714	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44859	436	Khongapani	250581	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44860	5	Khour	248193	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44861	302	Khowai Municipal Council	249783	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44862	428	Kirandul	250671	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44863	438	Kirodimal Nagar	253280	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44864	93	Kishangarh	248786	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44865	228	KOCHAS	276405	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44866	619	Kochi	252220	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44867	630	Kodungallur	252200	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44868	625	Koduvally	272897	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44869	604	Kolar	251985	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44870	592	KOLHARA	276543	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44871	623	Kollam	252255	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44872	593	Kollegal	252056	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44873	626	Kondotty	272901	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44874	444	Konta	253217	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44875	619	Koothattukulam	272881	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44876	621	Koothuparamba	252144	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44877	610	Koratagere	251972	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44878	435	Korba	250598	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44879	427	Kota	250613	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44880	596	KOTEKAR	276555	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44881	619	Kothamangalam	252231	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44882	490	KOTHRI	276641	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44883	626	Kottakkal	259709	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44884	623	Kottarakkara	272889	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44885	624	Kottayam	252238	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44886	585	Kovvur	251736	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44887	625	koyilandy	252159	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44888	625	Kozhikode	252160	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44889	606	Krishnarajpet	252001	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44890	117	Kuchaman City	248757	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44891	566	Kudal	251612	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44892	590	KUDUTINI	276534	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44893	605	KUKANOORU	276497	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44894	612	Kumta	251907	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44895	598	Kundgol	251898	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44896	610	Kunigal	251977	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44897	630	Kunnamkulam	252180	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44898	590	KUREKUPPA	276538	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44899	579	Kurnool	251789	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44900	429	KURUD	248061	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44901	590	KURUGODU	276532	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44902	95	Kushalgarh	248836	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44903	168	Kushinagar	249456	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44904	605	Kushtagi	251880	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44905	521	Kutiyana	251142	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44906	117	Ladnu	248747	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44907	81	Ladwa	248509	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44908	438	Lailunga	253279	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44909	441	Lakhanpur	253121	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44910	68	LAMBGAON	277183	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44911	563	Lanja	251607	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44912	446	Lavan	253184	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44913	525	Limbdi	251117	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44914	608	Lingsugur	251871	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44915	72	Loharu	248553	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44916	449	Lormi	250611	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44917	121	Losal	248742	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44918	44	Ludhiana	248338	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44919	530	Lunawada	251192	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44920	573	Madakasira	253253	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44921	574	MADANAPALLI	248119	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44922	606	Maddur	252006	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44923	671	MADHIRA	257876	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44924	610	Madhugiri	251971	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44925	614	Magadi	251996	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44926	429	Magarlod	253108	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44927	672	MAHABUBNAGAR	248101	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44928	515	Mahudha	251189	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44929	508	Mahuva	251170	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44930	498	makdon	263205	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44931	117	Makrana	248756	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44932	626	Malappuram	252170	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44933	597	MALEBENNURU	276556	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44934	558	Malegaon	251438	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44935	427	Malhar	253174	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44936	532	Maliya Miyana	253135	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44937	589	MALLAPUR PG	276570	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44938	47	Malout	248356	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44939	604	Malur	251986	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44940	592	MANAGULI	276541	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44941	631	Mananthavady	272910	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44942	513	Manavadar	251144	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44943	99	Mandalgarh	248814	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44944	576	Mandapeta	251732	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44945	113	Mandawa	248682	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44946	484	Mandideep	250959	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44947	606	Mandya	252005	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44948	436	Manendragarh	250580	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44949	577	Mangalagiri	251752	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44950	596	Mangaluru	252021	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44951	487	Mangawan	250793	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44952	513	Mangrol	251150	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44953	626	Manjeri	252169	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44954	627	Mannarkad	272907	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44955	45	Mansa	248376	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44956	511	Mansa	251082	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44957	619	Maradu	252226	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44958	333	Marigaon	249864	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44959	590	MARIYAMMANAHALLI	276474	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44960	452	Maro	253160	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44961	608	MASKI	276519	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44962	175	Mathura	249052	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44963	621	Mattannur	252139	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44964	487	Mauganj	250796	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44965	618	Mavelikkara	252250	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44966	315	Mawkyrwat	282009	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44967	698	Medchal	263222	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44968	388	Medininagar	250324	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44969	364	Medinipur	250230	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44970	177	Meerut	248964	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44971	515	Mehmedabad	251185	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44972	303	Melaghar Municipal Council	261691	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44973	562	Mhasla	251512	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44974	589	M.K HUBBALLI	276574	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44975	46	Moga	248347	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44976	301	Mohanpur Municipal Council	261692	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44977	532	Morbi	251118	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44978	131	Mubarakpur	249474	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44979	592	Muddebihal	251846	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44980	608	Mudgal	251870	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44981	586	Mudhol	251835	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44982	594	Mudigere	251966	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44983	589	MUGALAKODA	276563	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44984	41	Mukerian	248303	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44985	625	Mukkom	272898	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44986	576	Mummidivaram	277315	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44987	589	MUNAVALLI	276564	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44988	599	Mundargi	251892	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44989	117	Mundwa	248751	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44990	449	Mungeli	250614	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44991	559	Murum	251572	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44992	619	Muvattupuzha	252230	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44993	575	Mydukur	253297	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44994	607	Mysuru	252045	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44995	589	NAAGANURA	276566	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44996	49	Nabha	248397	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44997	515	Nadiad	251187	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44998	606	Nagamangala	252002	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
44999	574	NAGARI	248125	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45000	378	Nagar Untari Nagar panchayat	274815	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45001	117	Nagaur	248749	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45002	555	Nagpur	251362	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45003	429	Nagri	253109	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45004	580	NAIDUPET	257831	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45005	487	Nai-Garhi	250795	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45006	436	Nai ladri	253220	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45007	592	NALATAVADA	276544	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45008	674	Nalgonda	251685	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45009	69	Nanakmatta	275661	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45010	578	Nandigama	254922	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45011	579	Nandikotkur	253273	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45012	579	Nandyal	251795	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45013	71	Naraingarh	248490	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45014	585	Narasapur	251742	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45015	577	Narasaraopeta	251755	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45016	443	Narayanpur	248064	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45017	599	Nargund	251884	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45018	76	Narnaund	248547	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45019	677	Narsampet	253275	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45020	583	Narsipatnam	251716	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45021	598	Navalgund	251895	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45022	518	Navsari	251245	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45023	117	Nawa	248758	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45024	452	Nawagarh	253148	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45025	113	Nawalgarh	248692	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45026	431	Naya Baradwar	250607	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45027	595	NAYAKANAHATTI	276542	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45028	629	Nedumangad	252259	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45029	588	Nelamangala	251990	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45030	584	Nellimarla	251711	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45031	580	Nellore	251772	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45032	30	Nerchowk	274794	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45033	629	Neyyattinkara	252261	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45034	626	Nilambur	259710	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45035	622	Nileshwar	259711	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45036	80	Nilokheri	248514	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45037	102	Nimbahera	248841	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45038	589	Nipani	251809	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45039	108	Nohar	248665	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45040	309	Nongpoh	249812	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45041	90	Nuh	248581	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45042	578	Nuzvid	251745	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45043	505	Ode	251173	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45044	533	Okha	251127	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45045	581	Ongole	251766	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45046	559	Osmanabad	251569	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45047	627	Ottappalam	252175	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45048	526	Padra	251214	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45049	624	Palai	252234	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45050	627	Palakkad	252176	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45051	582	PALAKONDA	257967	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45052	574	PALAMANER	248123	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45053	506	Palanpur	251055	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45054	582	Palasa Kasibugga	251695	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45055	508	Palitana	251168	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45056	573	Pamidi	253252	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45057	83	Panchkula	248489	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45058	628	Pandalam	272908	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45059	434	Pandariya	250624	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45060	606	Pandavapura	252003	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45061	84	Panipat	248521	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45062	299	Panisagar Nagar Panchayat	261688	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45063	621	Panoor	272885	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45064	562	Panvel	251492	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45065	559	Paranda	251566	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45066	626	Parappanangadi	272912	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45067	623	Paravoor	252256	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45068	619	Paravur	252215	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45069	527	Pardi	251262	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45070	677	PARKAL	257970	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45071	452	Parpodi	253150	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45072	584	Parvathipuram	251701	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45073	430	Patan	250641	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45074	520	Patan	251060	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45075	525	Patdi	253138	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45076	628	Pathanamthitta	252252	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45077	56	Pathankot	248256	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45078	449	Pathariya	253172	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45079	49	Patiala	248399	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45080	225	Patna	249650	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45081	627	Pattambi	272905	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45082	610	Pavagada	251970	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45083	621	Payyannur	252111	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45084	625	Payyoli	272896	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45085	578	Pedana	251749	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45086	576	Peddapuram	251724	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45087	81	Pehowa	248507	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45088	427	Pendra	250609	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45089	626	Perinthalmanna	252171	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45090	619	Perumbavoor	252207	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45091	505	Petlad	251178	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45092	577	Piduguralla	253167	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45093	108	Pilibanga	248663	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45094	60	PIPALKOTI	276459	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45095	114	Pipar City	248761	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45096	434	PIPARIYA	273465	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45097	63	Piran Kaliyar	275670	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45098	619	Piravom	272882	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45099	607	Piriyapatna	252042	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45100	576	Pithapuram	251728	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45101	626	Ponnani	252173	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45102	577	Ponnuru	251759	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45103	521	Porbandar	251138	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45104	665	Port Blair	253098	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45105	125	Pratapgarh	248844	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45106	575	Proddatur	251778	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45107	575	Pulivendula	253101	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45108	90	Punahana	248583	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45109	623	Punalur	252254	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45110	79	Pundri	248513	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45111	561	Pune	251530	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45112	574	PUNGANUR	248120	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45113	438	Pussore	253278	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45114	573	Puttaparthi	253254	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45115	574	PUTTUR	248126	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45116	617	Quepem	252097	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45117	520	Radhanpur	251058	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45118	608	Raichur	251876	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45119	438	Raigarh	250594	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45120	44	Raikot	248342	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45121	439	Raipur	250653	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45122	576	Rajahmundry	251725	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45123	105	Rajakhera	248714	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45124	103	Rajaldesar	248677	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45125	582	Rajam	251698	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45126	103	Rajgarh	248671	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45127	447	Rajim	253178	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45128	522	Rajkot	251120	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45129	440	Rajnandgaon	250629	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45130	517	Rajpipla	251216	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45131	49	Rajpura	248403	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45132	576	Ramachandrapuram	251733	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45133	614	Ramanagara	253186	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45134	625	Ramanattukara	272899	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45135	589	Ramdurg	251829	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45136	395	Ramgarh Nagar Parishad	274814	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45137	521	Ranavav	251141	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45138	389	Ranchi	250413	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45139	602	Ranibennur	251919	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45140	58	Ranikhet Chiliyanaula 	277190	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45141	301	Ranirbazar Municipal Council	249786	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45142	103	Ratangarh	248676	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45143	427	Ratanpur	250612	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45144	74	Ratia	248536	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45145	102	Rawatbhata	248838	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45146	108	Rawatsar	248664	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45147	575	Rayachoti	251786	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45148	121	Reengus	248745	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45149	577	Repalle	251761	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45150	487	Rewa	250797	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45151	86	Rohtak	248557	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45152	63	Roorkee	248478	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45153	300	Sabroom Nagar Panchayat	249799	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45154	78	Safidon	248535	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45155	106	Sagwara	248832	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45156	452	Saja	253149	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45157	427	Sakri	253175	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45158	533	Salaya	251130	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45159	584	Salur	251703	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45160	84	Samalkha	248526	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45161	576	Samalkot	251727	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45162	49	Samana	248396	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45163	423	Sambalpur	253100	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45164	503	Sanand	251090	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45165	49	Sanaur	248398	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45166	158	Sandila	249209	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45167	590	Sandur	251929	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45168	530	Santrampur	251191	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45169	438	Sarangarh	250596	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45170	103	Sardarshahar	248672	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45171	449	Sargaon	253176	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45172	438	Saria	253277	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45173	93	Sarwar	248792	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45174	53	S.A.S.Nagar - Mohali	248325	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45175	565	Satara	251593	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45176	65	Satpuli	262882	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45177	577	Sattenapalle	251753	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45178	589	Saundatti-Yellamma	251828	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45179	462	Sausar	251027	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45180	526	savli	253247	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45181	600	Sedam	251852	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45182	62	Selaqui(Central Hope Town)	275633	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45183	487	Semaria	250791	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45184	391	Seraikella	250423	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45185	557	Shahade	251277	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45186	519	SHAHERA	248076	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45187	490	Shahganj	262903	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45188	149	Shamsabad	249249	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45189	589	SHEDBALA	276579	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45190	122	Sheoganj	248770	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45191	609	Shikarpur	251948	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45192	599	Shirhatti	251890	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45193	609	Shivamogga	251951	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45194	436	Shivpur charcha	259685	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45195	627	Shoranur	252174	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45196	615	Shorapur	251859	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45197	520	Sidhpur	251059	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45198	613	Sidlaghatta	251982	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45199	508	Sihor	251166	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45200	121	Sikar	248741	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45201	446	Simga	250644	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45202	592	Sindgi	251844	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45203	547	Sindhakeda	259701	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45204	608	Sindhnur	251878	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45205	239	Singtam Nagar Panchayat	249695	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45206	610	Sira	251969	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45207	608	SIRAVARA	276605	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45208	427	Sirgiti	250619	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45209	38	Sirhind Fatehgarh Sahib	248328	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45210	122	Sirohi	248771	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45211	612	Sirsi	251905	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45212	441	Sitapur	253120	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45213	72	Siwani	248552	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45214	434	S.LOHARA	273468	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45215	505	Sojitra	253230	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45216	303	Sonamura Nagar Panchayat	249787	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45217	528	Songadh	251230	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45218	88	Sonipat	248529	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45219	609	Sorab	251946	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45220	621	Sreekandapuram	272884	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45221	40	Sri Hargobindpur	248265	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45222	582	Srikakulam	251700	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45223	574	SRIKALAHASTI	248124	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45224	103	Sujangarh	248680	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45225	444	Sukma	253216	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45226	580	Sullurupeta	253227	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45227	631	Sulthanbathery	272911	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45228	524	Surat	251231	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45229	525	Surendranagar Dudhrej	251114	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45230	558	Surgana	251434	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45231	577	Tadepalli	253168	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45232	585	Tadepalligudem	251738	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45233	34	Tahliwal	276639	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45234	427	Takhatpur	250615	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45235	621	Taliparamba	252112	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45236	557	Talode	251275	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45237	39	Talwandi Bhai	248350	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45238	585	Tanuku	251740	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45239	626	Tanur	272904	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45240	90	Taoru	248580	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45241	52	Tapa	248380	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45242	103	Taranagar	248670	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45243	594	Tarikere	251962	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45244	54	Tarn-Taran	248274	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45245	526	Tarsadi	276026	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45246	605	TAVARAGERA	276601	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45247	302	Teliamura Municipal Council	249784	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45248	577	Tenali	251758	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45249	487	Teonthar	250789	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45250	621	Thalassery	252149	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45251	525	Thangadh	251116	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45252	452	Than Khamharia	250633	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45253	506	Thara	253164	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45254	60	Tharali	275665	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45255	515	Thasra	253224	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45256	628	Thiruvalla	252251	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45257	629	Thiruvananthapuram	252260	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45258	620	Thodupuzha	252233	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45259	619	Thrikkakara	259708	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45260	619	Thrippunithura	252227	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45261	630	Thrissur	252194	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45262	610	Tiptur	251975	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45263	607	Tirumakudal - Narsipur	252052	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45264	574	TIRUPATI	248121	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45265	626	Tirur	252172	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45266	626	Tirurangadi	272903	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45267	578	Tiruvuru	254924	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45268	123	Todaraisingh	248798	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45269	123	Tonk	248797	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45270	559	Tuljapur	251570	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45271	610	Tumakuru	251973	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45272	576	Tuni	251722	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45273	610	Turuvekere	251976	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45274	608	TURVIHAL	276524	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45275	78	Uchana	248532	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45276	304	Udaipur Municipal Council	249796	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45277	113	Udaipurwati	248693	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45278	611	Udupi	251955	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45279	589	UGAR KHURDA	276565	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45280	76	Uklanamandi	248544	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45281	559	Umarga	251573	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45282	527	Umargaon	251269	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45283	505	Umreth	251171	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45284	522	Upleta	251124	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45285	430	Utai	253153	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45286	526	Vadodara	251209	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45287	624	Vaikom	252236	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45288	626	Valanchery	272902	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45289	508	Vallabhipur	253126	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45290	616	Valpoi	252079	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45291	527	Valsad	251254	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45292	513	Vanthali	251145	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45293	527	Vapi	251264	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45294	629	Varkala	252257	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45295	625	Vatakara	252157	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45296	580	Venkatagiri	251774	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45297	534	Veraval	251152	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45298	93	Vijainagar	248791	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45299	516	Vijapur	251067	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45300	592	VIJAYAPURA	251842	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45301	578	Vijayawada	251746	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45302	503	Viramgam	251089	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45303	583	Visakhapatnam	251719	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45304	513	Visavadar	251148	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45305	516	Visnagar	251065	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45306	596	VITLA	276554	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45307	584	Vizianagaram	251709	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45308	528	Vyara	251244	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45309	630	Wadakkanchery	272909	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45310	525	Wadhwan	251115	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45311	555	Wanadongri	251363	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45312	532	Wankaner	251119	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45313	89	Yamunanagar	248500	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45314	571	Yavatmal	251386	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45315	583	Yelamanchili	258054	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45316	593	Yelandur	252055	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45317	605	Yelburga	251879	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45318	579	Yemmiganur	251787	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45319	575	Yerraguntla	251781	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
45320	53	Zirakpur	248407	\N	System	2018-12-10 10:42:31.797671	\N	2018-12-10 10:42:31.797671	A	UR
38048	93	KEKRI	569	\N	System	2018-10-24 11:34:41.360697	SLMA7.001	2018-10-24 11:34:41.360697	A	RU
41972	668	ADILABAD URBAN	4634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	UR
39114	202	DEO	1636	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37484	1	ACHABAL	1	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37485	1	BRENG	2	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37486	1	DACHNIPORA	3	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37487	17	DEVSAR	4	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37488	17	D.H. PORA	5	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37489	1	KHOVERIPORA	6	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37490	17	KULGAM	7	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37491	17	PAHLOO	8	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37492	17	QAIMOH	9	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37493	1	SHAHABAD	11	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37494	1	SHANGUS	12	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37495	2	B.K.PORA	13	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37496	2	BADGAM	14	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37497	2	BEERWAH	15	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37498	2	CHADOORA	16	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37499	2	KHAG	17	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37500	2	KHAN-SAHIB	18	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37501	2	NAGAM	19	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37502	2	NARBAL	20	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37503	18	BANDIPORA	21	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37504	3	BARAMULLA	22	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37505	3	BONIYAR	23	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37506	18	GUREZ	24	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37507	18	HAJIN	25	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37508	3	KUNZER	26	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37509	3	PATTAN	27	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37510	3	RAFIABAD	28	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37511	3	ROHAMA	29	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37512	3	SINGHPORA	30	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37513	3	SOPORE	31	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37514	18	SUMBAL	32	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37515	3	TANGMARAG	33	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37516	3	URI	34	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37517	3	WAGOORA	35	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37518	3	ZAINGEER	36	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37519	4	ASSAR	37	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37520	16	BANIHAL	38	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37521	4	BHADERWAH	39	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37522	4	BHAGWAH	40	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37523	4	BHALESSA(GANDOH)	41	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37524	15	DACHHAN	42	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37525	4	DODA	43	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37526	15	DRABSHALLA	44	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37527	4	GUNDANA	45	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37528	15	INDERWAL	46	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37529	15	KISHTWAR	47	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37530	4	MARMAT	48	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37531	15	MARWAH	49	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37532	15	NAGSENI	50	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37533	15	PADDER	51	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37534	16	RAMBAN	52	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37535	16	RAMSOO	53	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37536	4	THATHRI	54	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37537	15	WARWAN	55	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37538	5	AKHNOOR	56	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37539	5	BHALWAL	57	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37540	5	BISHNAH	58	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37541	5	DANSAL	59	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37542	5	KHOUR	60	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37543	5	MARH	61	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37544	19	PURMANDAL	62	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37545	5	R.S.PURA	63	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37546	19	SAMBA	64	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37547	5	SATWARI	65	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37548	19	VIJAYPUR	66	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37549	6	DRASS	67	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37550	6	KARGIL	68	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37551	6	SANKOO	69	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37552	6	SHAKER CHAKTAN	70	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37553	6	SHARGOL	71	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37554	6	TAISURU	72	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37555	6	ZANSKER	73	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37556	7	BANI	74	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37557	7	BARNOTI	75	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37558	7	BASOHLI	76	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37559	7	BILLAWAR	77	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37560	7	DUGGAN	78	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37561	19	GHAGWAL	79	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37562	7	HIRANAGAR	80	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37563	7	KATHUA	81	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37564	7	LOHAI-MALHAR	82	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37565	8	KALAROOCH	83	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37566	8	KRALPORA	84	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37567	8	KUPWARA	85	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37568	8	LANGATE	86	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37569	8	RAJWAR	87	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37570	8	RAMHAL	88	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37571	8	SOGAM	89	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37572	8	TANGDAR	90	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37573	8	TEETWAL	91	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37574	8	trehgam	92	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37575	8	WAVOORA	93	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37576	9	DURBUK	94	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37577	9	KHALTSI	95	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37578	9	KHARU	96	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37579	9	LEH	97	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37580	9	Deskit	98	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37581	9	NYOMA	99	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37582	10	BALAKOTE	100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37583	10	BUFLIAZ	101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37584	10	MANDI	102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37585	10	MENDHAR	103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37586	10	POONCH	104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37587	10	SURANKOTE	105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37588	11	KAKAPORA	106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37589	11	PAMPORE	108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37590	11	PULWAMA	109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37591	20	SHOPIAN	110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37592	11	TRAL	111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37593	12	BUDHAL	112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37594	12	DARHAL	113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37595	12	KALAKOTE	114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37596	12	MANJAKOTE	115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37597	12	NOWSHERA	116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37598	12	RAJOURI	117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37599	12	SUNDERBANI	118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37600	21	GANDERBAL	119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37601	21	KANGAN	120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37602	21	LAR	121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37603	13	SRINAGAR	122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37604	22	ARNAS	123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37605	14	CHENANI	124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37606	14	DUDU	125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37607	14	GHORDI	126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37608	16	GOOL	127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37609	22	MAHORE	128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37610	14	MAJALTA	129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37611	14	PANCHARI	130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37612	22	POUNI	131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37613	14	RAMNAGAR	132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37614	22	REASI	133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37615	14	UDHAMPUR	134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37616	23	BILASPUR SADAR	135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37617	23	JHANDUTTA	136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37618	23	GHUMARWIN	137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37619	24	BHATTIYAT	138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37620	24	BHARMOUR	139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37621	24	CHAMBA	140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37622	24	MEHLA	141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37623	24	PANGI	142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37624	24	SALUNI	143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37625	24	TISA	144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37626	25	BAMSON	145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37627	25	BHORANJ	146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37628	25	BIJHRI	147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37629	25	HAMIRPUR	148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37630	25	NADAUN	149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37631	25	TIRA SUJANPUR	150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37632	26	BAIJNATH	151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37633	26	BHAWARNA	152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37634	26	DEHRA GOPIPUR	153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37635	26	FATEHPUR	154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37636	26	INDORA	155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37637	26	KANGRA	156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37638	26	LAMBAGAON	157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37639	26	NAGROTA BAGWAN	158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37640	26	NAGROTA SURIAN	159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37641	26	NURPUR	160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37642	26	PANCHRUKHI	161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37643	26	PRAGPUR	162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37644	26	RAIT	163	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37645	26	SULAH	164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37646	27	KALPA	165	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37647	27	NICHAR	166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37648	27	POOH	167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37649	28	ANNI	168	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37650	28	BANJAR	169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37651	28	KULLU	170	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37652	28	NAGGAR	171	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37653	28	NIRMAND	172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37654	29	LAHUL	173	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37655	29	SPITI	174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37656	30	BALH	175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37657	30	GOHAR	176	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37658	30	CHAUNTRA	177	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37659	30	DHARMPUR	178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37660	30	DRANG	179	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37661	30	GOPALPUR	180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37662	30	KARSOG	181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37663	30	MANDI SADAR	182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37664	30	SERAJ	183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37665	30	SUNDARNAGAR	184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37666	31	BASANTPUR	185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37667	31	CHAUHARA	186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37668	31	CHAUPAL	187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37669	31	JUBBAL KOTKHAI	188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37670	31	MASHOBRA	189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37671	31	NARKANDA	190	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37672	31	RAMPUR	191	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37673	31	ROHRU	192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37674	31	THEOG	193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37675	32	NAHAN	194	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37676	32	PACHHAD	195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37677	32	PAONTA SAHIB	196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37678	32	RAJGARH	197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37679	32	SANGRAH	198	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37680	32	SHILLAI	199	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37681	33	DHARAMPUR	200	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37682	33	KANDAGHAT	201	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37683	33	KUNIHAR	202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37684	33	NALAGARH	203	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37685	33	SOLAN	204	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37686	34	AMB	205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37687	34	BANGANA	206	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37688	34	GAGRET	207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37689	34	HAROLI	208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37690	34	UNA	209	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37691	35	AJNALA	210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37692	54	BHIKHI WIND-13	211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37693	35	CHOGAWAN	212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37694	54	CHOHLA SAHIB-8	213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37695	54	GANDIWIND-9	214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37696	35	HARSHE  CHHINA	215	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37697	35	JANDIALA GURU	216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37698	54	KHADUR-SAHIB-10	217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37699	35	MAJITHA	218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37700	54	NAUSHEHRA PANNUAN-11	219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37701	54	PATTI-14	220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37702	35	RAYYA	221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37703	54	TARN TARAN-12	222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37704	35	TARSIKKA	223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37705	54	VALTOHA-15	224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37706	35	VERKA	225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37707	36	BATHINDA	226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37708	36	BHAGTA BHAIKA	227	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37709	36	MAUR	228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37710	36	NATHANA	229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37711	36	PHUL	230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37712	36	RAMPURA	231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37713	36	SANGAT	232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37714	36	TALWANDI SABO	233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37715	37	FARIDKOT	234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37716	37	KOT KAPURA	235	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37717	38	AMLOH	236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37718	38	BASSI PATHANA	237	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37719	38	KHAMANO	238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37720	38	KHERA	239	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37721	38	SIRHIND	240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37722	55	ABOHAR	241	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37723	55	FAZILKA	242	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37724	39	FIROZPUR	243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37725	39	GHALL KHURD	244	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37726	39	GURU HAR SAHAI	245	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37727	55	JALALABAD	246	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37728	55	KHUIAN SARWAR	247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37729	39	MAKHU	248	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37730	39	MAMDOT	249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37731	39	ZIRA	250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37732	56	BAMIAL	251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37733	40	BATALA	252	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37734	40	DERA BABA NANAK	253	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37735	40	DHARIWAL	254	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37736	56	DHARKALAN	255	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37737	40	DINANAGAR	256	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37738	40	DORANGLA	257	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37739	40	FATEHGARH CHURIAN	258	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37740	40	GURDASPUR	259	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37741	40	KAHNUWAN	260	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37742	40	KALANAUR	261	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37743	56	NAROT JAIMAL SINGH	262	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37744	56	PATHANKOT	263	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37745	40	QADIAN	264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37746	40	SRI HARGOBINDPUR	265	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37747	56	SUJANPUR	266	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37748	41	BHUNGA	267	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37749	41	DASUYA	268	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37750	41	GARHSHANKAR	269	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37751	41	HAJIPUR	270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37752	41	HOSHIARPUR-I	271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37753	41	HOSHIARPUR-II	272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37754	41	MAHILPUR	273	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37755	41	MUKERIAN	274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37756	41	TALWARA	275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37757	41	TANDA	276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37758	42	ADAMPUR	277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37759	42	BHOGPUR	278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37760	42	JALANDHAR - WEST	279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37761	42	JALANDHAR-EAST	280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37762	42	LOHIAN	281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37763	42	NAKODAR	282	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37764	42	NURMAHAL	283	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37765	42	PHILLAUR	284	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37766	42	RURKA KALAN	285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37767	42	SHAHKOT	286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37768	43	DHILWAN	287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37769	43	KAPURTHALA	288	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37770	43	NADALA	289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37771	43	PHAGWARA	290	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37772	43	SULTANPUR LODHI	291	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37773	44	DEHLON	292	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37774	44	DORAHA	293	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37775	44	JAGRAON	294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37776	44	KHANNA	295	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37777	44	LUDHIANA-1	296	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37778	44	LUDHIANA-2	297	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37779	44	MACHHIWARA	298	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37780	44	PAKHOWAL	299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37781	44	RAIKOT	300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37782	44	SAMRALA	301	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37783	44	SIDHWAN BET	302	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37784	44	SUDHAR	303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37785	45	BHIKHI	304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37786	45	BUDHLADA	305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37787	45	JHUNIR	306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37788	45	MANSA	307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37789	45	SARDULGARH	308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37790	46	BAGHAPURANA	309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37791	46	KOT-ISE-KHAN	310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37792	46	MOGA-I	311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37793	46	MOGA-II	312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37794	46	NIHAL SINGH WALA	313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37795	47	GIDDERBAHA	314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37796	47	LAMBI	315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37797	47	MALOUT	316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37798	47	MUKTSAR	317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37799	48	AUR	318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37800	48	BALACHAUR	319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37801	48	BANGA	320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37802	48	NAWANSHAHR	321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37803	48	SAROYA	322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37804	49	BHUNER HERI	323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37805	53	DERA BASSI	324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37806	49	GHANAUR	325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37807	49	NABHA	326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37808	49	PATIALA	327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37809	49	PATRAN	328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37810	49	RAJPURA	329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37811	49	SAMANA	330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37812	49	SANOUR	331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37813	50	ANANDPUR SAHIB	332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37814	50	CHAMKAUR SAHIB	333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37815	53	KHARAR	334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37816	53	MAJRI	335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37817	50	MORINDA	336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37818	50	NURPUR BEDI	337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37819	50	RUPNAGAR	338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37820	51	AHMEDGARH	339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37821	51	ANDANA	340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37822	52	BARNALA	341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37823	51	BHAWANI GARH	342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37824	51	DHURI	343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37825	51	LEHRAGAGA	344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37826	51	MALERKOTLA	345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37827	52	MEHAL KALAN	346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37828	51	SANGRUR	347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37829	52	SEHNA	348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37830	51	SHERPUR	349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37831	51	SUNAM	350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37832	57	CHANDIGARH	351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37833	58	BHAISIYA CHHANA	352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37834	58	BHIKIYASAIN	353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37835	58	CHAUKHUTIYA	354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37836	58	DHAULADEVI	355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37837	58	DWARAHAT	356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37838	58	HAWALBAG	357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37839	58	LAMGARA	358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37840	58	SULT	359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37841	58	SYALDEY	360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37842	58	TAKULA	361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37843	58	TARIKHET	362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37844	59	BAGESHWAR	363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37845	59	GARUR	364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37846	59	KAPKOTE	365	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37847	60	DASHOLI	366	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37848	60	DEWAL	367	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37849	60	GAIRSAIN	368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37850	60	GHAT	369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37851	60	JOSHIMATH	370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37852	60	KARNAPRAYAG	371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37853	60	NARAYANBAGAR	372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37854	60	POKHARI	373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37855	60	THARALI	374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37856	61	BARAKOT	375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37857	61	CHAMPAWAT	376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37858	61	LOHAGHAT	377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37859	61	PATI	378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37860	62	CHAKRATA	379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37861	62	DOIWALA	380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37862	62	KALSI	381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37863	62	RAIPUR	382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37864	62	SAHASPUR	383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37865	62	VIKASNAGAR	384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37866	63	BAHADRABAD	385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37867	63	BHAGWANPUR	386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37868	63	KHANPUR	387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37869	63	LAKSAR	388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37870	63	NARSAN	389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37871	63	ROORKEE	390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37872	64	BETALGHAT	391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37873	64	BHIMTAL	392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37874	64	DHARI	393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37875	64	HALDWANI	394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37876	64	KOTABAG	395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37877	64	OKHALKANDA	396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37878	64	RAMGARH	397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37879	64	RAMNAGAR	398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37880	65	BIRONKHAL	399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37881	65	DUGGADA	400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37882	65	DWARIKHAL	401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37883	65	EKESHWAR	402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37884	65	KALJIKHAL	403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37885	65	KHIRSU	404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37886	65	KOT	405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37887	65	NAINIDANDA	406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37888	65	PABAU	407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37889	65	PAURI	408	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37890	65	POKHRA	409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37891	65	RIKHNIKHAL	410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37892	65	THALISAIN	411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37893	65	YAMKESHWAR	412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37894	65	ZAHRIKHAL	413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37895	66	BERINAG	414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37896	66	DHARCHULA	415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37897	66	DIDIHAT	416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37898	66	GANGOLIHAT	417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37899	66	KANALICHINA	418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37900	66	MUNAKOT	419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37901	66	MUNSYARI	420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37902	66	PITHORAGARH	421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37903	67	AUGUSTMUNI	422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37904	67	JAKHOLI	423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37905	67	UKHIMATH	424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37906	68	BHILANGNA	425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37907	68	CHAMBA	426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37908	68	DEOPRAYAG	427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37909	68	JAKHNIDHAR	428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37910	68	JAUNPUR	429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37911	68	KIRTINAGAR	430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37912	68	NARENDRA NAGAR	431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37913	68	PRATAPNAGAR	432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37914	68	THAULDHAR	433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37915	69	BAJPUR	434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37916	69	GADARPUR	435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37917	69	JASPUR	436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37918	69	KASHIPUR	437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37919	69	KHATIMA	438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37920	69	RUDRAPUR	439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37921	69	SITARGANJ	440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37922	70	BHATWARI	441	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37923	70	CHINYALISAUR	442	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37924	70	DUNDA	443	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37925	70	MORI	444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37926	70	NAUGAON	445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37927	70	PUROLA	446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37928	71	AMBALA-I	447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37929	71	AMBALA-II	448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37930	71	BARARA	449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37931	71	NARAINGARH	450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37932	71	SAHA	451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37933	71	SHAHZADPUR	452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37934	92	BADHRA	453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37935	72	BAWANI KHERA	454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37936	72	BEHAL	455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37937	72	BHIWANI	456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37938	72	KAIRU	459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37939	72	LOHARU	460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37940	72	SIWANI	461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37941	72	TOSHAM	462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37942	73	BALLABGARH	463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37943	73	FARIDABAD	464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37944	91	HASSANPUR	465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37945	91	HATHIN	466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37946	91	HODAL	467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37947	91	PALWAL	468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37948	74	BHATTU KALAN	469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37949	74	BHUNA	470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37950	74	FATEHABAD	471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37951	74	JAKHAL	472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37952	74	RATIA	473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37953	74	TOHANA	474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37954	75	FARRUKH NAGAR	475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37955	90	FEROZEPUR JHIRKA	476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37956	75	GURGAON	477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37957	90	NAGINA	478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37958	90	NUH	479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37959	75	PATAUDI	480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37960	90	PUNAHANA	481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37961	75	SOHNA	482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37962	90	TAORU	483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37963	76	ADAMPUR	484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37964	76	AGROHA	485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37965	76	BARWALA	486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37966	76	HANSI-I	487	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37967	76	HANSI-II	488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37968	76	HISAR-I	489	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37969	76	HISAR-II	490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37970	76	NARNAUND	491	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37971	76	UKLANA	492	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37972	77	BAHADURGARH	493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37973	77	BERI	494	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37974	77	JHAJJAR	495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37975	77	MATANNAIL	496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37976	77	SALHAWAS	497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37977	78	ALEWA	498	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37978	78	JIND	499	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37979	78	JULANA	500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37980	78	NARWANA	501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37981	78	PILLUKHERA	502	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37982	78	SAFIDON	503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37983	78	UCHANA	504	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37984	79	GUHLA	505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37985	79	KAITHAL	506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37986	79	KALAYAT	507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37987	79	PUNDRI	508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37988	79	RAJOUND	509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37989	79	SIWAN	510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37990	80	ASSANDH	511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37991	80	GHARAUNDA (PART)	512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37992	80	INDRI	513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37993	80	KARNAL	514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37994	80	NILOKHERI	515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37995	80	NISSING AT CHIRAO	516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37996	81	BABAIN	517	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37997	81	LADWA	518	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37998	81	PEHOWA	519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
37999	81	SHAHBAD	520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38000	81	THANESAR	521	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38001	82	ATELI NANGAL	522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38002	82	KANINA	523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38003	82	MAHENDRAGARH	524	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38004	82	NANGAL CHAUDHRY	525	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38005	82	NARNAUL	526	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38006	83	BARWALA	527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38007	83	MORNI	528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38008	83	PINJORE	529	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38009	83	RAIPUR RANI	530	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38010	84	BAPOLI	531	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38011	84	ISRANA	532	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38012	84	MADLAUDA	533	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38013	84	PANIPAT	534	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38014	84	SAMALKHA	535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38015	85	BAWAL	536	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38016	85	JATUSANA	537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38017	85	KHOL AT REWARI	538	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38018	85	NAHAR	539	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38019	85	REWARI	540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38020	86	KALANAUR	541	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38021	86	LAKHAN MAJRA	542	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38022	86	MAHAM	543	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38023	86	ROHTAK	544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38024	86	SAMPLA	545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38025	87	BARAGUDHA	546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38026	87	DABWALI	547	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38027	87	ELLENABAD	548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38028	87	NATHUSARI CHOPTA	549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38029	87	ODHAN	550	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38030	87	RANIA	551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38031	87	SIRSA	552	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38032	88	GANAUR	553	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38033	88	GOHANA	554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38034	88	KATHURA	555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38035	88	KHARKHODA	556	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38036	88	MUNDLANA	557	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38038	88	SONIPAT	559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38039	89	BILASPUR	560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38040	89	CHHACHHRAULI	561	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38041	89	JAGADHRI	562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38042	89	MUSTAFABAD	563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38043	89	RADAUR	564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38044	89	SADAURA (PART)	565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38045	93	ARAIN	566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38046	93	BHINAY	567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38047	93	JAWAJA	568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38049	93	SILORA	570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38050	93	MASOODA	571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38051	93	PISANGAN	572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38052	93	SRINAGAR	573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38053	94	BANSUR	574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38054	94	BEHROR	575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38055	94	KATHUMAR	576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38056	94	KISHANGARH BAS	577	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38057	94	KOTKASIM	578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38058	94	LACHHMANGARH	579	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38059	94	MANDAWAR	580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38060	94	NIMRANA	581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38061	94	RAJGARH	582	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38062	94	RAMGARH	583	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38063	94	RENI	584	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38064	94	THANAGAZI	585	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38065	94	TIJARA	586	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38066	94	UMREN	587	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38067	95	ANANDPURI	588	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38068	95	BAGIDORA	589	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38069	95	BANSWARA	590	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38070	95	GARHI	591	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38071	95	GHATOL	592	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38072	95	KUSHALGARH	593	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38073	125	PEEPAL KHOONT	594	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38074	95	SAJJANGARH	595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38075	96	ANTA	596	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38076	96	ATRU	597	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38077	96	BARAN (FULL)	598	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38078	96	CHHABRA	599	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38079	96	CHHIPABAROD	600	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38080	96	KISHANGANJ	601	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38081	96	SHAHBAD	602	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38082	97	BALTORA	603	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38083	97	BARMER	604	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38084	97	BAYTOO	605	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38085	97	CHOHTAN	606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38086	97	DHORIMANNA	607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38087	97	SHEO	608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38088	97	SINDHARI	609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38089	97	SIWANA	610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38090	98	BAYANA	611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38091	98	DEEG	612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38092	98	KAMAN	613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38093	98	KUMHER	614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38094	98	NADBAI	615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38095	98	NAGAR PAHARI	616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38096	98	RUPBAS	617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38097	98	SEWAR	618	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38098	98	WEIR	619	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38099	99	ASIND	620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38100	99	BANERA	621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38101	99	HURDA	622	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38102	99	JAHAZPUR	623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38103	99	KOTRI	624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38104	99	MANDAL	625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38105	99	MANDALGARH	626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38106	99	RAIPUR	627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38107	99	SAHARA	628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38108	99	SHAHPURA	629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38109	99	SUWANA	630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38110	100	BIKANER	631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38111	100	KOLAYAT	632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38112	100	LUNKARANSAR	633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38113	100	NOKHA	634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38114	100	SRI DUNGARGARH	635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38115	101	HINDOLI	636	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38116	101	KESHORAIPATAN	637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38117	101	NAINWA	638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38118	101	TALERA	639	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38119	125	ARNOD	640	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38120	102	BARI SADRI	641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38121	102	BEGUN	642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38122	102	BHADESAR	643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38123	102	BHAINSRORGARH	644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38124	102	BHOPALSAGAR	645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38125	125	CHHOTI SADRI	646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38126	102	CHITTAURGARH	647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38127	102	DUNGLA	648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38128	102	GANGRAR	649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38129	102	KAPASAN	650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38130	102	NIMBAHERA	651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38131	125	PRATAPGARH	652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38132	102	RASHMI	653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38133	103	CHURU	654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38134	103	RAJGARH	655	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38135	103	RATANGARH	656	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38136	103	SARDARSHAHAR	657	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38137	103	SUJANGARH	658	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38138	103	TARANAGAR	659	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38139	104	BANDIKUI	660	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38140	104	DAUSA	661	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38141	104	LALSOT	662	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38142	104	MAHWA	663	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38143	104	SIKRAI	664	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38144	105	BARI	665	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38145	105	BASERI	666	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38146	105	DHAULPUR	667	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38147	105	RAJAKHERA	668	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38148	106	ASPUR	669	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38149	106	BICHIWARA	670	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38150	106	DUNGARPUR	671	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38151	106	SAGWARA	672	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38152	106	SIMALWARA	673	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38153	107	ANUPGARH	674	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38154	107	GANGANAGAR	675	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38155	107	KARANPUR	676	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38156	107	PADAMPUR	677	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38157	107	RAISINGHNAGAR	678	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38158	107	SADULSHAHAR	679	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38159	107	SURATGARH	680	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38160	108	BHADRA	681	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38161	108	HANUMANGARH	682	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38162	108	NOHAR	683	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38163	109	AMBER	684	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38164	109	BASSI	685	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38165	109	CHAKSU	686	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38166	109	DUDU	687	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38167	109	GOVINDGARH	688	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38168	109	JAMWA RAMGARH	689	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38169	109	JHOTWARA	690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38170	109	KOTPUTLI	691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38171	109	PHAGI	692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38172	109	SAMBHAR	693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38173	109	SANGANER	694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38174	109	SHAHPURA	695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38175	109	VIRATNAGAR	696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38176	110	JAISALMER	697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38177	110	SAM	698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38178	110	SANKRA	699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38179	111	AHORE	700	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38180	111	BHINMAL	701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38181	111	JALORE	702	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38182	111	JASWANTPURA	703	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38183	111	RANIWARA	704	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38184	111	SANCHORE	705	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38185	111	SAYLA	706	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38186	112	BAKANI	707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38187	112	DAG	708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38188	112	JHALRAPATAN	709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38189	112	KHANPUR	710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38190	112	MANOHARTHANA	711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38191	112	PIRAWA (SUNEL)	712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38192	113	ALSISAR	713	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38193	113	BUHANA	714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38194	113	CHIRAWA	715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38195	113	JHUNJHUNUN	716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38196	113	KHETRI	717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38197	113	NAWALGARH	718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38198	113	SURAJGARH	719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38199	113	UDAIPURWATI	720	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38200	114	BALESAR	721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38202	114	BHOPALGARH	723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38203	114	BILARA	724	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38204	114	LUNI	725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38205	114	MANDOR	726	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38206	114	OSIAN	727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38207	114	PHALODI	728	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38208	114	SHERGARH	729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38209	115	HINDAUN	730	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38210	115	KARAULI	731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38211	115	NADAUTI	732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38212	115	SAPOTRA	733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38213	115	TODABHIM	734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38214	116	ITAWA	735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38215	116	KHAIRABAD	736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38216	116	LADPURA	737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38217	116	SANGOD	738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38218	116	SULTANPUR	739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38219	117	DEGANA	740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38220	117	DIDWANA	741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38221	117	JAYAL	742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38222	117	KUCHAMAN	743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38223	117	LADNU	744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38224	117	MAKRANA	745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38225	117	MERTA	746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38226	117	MUNDWA	747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38227	117	NAGAUR	748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38228	117	PARBATSAR	749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38229	117	RIYAN BADI	750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38230	118	BALI	751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38231	118	DESURI	752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38232	118	JAITARAN	753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38233	118	KHARCHI(MAR.JUN)	754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38234	118	PALI	755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38235	118	RAIPUR	756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38236	118	RANI STATION	757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38237	118	ROHAT	758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38238	118	SOJAT	759	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38239	118	SUMERPUR	760	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38240	119	AMET	761	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38241	119	BHIM	762	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38242	119	DEOGARH	763	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38243	119	KHAMNOR	764	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38244	119	KUMBHALGARH	765	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38245	119	RAILMAGRA	766	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38246	119	RAJSAMAND	767	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38247	120	BAMANWAS	768	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38248	120	BONLI	769	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38249	120	GANGAPUR CITY	770	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38250	120	KHANDAR	771	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38251	120	SAWAI MADHOPUR	772	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38252	121	DANTA RAMGARH	773	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38253	121	DHOD	774	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38254	121	FATEHPUR	775	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38255	121	KHANDELA	776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38256	121	LACHHMANGARH	777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38257	121	NEEM KA THANA	778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38258	121	PIPRALI	779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38259	121	SRI MADHOPUR	780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38260	122	ABU ROAD	781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38261	122	PINDWARA	782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38262	122	REODAR	783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38263	122	SHEOGANJ	784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38264	122	SIROHI	785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38265	123	DEOLI	786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38266	123	MALPURA	787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38267	123	NEWAI	788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38268	123	TODARAISINGH	789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38269	123	TONK	790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38270	123	UNIARA	791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38271	124	BARGAON	792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38272	124	BHINDER	793	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38273	125	DHARIAWAD	794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38274	124	GIRWA	795	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38275	124	GOGUNDA	796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38276	124	JHADOL	797	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38277	124	KHERWARA	798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38278	124	KOTRA	799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38279	124	MAVLI	800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38280	124	SALUMBAR	801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38281	124	SARADA	802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38282	126	ACHHNERA	803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38283	126	AKOLA	804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38284	126	BAH	805	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38285	126	BARAULI AHIR	806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38286	126	BICHPURI	807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38287	126	ETMADPUR	808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38288	126	FATEHABAD	809	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38289	126	FATEHPUR SIKRI	810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38290	126	JAGNER	811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38291	126	JAITPUR KALAN	812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38292	126	KHANDAULI	813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38293	126	KHERAGARH	814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38294	126	PINAHAT	815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38295	126	SAIYAN	816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38296	126	SHAMSABAD	817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38297	127	AKRABAD	818	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38298	127	ATRAULI	819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38299	127	BIJAULI	820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38300	127	CHANDAUS	821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38301	127	DHANIPUR	822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38302	127	GANGIRI	823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38303	127	GONDA	824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38304	127	IGLAS	825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38305	127	JAWAN SIKANDERPUR	826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38306	127	KHAIR	827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38307	127	LODHA	828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38308	127	TAPPAL	829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38309	128	BAHADURPUR	830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38310	128	BAHRIA	831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38311	128	CHAKA	832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38312	128	DHANUPUR	833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38313	128	HANDIA	834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38314	128	HOLAGARH	835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38315	128	JASRA	836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38316	128	KARCHHANA	837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38317	128	KAUDHIYARA	838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38318	128	KAURIHAR	839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38319	128	KORAON	840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38320	128	MANDA	841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38321	128	MAUAIMA	842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38322	128	MEJA	843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38323	128	PHULPUR	844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38324	128	PRATAPPUR	845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38325	128	SAIDABAD	846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38326	128	SHANKARGARH	847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38327	128	SORAON	848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38328	128	URUWAN	849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38329	129	AKBARPUR	850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38330	129	BASKHARI	851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38331	129	BHITI	852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38332	129	BHIYAWAN	853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38333	129	JAHANGIR GANJ	854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38334	129	JALAL PUR	855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38335	129	KATEHARI	856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38336	129	RAM NAGAR	857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38337	129	TANDA	858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38338	130	ACHCHALDA	859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38339	130	AJITMAL	860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38340	130	AURAIYA	861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38341	130	BHAGYANAGAR	862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38342	130	BIDHUNA	863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38343	130	ERWA KATRA	864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38344	130	SAHAR	865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38345	131	AHIRAULA	866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38346	131	ATRAULIA	867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38347	131	AZMATGARH	868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38348	131	BILARIYAGANJ	869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38349	131	HARAIYA	870	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38350	131	JAHANAGANJ	871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38351	131	KOILSA	872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38352	131	LALGANJ	873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38353	131	MAHRAJGANJ	874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38354	131	MARTINGANJ	875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38355	131	MEHNAGAR	876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38356	131	MIRZAPUR	877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38357	131	MOHAMMADPUR	878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38358	131	PALHANA	879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38359	131	PALHANI	880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38360	131	PAWAI	881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38361	131	PHULPUR	882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38362	131	RANI KI SARAI	883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38363	131	SATHIYAON	884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38364	131	TAHBARPUR	885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38365	131	TARWA	886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38366	131	THEKMA	887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38367	132	BAGHPAT	888	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38368	132	BARAUT	889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38369	132	BINAULI	890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38370	132	CHHAPRAULI	891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38371	132	KHEKRA	892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38372	132	PILANA	893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38373	133	BALAHA	894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38374	133	CHITAURA	895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38375	133	HUZOORPUR	896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38376	133	JARWAL	897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38377	133	KAISARGANJ	898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38378	133	MAHASI	899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38379	133	MIHINPURWA	900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38380	133	NAWABGANJ	901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38381	133	PHAKHARPUR	902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38382	133	PAYAGPUR	903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38383	133	RISIA	904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38384	133	SHIVPUR	905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38385	133	TEJWAPUR	906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38386	133	VISHESHWARGANJ	907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38387	134	BAIRIA	908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38388	134	BANSDIH	909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38389	134	BELHARI	910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38390	134	BERUARBARI	911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38391	134	CHILKAHAR	912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38392	134	DUBHAR	913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38393	134	GARWAR	914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38394	134	HANUMANGANJ	915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38395	134	MANIAR	916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38396	134	MURLICHHAPRA	917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38397	134	NAGRA	918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38398	134	NAVANAGAR	919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38399	134	PANDAH	920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38400	134	RASRA	921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38401	134	REOTI	922	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38402	134	SIAR	923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38403	134	SOHANV	924	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38404	135	BALRAMPUR	925	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38405	135	GAINDAS BUJURG	926	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38406	135	GAISRI	927	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38407	135	HARRIYA SATGHARWA	928	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38408	135	PACHPEDWA	929	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38409	135	REHERA BAZAAR	930	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38410	135	SHRIDUTTGANJ	931	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38411	135	TULSIPUR	932	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38412	135	UTRAULA	933	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38413	136	BABERU	934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38414	136	BADOKHAR KHURD	935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38415	136	BISANDA	936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38416	136	JASPURA	937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38417	136	KAMASIN	938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38418	136	MAHUVA	939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38419	136	NARAINI	940	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38420	136	TINDWARI	941	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38421	137	BANI KODAR	942	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38422	137	BANKI	943	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38423	137	DARIYABAD	944	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38424	137	DEWA	945	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38425	137	FATEHPUR	946	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38426	137	HAIDARGARH	947	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38427	137	HARAKH	948	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38428	137	MASAULI	949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38429	137	NINDAURA	951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38430	137	PUREDALAI	952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38431	137	RAMNAGAR	953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38432	148	RUDAULI	954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38433	137	SIDHAUR	955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38434	137	SIRAULI GAUSPUR	956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38435	137	SURATGANJ	957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38436	137	TRIVEDIGANJ	958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38437	138	AALAMPUR JAFARABAD	959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38438	138	BAHERI	960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38439	138	BHADPURA	961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38440	138	BHOJIPURA	962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38441	138	BHUTA	963	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38442	138	BITHIRI CHAINPUR	964	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38443	138	DAMKHAUDA	965	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38444	138	FARIDPUR	966	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38445	138	FATEHGANJ WEST	967	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38446	138	KYARA	968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38447	138	MAJHGAWAN	969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38448	138	MIRGANJ	970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38449	138	NAWABGANJ	971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38450	138	RAMNAGAR	972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38451	138	SHERGARH	973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38452	139	BAHADURPUR	974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38453	139	BANKATI	975	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38454	139	BASTI	976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38455	139	DUBAULIYA	977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38456	139	GAUR	978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38457	139	HARRAIYA	979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38458	139	KAPTANGANJ	980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38459	139	KUDARAHA	981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38460	139	PARAS RAMPUR	982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38461	139	RAMNAGAR	983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38462	139	RUDAULI	984	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38463	139	SALTAUA GOPAL PUR	985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38464	139	SAU GHAT	986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38465	139	VIKRAM JOT	987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38466	140	AFZALGARH	988	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38467	140	BUDHANPUR SEOHARA	989	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38468	140	DHAMPUR	990	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38469	140	HALDAUR(KHARI JHALU)	991	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38470	140	JALILPUR	992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38471	140	KIRATPUR	993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38472	140	KOTWALI	994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38473	140	MOHAMMEDPUR DEOMAL	995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38474	140	NAJIBABAD	996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38475	140	NEHTAUR	997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38476	140	NOORPUR	998	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38477	141	AMBIAPUR	999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38478	141	ASAFPUR	1000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38479	141	BISAULI	1001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38480	141	DAHGAVAN	1002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38481	141	DATAGANJ	1003	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38483	141	ISLAMNAGAR	1005	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38484	141	JAGAT	1006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38485	198	JUNAWAI	1007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38486	141	MION	1008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38487	141	QADAR CHOWK	1009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38488	198	RAJPURA	1010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38489	141	SAHASWAN	1011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38490	141	SALARPUR	1012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38491	141	SAMRER	1013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38492	141	UJHANI	1014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38493	141	USAWAN	1015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38494	141	WAZIRGANJ	1016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38495	142	AGAUTA	1017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38496	142	ANUPSHAHR	1018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38497	142	ARANIYA	1019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38498	142	BHAWAN BAHADUR NAGAR	1020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38499	142	BULANDSHAHR	1021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38500	142	DANPUR	1022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38501	142	DIBAI	1023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38502	142	GULAOTHI	1024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38503	142	JAHANGIRABAD	1025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38504	142	KHURJA	1026	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38505	142	LAKHAOTHI	1027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38506	142	PAHASU	1028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38507	142	SHIKARPUR	1029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38508	142	SIKANDRABAD	1030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38509	142	SYANA	1031	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38510	142	UNCHAGAON	1032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38511	143	BERAHANI	1033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38512	143	CHAHNIYA	1034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38513	143	CHAKIYA	1035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38514	143	CHANDAULI	1036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38515	143	DHANAPUR	1037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38516	143	NAUGARH	1038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38517	143	NIYAMATABAD	1039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38518	143	SAHABGANJ	1040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38519	143	SAKALDIHA	1041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38520	144	KARWI	1042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38521	144	MANIKPUR	1043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38522	144	MAU	1044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38523	144	PAHARI	1045	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38524	144	RAMNAGAR	1046	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38525	145	BAITALPUR	1047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38526	145	BANKATA	1048	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38527	145	BARHAJ	1049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38528	145	BHAGALPUR	1050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38529	145	BHALUANI	1051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38530	145	BHATNI	1052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38531	145	BHATPAR RANI	1053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38532	145	DEORIA SADAR	1054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38533	145	DESAI DEORIA	1055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38534	145	GAURI BAZAR	1056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38535	145	LAR	1057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38536	145	PATHAR DEWA	1058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38537	145	RAMPUR KARKHANA	1059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38538	145	RUDRAPUR	1060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38539	145	SALEMPUR	1061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38540	145	TARKALUA	1062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38541	146	ALIGANJ	1063	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38542	196	AMANPUR	1064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38543	146	AWAGARH	1065	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38544	196	GANJ DUNDWARA	1066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38545	146	JAITHARA	1067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38546	146	JALESAR	1068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38547	196	KASGANJ	1069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38548	146	MAREHRA	1070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38549	146	NIDHAULI KALAN	1071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38550	196	PATIYALI	1072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38551	196	SAHAWAR	1073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38552	146	SAKIT	1074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38553	146	SHITALPUR	1075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38554	196	SIDHPURA	1076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38555	196	SORON	1077	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38556	147	BARHPURA	1078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38557	147	BASREHAR	1079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38558	147	BHARTHANA	1080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38559	147	CHAKARNAGAR	1081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38560	147	JASWANTNAGAR	1082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38561	147	MAHEWA	1083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38562	147	SEFAI	1084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38563	147	TAKHA	1085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38564	148	AMANIGANJ	1086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38565	148	BIKAPUR	1087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38566	148	HARIYANGATANGANJ	1088	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38567	148	MASODHA	1089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38568	148	Mawai	1090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38569	148	MAYA BAZAR	1091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38570	148	MILKIPUR	1092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38571	148	PURA BAZAR	1093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38572	148	SOHAWAL	1094	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38573	148	TARUN	1095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38574	149	BARHPUR	1096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38575	149	KAIMGANJ	1097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38576	149	KAMALGANJ	1098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38577	149	MOHAMDABAD	1099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38578	149	NAWABGANJ	1100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38579	149	RAJEPUR	1101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38580	149	SHAMSABAD	1102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38581	150	AIRAYAN	1103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38582	150	AMAULI	1104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38583	150	ASOTHAR	1105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38584	150	BAHUA	1106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38585	150	BHITAURA	1107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38586	150	DEVMAI	1108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38587	150	DHATA	1109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38588	150	HASWA	1110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38589	150	HATHGAON	1111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38590	150	KHAJUHA	1112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38591	150	MALWAN	1113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38592	150	TELYANI	1114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38593	150	VIJAYIPUR	1115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38594	151	ARAON	1116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38595	151	EKA	1117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38596	151	FIROZABAD	1118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38597	151	HATHWANT	1119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38598	151	JASRANA	1120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38599	151	MADANPUR	1121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38600	151	NARKHI	1122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38601	151	SHIKOHABAD	1123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38602	151	TUNDLA	1124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38603	152	BISRAKH	1125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38604	152	DADRI	1126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38605	152	DANKAUR	1127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38606	152	JEWAR	1128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38607	153	BHOJPUR	1129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38608	200	DHAULANA	1130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38609	200	GARH MUKTESHWAR	1131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38610	200	HAPUR	1132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38611	153	LONI	1133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38612	153	MURADNAGAR	1134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38613	153	RAJAPUR	1135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38614	200	SIMBHAWALI	1136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38615	154	BHADAURA	1137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38616	154	BHANWARKOL	1138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38617	154	DEVKALI	1139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38618	154	GHAZIPUR	1140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38619	154	JAKHANIA	1141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38620	154	KARANDA	1142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38621	154	KASIMABAD	1143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38622	154	MANIHARI	1144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38623	154	MARDAH	1145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38624	154	MOHAMMADABAD	1146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38625	154	REVATIPUR	1147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38626	154	SADAT	1148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38627	154	SAIDPUR	1149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38628	154	VARACHAKWAR	1150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38629	154	VIRNO	1151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38630	154	ZAMANIA	1152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38631	155	BABHANJOT	1153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38632	155	BELSAR	1154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38633	155	CHHAPIA	1155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38634	155	COLONELGANJ	1156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38635	155	HALDHARMAU	1157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38636	155	ITIATHOK	1158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38637	155	JHANJHARI	1159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38638	155	KATRA BAZAR	1160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38639	155	MANKAPUR	1161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38640	155	MUJEHANA	1162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38641	155	NAWABGANJ	1163	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38642	155	PANDRI KRIPAL	1164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38643	155	PARASPUR	1165	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38644	155	RUPAIDEEH	1166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38645	155	TARABGANJ	1167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38646	155	WAZIRGANJ	1168	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38647	156	BANSGAON	1169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38648	156	BARHALGANJ	1170	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38649	156	BELGHAT	1171	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38650	156	BHATHAT	1172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38651	156	BRAHMPUR	1173	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38652	156	CAMPIERGANJ	1174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38653	156	CHARGAWAN	1175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38654	156	GAGAHA	1176	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38655	156	GOLA	1177	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38656	156	JANGAL KAUDIA	1178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38657	156	KAURI RAM	1179	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38658	156	KHAJNI	1180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38659	156	KHORABAR	1181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38660	156	PALI	1182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38661	156	PIPRAICH	1183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38662	156	PIPRAULI	1184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38663	156	SAHJANAWA	1185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38664	156	SARDARNAGAR	1186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38665	156	URUWA	1187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38666	157	GOHAND	1188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38667	157	KURARA	1189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38668	157	MAUDAHA	1190	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38669	157	MUSKARA	1191	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38670	157	RATH	1192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38671	157	SARILA	1193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38672	157	SUMERPUR	1194	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38673	158	AHIRORI	1195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38674	158	BAWAN	1196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38675	158	BEHENDAR	1197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38676	158	BHARAWAN	1198	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38677	158	BHARKHANI	1199	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38678	158	BILGRAM	1200	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38679	158	HARIYAWAN	1201	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38680	158	HARPALPUR	1202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38681	158	KACHAUNA	1203	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38682	158	KOTHAWAN	1204	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38683	158	MADHOGANJ	1205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38684	158	MALLAWAN	1206	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38685	158	PIHANI	1207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38686	158	SANDI	1208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38687	158	SANDILA	1209	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38688	158	SHAHABAD	1210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38689	158	SURSA	1211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38690	158	TANDIYAWAN	1212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38691	158	TODARPUR	1213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38692	159	DAKORE	1214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38693	159	JALAUN	1215	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38694	159	KADAURA	1216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38695	159	KONCH	1217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38696	159	KUTHAUND	1218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38697	159	MADHOGARH	1219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38698	159	MAHEVA	1220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38699	159	NADIGAON	1221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38700	159	RAMPURA	1222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38701	160	BADLA PUR	1223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38702	160	BAKSHA	1224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38703	160	BARASATHI	1225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38704	160	DHARMA PUR	1226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38705	160	DOBHI	1227	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38706	160	JALAL PUR	1228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38707	160	KARANJA KALA	1229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38708	160	KERAKAT	1230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38709	160	KHUTHAN	1231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38710	160	MACHCHALI SHAHAR	1232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38711	160	MAHARAJ GANJ	1233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38712	160	MARIYAHU	1234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38713	160	MUFTI GANJ	1235	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38714	160	MUNGRA BADSHAH PUR	1236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38715	160	RAM NAGAR	1237	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38716	160	RAM PUR	1238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38717	160	SHAH GANJ	1239	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38718	160	SIKRARA	1240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38719	160	SIRKONI	1241	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38720	160	SUITHA KALA	1242	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38721	160	SUJAN GANJ	1243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38722	161	BABINA	1244	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38723	161	BADAGAON	1245	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38724	161	BAMAUR	1246	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38725	161	BANGRA	1247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38726	161	CHIRGAON	1248	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38727	161	GURSARAI	1249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38728	161	MAURANIPUR	1250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38729	161	MOTH	1251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38730	162	AMROHA	1252	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38731	162	DHANAURA	1253	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38732	162	GAJRAULA	1254	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38733	162	GANGESHWARI	1255	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38734	162	HASANPUR	1256	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38735	162	JOYA	1257	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38736	163	CHHIBRAMAU	1258	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38737	163	GUGHRAPUR	1259	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38738	163	HASERAN	1260	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38739	163	JALALABAD	1261	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38740	163	KANNAUJ	1262	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38741	163	SAURIKH	1263	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38742	163	TALGRAM	1264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38743	163	UMARDA	1265	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38744	164	AKBARPUR	1266	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38745	164	AMRODHA	1267	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38746	164	DERAPUR	1268	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38747	164	JHINJHAK	1269	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38748	164	MAITHA	1270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38749	164	MALASA	1271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38750	164	RAJPUR	1272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38751	164	RASULABAD	1273	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38752	164	SANDALPUR	1274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38753	164	SARBANKHERA	1275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38754	165	BHITARGAON	1276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38755	165	BILHAUR	1277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38756	165	CHAUBEYPUR	1278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38757	165	GHATAMPUR	1279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38758	165	KAKWAN	1280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38759	165	KALYANPUR	1281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38760	165	PATARA	1282	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38761	165	SARSOL	1283	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38762	165	SHIVRAJPUR	1284	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38763	165	VIDHUNU	1285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38764	166	CHAIL	1286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38765	166	KARA	1287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38766	166	KAUSHAMBI	1288	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38767	166	MANJHANPUR	1289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38768	166	MOORATGANJ	1290	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38769	166	NEVADA	1291	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38770	166	SARSAWAN	1292	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38771	166	SIRATHU	1293	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38772	167	BANKEYGANJ	1294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38773	167	BEHJAM	1295	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38774	167	BIJUWA	1296	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38775	167	DHAURHARA	1297	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38776	167	ISANAGAR	1298	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38777	167	KUMBHIGOLA	1299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38778	167	LAKHIMPUR	1300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38779	167	MITAULI	1301	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38780	167	MOHAMMADI	1302	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38781	167	NAKAHA	1303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38782	167	NIGHASAN	1304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38783	167	PALIA	1305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38784	167	PASGAWAN	1306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38785	167	PHOOLBEHAR	1307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38786	167	RAMIA BEHAR	1308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38787	168	DUDHAHI	1309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38788	168	FAZILNAGAR	1310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38789	168	HATA	1311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38790	168	KAPTAINGANJ	1312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38791	168	KASAYA	1313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38792	168	KHADDA	1314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38793	168	MOTICHAK	1315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38794	168	NEBUA NAURANGIA	1316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38795	168	PADRAUNA	1317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38796	168	RAMKOLA	1318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38797	168	SEORAHI	1319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38798	168	SUKRAULI	1320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38799	168	TAMKUHIRAJ	1321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38800	168	VISHUNPURA	1322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38801	169	BAR	1323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38802	169	BIRDHA	1324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38803	169	JAKHAURA	1325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38804	169	MANDAWARA	1326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38805	169	MEHRONI	1327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38806	169	TALBEHAT	1328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38807	170	BAKSHI-KA-TALAB	1329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38808	170	CHINHAT	1330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38809	170	GOSAIGANJ	1331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38810	170	KAKORI	1332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38811	170	MAL	1333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38812	170	MALIHABAD	1334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38813	170	MOHANLALGANJ	1335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38814	170	SAROJANINAGAR	1336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38815	171	HASAYAN	1337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38816	171	HATHRAS	1338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38817	171	MURSAN	1339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38818	171	SADABAD	1340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38819	171	SASNI	1341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38820	171	SEHPAU	1342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38821	171	SIKANDRARAO	1343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38822	172	BRIDGEMANGANJ	1344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38823	172	DHANI	1345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38824	172	GHUGHLI	1346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38825	172	LAKSHMIPUR	1347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38826	172	MAHRAJGANJ	1348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38827	172	MITHAURA	1349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38828	172	NAUTANWA	1350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38829	172	NICHLAUL	1351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38830	172	PANIYARA	1352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38831	172	PARTAWAL	1353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38832	172	PHARENDA	1354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38833	172	SISWA	1355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38834	173	CHARKHARI	1356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38835	173	JAITPUR	1357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38836	173	KABRAI	1358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38837	173	PANWARI	1359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38838	174	BARNAHAL	1360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38839	174	BEWAR	1361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38840	174	GHIROR	1362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38841	174	JAGEER	1363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38842	174	KARHAL	1364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38843	174	KISHNI	1365	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38844	174	KURAOLI	1366	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38845	174	MAINPURI	1367	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38846	174	SULTANGANJ	1368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38847	175	BALDEO	1369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38848	175	CHAUMUHA	1370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38849	175	CHHATA	1371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38850	175	FARAH	1372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38851	175	GOVARDHAN	1373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38852	175	MAT	1374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38853	175	MATHURA	1375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38854	175	NANDGAON	1376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38855	175	NOHJHIL	1377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38856	175	RAYA	1378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38857	176	BADRAON	1379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38858	176	DOHRI GHAT	1380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38859	176	FATEHPUR MADAUN	1381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38860	176	GHOSI	1382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38861	176	KOPAGANJ	1383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38862	176	MOHAMMADABAD GOHANA	1384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38863	176	PARDAHA	1385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38864	176	RANIPUR	1386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38865	176	RATANPURA	1387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38866	177	DAURALA	1388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38867	177	HASTINAPUR	1389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38868	177	JANIKHURD	1390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38869	177	KHARKHODA	1391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38870	177	MACHRA	1392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38871	177	MAWANA KALAN	1393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38872	177	MEERUT	1394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38873	177	PARIKSHITGARH	1395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38874	177	RAJPURA	1396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38875	177	ROHTA	1397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38876	177	SARDHANA	1398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38877	177	SARURPUR KHURD	1399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38878	178	CHHANVEY	1400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38879	178	HALLIA	1401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38880	178	JAMALPUR	1402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38881	178	KON	1403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38882	178	LALGANJ	1404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38883	178	MAJHAWA	1405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38884	178	NAGAR (CITY)	1406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38885	178	NARAINPUR	1407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38886	178	PAHARI	1408	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38887	178	PATEHRA	1409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38888	178	RAJGARH	1410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38889	178	SHIKHAR	1411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38890	198	ASMAULI	1412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38891	198	BAHJOI	1413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38892	198	BANIYAKHERA	1414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38893	179	BHAGATPUR TANDA	1415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38894	179	BILARI	1416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38895	179	CHHAJLET	1417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38896	179	DILARI	1418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38897	179	KUNDARKI	1419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38898	179	MORADABAD	1420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38899	179	MUNDA PANDEY	1421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38900	198	PANWASA	1422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38901	198	SAMBHAL	1423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38902	179	THAKURDWARA	1424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38903	180	BAGHARA	1425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38904	180	BUDHANA	1426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38905	180	CHARTHAWAL	1427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38906	180	JANSATH	1428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38907	199	KAIRANA	1429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38908	199	KANDHLA	1430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38909	180	KHATAULI	1431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38910	180	MORNA	1432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38911	180	MUZAFFARNAGAR	1433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38912	180	PURKAJI	1434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38913	180	SHAHPUR	1435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38914	199	SHAMLI	1436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38915	199	THANA BHAWAN	1437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38916	199	UN	1438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38917	181	AMARIYA	1439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38918	181	BARKHERA	1440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38919	181	BILSANDA	1441	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38920	181	BISALPUR	1442	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38921	181	LALAURIKHERA	1443	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38922	181	MARORI	1444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38923	181	PURANPUR	1445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38924	182	ASPUR DEOSARA	1446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38925	182	BABA BELKHARNATH DHAM	1447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38926	182	BABAGANJ	1448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38927	182	BIHAR	1449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38928	182	GAURA	1450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38929	182	KALAKANKAR	1451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38930	182	KUNDA	1452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38931	182	LAKSHAMANPUR	1453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38932	182	LALGANJ	1454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38933	182	MAGRAURA	1455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38934	182	MANDHATA	1456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38935	182	PATTI	1457	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38936	182	PRATAPGARH (SADAR)	1458	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38937	182	RAMPUR SANRAMGARH	1459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38938	182	SANDWA CHANDRIKA	1460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38939	182	SANGIPUR	1461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38940	182	SHIVGARH	1462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38941	183	AMAWAN	1463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38942	183	BACHHARAWAN	1464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38943	197	BAHADURPUR	1465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38944	183	CHHATOH	1466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38945	183	DALMAU	1467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38946	183	DEENSHAH GAURA	1468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38947	183	DIH	1469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38948	183	HARCHANDPUR	1470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38949	183	JAGATPUR	1471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38950	183	KHIRON	1472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38951	183	LALGANJ	1473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38952	183	MAHRAJGANJ	1474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38953	183	RAHI	1475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38954	183	ROHANIA	1476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38955	183	SALON	1477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38956	183	SARENI	1478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38957	183	SATAON	1479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38958	183	SHIVGARH	1480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38959	197	SINGHPUR	1481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38960	197	TILOI	1482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38961	183	UNCHAHAR	1483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38962	184	BILASPUR	1484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38963	184	CHAMRAON	1485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38964	184	MILAK	1486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38965	184	SAIDNAGAR	1487	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38966	184	SHAHABAD	1488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38967	184	SUAR	1489	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38968	185	BALLIA KHERI	1490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38969	185	DEOBAND	1491	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38970	185	GANGOH	1492	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38971	185	MUZAFFARABAD	1493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38972	185	NAGAL	1494	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38973	185	NAKUR	1495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38974	185	NANAUTA	1496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38975	185	PUWARKA	1497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38976	185	RAMPUR MANIHARAN	1498	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38977	185	SADAULI QADEEM	1499	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38978	185	SARSAWAN	1500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38979	186	BAGHAULI	1501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38980	186	BELHAR KALA	1502	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38981	186	HAINSAR BAZAR	1503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38982	186	KHALILABAD	1504	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38983	186	MEHDAWAL	1505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38984	186	NATH NAGAR	1506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38985	186	PAULI	1507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38986	186	SANTHA	1508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38987	186	SEMARIYAWAN	1509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38988	187	ABHAULI	1510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38989	187	AURAI	1511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38990	187	BHADOHI	1512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38991	187	DEEGH	1513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38992	187	GYANPUR	1514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38993	187	SURIYAVAN	1515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38994	188	BANDA	1516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38995	188	BHAWAL KHERA	1517	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38996	188	DADROL	1518	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38997	188	JAITIPUR	1519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38998	188	JALALABAD	1520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
38999	188	KALAN	1521	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39000	188	KANTH	1522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39001	188	KHUDAGANJ KATRA	1523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39002	188	KHUTAR	1524	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39003	188	MADNAPUR	1525	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39004	188	MIRZAPUR	1526	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39005	188	NIGOHI	1527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39006	188	POWAYAN	1528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39007	188	SINDHAULI	1529	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39008	188	TILHAR	1530	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39009	189	EKONA	1531	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39010	189	GILAULA	1532	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39011	189	HARIHARPUR RANI	1533	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39012	189	JAMUNAHA	1534	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39013	189	SIRSIYA	1535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39014	190	BANSI	1536	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39015	190	BARHNI	1537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39016	190	BHANWAPUR	1538	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39017	190	BIRDPUR	1539	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39018	190	DOMARIYAGANJ	1540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39019	190	ITWA	1541	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39020	190	JOGIA	1542	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39021	190	KHESRAHA	1543	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39022	190	KHUNIYAON	1544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39023	190	LOTAN	1545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39024	190	MITHWAL	1546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39025	190	NAUGARH	1547	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39026	190	SHOHARATGARH	1548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39027	190	USKA BAZAR	1549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39028	191	AILIYA	1550	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39029	191	BEHTA	1551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39030	191	BISWAN	1552	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39031	191	GONDLAMAU	1553	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39032	191	HARGAON	1554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39033	191	KASMANDA	1555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39034	191	KHAIRABAD	1556	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39035	191	LAHARPUR	1557	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39036	191	MACHHREHTA	1558	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39037	191	MAHMUDABAD	1559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39038	191	MAHOLI	1560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39039	191	MISRIKH	1561	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39040	191	PAHALA	1562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39041	191	PARSENDI	1563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39042	191	PISAWAN	1564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39043	191	RAMPUR MATHURA	1565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39044	191	REUSA	1566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39045	191	SAKRAN	1567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39046	191	SIDHAULI	1568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39047	192	BABHANI	1569	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39048	192	CHATRA	1570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39049	192	CHOPAN	1571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39050	192	DUDHI	1572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39051	192	GHORAWAL	1573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39052	192	MYORPUR	1574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39053	192	NAGWA	1575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39054	192	ROBERTSGANJ	1576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39055	193	AKHAND NAGAR	1577	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39056	197	AMETHI	1578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39057	193	BALDIRAI	1579	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39058	193	BHADAIYA	1580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39059	197	BHADAR	1581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39060	197	BHETUA	1582	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39061	193	DHANPATGANJ	1583	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39062	193	DOSTPUR	1584	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39063	193	DUBEPUR	1585	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39064	197	GAURIGANJ	1586	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39065	197	JAGDISHPUR	1587	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39066	193	JAISINGHPUR	1588	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39067	197	JAMO	1589	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39068	193	KADIPUR	1590	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39069	193	KUREBHAR	1591	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39070	193	KURWAR	1592	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39071	193	LAMBHUA	1593	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39072	193	MOTIGARPUR	1594	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39073	197	MUSAFIR KHANA	1595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39074	193	P.P.KAMAICHA	1596	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39075	197	SANGRAMPUR	1597	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39076	197	SHAHGARH	1598	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39077	197	SHUKUL BAZAR	1599	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39078	194	ASOHA	1600	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39079	194	AURAS	1601	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39080	194	BANGARMAU	1602	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39081	194	BICHHIYA	1603	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39082	194	BIGHAPUR	1604	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39083	194	FATEHPUR CHAURASI	1605	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39084	194	GANJ MORADABAD	1606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39085	194	HASANGANJ	1607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39086	194	HILAULI	1608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39087	194	MIANGANJ	1609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39088	194	NAWABGANJ	1610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39089	194	PURWA	1611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39090	194	SAFIPUR	1612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39091	194	SIKANDARPUR KARAN	1613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39092	194	SIKANDARPUR SARAUSI	1614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39093	194	SUMERPUR	1615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39094	195	ARAJILINE	1616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39095	195	BARAGAON	1617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39096	195	CHIRAIGAON	1618	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39097	195	CHOLAPUR	1619	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39098	195	HARAHUA	1620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39099	195	KASHI VIDYAPEETH	1621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39100	195	PINDRA	1622	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39101	195	SEVAPURI	1623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39102	201	ARARIA	1624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39103	201	BHARGAMA	1625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39104	201	FORBESGANJ	1626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39105	201	JOKIHAT	1627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39106	201	KURSAKANTA	1628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39107	201	NARPATGANJ	1629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39108	201	PALASI	1630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39109	201	RANIGANJ	1631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39110	201	SIKTY	1632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39111	202	AURANGABAD	1633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39112	202	BARUN	1634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39113	202	DAUDNAGAR	1635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39115	202	GOH	1637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39116	202	HASPURA	1638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39117	202	KUTUMBA	1639	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39118	202	MADANPUR	1640	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39119	202	NABINAGAR	1641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39120	202	OBRA	1642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39121	202	RAFIGANJ	1643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39122	203	AMARPUR	1644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39123	203	BANKA	1645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39124	203	BARAHAT	1646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39125	203	BAUSI	1647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39126	203	BELHAR	1648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39127	203	CHANDAN	1649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39128	203	DHURAIYA	1650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39129	203	FULLIDUMAR	1651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39130	203	KATORIA	1652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39131	203	RAJAUN	1653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39132	203	SHAMBHUGANJ	1654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39133	204	BACHHWARA	1655	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39134	204	BAKHRI	1656	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39135	204	BALLIA	1657	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39136	204	BARAUNI	1658	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39137	204	BEGUSARAI	1659	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39138	204	BHAGWANPUR	1660	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39139	204	BIRPUR	1661	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39140	204	CHERIA BARIARPUR	1662	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39141	204	CHHAURAHI	1663	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39142	204	DANDARI	1664	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39143	204	GADHPURA	1665	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39144	204	KHODAWANDPUR	1666	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39145	204	MANSURCHAK	1667	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39146	204	MATIHANI	1668	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39147	204	NAWKOTHI	1669	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39148	204	SAHEBPUR KAMAL	1670	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39149	204	SAMHO AKHA KURHA	1671	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39150	204	TEGHRA	1672	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39151	205	BIHPUR	1673	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39152	205	Kahalgaon	1674	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39153	205	GOPALPUR	1675	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39154	205	GORADIH	1676	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39155	205	ISMAILPUR	1677	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39156	205	JAGDISHPUR	1678	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39157	205	KHARIK	1679	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39158	205	NARAYANPUR	1680	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39159	205	NATHNAGAR	1681	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39160	205	NAUGACHHIA	1682	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39161	205	PIRPAINTI	1683	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39162	205	RANGRACHOWK	1684	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39163	205	SABOUR	1685	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39164	205	SHAHKUND	1686	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39165	205	SONHAULA	1687	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39166	205	SULTANGANJ	1688	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39167	206	AGIAON	1689	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39168	206	ARA	1690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39169	206	BARHARA	1691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39170	206	BEHEA	1692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39171	206	CHARPOKHARI	1693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39172	206	GARHANI	1694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39173	206	JAGDISHPUR	1695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39174	206	KOILWAR	1696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39175	206	PIRO	1697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39176	206	SAHAR	1698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39177	206	SANDESH	1699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39178	206	SHAHPUR	1700	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39179	206	TARARI	1701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39180	206	UDWANTNAGAR	1702	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39181	207	BRAHMPUR	1703	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39182	207	BUXAR	1704	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39183	207	CHAKKI	1705	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39184	207	CHAUSA	1706	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39185	207	CHOUGAIN	1707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39186	207	DUMRAON	1708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39187	207	ITARHI	1709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39188	207	KESATH	1710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39189	207	NAWANAGAR	1711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39190	207	RAJPUR	1712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39191	207	SIMRI	1713	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39192	208	ALINAGAR	1714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39193	208	BAHADURPUR	1715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39194	208	BAHERI	1716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39195	208	BENIPUR	1717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39196	208	BIRAUL	1718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39197	208	DARBHANGA	1719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39198	208	GAURABAURAM	1720	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39199	208	GHANSHYAMPUR	1721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39200	208	HANUMAN NAGAR	1722	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39201	208	HAYAGHAT	1723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39202	208	JALE	1724	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39203	208	KEOTIRUNWAY	1725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39204	208	KIRATPUR	1726	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39205	208	KUSHESHWAR ASTHAN	1727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39206	208	KUSHESWAR ASTHAN EAST	1728	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39207	208	MANIGACHHI	1729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39208	208	SINGHWARA	1730	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39209	208	TARDIH	1731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39210	209	AMAS	1732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39211	209	ATRI	1733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39212	209	BANKEY BAZAR	1734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39213	209	BARACHATTI	1735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39214	209	BELAGANJ	1736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39215	209	BODHGAYA	1737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39216	209	DOBHI	1738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39217	209	DUMARIA	1739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39218	209	FATEHPUR	1740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39219	209	GAYA TOWN	1741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39220	209	GURARU	1742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39221	209	GURUA	1743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39222	209	IMAMGANJ	1744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39223	209	KHIZARSARAI	1745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39224	209	KONCH	1746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39225	209	MANPUR	1747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39226	209	MOHANPUR	1748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39227	209	MOHRA	1749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39228	209	NEEMCHAK BATHANI	1750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39229	209	PARAIYA	1751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39230	209	SHERGHATTY	1752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39231	209	TANKUPPA	1753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39232	209	TEKARI	1754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39233	209	WAZIRGANJ	1755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39234	210	BAIKUNTHPUR	1756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39235	210	BARAULI	1757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39236	210	BHOREY	1758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39237	210	BIJAIPUR	1759	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39238	210	GOPALGANJ	1760	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39239	210	HATHUA	1761	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39240	210	KATAIYA	1762	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39241	210	KUCHAIKOTE	1763	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39242	210	MANJHA	1764	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39243	210	PANCHDEORI	1765	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39244	210	PHULWARIYA	1766	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39245	210	SIDHWALIYA	1767	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39246	210	THAWE	1768	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39247	210	UCHKAGAON	1769	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39248	211	BARHAT	1770	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39249	211	CHAKAI	1771	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39250	211	GIDHOR	1772	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39251	211	ISLAMNAGAR ALIGANJ	1773	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39252	211	JAMUI	1774	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39253	211	JHAJHA	1775	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39254	211	KHAIRA	1776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39255	211	LAXMIPUR	1777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39256	211	SIKANDRA	1778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39257	211	SONO	1779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39258	212	GHOSHI	1780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39259	212	HULASGANJ	1781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39260	212	JEHANABAD	1782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39261	212	KAKO	1783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39262	212	MAKHDUMPUR	1784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39263	212	MODANGANJ	1785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39264	212	RATNI FARIDPUR	1786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39265	213	ADHAURA	1787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39266	213	BHABUA	1788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39267	213	BHAGWANPUR	1789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39268	213	CHAINPUR	1790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39269	213	CHAND	1791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39270	213	DURGAWATI	1792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39271	213	KUDRA	1793	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39272	213	MOHANIA	1794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39273	213	NUAON	1795	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39274	213	RAMGARH	1796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39275	213	RAMPUR	1797	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39276	214	AMDABAD	1798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39277	214	AZAMNAGAR	1799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39278	214	BALRAMPUR	1800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39279	214	BARARI	1801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39280	214	BARSOI	1802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39281	214	DANDKHORA	1803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39282	214	FALKA	1804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39283	214	HASANGANJ	1805	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39284	214	KADWA	1806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39285	214	KATIHAR	1807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39286	214	KORHA	1808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39287	214	KURSELA	1809	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39288	214	MANIHARI	1810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39289	214	MANSAHI	1811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39290	214	PRANPUR	1812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39291	214	SAMELI	1813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39292	215	ALAULI	1814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39293	215	BELDAUR	1815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39294	215	CHAUTHAM	1816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39295	215	GOGRI	1817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39296	215	KHAGARIA	1818	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39297	215	MANSI	1819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39298	215	PARBATTA	1820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39299	216	BAHADURGANJ	1821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39300	216	DIGHALBANK	1822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39301	216	KISHANGANJ	1823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39302	216	KOCHADHAMAN	1824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39303	216	POTHIA	1825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39304	216	TERHAGACHH	1826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39305	216	THAKURGANJ	1827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39306	217	BARAHIYA	1828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39307	217	CHANNAN	1829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39308	217	HALSI	1830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39309	217	LAKHISARAI	1831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39310	217	PIPARIYA	1832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39311	217	RAMGARH CHOWK	1833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39312	217	SURAJGARHA	1834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39313	218	ALAMNAGAR	1835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39314	218	BIHARIGANJ	1836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39315	218	CHAUSA	1837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39316	218	GAMHARIYA	1838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39317	218	GHELARH	1839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39318	218	GWALPARA	1840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39319	218	KUMARKHAND	1841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39320	218	MADHEPURA	1842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39321	218	MURLIGANJ	1843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39322	218	PURANI	1844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39323	218	SHANKARPUR	1845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39324	218	SINGHESHWAR	1846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39325	218	UDA KISHANGANJ	1847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39326	219	ANDHRATHARHI	1848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39327	219	BABU BARHI	1849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39328	219	BASOPATTI	1850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39329	219	BENIPATTI	1851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39330	219	BISFI	1852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39331	219	GHOGHARDIHA	1853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39332	219	HARLAKHI	1854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39333	219	JAINAGAR	1855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39334	219	JHANJHARPUR	1856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39335	219	KALUAHI	1857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39336	219	KHAJAULI	1858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39337	219	LADANIA	1859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39338	219	LAKHNAUR	1860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39339	219	LAUKAHA (KHUTAUNA)	1861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39340	219	LAUKAHI	1862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39341	219	MADHEPUR	1863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39342	219	MADHUBANI	1864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39343	219	MADHWAPUR	1865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39344	219	PANDAUL	1866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39345	219	PHULPARAS	1867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39346	219	RAJNAGAR	1868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39347	220	ASARGANJ	1869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39348	220	BARIYARPUR	1870	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39349	220	DHARHARA	1871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39350	220	JAMALPUR	1872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39351	220	KHARAGPUR	1873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39352	220	MUNGER SADAR	1874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39353	220	SANGRAMPUR	1875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39354	220	TARAPUR	1876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39355	220	TETIABAMBAR	1877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39356	221	AURAI	1878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39357	221	BANDRA	1879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39358	221	BOCHAHAN	1880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39359	221	GAIGHAT	1881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39360	221	KANTI	1882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39361	221	KATRA	1883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39362	221	KURHANI	1884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39363	221	MARWAN	1885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39364	221	MINAPUR	1886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39365	221	MOTIPUR	1887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39366	221	MURAUL	1888	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39367	221	MUSHAHARI	1889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39368	221	PAROO	1890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39369	221	SAHEBGANJ	1891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39370	221	SAKRA	1892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39371	221	SARAIYA	1893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39372	222	ASTHAWAN	1894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39373	222	BEN	1895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39374	222	BIHARSHARIF	1896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39375	222	BIND	1897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39376	222	CHANDI	1898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39377	222	EKANGARSARAI	1899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39378	222	GIRIAK	1900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39379	222	HARNAUT	1901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39380	222	HILSA	1902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39381	222	ISLAMPUR	1903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39382	222	KARAI PARSURAI	1904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39383	222	KATRISARAI	1905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39384	222	NAGAR NAUSA	1906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39385	222	NOORSARAI	1907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39386	222	PARBALPUR	1908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39387	222	RAHUI	1909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39388	222	RAJGIR	1910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39389	222	SARMERA	1911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39390	222	SILAO	1912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39391	222	THARTHARI	1913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39392	223	AKBARPUR	1914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39393	223	GOBINDPUR	1915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39394	223	HISUA	1916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39395	223	KASHICHAK	1917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39396	223	KAWAKOLE	1918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39397	223	MESCAUR	1919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39398	223	NARDIGANJ	1920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39399	223	NARHAT	1921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39400	223	NAWADA	1922	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39401	223	PAKRI BARAWAN	1923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39402	223	RAJAULI	1924	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39403	223	ROH	1925	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39404	223	SIRDALA	1926	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39405	223	WARISALIGANJ	1927	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39406	224	BAGAHA-I	1928	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39407	224	BAGAHA-II	1929	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39408	224	BAIRIA	1930	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39409	224	BETTIAH	1931	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39410	224	BHITAHA	1932	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39411	224	CHANPATIA	1933	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39412	224	GAUNAHA	1934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39413	224	JOGAPATTI	1935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39414	224	LAURIYA	1936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39415	224	MADHUBANI	1937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39416	224	MAINATAND	1938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39417	224	MAJHAULIA	1939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39418	224	NARKATIAGANJ	1940	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39419	224	NAUTAN	1941	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39420	224	PIPRASI	1942	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39421	224	RAMNAGAR	1943	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39422	224	SIKTA	1944	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39423	224	THAKRAHAN	1945	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39424	225	ATHAMALGOLA	1946	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39425	225	BAKHTIARPUR	1947	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39426	225	BARH	1948	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39427	225	BELCHCHI	1949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39428	225	BIHTA	1950	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39429	225	BIKRAM	1951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39430	225	DANIYAWAN	1952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39431	225	DHANARUA	1953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39432	225	DINAPUR	1954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39433	225	DULHIN BAZAR	1955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39434	225	FATUHA	1956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39435	225	GHOSWARI	1957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39436	225	KHUSRUPUR	1958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39437	225	MANER	1959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39438	225	MASAURHI	1960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39439	225	MOKAMA	1961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39440	225	NAUBATPUR	1962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39441	225	PALIGANJ	1963	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39442	225	PANDARAK	1964	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39443	225	PATNA SADAR	1965	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39444	225	PHULWARI	1966	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39445	225	PUNPUN	1967	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39446	225	SAMPATCHAK	1968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39447	226	ADAPUR	1969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39448	226	ARERAJ	1970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39449	226	BANJARIYA	1971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39450	226	BANKATWA	1972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39451	226	CHAKIA (PIPRA)	1973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39452	226	CHAWRADANO	1974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39453	226	CHIRAIYA	1975	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39454	226	DHAKA	1976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39455	226	GHORASAHAN	1977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39456	226	HARSIDHI	1978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39457	226	KALYANPUR	1979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39458	226	KESARIA	1980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39459	226	KOTWA	1981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39460	226	MADHUBAN	1982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39461	226	MEHSI	1983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39462	226	MOTIHARI	1984	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39463	226	PAHARPUR	1985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39464	226	PAKRIDAYAL	1986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39465	226	PATAHI	1987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39466	226	PHENHARA	1988	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39467	226	PIPRA KOTHI	1989	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39468	226	RAMGARHWA	1990	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39469	226	RAXAUL	1991	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39470	226	SANGRAMPUR	1992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39471	226	SUGAULI	1993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39472	226	TETARIYA	1994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39473	226	TURKAULIA	1995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39474	227	AMOUR	1996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39475	227	BAISA	1997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39476	227	BAISI	1998	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39477	227	BANMANKHI	1999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39478	227	BARHARA	2000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39479	227	BHAWANIPUR	2001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39480	227	DAGRAUA	2002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39481	227	DHAMDAHA	2003	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39482	227	JALALGARH	2004	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39483	227	KASBA	2005	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39484	227	KRITYANAND NAGAR	2006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39485	227	PURNIA EAST	2007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39486	227	RUPOULI	2008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39487	227	SRINAGAR	2009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39488	228	AKHORIGOLA	2010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39489	228	BIKRAMGANJ	2011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39490	228	CHENARI	2012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39491	228	DAWATH	2013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39492	228	DEHRI	2014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39493	228	DINARA	2015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39494	228	KARAKAT	2016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39495	228	KARGAHAR	2017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39496	228	KOCHAS	2018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39497	228	NASRIGANJ	2019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39498	228	NAWHATTA	2020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39499	228	NOKHA	2021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39500	228	RAJPUR	2022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39501	228	ROHTAS	2023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39502	228	SANJHOULI	2024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39503	228	SASARAM	2025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39504	228	SHEOSAGAR	2026	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39505	228	SURAJPURA	2027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39506	228	TILOUTHU	2028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39507	229	BANMA  ITAHARI	2029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39508	229	KAHARA	2030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39509	229	MAHISHI	2031	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39510	229	NAUHATTA	2032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39511	229	PATARGHAT	2033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39512	229	SALKHUA	2034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39513	229	SATTAR  KATTAIYA	2035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39514	229	SIMRI BAKHTIARPUR	2036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39515	229	SONBARSA	2037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39516	229	SOUR BAZAR	2038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39517	230	BIBHUTPUR	2039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39518	230	BITHAN	2040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39519	230	DALSINGHSARAI	2041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39520	230	HASANPUR	2042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39521	230	KALYANPUR	2043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39522	230	KHANPUR	2044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39523	230	MOHANPUR	2045	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39524	230	MOHIUDDINAGAR	2046	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39525	230	MORWA	2047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39526	230	PATORI	2048	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39527	230	PUSA	2049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39528	230	ROSERA	2050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39529	230	SAMASTIPUR	2051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39530	230	SARAIRANJAN	2052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39531	230	SHIVAJI NAGAR	2053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39532	230	SINGHIA	2054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39533	230	TAJPUR	2055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39534	230	UJIARPUR	2056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39535	230	VIDYAPATI NAGAR	2057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39536	230	WARISNAGAR	2058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39537	231	AMNOUR	2059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39538	231	BANIAPUR	2060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39539	231	CHHAPRA	2061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39540	231	DARIAPUR	2062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39541	231	DIGHWARA	2063	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39542	231	EKMA	2064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39543	231	GARKHA	2065	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39544	231	ISUAPUR	2066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39545	231	JALALPUR	2067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39546	231	LAHLADPUR	2068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39547	231	MAKER	2069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39548	231	MANJHI	2070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39549	231	MARHAURAH	2071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39550	231	MASHRAKH	2072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39551	231	NAGRA	2073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39552	231	PANAPUR	2074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39553	231	PARSA	2075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39554	231	REVELGANJ	2076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39555	231	SONEPUR	2077	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39556	231	TARAIYA	2078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39557	232	ARIARI	2079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39558	232	BARBIGHA	2080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39559	232	CHEWARA	2081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39560	232	GHAT KUSUMBHA	2082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39561	232	SHEIKHOPUR SARAI	2083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39562	232	SHEIKHPURA	2084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39563	233	DUMARI KATSARI	2085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39564	233	PIPRAHI	2086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39565	233	PURNAHIYA	2087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39566	233	SHEOHAR	2088	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39567	233	TARIYANI	2089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39568	234	BAIRGANIA	2090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39569	234	BAJPATTI	2091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39570	234	BATHANAHA	2092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39571	234	BELSAND	2093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39572	234	BOKHRA	2094	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39573	234	CHORAUT	2095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39574	234	DUMRA	2096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39575	234	MAJORGANJ	2097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39576	234	NANPUR	2098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39577	234	PARIHAR	2099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39578	234	PARSAUNI	2100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39579	234	PUPRI	2101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39580	234	RIGA	2102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39581	234	RUNNISAIDPUR	2103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39582	234	SONBARSA	2104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39583	234	SUPPI	2105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39584	234	SURSAND	2106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39585	235	ANDAR	2107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39586	235	BARHARIA	2108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39587	235	BASANTPUR	2109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39588	235	BHAGWANPUR HAT	2110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39589	235	DARAULI	2111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39590	235	DARAUNDHA	2112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39591	235	GORIAKOTHI	2113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39592	235	GUTHANI	2114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39593	235	HASAN PURA	2115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39594	235	HUSSAINGANJ	2116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39595	235	LAKRI NABIGANJ	2117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39596	235	MAHARAJGANJ	2118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39597	235	MAIRWA	2119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39598	235	NAUTAN	2120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39599	235	PACHRUKHI	2121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39600	235	RAGHUNATHPUR	2122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39601	235	SISWAN	2123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39602	235	SIWAN	2124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39603	235	ZIRADEI	2125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39604	236	BASANTPUR	2126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39605	236	CHHATAPUR	2127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39606	236	KISHANPUR	2128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39607	236	MARAUNA	2129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39608	236	NIRMALI	2130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39609	236	PIPRA	2131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39610	236	PRATAPGANJ	2132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39611	236	RAGHOPUR	2133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39612	236	SARAIGARH BHAPTIYAHI	2134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39613	236	SUPAUL	2135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39614	236	TRIBENIGANJ	2136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39615	237	BHAGWANPUR	2137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39616	237	BIDUPUR	2138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39617	237	CHEHRAKALA	2139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39618	237	DESRI	2140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39619	237	GARAUL	2141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39620	237	HAJIPUR	2142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39621	237	JANDAHA	2143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39622	237	LALGANJ	2144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39623	237	MAHNAR	2145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39624	237	MAHUA	2146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39625	237	PATEDHI BELSAR	2147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39626	237	PATEPUR	2148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39627	237	RAGHOPUR	2149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39628	237	RAJAPAKAR	2150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39629	237	SAHDEI BUZURG	2151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39630	237	VAISHALI	2152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39631	239	NANDOK	2153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39632	239	PAKYONG	2154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39633	240	CHUNGTHANG	2155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39634	240	MANGAN	2156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39635	241	NAMCHI	2157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39636	241	RAVANGLA	2158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39637	242	GYALSHING	2159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39638	242	SORENG	2160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39639	243	BORDUMSA	2161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39640	243	CHANGLANG	2162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39641	243	Khagam-Miao	2166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39642	243	NAMPONG	2167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39643	244	ANINI-MEPI	2169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39644	245	BAMENG	2172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39645	245	CHAYANGTAJO	2174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39646	245	PAKKEKESSANG	2175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39647	245	SEPPA	2180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39648	246	MEBO	2186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39649	262	PANGIN	2189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39650	260	CHAMBANG	2192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39651	247	DAMIN	2193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39652	247	KOLORIANG	2195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39653	247	NYAPIN	2196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39654	260	PALIN	2197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39655	260	TALI	2202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39656	258	HAWAI-WALONG	2207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39657	258	HAYULIANG	2208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39658	248	TEZU	2214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39659	248	WAKRO	2216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39660	249	HUNLI-KRONLI	2218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39661	249	ROING	2222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39662	250	HONG-HARI	2225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39663	250	TAMEN-RAGA	2232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39664	250	ZIRO-I	2233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39665	250	ZIRO-II	2236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39666	251	DOIMUKH	2238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39667	251	SAGALEE	2243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39668	252	JANG-THINGBU	2247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39669	252	LUMLA	2249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39670	252	TAWANG	2251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39671	254	MARIYANG	2270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39672	254	TUTING	2271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39673	254	YINGKIONG	2272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39674	255	GIBA	2275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39675	255	DAPORIJO	2276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39676	255	DUMPORIJO	2278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39677	255	NACHO	2281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39678	255	TALIHA	2285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39679	256	DIRANG	2287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39680	256	KALAKTANG	2289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39681	256	THRIZINO	2294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39682	257	ALONG WEST	2299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39683	257	BASAR	2300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39684	257	GENSI	2303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39685	262	KAYING	2305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39686	257	LIROMOBA-YOMCHA	2307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39687	257	MECHUKA-TATO	2309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39688	262	RUMGONG	2311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39689	263	DHANSIRIPAR	2313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39690	263	KUHUBOTO	2314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39691	263	MEDZIPHEMA	2315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39692	263	NIULAND	2316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39693	264	CHIEPHOBOZOU	2317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39694	264	JAKHAMA	2318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39695	271	JALUKIE	2319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39696	264	KOHIMA	2320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39697	271	PEREN	2321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39698	271	TENNING	2322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39699	264	TSEMINYU	2323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39700	265	CHANGTONGYA	2324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39701	265	KUBOLONG	2325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39702	265	LONGCHEM	2326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39703	265	MANGKOLEMBA	2327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39704	265	ONGPANGKONG(NORTH)	2328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39705	265	ONGPANGKONG(SOUTH)	2329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39706	266	CHEN	2330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39707	266	MON	2331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39708	266	PHOMCHING	2332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39709	266	TIZIT	2333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39710	266	TOBU	2334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39711	266	WAKCHING	2335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39712	267	KIKRUMA	2336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39713	267	MELURI	2337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39714	267	PFUTSERO	2338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39715	267	PHEK	2339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39716	267	SEKRUZU	2340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39717	268	CHARE	2341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39718	268	CHESSORE	2342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39719	268	LONGKHIM	2343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39720	268	NOKLAK	2344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39721	268	NOKSEN	2345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39722	268	SANGSANGYU	2346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39723	268	SHAMATOR	2347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39724	268	THONOKNYU	2348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39725	269	BHANDARI	2349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39726	269	CHUKITONG	2350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39727	269	SANIS	2351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39728	269	WOKHA	2352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39729	269	WOZHURO-RALAN	2353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39730	270	AKULUTO	2354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39731	270	GHATHASHI	2355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39732	270	SATAKHA	2356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39733	270	TOKIYE	2357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39734	270	ZUNHEBOTO	2358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39735	274	BISHNUPUR	2359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39736	274	MOIRANG	2360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39737	275	CHAKPIKARONG	2361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39738	275	CHANDEL	2362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39739	288	MACHI	2363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39740	288	TENGNOUPAL	2364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39741	278	HAORANGSABAL	2368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39742	278	WANGOI	2369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39743	284	KANGPOKPI	2370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39744	279	PAOMATA	2371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39745	279	PURUL	2372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39746	284	SAIKUL	2373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39747	284	SAITU GAMPHAZOL	2374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39748	279	TADUBI	2375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39749	280	NUNGBA	2376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39750	280	TAMEI	2377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39751	280	TAMENGLONG	2378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39752	280	TOUSEM	2379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39753	283	KAKCHING	2380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39754	281	THOUBAL	2381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39755	282	CHINGAI	2382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39756	289	KAMJONG	2383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39757	289	KASOM KHULLEN	2384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39758	289	PHUNGYAR	2385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39759	282	UKHRUL	2386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39760	290	AIBAWK	2387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39761	290	DARLAWN	2388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39762	290	PHULLEN	2389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39763	290	THINGSULTHLIAH	2390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39764	290	TLANGNUAM	2391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39765	291	KHAWBUNG	2392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39766	291	KHAWZAWL	2393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39767	291	NGOPA	2394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39768	292	THINGDAWL	2395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39769	293	BUNGTLANG SOUTH	2396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39770	293	CHAWNGTE	2397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39771	293	LAWNGTLAI	2398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39772	293	SANGU	2399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39773	294	BUNGHMUN	2400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39774	294	HNAHTHIAL	2401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39775	294	LUNGLEI	2402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39776	294	LUNGSEN	2403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39777	295	REIEK	2404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39778	295	WEST PHAILENG	2405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39779	295	ZAWLNUAM	2406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39780	296	SAIHA	2407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39781	296	TUIPANG	2409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39782	298	Ambassa	2410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39783	298	Chawmanu	2411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39784	298	Dumburnagar	2412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39785	298	Manu	2413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39786	298	Salema	2414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39787	299	Damcherra	2415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39788	299	Dasda	2416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39789	305	Gournagar	2417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39790	299	Jampui Hills	2418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39791	299	Kadamtala	2419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39792	305	Kumarghat	2420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39793	299	Panisagar	2421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39794	305	Pecharthal	2422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39795	304	Amarpur	2423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39796	300	Bokafa	2424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39797	300	Hrishyamukh	2425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39798	304	Kakraban	2426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39799	304	Karbook	2427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39800	304	Killa	2428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39801	304	Matabari	2429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39802	304	Ompi	2430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39803	300	Rajnagar	2431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39804	300	Rupaichari	2432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39805	300	Satchand	2433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39806	303	Bishalgarh	2434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39807	303	Boxanagar	2435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39808	301	Dukli	2436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39809	301	Hezamara	2437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39810	303	Jampuijala	2438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39811	301	Jirania	2439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39812	302	Kalyanpur	2440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39813	303	Kathalia	2441	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39814	302	Khowai	2442	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39815	301	Mandwai	2443	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39816	303	Nalchar	2444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39817	301	Mohanpur	2445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39818	302	Mungiakami	2446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39819	302	Padmabil	2447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39820	302	Teliamura	2448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39821	302	Tulashikhar	2449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39822	306	DAMBO RONGJENG	2450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39823	313	KHARKUTTA	2451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39824	313	RESUBELPARA	2452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39825	306	SAMANDA	2453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39826	306	SONGSAK	2454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39827	307	KHADARSHNONG-LAITKROH	2455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39828	307	MAWKYNREW	2456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39829	307	MAWPHLANG	2457	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39830	307	MAWRYNGKNENG	2458	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39831	307	MAWSYNRAM	2459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39832	307	MYLLIEM	2460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39833	307	PYNURSLA	2461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39834	307	SHELLA BHOLAGANJ	2462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39835	308	AMLAREM	2463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39836	314	KHLIEHRIAT	2464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39837	308	LASKEIN	2465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39838	314	SAIPUNG	2466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39839	308	THADLASKEIN	2467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39840	309	JIRANG	2468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39841	309	UMLING	2469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39842	309	UMSNING	2470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39843	310	BAGHMARA	2471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39844	310	CHOKPOT	2472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39845	310	GASUAPARA	2473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39846	310	RONGARA	2474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39847	316	BETASING	2475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39848	311	DADENGGIRI	2476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39849	311	DALU	2477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39850	311	GAMBEGRE	2478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39851	311	RONGRAM	2479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39852	311	SALSELLA	2480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39853	311	TIKRIKILLA	2481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39854	316	ZIKZAK	2482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39855	312	MAIRANG	2483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39856	315	MAWKYRWAT	2484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39857	312	MAWSHYNRUT	2485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39858	312	MAWTHADRAISHAN	2486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39859	312	NONGSTOIN	2487	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39860	315	RANIKOR	2488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39861	317	BAJALI	2489	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39862	317	BARPETA	2490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39863	317	BHABANIPUR	2491	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39864	317	CHAKCHAKA	2492	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39865	317	CHENGA	2493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39866	317	GOMAPHULBARI	2495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39867	341	JALAH	2496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39868	317	MANDIA	2497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39869	317	PAKABETBARI	2498	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39870	317	RUPOSHI	2499	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39871	317	SARUKHETRI	2500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39872	318	BOITAMARI	2501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39874	318	DANGTOL	2503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39875	340	SIDLI-CHIRANG PART	2505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39876	318	SRIJANGRAM	2506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39877	318	TAPATTARY	2507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39878	319	BANSKANDI	2508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39879	319	BARJALENGA	2509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39880	319	BINNAKANDI	2510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39881	319	BORKHOLA	2511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39882	319	KALAIN	2512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39883	319	KATIGORAH	2513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39884	319	LAKHIPUR	2514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39885	319	NARSINGPUR	2515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39886	319	PALONGHAT	2516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39887	319	RAJABAZAR	2517	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39888	319	SALCHAPRA	2518	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39889	319	SILCHAR	2519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39890	319	SONAI	2520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39891	319	TAPANG	2521	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39892	319	UDHARBOND	2522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39893	320	BECHIMARI	2523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39894	320	DALGAON-SIALMARI	2527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39895	320	KALAIGAON	2528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39896	320	PACHIM-MANGALDAI	2535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39897	320	PUB-MANGALDAI	2537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39898	320	SIPAJHAR	2540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39899	321	SISSIBORGAON	2544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39900	321	BORDOLONI	2545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39901	321	DHEMAJI	2546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39902	321	MACHKHOWA	2547	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39903	321	MURKONGSELEK	2548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39904	322	AGOMANI	2549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39905	322	BIRSHING-JARUA	2551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39906	346	FEKAMARI	2554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39907	322	GAURIPUR	2555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39908	346	MANKACHAR	2559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39909	322	NAYERALGA	2560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39910	346	SOUTH SALMARA	2562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39911	323	BARBARUAH	2563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39912	323	JOYPUR	2564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39913	323	KHOWANG	2565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39914	323	LAHOAL	2566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39915	323	PANITOLA	2567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39916	323	TENGAKHAT	2568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39917	323	TINGKHONG	2569	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39918	324	BALIJANA	2570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39919	324	JALESWAR	2571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39920	324	KHARMUZA	2572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39921	324	KRISHNAI	2573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39922	324	KUCHDHOWA	2574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39923	324	LAKHIPUR	2575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39924	324	MATIA	2576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39925	324	RONGJULI	2577	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39926	325	GOLAGHAT CENTRAL	2578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39927	325	GOLAGHAT EAST	2579	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39928	325	GOLAGHAT NORTH	2580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39929	325	GOLAGHAT SOUTH	2581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39930	325	GOLAGHAT WEST	2582	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39931	325	GOMARIGURI	2583	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39932	325	KAKODONGA	2584	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39933	325	MORONGI	2585	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39934	326	ALGAPUR	2586	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39935	326	HAILAKANDI	2587	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39936	326	KATLICHERRA	2588	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39937	326	LALA	2589	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39938	326	SOUTH HAILAKANDI	2590	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39939	327	JORHAT	2591	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39940	327	JORHAT CENTRAL	2592	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39941	327	JORHAT EAST	2593	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39942	327	KALIAPANI	2594	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39943	345	MAJULI	2595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39944	327	NORTH WEST JORHAT	2596	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39945	327	TITABOR	2597	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39946	345	UJANI MAJULI	2598	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39947	328	BEZERA	2599	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39948	328	BIHDIA -JAJIKONA	2600	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39949	328	BOKO	2601	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39950	328	BONGAON	2602	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39951	328	CHAMARIA	2603	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39952	343	CHANDRAPUR	2604	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39953	328	CHAYANI	2605	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39954	328	CHAYGAON	2606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39955	343	DIMORIA	2607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39956	341	GORESWAR	2608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39957	328	GOROIMARI	2609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39958	328	HAJO	2610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39959	328	KAMALPUR	2611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39960	328	RAMPUR	2612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39961	328	RANGIA	2613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39962	328	RANI	2614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39963	328	SUALKUCHI	2615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39964	349	AMRI	2616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39965	329	BOKAJAN	2617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39966	349	CHINTHONG	2618	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39967	329	HOWRAGHAT	2619	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39968	329	LANGSOMEPI	2620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39969	329	LUMBAJONG	2621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39970	329	NILIP	2622	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39971	349	RONGKHANG	2623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39972	329	RONGMONGWE	2624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39973	329	SAMELANGSO	2625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39974	349	SOCHENG	2626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39975	330	BADARPUR	2627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39976	330	DULLAVCHERRA	2628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39977	330	LOWAIRPOA	2629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39978	330	NORTH KARIMGANJ	2630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39979	330	PATHARKANDI	2631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39980	330	RAMKRISHNA NAGAR	2632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39981	330	SOUTH KARIMGANJ	2633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39982	331	Dotma	2634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39983	331	Gossaigaon	2635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39984	331	Kachugaon	2637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39985	331	Kokrajhar	2638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39986	332	BIHPURIA	2640	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39987	332	BOGINADI	2641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39988	332	DHAKUAKHANA	2642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39989	332	GHILAMARA	2643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39990	332	KARUNABARI	2644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39991	332	LAKHIMPUR	2645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39992	332	NARAYANPUR	2646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39993	332	NOWBOICHA	2647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39994	332	TELAHI	2648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39995	333	BATABRABA (PART)	2649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39996	333	BHURBANDHA	2650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39997	333	DOLONGGHAT (PART)	2651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39998	333	KAPILI	2652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
39999	333	LAHARIGHAT	2653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40000	333	MAYANG	2654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40001	333	MOIRABARI	2655	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40002	334	BAJIAGAON	2656	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40003	334	BARHAMPUR	2657	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40004	334	BATADRAVA	2658	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40005	348	BINAKANDI	2659	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40006	348	DHALPUKHURI	2660	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40007	334	DOLONGGHAT	2661	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40008	348	JUGIJAN	2662	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40009	334	JURIA	2663	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40010	334	KALIABOR	2664	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40011	334	KAPILI PT.I	2665	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40012	334	KATHIATOLI	2666	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40013	334	KHAGARIJAN	2667	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40014	334	LAOKHOWA	2668	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40015	348	LUMDING	2669	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40016	334	MOIRABARI PART	2670	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40017	334	PACHIM KALIABOR	2671	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40018	334	PAKHIMORIA	2672	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40019	334	RAHA	2673	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40020	334	RUPAHI	2674	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40021	348	UDALI	2675	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40022	341	BARAMA	2676	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40023	335	BARIGOG BANBHAG	2677	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40024	335	BARKHETRI	2678	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40025	341	BASKA	2679	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40026	335	BORBHAG	2680	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40027	341	DHAMDHAMA	2681	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40028	335	MADHUPUR	2682	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40029	341	NAGRIJULI	2683	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40030	335	PASCHIM NALBARI	2684	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40031	335	PUB NALBARI	2685	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40032	341	TAMULPUR	2686	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40033	335	TIHU	2687	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40034	336	DIYANG VALLEY	2688	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40035	336	DIYUNGBRA	2689	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40036	336	HARANGAJAO	2690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40037	336	JATINGA VALLEY	2691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40038	336	NEW   SANGBAR	2692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40039	337	AMGURI	2693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40040	337	DEMOW	2694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40041	337	GAURISAGAR	2695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40042	347	LAKUWA	2696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40043	337	NAZIRA	2697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40044	347	SAPEKHATI	2698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40045	337	SIVASAGAR	2699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40046	347	SONARI	2700	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40047	347	WEST ABHAIPUR	2701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40048	344	BAGHMARA	2702	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40049	338	BALIPARA	2703	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40050	344	BEHALI	2704	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40051	338	BIHAGURI	2705	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40052	344	BISWANATH	2706	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40053	338	BORCHALA	2707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40054	344	CHAIDUAR	2708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40055	338	DHEKIAJULI	2709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40056	338	GABHORU	2710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40057	338	NADUAR	2711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40058	344	PUB CHAIDUAR	2712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40059	338	RANGAPARA	2713	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40060	344	SAKOMATHA	2714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40061	338	SOOTEA	2715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40062	339	GUIJAN	2716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40063	339	HAPJAN	2717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40064	339	ITAKHULI	2718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40065	339	KAKOPATHAR	2719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40066	339	MARGHERITA	2720	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40067	339	SADIYA	2721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40068	339	SAIKHOWA	2722	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40069	350	AMDANGA	2723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40070	350	BADURIA	2724	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40071	350	BAGDA	2725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40072	350	BARASAT-I	2726	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40073	350	BARASAT-II	2727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40074	350	BARRACKPUR-I	2728	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40075	350	BARRACKPUR-II	2729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40076	350	BASIRHAT-I	2730	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40077	350	BASIRHAT-II	2731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40078	350	BONGAON	2732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40079	350	DEGANGA	2733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40080	350	GAIGHATA	2734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40081	350	HABRA-I	2735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40082	350	HABRA-II	2736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40083	350	HAROA	2737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40084	350	HASNABAD	2738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40085	350	HINGALGANJ	2739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40086	350	MINAKHAN	2740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40087	350	RAJARHAT	2741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40088	350	SANDESHKHALI-I	2742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40089	350	SANDESHKHALI-II	2743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40090	350	SWARUPNAGAR	2744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40091	351	BARUIPUR	2745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40092	351	BASANTI	2746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40093	351	BHANGAR-I	2747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40094	351	BHANGAR-II	2748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40095	351	BISHNUPUR-I	2749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40096	351	BISHNUPUR-II	2750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40097	351	BUDGE BUDGE-I	2751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40098	351	BUDGE BUDGE-II	2752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40099	351	CANNING-I	2753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40100	351	CANNING-II	2754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40101	351	DIAMOND HARBOUR-I	2755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40102	351	DIAMOND HARBOUR-II	2756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40103	351	FALTA	2757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40104	351	GOSABA	2758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40105	351	JAYNAGAR-I	2759	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40106	351	JAYNAGAR-II	2760	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40107	351	KAK DWIP	2761	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40108	351	KULPI	2762	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40109	351	KULTALI	2763	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40110	351	MAGRA HAT-I	2764	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40111	351	MAGRA HAT-II	2765	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40112	351	MANDIRBAZAR	2766	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40113	351	MATHURAPUR I	2767	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40114	351	MATHURAPUR-II	2768	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40115	351	NAMKHANA	2769	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40116	351	PATHAR PRATIMA	2770	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40117	351	SAGAR	2771	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40118	351	SONAR PUR	2772	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40119	351	THAKURPUKUR MAHESTOLA	2773	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40120	352	BANKURA-I	2774	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40121	352	BANKURA-II	2775	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40122	352	BARJORA	2776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40123	352	CHHATNA	2777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40124	352	GANGAJAL GHATI	2778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40125	352	HIRBANDH	2779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40126	352	INDPUR	2780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40127	352	INDUS	2781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40128	352	JAYPUR	2782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40129	352	KHATRA-I	2783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40130	352	KOTULPUR	2784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40131	352	MEJHIA	2785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40132	352	ONDA	2786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40133	352	PATRASAYER	2787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40134	352	RAIPUR-I	2788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40135	352	RANIBUNDH	2789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40136	352	SALTORA	2790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40137	352	SARENGA	2791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40138	352	SIMLAPAL	2792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40139	352	SONAMUKHI	2793	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40140	352	TALDANGRA	2794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40141	352	VISHNUPUR	2795	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40142	353	AUSGRAM-I	2796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40143	353	AUSGRAM-II	2797	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40144	371	BARABANI	2798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40145	353	BHATAR	2799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40146	353	BURDWAN-I	2800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40147	353	BURDWAN-II	2801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40148	371	FARIDPUR - DURGAPUR	2802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40149	353	GALSI -I	2803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40150	353	GALSI-II	2804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40151	353	JAMAL PUR	2805	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40152	371	JAMURIA	2806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40153	353	KALNA II	2807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40154	353	KALNA-I	2808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40155	371	KANKSA	2809	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40156	353	KATWA-I	2810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40157	353	KATWA-II	2811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40158	353	KETUGRAM-II	2812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40159	353	KETUGRAM_I	2813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40160	353	KHANDAGHOSH	2814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40161	353	MANGOLKOTE	2815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40162	353	MANTESWAR	2816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40163	353	MEMARI-1	2817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40164	353	MEMARI-II	2818	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40165	371	ONDAL	2819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40166	371	PANDAVESWAR	2820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40167	353	PURBASTHALI-I	2821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40168	353	PURBASTHALI-II	2822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40169	353	RAINA-I	2823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40170	353	RAINA-II	2824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40171	371	RANIGANJ	2825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40172	371	SALANPUR	2826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40173	354	BOLPUR-SRINIKETAN	2827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40174	354	DUBRAJPUR	2828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40175	354	ILLAMBAZAR	2829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40176	354	KHOYRASOL	2830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40177	354	LABPUR	2831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40178	354	MAYURESWAR-I	2832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40179	354	MAYURESWAR-II	2833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40180	354	MOHAMMAD BAZAR	2834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40181	354	MURARAI-I	2835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40182	354	MURARAI-II	2836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40183	354	NALHATI-I	2837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40184	354	NALHATI-II	2838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40185	354	NANOOR	2839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40186	354	RAJNAGAR	2840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40187	354	RAMPURHAT-I	2841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40188	354	RAMPURHAT-II	2842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40189	354	SAINTHIA	2843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40190	354	SURI-I	2844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40191	354	SURI-II	2845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40192	355	COOCH BEHAR II	2846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40193	355	COOCH BEHAR-I	2847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40194	355	DINHATA-I	2848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40195	355	DINHATA-II	2849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40196	355	HALDIBARI	2850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40197	355	MATHA BHANGA-II	2851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40198	355	MATHABHANGA-I	2852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40199	355	MEKLIGANJ	2853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40200	355	SITAI	2854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40201	355	SITALKUCHI	2855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40202	355	TUFANGANJ-I	2856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40203	355	TUFANGANJ-II	2857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40204	356	DARJEELING-PULBAZAR	2858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40205	369	GORUBATHAN	2859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40206	356	JORE BUNGLOW-SUKIAPOKHRI	2860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40207	369	KALIMPONG-I	2861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40208	369	KALIMPONG-II	2862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40209	356	KHARIBARI	2863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40210	356	KURSEONG	2864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40211	356	MATIGARA	2865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40212	356	MIRIK	2866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40213	356	NAXAL BARI	2867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40214	356	PHANSIDEWA	2868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40215	356	RANGLI RANGLIOT	2869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40216	357	BALURGHAT	2870	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40217	357	BANSIHARI	2871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40218	357	GANGARAMPUR	2872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40219	357	HARIRAMPUR	2873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40220	357	HILI	2874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40221	357	KUMARGANJ	2875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40222	357	KUSHMANDI	2876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40223	357	TAPAN	2877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40224	358	CHOPRA	2878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40225	358	GOALPOKHAR II	2879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40226	358	GOALPOKHAR-I	2880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40227	358	HEMTABAD	2881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40228	358	ISLAMPUR	2882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40229	358	ITAHAR	2883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40230	358	KALIAGANJ	2884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40231	358	KARANDIGHI	2885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40232	358	RAIGANJ	2886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40233	359	ARAMBAGH	2887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40234	359	BALAGARH	2888	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40235	359	CHANDITALA-I	2889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40236	359	CHANDITALA-II	2890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40237	359	CHINSURAH-MAGRAH	2891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40238	359	DHANIAKHALI	2892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40239	359	GOGHAT-I	2893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40240	359	GOGHAT-II	2894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40241	359	HARIPAL	2895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40242	359	JANGIPARA	2896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40243	359	KHANAKUL-I	2897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40244	359	KHANAKUL-II	2898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40245	359	PANDUA	2899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40246	359	POLBA-DADPUR	2900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40247	359	PURSURAH	2901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40248	359	SINGUR	2902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40249	359	SIRAMPUR-UTTARPARA	2903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40250	359	TARAKESWAR	2904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40251	360	AMTA-I	2905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40252	360	AMTA-II	2906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40253	360	BAGNAN-I	2907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40254	360	BAGNAN-II	2908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40255	360	BALLY-JAGACHA	2909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40256	360	DOMJUR	2910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40257	360	JAGATBALLAVPUR	2911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40258	360	PANCHLA	2912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40259	360	SANKRAIL	2913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40260	360	SHYAMPUR-I	2914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40261	360	SHYAMPUR-II	2915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40262	360	UDAYNARAYANPUR	2916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40263	360	ULUBERIA-I	2917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40264	360	ULUBERIA-II	2918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40265	368	ALIPURDUAR-I	2919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40266	368	ALIPURDUAR-II	2920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40267	361	DHUPGURI	2921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40268	368	FALAKATA	2922	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40269	361	JALPAIGURI	2923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40270	368	KALCHINI	2924	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40271	368	KUMARGRAM	2925	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40272	368	MADARIHAT	2926	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40273	361	MAL	2927	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40274	361	MATIALI	2928	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40275	361	MAYNAGURI	2929	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40276	361	NAGRAKATA	2930	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40277	361	RAJGANJ	2931	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40278	362	BAMONGOLA	2932	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40279	362	CHANCHAL-I	2933	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40280	362	CHANCHAL-II	2934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40281	362	ENGLISH BAZAR	2935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40282	362	GAZOLE	2936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40283	362	HABIBPUR	2937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40284	362	HARISHCHANDRAPUR-I	2938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40285	362	HARISHCHANDRAPUR-II	2939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40286	362	KALIACHAK-I	2940	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40287	362	KALIACHAK-II	2941	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40288	362	KALIACHAK-III	2942	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40289	362	MANIKCHAK	2943	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40290	362	OLD MALDA	2944	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40291	362	RATUA-I	2945	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40292	362	RATUA-II	2946	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40293	363	BHAGAWANPUR-I	2947	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40294	363	BHAGAWANPUR-II	2948	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40295	363	CHANDIPUR	2949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40296	363	CONTAI-I	2950	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40297	363	CONTAI-III	2951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40298	363	DESHAPRAN	2952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40299	363	EGRA-I	2953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40300	363	EGRA-II	2954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40301	363	HALDIA	2955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40302	363	KHEJURI-I	2956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40303	363	KHEJURI-II	2957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40304	363	KOLAGHAT	2958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40305	363	MAHISHADAL	2959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40306	363	MOYNA	2960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40307	363	NANDAKUMAR	2961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40308	363	NANDIGRAM-I	2962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40309	363	NANDIGRAM-II	2963	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40310	363	PANSKURA-I	2964	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40311	363	PATASHPUR-I	2965	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40312	363	PATASHPUR-II	2966	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40313	363	RAMNAGAR-I	2967	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40314	363	RAMNAGAR-II	2968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40315	363	SHAHID MATANGINI	2969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40316	363	SUTAHATA	2970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40317	363	TAMLUK	2971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40318	370	BINPUR-I	2972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40319	370	BINPUR-II	2973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40320	364	CHANDRAKONA-I	2974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40321	364	CHANDRAKONA-II	2975	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40322	364	DANTAN-I	2976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40323	364	DANTAN-II	2977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40324	364	DASPUR-I	2978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40325	364	DASPUR-II	2979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40326	364	DEBRA	2980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40327	364	GARBETA-I	2981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40328	364	GARBETA-II	2982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40329	364	GARBETA-III	2983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40330	364	GHATAL	2984	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40331	370	GOPIBALLAV PUR -II	2985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40332	370	GOPIBALLAVPUR-I	2986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40333	370	JAMBANI	2987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40334	370	JHARGRAM	2988	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40335	364	KESHIARY	2989	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40336	364	KESHPUR	2990	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40337	364	KHARAGPUR-I	2991	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40338	364	KHARAGPUR-II	2992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40339	364	MIDNAPORE	2993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40340	364	MOHANPUR	2994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40341	364	NARAYANGARH	2995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40342	370	NAYAGRAM	2996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40343	364	PINGLA	2997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40344	364	SABANG	2998	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40345	364	SALBANI	2999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40346	370	SANKRAIL	3000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40347	365	BELDANGA-I	3001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40348	365	BELDANGA-II	3002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40349	365	BERHAMPORE	3003	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40350	365	BHAGABANGOLA-II	3004	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40351	365	BHAGAWANGOLA-I	3005	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40352	365	BHARATPUR-I	3006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40353	365	BHARATPUR-II	3007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40354	365	BURWAN	3008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40355	365	DOMKAL	3009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40356	365	FARAKKA	3010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40357	365	HARIHARPARA	3011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40358	365	JALANGI	3012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40359	365	KANDI	3013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40360	365	KHARGRAM	3014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40361	365	LALGOLA	3015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40362	365	MURSHIDABAD-JIAGUNJ	3016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40363	365	NABAGRAM	3017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40364	365	NAWDA	3018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40365	365	RAGHUNATHGANJ-I	3019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40366	365	RAGHUNATHGANJ-II	3020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40367	365	RANINAGAR-I	3021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40368	365	RANINAGAR-II	3022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40369	365	SAGARDIGHI	3023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40370	365	SHAMSHERGANJ	3024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40371	365	SUTI-I	3025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40372	365	SUTI-II	3026	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40373	366	CHAKDAH	3027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40374	366	CHAPRA	3028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40375	366	HANSKHALI	3029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40376	366	HARINGHATA	3030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40377	366	KALIGANJ	3031	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40378	366	KARIMPUR-1	3032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40379	366	KARIMPUR-II	3033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40380	366	KRISHNAGANJ	3034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40381	366	KRISHNAGAR-I	3035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40382	366	KRISHNAGAR-II	3036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40383	366	NABADWIP	3037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40384	366	NAKASHIPARA	3038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40385	366	RANAGHAT-I	3039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40386	366	RANAGHAT-II	3040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40387	366	SANTIPUR	3041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40388	366	TEHATTA-I	3042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40389	366	TEHATTA-II	3043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40390	367	ARSHA	3044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40391	367	BAGMUNDI	3045	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40392	367	BALARAMPUR	3046	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40393	367	BARABAZAR	3047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40394	367	BUNDWAN	3048	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40395	367	HURA	3049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40396	367	JAIPUR	3050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40397	367	JHALDA-I	3051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40398	367	JHALDA-II	3052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40399	367	KASHIPUR	3053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40400	367	MANBAZAR-I	3054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40401	367	MANBAZAR-II	3055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40402	367	NETURIA	3056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40403	367	PARA	3057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40404	367	PUNCHA	3058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40405	367	PURULIA-I	3059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40406	367	PURULIA-II	3060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40407	367	RAGHUNATH PUR-I	3061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40408	367	RAGHUNATHPUR-II	3062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40409	367	SANTURI	3063	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40410	372	BERMO	3064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40411	372	CHANDANKIYARI	3065	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40412	372	CHAS	3066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40413	372	GOMIA	3067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40414	372	JARIDIH	3068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40415	372	KASMAR	3069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40416	372	NAWADIH	3070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40417	372	PETERWAR	3071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40418	373	CHATRA	3072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40419	373	GIDDHOR	3073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40420	373	SHALIGRAM RAM NARAYANPUR ALIAS HUNTERGANJ	3074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40421	373	ITKHORI	3075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40422	373	KUNDA	3076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40423	373	LAWALONG	3077	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40424	373	PATHALGADA	3078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40425	373	PRATAPPUR	3079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40426	373	SIMARIA	3080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40427	373	TANDWA	3081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40428	374	DEOGHAR	3082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40429	374	DEVIPUR	3083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40430	374	KAROWN	3084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40431	374	MADHUPUR	3085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40432	374	MOHANPUR	3086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40433	374	PALOJORI	3087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40434	374	SARATH	3088	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40435	374	SARWAN	3089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40436	375	BAGHMARA	3090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40437	375	BALIAPUR	3091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40438	375	DHANBAD	3092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40439	375	GOVINDPUR	3093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40440	375	NIRSA	3095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40441	375	TOPCHANCHI	3096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40442	375	TUNDI	3097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40443	376	DUMKA	3098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40444	376	GOPIKANDER	3099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40445	376	JAMA	3100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40446	376	JARMUNDI	3101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40447	376	KATHIKUND	3102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40448	376	MASALIYA	3103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40449	376	RAMGARH	3104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40450	376	RANISHWAR	3105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40451	376	SARAIYAHAT	3106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40452	376	SIKARIPARA	3107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40453	377	BAHRAGORA	3108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40454	377	CHAKULIA	3109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40455	377	DHALBHUMGARH	3110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40456	377	DUMARIA	3111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40457	377	GHATSHILA	3112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40458	377	GOLMURI CUM JUGSALAI	3113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40459	377	MUSABANI	3114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40460	377	PATAMDA	3115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40461	377	POTKA	3116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40462	378	BHANDARIA	3117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40463	378	BHAWNATHPUR	3118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40464	378	CHINIA	3119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40465	378	DANDAI	3120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40466	378	DHURKI	3121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40467	378	GARHWA	3122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40468	378	KANDI	3123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40469	378	KHARAUNDHI	3124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40470	378	MANJHIAON	3125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40471	378	MERAL	3126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40472	378	NAGAR UNTARI	3127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40473	378	RAMKANDA	3128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40474	378	RAMNA	3129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40475	378	RANKA	3130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40476	379	BAGODAR	3131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40477	379	BENGABAD	3132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40478	379	BIRNI	3133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40479	379	DEORI	3134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40480	379	DHANWAR	3135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40481	379	DUMRI	3136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40482	379	GANDEY	3137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40483	379	GAWAN	3138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40484	379	GIRIDIH	3139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40485	379	JAMUA	3140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40486	379	PIRTAND	3141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40487	379	TISRI	3142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40488	380	BOARIJOR	3143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40489	380	GODDA	3144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40490	380	MAHAGAMA	3145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40491	380	MEHARMA	3146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40492	380	PATHARGAMA	3147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40493	380	PORAIYAHAT	3148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40494	380	SUNDARPAHARI	3149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40495	380	THAKURGANGTI	3150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40496	381	BASIA	3151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40497	381	BHARNO	3152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40498	381	BISHUNPUR	3153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40499	381	CHAINPUR	3154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40500	381	DUMRI	3155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40501	381	GHAGHRA	3156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40502	381	GUMLA	3157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40503	381	KAMDARA	3158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40504	381	PALKOT	3159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40505	381	RAIDIH	3160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40506	381	SISAI	3161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40507	382	BARHI	3162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40508	382	BARKAGAON	3163	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40509	382	BARKATHA	3164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40510	382	BISHNUGARH	3165	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40511	382	CHOUPARAN	3166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40512	382	CHURCHU	3167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40513	395	GOLA	3168	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40514	382	ICHAK	3169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40515	382	KATKAMSANDI	3170	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40516	382	KEREDARI	3171	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40517	395	MANDU	3172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40518	382	PADMA	3173	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40519	395	PATRATU	3174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40520	395	RAMGARH	3175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40521	382	SADAR	3176	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40522	383	JAMTARA	3177	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40523	383	KUNDHIT	3178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40524	383	NALA	3179	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40525	383	NARAYANPUR	3180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40526	384	CHANDWARA	3181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40527	384	JAINAGAR	3182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40528	384	KODERMA	3183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40529	384	MARKACHO	3184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40530	384	SATGAWAN	3185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40531	385	BALUMATH	3186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40532	385	BARWADIH	3187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40533	385	CHANDWA	3188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40534	385	GARU	3189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40535	385	LATEHAR	3190	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40536	385	MAHUADANR	3191	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40537	385	MANIKA	3192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40538	386	BHANDRA	3193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40539	386	KISKO	3194	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40540	386	KURU	3195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40541	386	LOHARDAGA	3196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40542	386	SENHA	3197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40543	387	AMRAPARA	3198	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40544	387	HIRANPUR	3199	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40545	387	LITTIPARA	3200	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40546	387	MAHESHPUR	3201	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40547	387	PAKUR	3202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40548	387	PAKURIA	3203	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40549	388	BISHRAMPUR	3204	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40550	388	CHAINPUR	3205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40551	388	CHHATARPUR	3206	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40552	388	MEDININAGAR	3207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40553	388	HAIDERNAGAR	3208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40554	388	HARIHARGANJ	3209	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40555	388	HUSSAINABAD	3210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40556	388	LESLIGANJ	3211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40557	388	MANATU	3212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40558	388	PANDU	3213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40559	388	PANKI	3214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40560	388	PATAN	3215	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40561	388	SATBARWA	3216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40562	389	ANGARA	3217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40563	394	ARKI	3218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40564	389	BERO	3219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40565	389	BUNDU	3220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40566	389	BURMU	3221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40567	389	CHANHO	3222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40568	389	KANKE	3223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40569	394	KARRA	3224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40570	394	KHUNTI	3225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40571	389	LAPUNG	3226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40572	389	MANDAR	3227	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40573	394	MURHU	3228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40574	389	NAMKUM	3229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40575	389	ORMANJHI	3230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40576	394	RANIA	3231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40577	389	RATU	3232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40578	389	SILLI	3233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40579	389	SONAHATU	3234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40580	389	TAMAR	3235	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40581	394	TORPA	3236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40582	390	BARHAIT	3237	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40583	390	BARHARWA	3238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40584	390	BORIO	3239	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40585	390	MANDRO	3240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40586	390	PATHNA	3241	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40587	390	RAJMAHAL	3242	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40588	390	SAHIBGANJ	3243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40589	390	TALJHARI	3244	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40590	390	UDHWA	3245	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40591	391	CHANDIL	3246	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40592	391	GAMHARIA	3247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40593	391	ICHAGARH	3248	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40594	391	KHARSAWAN	3249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40595	391	KUCHAI	3250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40596	391	NIMDIH	3251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40597	391	RAJNAGAR	3252	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40598	391	SERAIKELLA	3253	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40599	392	BANO	3254	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40600	392	BOLBA	3255	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40601	392	JALDEGA	3256	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40602	392	KOLEBIRA	3257	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40603	392	KURDEG	3258	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40604	392	SIMDEGA	3259	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40605	392	THETHAITANGER	3260	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40606	393	BANDGAON	3261	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40607	393	CHAIBASA	3262	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40608	393	CHAKRADHARPUR	3263	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40609	393	GOELKERA	3264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40610	393	JAGANNATHPUR	3265	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40611	393	JHINKPANI	3266	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40612	393	KHUNTPANI	3267	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40613	393	KUMARDUNGI	3268	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40614	393	MANJHARI	3269	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40615	393	MANJHGAON	3270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40616	393	MANOHARPUR	3271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40617	393	NOAMUNDI	3272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40618	393	SONUA	3273	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40619	393	TANTNAGAR	3274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40620	393	TONTO	3275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40621	396	ANUGUL	3276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40622	396	ATHMALLIK	3277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40623	396	BANARPAL	3278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40624	396	CHHENDIPADA	3279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40625	396	KANIHA	3280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40626	396	KISHORENAGAR	3281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40627	396	PALALAHADA	3282	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40628	396	TALACHER	3283	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40629	397	AGALPUR	3284	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40630	397	BALANGIR	3285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40631	397	BANGOMUNDA	3286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40632	397	BELPARA	3287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40633	397	DEOGAON	3288	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40634	397	GUDVELLA	3289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40635	397	KHAPRAKHOL	3290	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40636	397	LOISINGA	3291	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40637	397	MURIBAHAL	3292	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40638	397	PATNAGARH	3293	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40639	397	PUINTALA	3294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40640	397	SAINTALA	3295	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40641	397	TITLAGARH	3296	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40642	397	TUREKELA	3297	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40643	398	BAHANAGA	3298	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40644	398	BALESHWAR	3299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40645	398	BALIAPAL	3300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40646	398	BASTA	3301	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40647	398	BHOGRAI	3302	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40648	398	JALESWAR	3303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40649	398	KHAIRA	3304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40650	398	NILGIRI	3305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40651	398	OUPADA	3306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40652	398	REMUNA	3307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40653	398	SIMULIA	3308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40654	398	SORO	3309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40655	399	AMBABHONA	3310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40656	399	ATTABIRA	3311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40657	399	BARGARH	3312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40658	399	BARPALI	3313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40659	399	BHATLI	3314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40660	399	BHEDEN	3315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40661	399	BIJEPUR	3316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40662	399	GAISILET	3317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40663	399	JHARBANDH	3318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40664	399	PADAMPUR	3319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40665	399	PAIKMAL	3320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40666	399	SOHELLA	3321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40667	400	BASUDEVPUR	3322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40668	400	BHADRAK	3323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40669	400	BHANDARIPOKHARI	3324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40670	400	BONTH	3325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40671	400	CHANDABALI	3326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40672	400	DHAMANAGAR	3327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40673	400	TIHIDI	3328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40674	401	BOUDH	3329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40675	401	HARABHANGA	3330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40676	401	KANTAMAL	3331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40677	402	ATHAGAD	3332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40678	402	BADAMBA	3333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40679	402	BANKI	3334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40680	402	BANKI- DAMPARA	3335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40681	402	BARANGA	3336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40682	402	CUTTACKSADAR	3337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40683	402	KANTAPADA	3338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40684	402	MAHANGA	3339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40685	402	NARASINGHPUR	3340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40686	402	NIALI	3341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40687	402	NISCHINTA KOILI	3342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40688	402	SALEPUR	3343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40689	402	TANGI CHOUDWAR	3344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40690	402	TIGIRIA	3345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40691	403	BARKOTE	3346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40692	403	REAMAL	3347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40693	403	TILEIBANI	3348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40694	404	BHUBAN	3349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40695	404	DHENKANAL SADAR	3350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40696	404	GONDIA	3351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40697	404	HINDOL	3352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40698	404	KAMAKHYANAGAR	3353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40699	404	KANKADA HAD	3354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40700	404	ODAPADA	3355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40701	404	PARJANG	3356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40702	405	GOSANI	3357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40703	405	GUMMA	3358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40704	405	KASINAGAR	3359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40705	405	MOHANA	3360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40706	405	NUAGADA	3361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40707	405	R.UDAYAGIRI	3362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40708	405	RAYAGADA	3363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40709	406	ASKA	3364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40710	406	BEGUNIAPADA	3365	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40711	406	BELLAGUNTHA	3366	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40712	406	BHANJANAGAR	3367	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40713	406	BUGUDA	3368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40714	406	CHATRAPUR	3369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40715	406	CHIKITI	3370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40716	406	DHARAKOTE	3371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40717	406	DIGAPAHANDI	3372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40718	406	GANJAM	3373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40719	406	HINJILICUT	3374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40720	406	JAGANNATHPRASAD	3375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40721	406	KABISURYANAGAR	3376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40722	406	KHALLIKOTE	3377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40723	406	KUKUDAKHANDI	3378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40724	406	PATRAPUR	3379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40725	406	POLOSARA	3380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40726	406	PURUSHOTTAMPUR	3381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40727	406	RANGEILUNDA	3382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40728	406	SANAKHEMUNDI	3383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40729	406	SHERAGADA	3384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40730	406	SURADA	3385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40731	407	BALIKUDA	3386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40732	407	BIRIDI	3387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40733	407	ERASAMA	3388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40734	407	JAGATSINGHPUR	3389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40735	407	KUJANG	3390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40736	407	NAUGAON	3391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40737	407	RAGHUNATHPUR	3392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40738	407	TIRTOL	3393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40739	408	BADCHANA	3394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40740	408	BARI	3395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40741	408	BINJHARPUR	3396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40742	408	DAHRMASALA	3397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40743	408	DANAGADI	3398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40744	408	DASARATHAPUR	3399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40745	408	JAJPUR	3400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40746	408	KOREI	3401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40747	408	RASULPUR	3402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40748	408	SUKINDA	3403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40749	409	JHARSUGUDA	3404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40750	409	KIRMIRA	3405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40751	409	KOLABIRA	3406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40752	409	LAIKERA	3407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40753	409	LAKHANPUR	3408	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40754	410	BHAWANIPATNA	3409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40755	410	DHARAMAGARH	3410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40756	410	GOLAMUNDA	3411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40757	410	JAYAPATNA	3412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40758	410	JUNAGARH	3413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40759	410	KALAMPUR	3414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40760	410	KARLAMUNDA	3415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40761	410	KESINGA	3416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40762	410	KOKASARA	3417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40763	410	LANJIGARH	3418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40764	410	MADANPUR    RAMPUR	3419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40765	410	NARALA	3420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40766	410	THUAMUL RAM PUR	3421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40767	411	BALIGUDA	3422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40768	411	CHAKAPAD	3423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40769	411	DARINGIBADI	3424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40770	411	G.UDAYAGIRI	3425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40771	411	K.NUAGAN	3426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40772	411	KHAJURIPADA	3427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40773	411	KOTAGARH	3428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40774	411	PHIRINGIA	3429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40775	411	PHULBANI	3430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40776	411	RAIKIA	3431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40777	411	TIKABALI	3432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40778	411	TUMUDIBANDH	3433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40779	412	AUL	3434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40780	412	DERABISH	3435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40781	412	GARADAPUR	3436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40782	412	KENDRAPADA	3437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40783	412	MAHAKALAPADA	3438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40784	412	MARSAGHAI	3439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40785	412	PATTAMUNDAI	3440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40786	412	RAJKANIKA	3441	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40787	412	RAJNAGAR	3442	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40788	413	ANANDAPUR	3443	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40789	413	BANSAPAL	3444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40790	413	CHAMPUA	3445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40791	413	GHASIPURA	3446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40792	413	GHATGAON	3447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40793	413	HARICHADANPUR	3448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40794	413	HATADIHI	3449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40795	413	JHUMPURA	3450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40796	413	JODA	3451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40797	413	KENDUJHAR SADAR	3452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40798	413	PATANA	3453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40799	413	SAHARAPADA	3454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40800	413	TELKOI	3455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40801	414	BALIANTA	3456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40802	414	BALIPATNA	3457	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40803	414	BANAPUR	3458	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40804	414	BEGUNIA	3459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40805	414	BHUBANESWAR	3460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40806	414	BOLAGARH	3461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40807	414	CHILIKA	3462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40808	414	JATNI	3463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40809	414	KHORDHA	3464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40810	414	TANGI	3465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40811	415	BANDHUGAON	3466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40812	415	BOIPARIGUDA	3467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40813	415	BORIGUMMA	3468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40814	415	DASAMANTAPUR	3469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40815	415	JEYPORE	3470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40816	415	KORAPUT	3471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40817	415	KOTPAD	3472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40818	415	KUNDURA	3473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40819	415	LAMTAPUT	3474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40820	415	LAXMIPUR	3475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40821	415	NANDAPUR	3476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40822	415	NARAYAN PATANA	3477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40823	415	POTTANGI	3478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40824	415	SEMILIGUDA	3479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40825	416	KALIMELA	3480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40826	416	KHAIRAPUT	3481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40827	416	KORUKONDA	3482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40828	416	CHITRAKONDA	3483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40829	416	MALKANGIRI	3484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40830	416	MATHILI	3485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40831	416	PODIA	3486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40832	417	BADASAHI	3487	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40833	417	BAHALDA	3488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40834	417	BANGRIPOSI	3489	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40835	417	BARIPADA	3490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40836	417	BETNOTI	3491	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40837	417	BIJATALA	3492	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40838	417	BISOI	3493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40839	417	GOPABANDHUNAGAR	3494	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40840	417	JAMDA	3495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40841	417	JOSHIPUR	3496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40842	417	KAPTIPADA	3497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40843	417	KARANJIA	3498	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40844	417	KHUNTA	3499	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40845	417	KULIANA	3500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40846	417	KUSUMI	3501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40847	417	MORADA	3502	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40848	417	RAIRANGPUR	3503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40849	417	RARUAN	3504	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40850	417	RASGOVINDPUR	3505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40851	417	SAMAKHUNTA	3506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40852	417	SARASKANA	3507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40853	417	SUKRULI	3508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40854	417	SULIAPADA	3509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40855	417	THAKURMUNDA	3510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40856	417	TIRING	3511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40857	417	UDALA	3512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40858	418	CHANDAHANDI	3513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40859	418	DABUGAM	3514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40860	418	JHARIGAM	3515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40861	418	KOSAGUMUDA	3516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40862	418	NABARANGPUR	3517	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40863	418	NANDAHANDI	3518	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40864	418	PAPADAHANDI	3519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40865	418	RAIGHAR	3520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40866	418	TENTULIKHUNTI	3521	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40867	418	UMERKOTE	3522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40868	419	BHAPUR	3523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40869	419	DASAPALLA	3524	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40870	419	GANIA	3525	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40871	419	KHANDAPARA	3526	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40872	419	NAYAGARH	3527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40873	419	NUAGAON	3528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40874	419	ODAGAON	3529	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40875	419	RANAPUR	3530	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40876	420	BODEN	3531	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40877	420	KHARIAR	3532	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40878	420	KOMNA	3533	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40879	420	NUAPADA	3534	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40880	420	SINAPALI	3535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40881	421	ASTARANGA	3536	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40882	421	BRAHMAGIRI	3537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40883	421	DELANGA	3538	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40884	421	GOP	3539	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40885	421	KAKAT PUR	3540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40886	421	KANAS	3541	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40887	421	KRUSHNAPRASAD	3542	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40888	421	NIMAPADA	3543	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40889	421	PIPILI	3544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40890	421	SADAR	3545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40891	421	SATYABADI	3546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40892	422	BISSAMCUTTACK	3547	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40893	422	CHANDRAPUR	3548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40894	422	GUDARI	3549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40895	422	GUNUPUR	3550	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40896	422	KALYANSINGPUR	3551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40897	422	KASIPUR	3552	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40898	422	KOLNARA	3553	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40899	422	MUNIGUDA	3554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40900	422	PADMAPUR	3555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40901	422	RAMANAGUDA	3556	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40902	422	RAYAGADA	3557	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40903	423	BAMRA	3558	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40904	423	DHANKAUDA	3559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40905	423	JAMANKIRA	3560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40906	423	JUJOMURA	3561	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40907	423	KUCHINDA	3562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40908	423	MANESWAR	3563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40909	423	NAKTIDEUL	3564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40910	423	RAIRAKHOL	3565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40911	423	RENGALI	3566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40912	424	BINIKA	3567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40913	424	BIRMAHARAJPUR	3568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40914	424	DUNGURIPALI	3569	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40915	424	SONEPUR	3570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40916	424	TARBHA	3571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40917	424	ULLUNDA	3572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40918	425	BALISANKARA	3573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40919	425	BARGAON	3574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40920	425	BISRA	3575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40921	425	BONAIGARH	3576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40922	425	GURUNDIA	3577	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40923	425	HEMGIR	3578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40924	425	KOIDA	3579	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40925	425	KUARMUNDA	3580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40926	425	KUTRA	3581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40927	425	LAHUNIPARA	3582	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40928	425	LATHIKATA	3583	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40929	425	LEPHRIPARA	3584	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40930	425	NUAGAON	3585	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40931	425	RAJGANGPUR	3586	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40932	425	SUBDEGA	3587	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40933	425	SUNDARGARH	3588	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40934	425	TANGARPALI	3589	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40935	445	BADERAJPUR	3590	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40936	426	BAKAWAND	3591	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40937	426	BASTANAR	3592	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40938	426	BASTAR	3593	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40939	426	DARBHA	3594	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40940	426	JAGDALPUR	3595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40941	445	KESHKAL	3596	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40942	445	KONDAGAON	3597	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40943	426	LOHANDIGUDA	3598	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40944	445	MAKDI	3599	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40945	443	NARAYANPUR	3600	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40946	443	ORCHHA(ABHUJMAD)	3601	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40947	445	PHARASGAON	3602	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40948	426	TOKAPAL	3603	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40949	427	BELHA	3604	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40950	427	GAURELLA-1	3605	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40951	427	GAURELLA-2	3606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40952	427	KOTA	3607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40953	449	LORMI	3608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40954	427	MARWAHI	3609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40955	427	MASTURI	3610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40956	449	MUNGELI	3611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40957	449	PATHARIYA	3612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40958	427	TAKHATPUR	3613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40959	442	BHAIRAMGARH	3614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40960	442	BHOPAL PATNAM	3615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40961	442	BIJAPUR	3616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40962	444	CHHINDGARH	3617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40963	428	DANTEWADA	3618	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40964	428	GEEDAM	3619	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40965	428	KATEKALYAN	3620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40966	444	KONTA	3621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40967	428	KUWAKONDA	3622	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40968	444	SUKMA	3623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40969	442	USOOR	3624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40970	429	DHAMTARI	3625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40971	429	KURUD	3626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40972	429	MAGARLOD	3627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40973	429	NAGARI	3628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40974	448	BALOD	3629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40975	452	BEMETARA	3630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40976	452	BERLA	3631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40977	430	DHAMDHA	3632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40978	448	DONDI	3633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40979	448	DONDILOHARA	3634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40980	430	DURG	3635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40981	448	GUNDERDEHI	3636	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40982	448	GURUR	3637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40983	452	NAWAGARH	3638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40984	430	PATAN	3639	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40985	452	SAJA	3640	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40986	431	AKALTARA	3641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40987	431	BAMHINDIH	3642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40988	431	BALODA	3643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40989	431	DABHARA	3644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40990	431	JAIJAIPUR	3645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40991	431	MALKHARODA	3646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40992	431	NAWAGARH	3647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40993	431	PAMGARH	3648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40994	431	SAKTI	3649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40995	432	BAGICHA	3650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40996	432	DULDULA	3651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40997	432	JASHPUR	3652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40998	432	KANSABEL	3653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
40999	432	KUNKURI	3654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41000	432	MANORA	3655	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41001	432	PATTHALGAON	3656	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41002	432	PHARSABAHAR	3657	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41003	433	ANTAGARH	3658	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41004	433	BHANUPRATAPPUR	3659	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41005	433	CHARAMA	3660	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41006	433	DURGUKONDAL	3661	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41007	433	KANKER	3662	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41008	433	KOILEBEDA	3663	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41009	433	NARHARPUR	3664	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41010	434	BODLA	3665	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41011	434	KAWARDHA	3666	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41012	434	PANDARIYA	3667	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41013	434	S.LOHARA	3668	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41014	435	KARTALA	3669	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41015	435	KATGHORA	3670	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41016	435	KORBA	3671	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41017	435	PALI	3672	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41018	435	PODI UPARODA	3673	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41019	436	BHARATPUR	3675	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41020	436	KHADGAWANA	3676	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41021	436	MANENDRAGARH	3677	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41022	436	SONHAT	3678	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41023	437	BAGBAHARA	3679	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41024	437	BASNA	3680	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41025	437	MAHASAMUND	3681	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41026	437	PITHORA	3682	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41027	437	SARAIPALI	3683	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41028	438	BARAMKELA	3684	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41029	438	DHARAMJAIGARH	3685	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41030	438	GHARGHODA	3686	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41031	438	KHARSIA	3687	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41032	438	LAILUNGA	3688	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41033	438	PUSSORE	3689	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41034	438	RAIGARH	3690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41035	438	SARANGARH	3691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41036	438	TAMNAR	3692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41037	439	ABHANPUR	3693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41038	439	ARANG	3694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41039	446	BALODA BAZAR	3695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41040	446	BHATAPARA	3696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41041	446	BILAIGARH	3697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41042	447	CHHURRA	3698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41043	447	DEOBHOG	3699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41044	439	DHARSIWA	3700	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41045	447	FINGESHWAR	3701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41046	447	GARIYABAND	3702	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41047	446	KASDOL	3703	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41048	447	MAINPUR	3704	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41049	446	PALARI	3705	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41050	446	SIMGA	3706	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41051	439	TILDA	3707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41052	440	A.CHOWKI (TD)	3708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41053	440	CHHUIKHADAN	3709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41054	440	CHHURIYA	3710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41055	440	DONGARGAON	3711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41056	440	DONGARGHAR	3712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41057	440	KHAIRAGARH	3713	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41058	440	MANPUR (TD)	3714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41059	440	MOHALA (TD)	3715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41060	440	RAJNANDGAON	3716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41061	441	AMBIKAPUR	3717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41062	451	BALRAMPUR	3718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41063	441	BATAULI	3719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41064	450	BHAIYATHAN	3720	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41065	451	KUSMI	3721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41066	441	LAKHANPUR	3722	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41067	441	LUNDRA	3723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41068	441	MAINPAT	3724	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41069	450	ODAGI	3725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41070	450	PRATAPPUR	3726	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41071	450	PREMNAGAR	3727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41072	451	RAJPUR	3728	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41073	450	RAMANUJNAGAR	3729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41074	451	RAMCHANDRAPUR	3730	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41075	451	SHANKARGARH	3731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41076	441	SITAPUR	3732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41077	450	SURAJPUR	3733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41078	441	UDAIPUR	3734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41079	451	WADRAFNAGAR	3735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41080	453	ANUPPUR	3736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41081	453	JAITHARI	3737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41082	453	KOTMA	3738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41083	453	PUSHPRAJGARH	3739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41084	454	ASHOKNAGAR	3740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41085	454	CHANDERI	3741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41086	454	ISAGARH	3742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41087	454	MUNGAOLI	3743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41088	455	BAIHAR	3744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41089	455	BALAGHAT	3745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41090	455	BIRSA	3746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41091	455	KATANGI	3747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41092	455	KHAIRLANJI	3748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41093	455	KIRNAPUR	3749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41094	455	LALBARRA	3750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41095	455	LANJI	3751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41096	455	PARASWADA	3752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41097	455	WARASEONI	3753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41098	456	BARWANI	3754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41099	456	NEWALI	3755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41100	456	PANSEMAL	3756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41101	456	PATI	3757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41102	456	RAJPUR	3758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41103	456	SENDHAWA	3759	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41104	456	THIKRI	3760	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41105	457	AMLA	3761	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41106	457	ATHNER	3762	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41107	457	BETUL	3763	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41108	457	BHAINSDEHI	3764	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41109	457	BHIMPUR	3765	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41110	457	CHICHOLI	3766	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41111	457	GHORADONGRI	3767	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41112	457	MULTAI	3768	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41113	457	PRABHAT PATTAN	3769	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41114	457	SHAHPUR	3770	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41115	458	ATER	3771	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41116	458	BHIND	3772	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41117	458	GOHAD	3773	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41118	458	LAHAR	3774	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41119	458	MEHGAON	3775	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41120	458	RAON	3776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41121	459	BERASIA	3777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41122	459	PHANDA	3778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41123	460	BURHANPUR	3779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41124	460	KHAKNAR	3780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41125	461	BADA MALEHARA	3781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41126	461	BARIGARH	3782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41127	461	BIJAWAR	3783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41128	461	BUXWAHA	3784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41129	461	CHHATARPUR	3785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41130	461	LAUNDI	3786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41131	461	NOWGONG	3787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41132	461	RAJNAGAR	3788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41133	462	AMARWARA	3789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41134	462	BICHHUA	3790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41135	462	CHAURAI	3791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41136	462	CHHINDWARA	3792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41137	462	HARRAI	3793	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41138	462	JAMAI	3794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41139	462	MOHKHED	3795	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41140	462	PANDHURNA	3796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41141	462	PARASIA	3797	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41142	462	SAUSAR	3798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41143	462	TAMIA	3799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41144	463	BATIYAGARH	3800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41145	463	DAMOH	3801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41146	463	HATTA	3802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41147	463	JABERA	3803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41148	463	PATERA	3804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41149	463	PATHARIYA	3805	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41150	463	TENDUKHEDA	3806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41151	464	BHANDER	3807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41152	464	DATIA	3808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41153	464	SEONDHA	3809	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41154	465	BAGLI	3810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41155	465	DEWAS	3811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41156	465	KANNOD	3812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41157	465	KHATEGAON	3813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41158	465	SONKATCH	3814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41159	465	TONK KHURD	3815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41160	466	BADNAWAR	3816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41161	466	BAGH	3817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41162	466	DAHI	3818	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41163	466	DHAR	3819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41164	466	DHARAMPURI	3820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41165	466	GANDHWANI	3821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41166	466	KUKSHI	3822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41167	466	MANAWAR	3823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41168	466	NALCHHA	3824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41169	466	NISARPUR	3825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41170	466	SARDARPUR	3826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41171	466	TIRLA	3827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41172	466	UMARBAN	3828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41173	467	AMARPUR	3829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41174	467	BAJAG	3830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41175	467	DINDORI	3831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41176	467	KARANJIYA	3832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41177	467	MEHANDWANI	3833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41178	467	SAMNAPUR	3834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41179	467	SHAHPURA	3835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41180	468	BALADI	3836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41181	468	CHHAIGAON MAKHAN	3837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41182	468	HARSUD	3838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41183	468	KHALWA	3839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41184	468	KHANDWA	3840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41185	468	PANDHANA	3841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41186	468	PUNASA	3842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41187	469	ARON	3843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41188	469	BAMORI	3844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41189	469	CHANCHODA	3845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41190	469	GUNA	3846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41191	469	RAGHOGARH	3847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41192	470	BHITARWAR	3848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41193	470	DABRA	3849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41194	470	GHATIGAON	3850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41195	470	MORAR	3851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41196	471	HARDA	3852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41197	471	KHIRKIYA	3853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41198	471	TIMARNI	3854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41199	472	BABAI	3855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41200	472	BANKHEDI	3856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41201	472	HOSHANGABAD	3857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41202	472	KESLA	3858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41203	472	PIPARIYA	3859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41204	472	SEONI MALWA	3860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41205	472	SOHAGPUR	3861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41206	473	DEPALPUR	3862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41207	473	INDORE	3863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41208	473	MHOW	3864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41209	473	SANWER	3865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41210	474	JABALPUR	3866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41211	474	KUNDAM	3867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41212	474	MAJHOULI	3868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41213	474	PANAGAR	3869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41214	474	PATAN	3870	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41215	474	SHAHPURA	3871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41216	474	SIHORA	3872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41217	502	ALIRAJPUR	3873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41218	502	BHABRA	3874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41219	475	JHABUA	3875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41220	502	JOBAT	3876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41221	502	KATTHIWADA	3877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41222	475	MEGHNAGAR	3878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41223	475	PETLAWAD	3879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41224	475	RAMA	3880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41225	475	RANAPUR	3881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41226	502	SONDWA	3882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41227	475	THANDLA	3883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41228	502	UDAIGARH	3884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41229	476	BADWARA	3885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41230	476	BAHORIBAND	3886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41231	476	DHEEMERKHEDA	3887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41232	476	KATNI	3888	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41233	476	RITHI	3889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41234	476	VIJAYRAGHAVGARH	3890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41235	477	BARWAH	3891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41236	477	BHAGVANPURA	3892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41237	477	BHIKANGAON	3893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41238	477	GOGAWAN	3894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41239	477	KASRAWAD	3895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41240	477	KHARGONE	3896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41241	477	MAHESHWAR	3897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41242	477	SEGAON	3898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41243	477	ZIRANYA	3899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41244	478	BICHHIYA	3900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41245	478	BIJADANDI	3901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41246	478	GHUGHRI	3902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41247	478	MANDLA	3903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41248	478	MAWAI	3904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41249	478	MOHGAON	3905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41250	478	NAINPUR	3906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41251	478	NARAYANGANJ	3907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41252	478	NIWAS	3908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41253	479	BHANPURA	3909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41254	479	GAROTH	3910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41255	479	MALHARGARH	3911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41256	479	MANDSAUR	3912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41257	479	SITAMAU	3913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41258	480	AMBAH	3914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41259	480	JOURA	3915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41260	480	KAILARAS	3916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41261	480	MORENA	3917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41262	480	PAHADGARH	3918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41263	480	PORSA	3919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41264	480	SABALGARH	3920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41265	481	BABAI CHICHALI	3921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41266	481	CHAWARPATHA	3922	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41267	481	GOTEGAON	3923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41268	481	KARELI	3924	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41269	481	NARSIMHAPUR	3925	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41270	481	SAINKHEDA	3926	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41271	482	JAWAD	3927	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41272	482	MANASA	3928	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41273	482	NEEMUCH	3929	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41274	483	AJAIGARH	3930	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41275	483	GUNOUR	3931	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41276	483	PANNA	3932	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41277	483	PAWAI	3933	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41278	483	SHAHNAGAR	3934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41279	484	BADI	3935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41280	484	BEGAMGANJ	3936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41281	484	GAIRATGANJ	3937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41282	484	OBAIDALLAGANJ	3938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41283	484	SANCHI	3939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41284	484	SILWANI	3940	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41285	484	UDAIPURA	3941	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41286	485	BIAORA	3942	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41287	485	KHILCHIPUR	3943	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41288	485	NARSINGHGARH	3944	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41289	485	RAJGARH	3945	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41290	485	SARANGPUR	3946	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41291	485	ZIRAPUR	3947	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41292	486	ALOT	3948	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41293	486	BAJNA	3949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41294	486	JAORA	3950	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41295	486	PIPLODA	3951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41296	486	RATLAM	3952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41297	486	SAILANA	3953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41298	487	GANGEV	3954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41299	487	HANUMANA	3955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41300	487	JAWA	3956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41301	487	MAUGANJ	3957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41302	487	NAIGARHI	3958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41303	487	RAIPUR  KARCHULIYAN	3959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41304	487	REWA	3960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41305	487	SIRMOUR	3961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41306	487	TEONTHAR	3962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41307	488	BANDA	3963	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41308	488	BINA	3964	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41309	488	DEORI	3965	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41310	488	JAISINAGAR	3966	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41311	488	KESLI	3967	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41312	488	KHURAI	3968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41313	488	MALTHONE	3969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41314	488	RAHATGARH	3970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41315	488	REHLI	3971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41316	488	SAGAR	3972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41317	488	SHAHGARH	3973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41318	489	AMARPATAN	3974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41319	489	MAIHAR	3975	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41320	489	MAJHGAWAN	3976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41321	489	NAGOD	3977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41322	489	RAMNAGAR	3978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41323	489	RAMPUR BAGHELAN	3979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41324	489	SOHAWAL	3980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41325	489	UNCHAHARA	3981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41326	490	ASHTA	3982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41327	490	BUDNI	3983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41328	490	ICHHAWAR	3984	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41329	490	NASRULLAGANJ	3985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41330	490	SEHORE	3986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41331	491	BARGHAT	3987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41332	491	CHHAPARA	3988	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41333	491	DHANAURA	3989	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41334	491	KAHNAPAS(GHANSAUR)	3990	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41335	491	KEOLARI	3991	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41336	491	KURAI	3992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41337	491	LAKHNADON	3993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41338	491	SEONI	3994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41339	492	BEOHARI	3995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41340	492	BURHAR	3996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41341	492	GOHPARU	3997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41342	492	JAISINGHNAGAR	3998	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41343	492	SOHAGPUR	3999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41344	493	AGAR	4000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41345	493	BAROD	4001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41346	493	KALAPIPAL	4002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41347	493	MOMAN BADODIA	4003	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41348	493	NALKHEDA	4004	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41349	493	SHAJAPUR	4005	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41350	493	SHUJALPUR	4006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41351	493	SUSNER	4007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41352	494	KARAHAL	4008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41353	494	SHEOPUR	4009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41354	494	VIJAYPUR	4010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41355	495	BADARWAS	4011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41356	495	KARERA	4012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41357	495	KHANIADHANA	4013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41358	495	KOLARAS	4014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41359	495	NARWAR	4015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41360	495	PICHHORE	4016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41361	495	POHRI	4017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41362	495	SHIVPURI	4018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41363	501	CHITRANGI	4019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41364	501	DEVSAR	4020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41365	496	KUSMI	4021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41366	496	MAJHAULI	4022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41367	496	RAMPUR NAIKIN	4023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41368	496	SIDHI	4024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41369	496	SIHAWAL	4025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41370	501	BAIDHAN	4026	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41371	497	BALDEOGARH	4027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41372	497	JATARA	4028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41373	497	NIWARI	4029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41374	497	PALERA	4030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41375	497	PRITHVIPUR	4031	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41376	497	TIKAMGARH	4032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41377	498	BADNAGAR	4033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41378	498	GHATIYA	4034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41379	498	KHACHAROD	4035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41380	498	MAHIDPUR	4036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41381	498	TARANA	4037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41382	498	UJJAIN	4038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41383	499	KARKELI	4039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41384	499	MANPUR	4040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41385	499	PALI	4041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41386	500	BASODA	4042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41387	500	GYARASPUR	4043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41388	500	KURWAI	4044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41389	500	LATERI	4045	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41390	500	NATERAN	4046	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41391	500	SIRONJ	4047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41392	500	VIDISHA	4048	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41393	503	AHMADABAD CITY	4049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41394	535	BARVALA	4050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41395	503	BAVLA	4051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41396	503	DASKROI	4052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41397	503	DETROJ RAMPURA	4053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41398	503	DHANDHUKA	4054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41399	503	DHOLKA	4055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41400	503	MANDAL	4056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41401	535	RANPUR	4057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41402	503	SANAND	4058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41403	503	VIRAMGAM	4059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41404	504	AMRELI	4060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41405	504	BABRA	4061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41406	504	BAGASARA	4062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41407	504	DHARI	4063	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41408	504	JAFRABAD	4064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41409	504	KHAMBHA	4065	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41410	504	KUNKAVAV -VADIA	4066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41411	504	LATHI	4067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41412	504	LILIA	4068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41413	504	RAJULA	4069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41414	504	SAVERKUNDLA	4070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41415	505	ANAND	4071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41416	505	ANKLAV	4072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41417	505	BORSAD	4073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41418	505	KHAMBHAT	4074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41419	505	PETLAD	4075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41420	505	SOJITRA	4076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41421	505	TARAPUR	4077	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41422	505	UMRETH	4078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41423	506	AMIRGADH	4079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41424	506	BHABHAR	4080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41425	506	DANTA	4081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41426	506	DANTIVADA	4082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41427	506	DEESA	4083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41428	506	DEODAR	4084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41429	506	DHANERA	4085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41430	506	KANKREJ	4086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41431	506	PALANPUR	4087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41432	506	THARAD	4088	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41433	506	VADGAM	4089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41434	506	VAV	4090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41435	507	AMOD	4091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41436	507	ANKLESVAR	4092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41437	507	BHARUCH	4093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41438	507	HANSOT	4094	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41439	507	JAMBUSAR	4095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41440	507	JHAGADIA	4096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41441	507	VAGRA	4097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41442	507	VALIA	4098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41443	508	BHAVNAGAR	4099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41444	535	BOTAD	4100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41445	535	GADHADA	4101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41446	508	GARIADHAR	4102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41447	508	GHOGHA	4103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41448	508	MAHUVA	4104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41449	508	PALITANA	4105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41450	508	SIHOR	4106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41451	508	TALAJA	4107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41452	508	UMRALA	4108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41453	508	VALLABHIPUR	4109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41454	509	AHWA	4110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41455	510	DAHOD	4111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41456	510	DEVGAD BARIYA	4112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41457	510	DHANPUR	4113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41458	510	FATEPURA	4114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41459	510	GARBADA	4115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41460	510	JHALOD	4116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41461	510	LIMKHEDA	4117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41462	511	DEHGAM	4118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41463	511	GANDHINAGAR	4119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41464	511	KALOL	4120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41465	511	MANSA	4121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41466	533	BHANVAD	4122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41467	512	DHROL	4123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41468	512	JAMJODHPUR	4124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41469	512	JAMNAGAR	4125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41470	512	JODIYA	4126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41471	512	KALAVAD	4127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41472	533	KALYANPUR	4128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41473	533	KHAMBHALIA	4129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41474	512	LALPUR	4130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41475	533	OKHAMANDAL	4131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41476	513	BHESAN	4132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41477	513	JUNAGADH	4133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41478	513	KESHOD	4134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41479	534	KODINAR	4135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41480	513	MALIA	4136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41481	513	MANAVADAR	4137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41482	513	MANGROL	4138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41483	513	MENDARDA	4139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41484	534	PATAN VERAVAL	4140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41485	534	SUTRAPADA	4141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41486	534	TALALA	4142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41487	534	UNA	4143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41488	513	VANTHALI	4144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41489	513	VISAVADAR	4145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41490	514	ABDASA	4146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41491	514	ANJAR	4147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41492	514	BHACHAU	4148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41493	514	BHUJ	4149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41494	514	GANDHIDHAM	4150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41495	514	LAKHPAT	4151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41496	514	MANDVI	4152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41497	514	MUNDRA	4153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41498	514	NAKHATRANA	4154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41499	514	RAPAR	4155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41500	530	BALASINOR	4156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41501	515	KAPADVANJ	4157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41502	515	KATHLAL	4158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41503	515	KHEDA	4159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41504	515	MAHUDHA	4160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41505	515	MATAR	4161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41506	515	MEHMEDABAD	4162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41507	515	NADIAD	4163	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41508	515	THASRA	4164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41509	530	VIRPUR	4165	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41510	516	BECHRAJI	4166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41511	516	KADI	4167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41512	516	KHERALU	4168	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41513	516	MAHESANA	4169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41514	516	SATLASNA	4170	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41515	516	UNJHA	4171	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41516	516	VADNAGAR	4172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41517	516	VIJAPUR	4173	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41518	516	VISNAGAR	4174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41519	517	DEDIYAPADA	4175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41520	517	NANDOD	4176	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41521	517	SAGBARA	4177	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41522	517	TILAKWADA	4178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41523	518	CHIKHALI	4179	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41524	518	GANDEVI	4180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41525	518	JALALPORE	4181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41526	518	NAVSARI	4182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41527	518	VANSDA	4183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41528	519	GHOGHAMBA	4184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41529	519	GODHRA	4185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41530	519	HALOL	4186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41531	519	JAMBUGHODA	4187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41532	530	KADANA	4188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41533	519	KALOL	4189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41534	530	KHANPUR	4190	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41535	530	LUNAWADA	4191	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41536	519	MORVAHADAF	4192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41537	530	SANTRAMPUR	4193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41538	519	SHEHERA	4194	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41539	520	CHANASMA	4195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41540	520	HARIJ	4196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41541	520	PATAN	4197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41542	520	RADHANPUR	4198	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41543	520	SAMI	4199	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41544	520	SANTALPUR	4200	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41545	520	SIDHPUR	4201	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41546	521	KUTIYANA	4202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41547	521	PORBANDAR	4203	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41548	521	RANAVAV	4204	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41549	522	DHORAJI	4205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41550	522	GONDAL	4206	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41551	522	JAMKANDORNA	4207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41552	522	JASDAN	4208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41553	522	JETPUR	4209	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41554	522	KOTDA SANGANI	4210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41555	522	LODHIKA	4211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41556	532	MALIYA	4212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41557	532	MORVI	4213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41558	522	PADDHARI	4214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41559	522	RAJKOT	4215	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41560	532	TANKARA	4216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41561	522	UPLETA	4217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41562	532	WANKANER	4218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41563	531	BAYAD	4219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41564	531	BHILODA	4220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41565	531	DHANSURA	4221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41566	523	HIMATNAGAR	4222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41567	523	IDAR	4223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41568	523	KHEDBRAHMA	4224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41569	531	MALPUR	4225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41570	531	MEGHRAJ	4226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41571	531	MODASA	4227	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41572	523	PRANTIJ	4228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41573	523	TALOD	4229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41574	523	VADALI	4230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41575	523	VIJAYNAGAR	4231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41576	524	BARDOLI	4232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41577	524	CHORASI	4233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41578	524	KAMREJ	4234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41579	524	MAHUVA	4235	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41580	524	MANDVI	4236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41581	524	MANGROL	4237	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41582	528	NIZAR	4238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41583	524	OLPAD	4239	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41584	524	PALSANA	4240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41585	528	SONGADH	4241	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41586	524	SURATCITY	4242	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41587	528	UCHCHHAL	4243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41588	524	UMARPADA	4244	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41589	528	VALOD	4245	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41590	528	VYARA	4246	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41591	525	CHOTILA	4247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41592	525	CHUDA	4248	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41593	525	DASADA	4249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41594	525	DHRANGADHRA	4250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41595	532	HALVAD	4251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41596	525	LAKHTAR	4252	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41597	525	LIMBDI	4253	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41598	525	MULI	4254	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41599	525	SAYLA	4255	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41600	525	WADHWAN	4256	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41601	529	CHHOTA UDEPUR	4257	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41602	526	DABHOI	4258	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41603	529	JETPUR PAVI	4259	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41604	526	KARJAN	4260	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41605	529	KAWANT	4261	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41606	529	NASWADI	4262	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41607	526	PADRA	4263	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41608	529	SANKHEDA	4264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41609	526	SAVLI	4265	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41610	526	SHINOR	4266	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41611	526	VADODARA(CITY AND RURAL)	4267	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41612	526	WAGHODIA	4268	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41613	527	DHARAMPUR	4269	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41614	527	KAPRADA	4270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41615	527	PARDI	4271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41616	527	UMBERGAON	4272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41617	527	VALSAD	4273	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41618	536	DAMAN	4274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41619	537	DIU	4275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41620	538	Dadra Nagar Haveli	4276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41621	539	AKOLE	4277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41622	539	JAMKHED	4278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41623	539	KARJAT	4279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41624	539	KOPARGAON	4280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41625	539	NAGAR	4281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41626	539	NEVASA	4282	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41627	539	PARNER	4283	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41628	539	PATHARDI	4284	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41629	539	RAHATA	4285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41630	539	RAHURI	4286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41631	539	SANGAMNER	4287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41632	539	SHEVGAON	4288	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41633	539	SHRIGONDA	4289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41634	539	SHRIRAMPUR	4290	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41635	540	AKOLA	4291	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41636	540	AKOT	4292	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41637	540	BALAPUR	4293	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41638	540	BARSHITAKLI	4294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41639	540	MURTIJAPUR	4295	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41640	540	PATUR	4296	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41641	540	TELHARA	4297	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41642	541	ACHALPUR	4298	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41643	541	AMRAVATI	4299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41644	541	ANJANGAON S	4300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41645	541	BHATKULI	4301	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41646	541	CHANDUR RIL	4302	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41647	541	CHANDUR BZ	4303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41648	541	CHIKHALDARA	4304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41649	541	DARYAPUR	4305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41650	541	DHAMANGAON RIL	4306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41651	541	DHARNI	4307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41652	541	MORSHI	4308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41653	541	NANDGAON KH	4309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41654	541	TIWSA	4310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41655	541	WARUD	4311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41656	542	AURANGABAD	4312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41657	542	GANGAPUR	4313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41658	542	KANAND	4314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41659	542	KHULTABAD	4315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41660	542	PAITHAN	4316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41661	542	PHULAMBRI	4317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41662	542	SILLOD	4318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41663	542	SOEGAON	4319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41664	542	VAIJAPUR	4320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41665	543	AMBAJOGAI	4321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41666	543	ASHTI	4322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41667	543	BEED	4323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41668	543	DHARUR	4324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41669	543	GEORAI	4325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41670	543	KAIJ	4326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41671	543	MAJALGAON	4327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41672	543	PARALI  V .	4328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41673	543	PATODA	4329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41674	543	SHIRUR ( KA )	4330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41675	543	WADWANI	4331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41676	544	BHANDARA	4332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41677	544	LAKHANDUR	4333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41678	544	LAKHANI	4334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41679	544	MOHADI	4335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41680	544	PAUNI	4336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41681	544	SAKOLI	4337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41682	544	TUMSAR	4338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41683	545	BULDANA	4339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41684	545	CHIKHLI	4340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41685	545	D. RAJA	4341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41686	545	JALGAONJAMOD	4342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41687	545	KHAMGAON	4343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41688	545	LONAR	4344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41689	545	MALKAPUR	4345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41690	545	MEHKAR	4346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41691	545	MOTALA	4347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41692	545	NANDURA	4348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41693	545	SANGRAMPUR	4349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41694	545	SHEGAON	4350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41695	545	SINDKHEDRAJA	4351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41696	546	BALLARPUR	4352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41697	546	BHADRAWATI	4353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41698	546	BRAHMAPURI	4354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41699	546	CHANDRAPUR	4355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41700	546	CHIMUR	4356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41701	546	GONDPIPRI	4357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41702	546	JIWATI	4358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41703	546	KORPANA	4359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41704	546	MUL	4360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41705	546	NAGBHID	4361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41706	546	POMBHURNA	4362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41707	546	RAJURA	4363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41708	546	SAOLI	4364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41709	546	SINDEWAHI	4365	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41710	546	WARORA	4366	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41711	547	DHULE	4367	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41712	547	SAKRI	4368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41713	547	SHINDKHEDE	4369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41714	547	SHIRPUR	4370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41715	548	AHERI	4371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41716	548	ARMORI	4372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41717	548	BHAMARAGAD	4373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41718	548	CHAMORSHI	4374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41719	548	DESAIGANJ (WADSA)	4375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41720	548	DHANORA	4376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41721	548	ETAPALLI	4377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41722	548	GADCHIROLI	4378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41723	548	KORCHI	4379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41724	548	KURKHEDA	4380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41725	548	MULCHERA	4381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41726	548	SIRONCHA	4382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41727	549	AMGAON	4383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41728	549	ARJUNI MORGAON	4384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41729	549	DEORI	4385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41730	549	GONDIA	4386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41731	549	GOREGAON	4387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41732	549	SADAK ARJUNI	4388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41733	549	SALEKASA	4389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41734	549	TIRORA	4390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41735	550	AUNDHA  NAGNATH	4391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41736	550	BASMAT	4392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41737	550	HINGOLI	4393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41738	550	KALAMNURI	4394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41739	550	SENGAON	4395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41740	551	AMALNER	4396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41741	551	BHADGAON	4397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41742	551	BHUSAWAL	4398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41743	551	BODWAD	4399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41744	551	CHALISGAON	4400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41745	551	CHOPDA	4401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41746	551	DHARANGAON	4402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41747	551	ERANDOL	4403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41748	551	JALGAON	4404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41749	551	JAMNER	4405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41750	551	MUKTAINAGAR	4406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41751	551	PACHORA	4407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41752	551	PAROLA	4408	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41753	551	RAVER	4409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41754	551	YAWAL	4410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41755	552	AMBAD	4411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41756	552	BADNAPUR	4412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41757	552	BHOKARDAN	4413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41758	552	GHANSAWANGI	4414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41759	552	JAFRABAD	4415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41760	552	JALNA	4416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41761	552	MANTHA	4417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41762	552	PARTUR	4418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41763	553	AJARA	4419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41764	553	GAGAN BAVADA	4420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41765	553	BHUDARGAD	4421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41766	553	CHANDGAD	4422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41767	553	GADHINGLAJ	4423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41768	553	HATKANANGALE	4424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41769	553	KAGAL	4425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41770	553	KARVEER	4426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41771	553	PANHALA	4427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41772	553	RADHANAGARI	4428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41773	553	SHAHUWADI	4429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41774	553	SHIROL	4430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41775	554	AHEMADPUR	4431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41776	554	AUSA	4432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41777	554	CHAKUR	4433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41778	554	DEONI	4434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41779	554	JALKOT	4435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41780	554	LATUR	4436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41781	554	NILANGA	4437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41782	554	RENAPUR	4438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41783	554	SHIRUR ANANTPAL	4439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41784	554	UDGIR	4440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41785	555	BHIVAPUR	4444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41786	555	HINGNA	4445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41787	555	KALMESHWAR	4446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41788	555	KAMPTEE	4447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41789	555	KATOL	4448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41790	555	KUHI	4449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41791	555	MOUDA	4450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41792	555	NAGPUR	4451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41793	555	NARKHED	4452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41794	555	PARSEONI	4453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41795	555	RAMTEK	4454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41796	555	SAONER	4455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41797	555	UMRED	4456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41798	556	ARDHAPUR	4457	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41799	556	BHOKAR	4458	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41800	556	BILOLI	4459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41801	556	DEGLUR	4460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41802	556	DHARMABAD	4461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41803	556	HADGAON	4462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41804	556	HIMAYATNAGAR	4463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41805	556	KANDHAR	4464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41806	556	KINWAT	4465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41807	556	LOHA	4466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41808	556	MAHUR	4467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41809	556	MODKHED	4468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41810	556	MOKHED	4469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41811	556	NAIGAON (KH)	4470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41812	556	NANDED	4471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41813	556	UMRI	4472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41814	557	AKKALKUWA	4473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41815	557	AKARANI	4474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41816	557	NANDURBAR	4475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41817	557	NAVAPUR	4476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41818	557	SHAHADA	4477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41819	557	TALODA	4478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41820	558	BAGLAN	4479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41821	558	CHANDWAD	4480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41822	558	DEOLA	4481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41823	558	DINDORI	4482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41824	558	IGATPURI	4483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41825	558	KALWAN	4484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41826	558	MALEGAON	4485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41827	558	NANDGAON	4486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41828	558	NASHIK	4487	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41829	558	NIPHAD	4488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41830	558	PETH	4489	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41831	558	SINNAR	4490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41832	558	SURGANA	4491	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41833	558	TRIMBAK	4492	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41834	558	YEOLA	4493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41835	559	BHOOM	4494	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41836	559	KALAMB	4495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41837	559	LOHARA	4496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41838	559	OMERGA	4497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41839	559	OSMANABAD	4498	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41840	559	PARANDA	4499	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41841	559	TULJAPUR	4500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41842	559	WASHI	4501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41843	560	GANGAKHED	4502	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41844	560	JINTUR	4503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41845	560	MANWAT	4504	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41846	560	PALAM	4505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41847	560	PARBHANI	4506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41848	560	PATHRI	4507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41849	560	PURNA	4508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41850	560	SAILU	4509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41851	560	SONPETH	4510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41852	561	AMBEGAON	4511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41853	561	BARAMATI	4512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41854	561	BHOR	4513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41855	561	DAUND	4514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41856	561	HAVELI	4515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41857	561	INDAPUR	4516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41858	561	JUNNAR	4517	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41859	561	KHED	4518	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41860	561	MAVAL	4519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41861	561	MULSHI	4520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41862	561	PURANDAR	4522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41863	561	SHIRUR	4523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41864	561	VELHE	4524	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41865	562	ALIBAG	4525	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41866	562	KARJAT	4526	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41867	562	KHALAPUR	4527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41868	562	MAHAD	4528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41869	562	MANGAON	4529	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41870	562	MHASALA	4530	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41871	562	MURUD	4531	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41872	562	PANVEL	4532	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41873	562	PEN	4533	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41874	562	POLADPUR	4534	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41875	562	ROHA	4535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41876	562	SHRIVARDHAN	4536	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41877	562	SUDHAGAD	4537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41878	562	TALA	4538	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41879	562	URAN	4539	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41880	563	CHIPALUN	4540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41881	563	DAPOLI	4541	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41882	563	GUHAGAR	4542	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41883	563	KHED	4543	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41884	563	LANJA	4544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41885	563	MANDANGAD	4545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41886	563	RAJAPUR	4546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41887	563	RATNAGIRI	4547	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41888	563	SANGMESHWAR	4548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41889	564	ATPADI	4549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41890	564	JATH	4550	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41891	564	KADEGAON	4551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41892	564	KAVATHEMAHANKAL	4552	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41893	564	KHANAPUR-VITA	4553	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41894	564	MIRAJ	4554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41895	564	PALUS	4555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41896	564	SHIRALA	4556	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41897	564	TASGAON	4557	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41898	564	VALVA-ISLAMPUR	4558	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41899	565	JAWALI	4559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41900	565	KARAD	4560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41901	565	KHANDALA	4561	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41902	565	KHATAV	4562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41903	565	KOREGAON	4563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41904	565	MAHABALESHWAR	4564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41905	565	MAN	4565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41906	565	PATAN	4566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41907	565	PHALTAN	4567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41908	565	SATARA	4568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41909	565	WAI	4569	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41910	566	DEOGAD	4570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41911	566	DODAMARG	4571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41912	566	KANKAVALI	4572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41913	566	KUDAL	4573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41914	566	MALVAN	4574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41915	566	SAWANTWADI	4575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41916	566	VAIBHAVAWADI	4576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41917	566	VENGURLA	4577	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41918	567	AKKALKOT	4578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41919	567	BARSHI	4579	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41920	567	KARMALA	4580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41921	567	MADHA	4581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41922	567	MALSHIRAS	4582	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41923	567	MANGALVEDHE	4583	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41924	567	MOHOL	4584	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41925	567	PANDHARPUR	4585	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41926	567	SANGOLA	4586	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41927	567	SOLAPUR NORTH	4587	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41928	567	SOUTH  SOLAPUR	4588	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41929	568	AMBERNATH	4589	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41930	568	BHIWANDI	4590	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41931	572	DAHANU	4591	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41932	572	JAWHAR	4592	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41933	568	KALYAN	4593	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41934	572	MOKHADA	4594	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41935	568	MURBAD	4595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41936	572	PALGHAR	4596	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41937	568	SHAHAPUR	4597	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41938	572	TALASARI	4598	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41939	572	VASAI	4601	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41940	572	VIKRAMGAD	4602	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41941	572	WADA	4603	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41942	569	ARVI	4604	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41943	569	ASHTI	4605	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41944	569	DEOLI	4606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41945	569	HINGANGHAT	4607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41946	569	KARANJA	4608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41947	569	SAMUDRAPUR	4609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41948	569	SELOO	4610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41949	569	WARDHA	4611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41950	570	KARANJA	4612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41951	570	MALEGAON	4613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41952	570	MANGRULPIR	4614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41953	570	MANORA	4615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41954	570	RISOD	4616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41955	570	WASHIM	4617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41956	571	ARNI	4618	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41957	571	BABHULGAON	4619	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41958	571	DARWHA	4620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41959	571	DIGRAS	4621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41960	571	GHATANJI	4622	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41961	571	KALAMB	4623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41962	571	KELAPUR	4624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41963	571	MAHAGAON	4625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41964	571	MAREGAON	4626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41965	571	NER	4627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41966	571	PUSAD	4628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41967	571	RALEGAON	4629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41968	571	UMARKHED	4630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41969	571	WANI	4631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41970	571	YAVATMAL	4632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41971	571	ZARI JAMNI	4633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41973	697	ASIFABAD	4635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41974	668	BAZARHATNOOR	4636	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41975	697	BEJJUR	4637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41976	668	BELA	4638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41977	682	BELLAMPALLY	4639	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41978	678	BHAINSA	4640	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41979	682	BHEEMINI	4641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41980	668	BOATH	4642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41981	682	CHENNUR	4643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41982	697	DAHEGAON	4644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41983	682	DANDEPALLY	4645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41984	678	DILAWARPUR	4646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41985	668	GUDIHATNUR	4647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41986	668	ICHODA	4648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41987	668	INDERVELLY	4649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41988	668	JAINAD	4650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41989	697	JAINOOR	4651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41990	682	JAIPUR	4652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41991	682	JANNARAM	4653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41992	678	KADDAM (PEDDUR)	4654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41993	697	KAGAZNAGAR	4655	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41994	682	KASIPET	4656	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41995	697	KERAMERI	4657	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41996	678	KHANAPUR	4658	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41997	682	KOTAPALLY	4659	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41998	697	KOUTHALA	4660	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
41999	678	KUBEER	4661	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42000	678	KUNTALA	4662	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42001	678	LAXMANCHANDA	4663	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42002	678	LOKESWARAM	4664	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42003	682	LUXETTIPET	4665	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42004	678	MAMDA	4666	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42005	682	MANCHERIAL	4667	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42006	682	MANDAMARRI	4668	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42007	678	MUDHOLE	4669	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42008	668	NARNOOR	4670	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42009	682	NENNEL	4671	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42010	668	NERADIGONDA	4672	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42011	678	NIRMAL	4673	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42012	697	REBBENA	4674	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42013	678	SARANGAPUR	4675	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42014	697	SIRPUR (T)	4676	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42015	697	SIRPUR (U)	4677	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42016	668	TALAMADUGU	4678	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42017	668	TAMSI	4679	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42018	682	TANDUR	4680	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42019	678	TANUR	4681	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42020	697	TIRYANI	4682	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42021	668	UTNOOR	4683	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42022	682	VEMANPALLY	4684	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42023	697	WANKIDI	4685	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42024	573	AGALI	4686	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42025	573	AMADAGUR	4687	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42026	573	AMARAPURAM	4688	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42027	573	ANANTAPUR	4689	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42028	573	ATMAKUR	4690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42029	573	BATHALAPALLE	4691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42030	573	BELUGUPPA	4692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42031	573	BOMMANAHAL	4693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42032	573	BRAHMASAMUDRAM	4694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42033	573	BUKKAPATNAM	4695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42034	573	BUKKARAYASAMUDRAM	4696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42035	573	CHENNEKOTHAPALLE	4697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42036	573	CHILAMATHUR	4698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42037	573	D.HIREHAL	4699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42038	573	DHARMAVARAM	4700	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42039	573	GANDLAPENTA	4701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42040	573	GARLADINNE	4702	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42041	573	GOOTY	4703	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42042	573	GORANTLA	4704	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42043	573	GUDIBANDA	4705	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42044	573	GUMMAGATTA	4706	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42045	573	GUNTAKAL	4707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42046	573	HINDUPUR	4708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42047	573	KADIRI	4709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42048	573	KALYANDRUG	4710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42049	573	KAMBADUR	4711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42050	573	KANAGANAPALLE	4712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42051	573	KANEKAL	4713	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42052	573	KOTHACHERUVU	4714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42053	573	KUDAIR	4715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42054	573	KUNDURPI	4716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42055	573	LEPAKSHI	4717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42056	573	MADAKASIRA	4718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42057	573	MUDIGUBBA	4719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42058	573	NALLACHERUVU	4720	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42059	573	NALLAMADA	4721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42060	573	NAMBULAPULIKUNTA	4722	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42061	573	NARPALA	4723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42062	573	OBULADEVARECHERUVU	4724	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42063	573	PAMIDI	4725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42064	573	PARIGI	4726	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42065	573	PEDDAPAPPUR	4727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42066	573	PEDDAVADUGUR	4728	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42067	573	PENUKONDA	4729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42068	573	PUTLUR	4730	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42069	573	PUTTAPARTHI	4731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42070	573	RAMAGIRI	4732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42071	573	RAPTADU	4733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42072	573	RAYADURG	4734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42073	573	RODDAM	4735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42074	573	ROLLA	4736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42075	573	SETTUR	4737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42076	573	SINGANAMALA	4738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42077	573	SOMANDEPALLE	4739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42078	573	TADIMARRI	4740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42079	573	TADIPATRI	4741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42080	573	TALUPULA	4742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42081	573	TANAKAL	4743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42082	573	URAVAKONDA	4744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42083	573	VAJRAKARUR	4745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42084	573	VIDAPANAKAL	4746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42085	573	YADIKI	4747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42086	573	YELLANUR	4748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42087	574	B.KOTHAKOTA	4749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42088	574	BAIREDDIPALLE	4750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42089	574	BANGARUPALEM	4751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42090	574	BUCHINADIDU KHANDRIGA	4752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42091	574	CHANDRAGIRI	4753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42092	574	CHINNAGOTTIGALLU	4754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42093	574	CHITTOOR	4755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42094	574	CHOWDEPALLE	4756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42095	574	GANGADHARA NELLORE	4757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42096	574	GANGAVARAM	4758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42097	574	GUDIPALA	4759	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42098	574	GUDUPALLE	4760	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42099	574	GURRAMKONDA	4761	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42100	574	IRALA	4762	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42101	574	K.V.B.PURAM	4763	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42102	574	KALAKADA	4764	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42103	574	KALIKIRI	4765	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42104	574	KAMBHAMVARIPALLE	4766	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42105	574	KARVETINAGAR	4767	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42106	574	KUPPAM	4768	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42107	574	KURABALAKOTA	4769	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42108	574	MADANAPALLE	4770	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42109	574	MULAKALACHERUVU	4771	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42110	574	NAGALAPURAM	4772	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42111	574	NAGARI	4773	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42112	574	NARAYANAVANAM	4774	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42113	574	NIMMANAPALLE	4775	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42114	574	NINDRA	4776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42115	574	PAKALA	4777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42116	574	PALAMANER	4778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42117	574	PALASAMUDRAM	4779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42118	574	PEDDAMANDYAM	4780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42119	574	PEDDAPANJANI	4781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42120	574	PEDDATHIPPASAMUDRAM	4782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42121	574	PENUMURU	4783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42122	574	PILER	4784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42123	574	PITCHATUR	4785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42124	574	PULICHERLA H/O REDDIVARIPALLE	4786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42125	574	PUNGANUR	4787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42126	574	PUTHALAPATTU	4788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42127	574	PUTTUR	4789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42128	574	RAMACHANDRAPURAM	4790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42129	574	RAMAKUPPAM	4791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42130	574	RAMASAMUDRAM	4792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42131	574	RENIGUNTA	4793	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42132	574	ROMPICHERLA	4794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42133	574	SANTHIPURAM HO ARIMUTHANAPALLE	4795	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42134	574	SATYAVEDU	4796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42135	574	SODAM	4797	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42136	574	SOMALA	4798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42137	574	SRIKALAHASTI	4799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42138	574	SRIRANGARAJAPURAM	4800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42139	574	THAMBALLAPALLE	4801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42140	574	THAVANAMPALLE	4802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42141	574	THOTTAMBEDU	4803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42142	574	TIRUPATI (RURAL)	4804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42143	574	VADAMALAPETA	4806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42144	574	VALMIKIPURAM	4807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42145	574	VARADAIAHPALEM	4808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42146	574	VEDURUKUPPAM	4809	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42147	574	VENKATAGIRIKOTA	4810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42148	574	VIJAYAPURAM	4811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42149	574	YADAMARI	4812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42150	574	YERPEDU	4813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42151	574	YERRAVARIPALEM	4814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42152	575	ATLUR	4815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42153	575	B.KODUR	4816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42154	575	BADVEL	4817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42155	575	BRAHMAMGARIMATHAM.	4818	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42156	575	CHAKRAYAPET	4819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42157	575	CHAPADU	4820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42158	575	CHENNUR	4821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42159	575	CHINNAMANDEM	4822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42160	575	CHINTAKOMMA DINNE	4823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42161	575	CHITVEL	4824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42162	575	DUVVUR	4825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42163	575	GALIVEEDU	4826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42164	575	GOPAVARAM	4827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42165	575	JAMMALAMADUGU	4828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42166	575	KALASAPADU	4829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42167	575	KAMALAPURAM	4830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42168	575	KHAJIPET	4831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42169	575	KODUR	4832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42170	575	KONDAPURAM	4833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42171	575	LAKKIREDDIPALLE	4834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42172	575	LINGALA	4835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42173	575	MUDDANUR	4836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42174	575	MYDUKUR	4837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42175	575	MYLAVARAM	4838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42176	575	NANDALUR	4839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42177	575	OBULAVARIPALLE	4840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42178	575	PEDDAMUDIUM	4841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42179	575	PENAGALUR	4842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42180	575	PENDLIMARRI	4843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42181	575	PORUMAMILLA	4844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42182	575	PRODDATUR	4845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42183	575	PULIVENDLA	4846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42184	575	PULLAMPETA	4847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42185	575	RAJAMPET	4848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42186	575	RAJUPALEM	4849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42187	575	RAMAPURAM	4850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42188	575	RAYACHOTY	4851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42189	575	SAMBEPALLE	4852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42190	575	SIDHOUT	4853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42191	575	SIMHADRIPURAM	4854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42192	575	SRI AVADUTHA KASINAYANA	4855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42193	575	T.SUNDUPALLE	4856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42194	575	THONDUR	4857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42195	575	VALLUR	4858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42196	575	VEERABALLI	4859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42197	575	VEERAPANAYANI PALLE	4860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42198	575	VEMPALLE	4861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42199	575	VEMULA	4862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42200	575	VONTIMITTA	4863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42201	575	YERRAGUNTLA	4864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42202	576	ADDATEEGALA	4865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42203	576	AINAVILLI	4866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42204	576	ALAMURU	4867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42205	576	ALLAVARAM	4868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42206	576	AMALAPURAM	4869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42207	576	AMBAJIPETA	4870	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42208	576	ANAPARTHY	4871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42209	576	ATREYAPURAM	4872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42210	576	BICCAVOLU	4873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42211	576	DEVIPATNAM	4874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42212	576	GANDEPALLE	4875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42213	576	GANGAVARAM	4876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42214	576	GOKAVARAM	4877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42215	576	GOLLAPROLU	4878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42216	576	I. POLAVARAM	4879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42217	576	JAGGAMPETA	4880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42218	576	KADIAM	4881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42219	576	KAJULURU	4882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42220	576	KAKINADA RURAL	4883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42221	576	KAPILESWARAPURAM	4884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42222	576	KARAPA	4885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42223	576	KATRENIKONA	4886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42224	576	KIRLAMPUDI	4887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42225	576	KORUKONDA	4888	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42226	576	KOTANANDURU	4889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42227	576	U.KOTHAPALLE	4890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42228	576	KOTHAPETA	4891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42229	576	MALIKIPURAM	4892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42230	576	MAMIDIKUDURU	4893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42231	576	MANDAPETA	4894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42232	576	MAREDUMILLI	4895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42233	576	MUMMIDIVARAM	4896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42234	576	P.GANNAVARAM	4897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42235	576	PAMARRU	4898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42236	576	PEDAPUDI	4899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42237	576	PEDDAPURAM	4900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42238	576	PITHAPURAM	4901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42239	576	PRATHIPADU	4902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42240	576	RAJAHMUNDRY RURAL	4903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42241	576	RAJANAGARAM	4904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42242	576	RAJAVOMMANGI	4905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42243	576	RAMACHANDRAPURAM	4906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42244	576	RAMPACHODAVARAM	4907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42245	576	RANGAMPETA	4908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42246	576	RAVULAPALEM	4909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42247	576	RAYAVARAM	4910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42248	576	RAZOLE	4911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42249	576	SAKHINETIPALLE	4912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42250	576	SAMALKOTA	4913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42251	576	SANKHAVARAM	4914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42252	576	SEETHANAGARAM	4915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42253	576	THALLAREVU	4916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42254	576	THONDANGI	4917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42255	576	TUNI	4918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42256	576	UPPALAGUPTAM	4919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42257	576	Y. RAMAVARAM	4920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42258	576	YELESWARAM	4921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42259	577	AMARAVATHI	4923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42260	577	AMRUTHALUR	4924	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42261	577	ATCHEMPET	4925	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42262	577	BAPATLA	4926	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42263	577	BELLAMKONDA	4927	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42264	577	BHATTIPROLU	4928	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42265	577	BOLLAPALLE	4929	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42266	577	CHEBROLE	4930	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42267	577	CHERUKUPALLE	4931	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42268	577	CHILAKALURIPET	4932	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42269	577	DACHEPALLE	4933	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42270	577	DUGGIRALA	4934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42271	577	DURGI	4935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42272	577	EDLAPADU	4936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42273	577	GUNTUR	4937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42274	577	GURAZALA	4938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42275	577	IPUR	4939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42276	577	KAKUMANU	4940	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42277	577	KAREMPUDI	4941	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42278	577	KARLAPALEM	4942	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42279	577	KOLLIPARA	4943	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42280	577	KOLLUR	4944	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42281	577	KROSURU	4945	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42282	577	MACHAVARAM	4946	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42283	577	MACHERLA	4947	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42284	577	MANGALAGIRI	4948	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42285	577	MEDIKONDURU	4949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42286	577	MUPPALLA	4950	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42287	577	NADENDLA	4951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42288	577	NAGARAM	4952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42289	577	NARASARAOPETA	4953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42290	577	NEKARIKALLU	4954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42291	577	NIZAMPATNAM	4955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42292	577	NUZENDLA	4956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42293	577	PEDAKAKANI	4957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42294	577	PEDAKURAPADU	4958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42295	577	PEDANANDIPADU	4959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42296	577	PHIRANGIPURAM	4960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42297	577	PIDUGURALLA	4961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42298	577	PITTALAVANIPALEM	4962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42299	577	PONNUR	4963	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42300	577	PRATHIPADU	4964	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42301	577	RAJUPALEM	4965	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42302	577	RENTACHINTALA	4966	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42303	577	REPALLE	4967	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42304	577	ROMPICHERLA	4968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42305	577	SATTENAPALLE	4969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42306	577	SAVALYAPURAM	4970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42307	577	TADEPALLE	4971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42308	577	TADIKONDA	4972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42309	577	TENALI	4973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42310	577	THULLUR	4974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42311	577	TSUNDUR	4975	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42312	577	VATTICHERUKURU	4976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42313	577	VELDURTHY	4977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42314	577	VEMURU	4978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42315	577	VINUKONDA	4979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42316	669	AMBERPET	4980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42317	669	AMEERPET	4981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42318	669	ASIFNAGAR	4982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42319	669	BAHADURPURA	4983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42320	669	BANDLAGUDA	4984	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42321	669	CHARMINAR	4985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42322	669	GOLCONDA	4986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42323	669	HIMAYATHNAGAR	4987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42324	669	KHAIRTHABAD	4988	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42325	669	MARREDPALLY	4989	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42326	669	MUSHEERABAD	4990	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42327	669	NAMPALLY	4991	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42328	669	SAIDABAD	4992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42329	669	SECUNDERABAD	4993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42330	669	SHAIKPET	4994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42331	669	TIRUMALAGIRY	4995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42332	690	BEJANKI	4996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42333	684	BHEEMDEVARAPALLI	4997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42334	681	BOINPALLI	4998	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42335	681	CHANDURTHI	4999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42336	670	CHIGURUMAMIDI	5000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42337	670	CHOPPADANDI	5001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42338	679	DHARMAPURI	5002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42339	680	DHARMARAM	5003	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42340	680	ELIGAID	5004	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42341	684	ELKATHURTHI	5005	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42342	681	ELLANTHAKUNTA	5006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42343	681	GAMBHIRAOPET	5007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42344	670	GANGADHARA	5008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42345	679	GOLLAPALLI	5009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42346	690	HUSNABAD	5010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42347	670	HUZURABAD	5011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42348	679	IBRAHIMPATNAM	5012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42349	679	JAGTIAL	5013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42350	670	JAMMIKUNTA	5014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42351	680	JULAPALLI	5015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42352	684	KAMALAPUR	5016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42353	680	KAMANPUR	5017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42354	670	KARIMNAGAR	5018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42355	685	KATARAM	5019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42356	679	KATHALAPUR	5020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42357	679	KODIMIAL	5021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42358	690	KOHEDA	5022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42359	681	KONARAOPET	5023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42360	679	KORUTLA	5024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42361	685	MAHADEVPUR	5025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42362	685	MALHAR RAO	5026	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42363	679	MALLAPUR	5027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42364	679	MALLIAL	5028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42365	670	MANAKONDUR	5029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42366	680	MANTHANI	5030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42367	679	MEDIPALLI	5031	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42368	679	METPALLI	5032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42369	681	MUSTABAD	5033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42370	685	MUTHARAM (MAHADEVPUR)	5034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42371	680	MUTHARAM (MANTHANI)	5035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42372	680	ODELA	5036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42373	680	PEDDAPALLI	5037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42374	679	PEGADAPALLI	5038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42375	679	RAIKAL	5039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42376	670	RAMADUGU	5040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42377	680	RAMAGUNDAM	5041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42378	670	SAIDAPUR	5042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42379	679	SARANGAPUR	5043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42380	670	SHANKARAPATNAM	5044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42381	681	SIRCILLA	5045	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42382	680	SRIRAMPUR	5046	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42383	680	SULTHANABAD	5047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42384	670	THIMMAPUR (L.M.D.)	5048	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42385	670	VEENAVANKA	5049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42386	679	VELGATOOR	5050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42387	681	VEMULAWADA	5051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42388	681	YELLAREDDIPET	5052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42389	688	ASWAPURAM	5053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42390	688	ASWARAOPETA	5054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42391	686	BAYYARAM	5055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42392	688	BHADRACHALAM	5056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42393	671	BONAKAL	5057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42394	688	BURGAMPAHAD	5058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42395	688	CHANDRUGONDA	5059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42396	688	CHERLA	5060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42397	671	CHINTHAKANI	5061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42398	576	CHINTOOR	5062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42399	688	DAMMAPETA	5063	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42400	688	DUMMUGUDEM	5064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42401	671	ENKOOR	5065	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42402	686	GARLA	5066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42403	688	GUNDALA	5067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42404	688	JULURUPADU	5068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42405	671	KALLUR	5069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42406	671	KAMEPALLY	5070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42407	671	KHAMMAM (RURAL)	5071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42408	671	KHAMMAM (URBAN)	5072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42409	671	KONIJERLA	5073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42410	688	KOTHAGUDEM	5074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42411	585	KUKKUNUR	5075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42412	576	KUNAVARAM	5076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42413	671	KUSUMANCHI	5077	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42414	671	MADHIRA	5078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42415	688	MANUGUR	5079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42416	671	MUDIGONDA	5080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42417	688	MULAKALAPALLY	5081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42418	671	NELAKONDAPALLY	5082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42419	688	PALWANCHA	5083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42420	671	PENUBALLY	5084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42421	688	PINAPAKA	5085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42422	671	SATHUPALLY	5086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42423	671	SINGARENI	5087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42424	688	TEKULAPALLY	5088	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42425	671	THALLADA	5089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42426	671	THIRUMALAYAPALEM	5090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42427	576	VARARAMACHANDRAPURAM	5091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42428	585	VELAIRPAD	5092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42429	671	VEMSOOR	5093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42430	685	VENKATAPURAM	5094	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42431	685	WAZEED	5095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42432	671	WYRA	5096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42433	688	YELLANDU	5097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42434	671	YERRUPALEM	5098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42435	578	A.KONDURU	5099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42436	578	AGIRIPALLI	5100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42437	578	AVANIGADDA	5101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42438	578	BANTUMILLI	5102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42439	578	BAPULAPADU	5103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42440	578	CHALLAPALLI	5104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42441	578	CHANDARLAPADU	5105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42442	578	CHATRAI	5106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42443	578	G.KONDURU	5107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42444	578	GAMPALAGUDEM	5108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42445	578	GANNAVARAM	5109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42446	578	GHANTASALA	5110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42447	578	GUDIVADA	5111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42448	578	GUDLAVALLERU	5112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42449	578	GUDURU	5113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42450	578	IBRAHIMPATNAM	5114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42451	578	JAGGAYYAPETA	5115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42452	578	KAIKALUR	5116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42453	578	KALIDINDI	5117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42454	578	KANCHIKACHERLA	5118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42455	578	KANKIPADU	5119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42456	578	KODURU	5120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42457	578	KRUTTIVENNU	5121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42458	578	MACHILIPATNAM	5122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42459	578	MANDAVALLI	5123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42460	578	MOPIDEVI	5124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42461	578	MOVVA	5125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42462	578	MUDINEPALLE	5126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42463	578	MUSUNURU	5127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42464	578	MYLAVARAM	5128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42465	578	NAGAYALANKA	5129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42466	578	NANDIGAMA	5130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42467	578	NANDIVADA	5131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42468	578	NUZVID	5132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42469	578	PAMARRU	5133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42470	578	PAMIDIMUKKALA	5134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42471	578	PEDANA	5135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42472	578	PEDAPARUPUDI	5136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42473	578	PENAMALURU	5137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42474	578	PENUGANCHIPROLU	5138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42475	578	REDDIGUDEM	5139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42476	578	THOTLAVALLURU	5140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42477	578	TIRUVURU	5141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42478	578	UNGUTURU	5142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42479	578	VATSAVAI	5143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42480	578	VEERULLAPADU	5144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42481	578	VIJAYAWADA RURAL	5145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42482	578	VIJAYAWADA URBAN	5146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42483	578	VISSANNAPET	5147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42484	578	VUYYURU	5148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42485	579	ADONI	5149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42486	579	ALLAGADDA	5150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42487	579	ALUR	5151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42488	579	ASPARI	5152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42489	579	ATMAKUR	5153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42490	579	BANAGANAPALLE	5154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42491	579	BANDI ATMAKUR	5155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42492	579	BETHAMCHERLA	5156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42493	579	C.BELAGAL	5157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42494	579	CHAGALAMARRI	5158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42495	579	CHIPPAGIRI	5159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42496	579	DEVANAKONDA	5160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42497	579	DHONE ALIAS DRONACHALAM	5161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42498	579	DORNIPADU	5162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42499	579	GADIVEMULA	5163	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42500	579	GONEGANDLA	5164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42501	579	GOSPADU	5165	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42502	579	GUDUR	5166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42503	579	HALAHARVI	5167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42504	579	HOLAGUNDA	5168	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42505	579	JUPADU BUNGALOW	5169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42506	579	KALLUR	5170	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42507	579	KODUMUR	5171	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42508	579	KOILAKUNTLA	5172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42509	579	KOLIMIGUNDLA	5173	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42510	579	KOSIGI	5174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42511	579	KOTHAPALLE	5175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42512	579	KOWTHALAM	5176	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42513	579	KRISHNAGIRI	5177	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42514	579	KURNOOL	5178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42515	579	MADDIKERA (EAST)	5179	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42516	579	MAHANANDI	5180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42517	579	MANTRALAYAM	5181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42518	579	MIDTHUR	5182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42519	579	NANDAVARAM	5183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42520	579	NANDIKOTKUR	5184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42521	579	NANDYAL	5185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42522	579	ORVAKAL	5186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42523	579	OWK	5187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42524	579	PAGIDYALA	5188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42525	579	PAMULAPADU	5189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42526	579	PANYAM	5190	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42527	579	PATTIKONDA	5191	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42528	579	PEAPULLY	5192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42529	579	PEDDAKADABUR	5193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42530	579	RUDRAVARAM	5194	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42531	579	SANJAMALA	5195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42532	579	SIRIVEL	5196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42533	579	SRISAILAM	5197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42534	579	TUGGALI	5198	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42535	579	UYYALAWADA	5199	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42536	579	VELDURTHI	5200	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42537	579	VELUGODU	5201	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42538	579	YEMMIGANUR	5202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42539	692	ACHAMPETA	5203	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42540	672	ADDAKAL	5204	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42541	693	AIZA	5205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42542	693	ALAMPUR	5206	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42543	676	AMANGAL	5207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42544	692	AMRABAD	5208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42545	691	ATMAKUR	5209	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42546	672	BALANAGAR	5210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42547	692	BALMOOR	5211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42548	672	BHOOTHPUR	5212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42549	692	BIJINAPALLE	5213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42550	696	BOMRASPETA	5214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42551	672	CHINNACHINTAKUNTA	5215	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42552	672	DAMARAGIDDA	5216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42553	672	DEVARAKADARA	5217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42554	672	DHANWADA	5218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42555	693	DHARUR	5219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42556	696	DOULATABAD	5220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42557	676	FAROOQNAGAR	5221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42558	693	GADWAL	5222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42559	691	GHANPUR	5223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42560	693	GHATTU	5224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42561	691	GOPALPETA	5225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42562	672	HANWADA	5226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42563	693	ITIKYAL	5227	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42564	672	JADCHERLA	5228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42565	692	KALWAKURTHY	5229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42566	676	KESHAMPETA	5230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42567	692	KODAIR	5231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42568	696	KODANGAL	5232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42569	672	KOILKONDA	5233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42570	692	KOLLAPUR	5234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42571	676	KONDURG	5235	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42572	672	KOSGI	5236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42573	691	KOTHAKOTA	5237	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42574	676	KOTHUR	5238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42575	692	LINGAL	5239	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42576	672	MADDUR	5240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42577	676	MADGUL	5241	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42578	672	MAGANOOR	5242	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42579	672	MAHBUBNAGAR	5243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42580	672	MAKTHAL	5244	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42581	693	MALDAKAL	5245	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42582	693	MANOPADU	5246	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42583	672	MIDJIL	5247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42584	692	NAGARKURNOOL	5248	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42585	672	NARAYANPET	5249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42586	672	NARVA	5250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42587	672	NAWABPET	5251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42588	691	PANGAL	5252	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42589	691	PEBBAIR	5253	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42590	692	PEDDAKOTHAPALLE	5254	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42591	691	PEDDAMANDADI	5255	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42592	692	TADOOR	5256	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42593	676	TALAKONDAPALLE	5257	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42594	692	TELKAPALLE	5258	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42595	692	THIMMAJIPETA	5259	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42596	692	UPPUNUNTHALA	5260	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42597	672	UTKOOR	5261	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42598	692	VANGOOR	5262	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42599	691	VEEPANGANDLA	5263	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42600	692	VELDANDA	5264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42601	693	WADDEPALLE	5265	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42602	691	WANAPARTHY	5266	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42603	673	ALLADURG	5267	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42604	689	ANDOLE	5268	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42605	673	CHEGUNTA	5269	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42606	690	CHINNAKODUR	5270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42607	690	DOULTABAD	5271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42608	690	DUBBAK	5272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42609	690	GAJWEL	5273	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42610	689	HATHNOORA	5274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42611	690	JAGDEVPUR	5275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42612	689	JHARASANGAM	5276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42613	689	JINNARAM	5277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42614	689	KALHER	5278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42615	689	KANGTI	5279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42616	689	KOHIR	5280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42617	690	KONDAPAK	5281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42618	689	KONDAPUR	5282	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42619	673	KOWDIPALLI	5283	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42620	673	KULCHARAM	5284	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42621	689	MANOOR	5285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42622	673	MEDAK	5286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42623	690	MIRDODDI	5287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42624	690	MULUG	5288	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42625	689	MUNPALLE	5289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42626	690	NANGANUR	5290	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42627	689	NARAYANKHED	5291	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42628	673	NARSAPUR	5292	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42629	689	NYALKAL	5293	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42630	673	PAPANNAPET	5294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42631	689	PATANCHERU	5295	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42632	689	PULKAL	5296	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42633	689	RAIKODE	5297	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42634	673	RAMAYAMPET	5298	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42635	689	RAMCHANDRAPURAM	5299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42636	673	REGODE	5300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42637	689	SADASIVPET	5301	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42638	689	SANGAREDDY	5302	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42639	673	SHANKARAMPET[A]	5303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42640	673	SHANKARAMPET[R]	5304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42641	673	SHIVAMPET	5305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42642	690	SIDDIPET	5306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42643	673	TEKMAL	5307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42644	690	THOGUTA	5308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42645	673	TUPRAN	5309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42646	690	WARGAL	5310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42647	673	YELDURTHY	5311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42648	689	ZAHIRABAD	5312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42649	695	ALAIR	5313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42650	674	ANUMULA	5314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42651	695	ATMAKUR(M)	5315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42652	694	ATMAKUR(S)	5316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42653	695	BHUVANAGIRI	5317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42654	695	BIBINAGAR	5318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42655	695	BOMMALA RAMARAM	5319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42656	674	CHANDAMPET	5320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42657	674	CHANDUR	5321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42658	694	CHILKUR	5322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42659	674	CHINTHA PALLY	5323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42660	674	CHITYALA	5324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42661	694	CHIVVEMLA	5325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42662	695	CHOUTUPPAL	5326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42663	674	DAMERACHERLA	5327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42664	674	DEVARAKONDA	5328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42665	694	GARIDE PALLY	5329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42666	687	GUNDALA	5330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42667	674	GUNDLAPALLY (DINDI)	5331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42668	674	GURRAMPODE	5332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42669	694	HUZURNAGAR	5333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42670	694	JAJI REDDI GUDEM   (ARVAPALLY)	5334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42671	674	KANAGAL	5335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42672	674	KATTANGOOR	5336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42673	674	KETHE PALLY	5337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42674	694	KODAD	5338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42675	695	M.TURKA PALLY	5339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42676	674	MARRIGUDA	5340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42677	694	MATTAM PALLY	5341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42678	694	MELLA CHERVU	5342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42679	674	MIRYALAGUDA	5343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42680	694	MOTHEY	5344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42681	695	MOTHKUR	5345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42682	694	MUNAGALA	5346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42683	674	MUNUGODE	5347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42684	694	NADIGUDEM	5348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42685	674	NAKREKAL	5349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42686	674	NALGONDA	5350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42687	674	NAMPALLY	5351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42688	695	NARAYANAPUR	5352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42689	674	NARKETPALLY	5353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42690	694	NEREDUCHERLA	5354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42691	674	NIDAMANOOR	5355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42692	694	NUTHANKAL	5356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42693	674	PEDDA  ADISERLA  PALLY	5357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42694	674	PEDDAVURA	5358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42695	694	PENPAHAD	5359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42696	695	POCHAMPALLY	5360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42697	695	RAJAPET	5361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42698	695	RAMANNAPETA	5362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42699	674	SHALI GOURARAM	5363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42700	694	SURYAPET	5364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42701	674	THIPPARTHI	5365	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42702	694	THIRUMALAGIRI	5366	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42703	674	TRIPURARAM	5367	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42704	694	THUNGATHURTHI	5368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42705	695	VALIGONDA	5369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42706	674	VEMULA PALLY	5370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42707	695	YADAGIRIGUTTA	5371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42708	580	ALLUR	5372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42709	580	ANANTHASAGARAM	5373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42710	580	ANUMASAMUDRAMPETA	5374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42711	580	ATMAKUR	5375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42712	580	BALAYAPALLE	5376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42713	580	BOGOLE	5377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42714	580	BUTCHIREDDIPALEM	5378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42715	580	CHEJERLA	5379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42716	580	CHILLAKUR	5380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42717	580	CHITTAMUR	5381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42718	580	DAGADARTHI	5382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42719	580	DAKKILI	5383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42720	580	DORAVARISATRAM	5384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42721	580	DUTTALUR	5385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42722	580	GUDUR	5386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42723	580	INDUKURPET	5387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42724	580	JALADANKI	5388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42725	580	KALIGIRI	5389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42726	580	KALUVOYA	5390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42727	580	KAVALI	5391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42728	580	KODAVALUR	5392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42729	580	KONDAPURAM	5393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42730	580	KOTA	5394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42731	580	KOVUR	5395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42732	580	MANUBOLU	5396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42733	580	MARRIPADU	5397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42734	580	MUTHUKUR	5398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42735	580	NAIDUPETA	5399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42736	580	NELLORE   RURAL	5400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42737	580	OZILI	5401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42738	580	PELLAKUR	5402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42739	580	PODALAKUR	5403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42740	580	RAPUR	5404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42741	580	SANGAM	5405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42742	580	SEETHARAMAPURAM	5406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42743	580	SULLURPETA	5407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42744	580	SYDAPURAM	5408	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42745	580	TADA	5409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42746	580	THOTAPALLIGUDUR	5410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42747	580	UDAYAGIRI	5411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42748	580	VAKADU	5412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42749	580	VARIKUNTAPADU	5413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42750	580	VENKATACHALAM	5414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42751	580	VENKATAGIRI	5415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42752	580	VIDAVALUR	5416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42753	580	VINJAMUR	5417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42754	675	ARMUR	5418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42755	675	BALKONDA	5419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42756	683	BANSWADA	5420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42757	675	BHEEMGAL	5421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42758	683	BHIKNUR	5422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42759	683	BICHKUNDA	5423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42760	683	BIRKOOR	5424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42761	675	BODHAN	5425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42762	675	DHARPALLE	5426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42763	675	DICHPALLE	5427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42764	683	DOMAKONDA	5428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42765	683	GANDHARI	5429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42766	675	JAKRANPALLE	5430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42767	683	JUKKAL	5431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42768	683	KAMAREDDY	5432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42769	675	KAMMARAPALLE	5433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42770	675	KOTGIRI	5434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42771	683	LINGAMPET	5435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42772	683	MACHAREDDY	5436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42773	683	MADNUR	5437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42774	675	MAKLOOR	5438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42775	675	MORTAD	5439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42776	683	NAGIREDDYPET	5440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42777	675	NANDIPET	5441	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42778	675	NAVIPET	5442	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42779	675	NIZAMABAD	5443	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42780	683	NIZAMSAGAR	5444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42781	683	PITLAM	5445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42782	675	RENJAL	5446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42783	683	SADASIVANAGAR	5447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42784	675	SIRKONDA	5448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42785	683	TADWAI	5449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42786	675	VARNI	5450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42787	675	VELPUR	5451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42788	675	YEDAPALLE	5452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42789	683	YELLAREDDY	5453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42790	581	ADDANKI	5454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42791	581	ARDHAVEEDU	5455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42792	581	BALLIKURAVA	5456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42793	581	BESTAVARIPETA	5457	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42794	581	CHANDRA SEKHARA PURAM	5458	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42795	581	CHIMAKURTHI	5459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42796	581	CHINAGANJAM	5460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42797	581	CHIRALA	5461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42798	581	CUMBUM	5462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42799	581	DARSI	5463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42800	581	DONAKONDA	5464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42801	581	DORNALA	5465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42802	581	GIDDALURU	5466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42803	581	GUDLURU	5467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42804	581	HANUMANTHUNI PADU	5468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42805	581	INKOLLU	5469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42806	581	JANAKAVARAM PONGULURU	5470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42807	581	KANDUKUR	5471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42808	581	KANIGIRI	5472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42809	581	KARAMCHEDU	5473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42810	581	KOMAROLU	5474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42811	581	KONAKANAMITTLA	5475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42812	581	KONDAPI	5476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42813	581	KORISAPADU	5477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42814	581	KOTHA PATNAM	5478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42815	581	KURICHEDU	5479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42816	581	LINGASAMUDRAM	5480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42817	581	MADDIPADU	5481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42818	581	MARKAPUR	5482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42819	581	MARRIPUDI	5483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42820	581	MARTUR	5484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42821	581	MUNDLAMURU	5485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42822	581	NAGULUPPALA PADU	5486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42823	581	ONGOLE	5487	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42824	581	PAMUR	5488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42825	581	PARCHUR	5489	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42826	581	PEDA ARAVEEDU	5490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42827	581	PEDACHERLO PALLE	5491	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42828	581	PODILI	5492	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42829	581	PONNALURU	5493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42830	581	PULLALACHERUVU	5494	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42831	581	RACHERLA	5495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42832	581	SANTHAMAGULURU	5496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42833	581	SANTHANUTHALA PADU	5497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42834	581	SINGARAYAKONDA	5498	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42835	581	TANGUTUR	5499	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42836	581	TARLUPADU	5500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42837	581	TALLUR	5501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42838	581	TRIPURANTHAKAM	5502	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42839	581	ULAVAPADU	5503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42840	581	VELIGANDLA	5504	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42841	581	VETAPALEM	5505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42842	581	VOLETIVARI PALEM	5506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42843	581	YDDANA PUDI	5507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42844	581	YERRAGONDAPALEM	5508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42845	581	ZARUGUMILLI	5509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42846	696	BANTWARAM	5510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42847	696	BASHEERABAD	5511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42848	676	CHEVELLA	5512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42849	696	DHARUR	5513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42850	696	DOMA	5514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42851	672	GANDEED	5515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42852	698	GHATKESAR	5516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42853	676	HAYATHNAGAR	5517	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42854	676	IBRAHIMPATNAM	5518	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42855	676	KANDUKUR	5519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42856	698	KEESARA	5520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42857	696	KULKACHARLA	5521	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42858	676	MAHESWARAM	5522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42859	676	MANCHAL	5523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42860	696	MARPALLY	5524	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42861	698	MEDCHAL	5525	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42862	676	MOINABAD	5526	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42863	696	MOMINPET	5527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42864	696	NAWABPET	5528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42865	696	PARGI	5529	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42866	696	PEDDEMUL	5530	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42867	696	PUDUR	5531	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42868	698	QUTHBULLAPUR	5532	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42869	676	RAJENDRANAGAR	5533	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42870	676	SAROORNAGAR	5534	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42871	676	SHABAD	5535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42872	698	SHAMIRPET	5536	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42873	676	SHAMSHABAD	5537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42874	676	SHANKARPALLY	5538	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42875	696	TANDUR	5539	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42876	696	VIKARABAD	5540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42877	676	YACHARAM	5541	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42878	696	YALAL	5542	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42879	582	AMADALAVALASA	5543	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42880	582	BHAMINI	5544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42881	582	BURJA	5545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42882	582	ETCHERLA	5546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42883	582	GANGUVARISIGADAM	5547	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42884	582	GARA	5548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42885	582	HIRAMANDALAM	5549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42886	582	ICHAPURAM	5550	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42887	582	JALUMURU	5551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42888	582	KANCHILI	5552	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42889	582	KAVITI	5553	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42890	582	KOTABOMMILI	5554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42891	582	KOTTURU	5555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42892	582	L.N PETA	5556	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42893	582	LAVERU	5557	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42894	582	MANDASA	5558	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42895	582	MELIAPUTTI	5559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42896	582	NANDIGAM	5560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42897	582	NARASANNAPETA	5561	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42898	582	PALAKONDA	5562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42899	582	PALASA	5563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42900	582	PATHAPATNAM	5564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42901	582	POLAKI	5565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42902	582	PONDURU	5566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42903	582	RAJAM	5567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42904	582	RANASTALAM	5568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42905	582	REGIDI AMADALAVALASA	5569	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42906	582	SANTHABOMMALI	5570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42907	582	SANTHAKAVATI	5571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42908	582	SARAVAKOTA	5572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42909	582	SARUBUJJILI	5573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42910	582	SEETHAMPETA	5574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42911	582	SOMPETA	5575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42912	582	SRIKAKULAM	5576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42913	582	TEKKALI	5577	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42914	582	VAJRAPUKOTTURU	5578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42915	582	VANGARA	5579	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42916	582	VEERAGHATTAM	5580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42917	583	ACHUTAPURAM	5581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42918	583	ANAKAPALLE	5582	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42919	583	ANANDAPURAM	5583	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42920	583	ANANTHAGIRI	5584	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42921	583	ARAKU VALLEY	5585	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42922	583	BHEEMUNIPATNAM	5586	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42923	583	BUTCHAYYAPETA	5587	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42924	583	CHEEDIKADA	5588	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42925	583	CHINTAPALLE	5589	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42926	583	CHODAVARAM	5590	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42927	583	DEVARAPALLE	5591	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42928	583	DUMBRIGUDA	5592	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42929	583	G.MADUGULA	5593	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42930	583	GAJUWAKA	5594	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42931	583	GOLUGONDA	5595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42932	583	GUDEM KOTHA VEEDHI	5596	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42933	583	HUKUMPETA	5597	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42934	583	K.KOTAPADU	5598	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42935	583	KASIMKOTA	5599	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42936	583	KOTAURATLA	5600	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42937	583	KOYYURU	5601	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42938	583	MADUGULA	5602	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42939	583	MAKAVARAPALEM	5603	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42940	583	MUNAGAPAKA	5604	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42941	583	MUNCHINGI PUTTU	5605	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42942	583	NAKKAPALLE	5606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42943	583	NARSIPATNAM	5607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42944	583	NATHAVARAM	5608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42945	583	PADERU	5609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42946	583	PADMANABHAM	5610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42947	583	PARAVADA	5611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42948	583	PAYAKARAOPETA	5612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42949	583	PEDA BAYALU	5613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42950	583	PEDAGANTYADA	5614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42951	583	PENDURTHI	5615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42952	583	RAMBILLI	5616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42953	583	RAVIKAMATHAM	5617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42954	583	ROLUGUNTA	5618	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42955	583	S.RAYAVARAM	5619	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42956	583	SABBAVARAM	5620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42957	583	VISAKHAPATNAM(RURAL)	5621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42958	583	YELAMANCHILI	5622	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42959	584	BADANGI	5623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42960	584	BALIJIPETA	5624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42961	584	BHOGHAPURAM	5625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42962	584	BOBBILI	5626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42963	584	BONDAPALLE	5627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42964	584	CHEEPURUPALLE	5628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42965	584	DATTIRAJERU	5629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42966	584	DENKADA	5630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42967	584	GAJAPATHINAGARAM	5631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42968	584	GANTYADA	5632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42969	584	GARIVIDI	5633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42970	584	GARUGUBILLI	5634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42971	584	GUMMALAKSHMIPURAM	5635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42972	584	GURLA	5636	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42973	584	JAMI	5637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42974	584	JIYYAMMAVALASA	5638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42975	584	KOMARADA	5639	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42976	584	KOTHAVALASA	5640	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42977	584	KURUPAM	5641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42978	584	LAKKAVARAPUKOTA	5642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42979	584	MAKKUVA	5643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42980	584	MENTADA	5644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42981	584	MERAKAMUDIDAM	5645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42982	584	NELLIMARLA	5646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42983	584	PACHIPENTA	5647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42984	584	PARVATHIPURAM	5648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42985	584	PUSAPATIREGA	5649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42986	584	RAMABHADRAPURAM	5650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42987	584	SALUR	5651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42988	584	SEETHANAGARAM	5652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42989	584	SRUNGAVARAPUKOTA	5653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42990	584	THERLAM	5654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42991	584	VEPADA	5655	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42992	584	VIZIANAGARAM	5656	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42993	677	ATMAKUR	5657	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42994	687	BACHANNAPETA	5658	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42995	685	BHUPALPALLE	5659	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42996	677	CHENNARAOPET	5660	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42997	690	CHERIYAL	5661	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42998	685	CHITYAL	5662	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
42999	687	DEVARUPPULA	5663	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43000	684	DHARMASAGAR	5664	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43001	686	DORNAKAL	5665	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43002	677	DUGGONDI	5666	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43003	685	ETURNAGARAM	5667	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43004	677	GEESUGONDA	5668	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43005	685	GHANAPUR (MULUG)	5669	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43006	687	GHANPUR(STATION)	5670	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43007	685	GOVINDARAOPET	5671	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43008	686	GUDUR	5672	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43009	684	HANAMKONDA	5673	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43010	684	HASANPARTHY	5674	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43011	687	JANGAON	5675	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43012	686	KESAMUDRAM	5676	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43013	677	KHANAPUR	5677	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43014	687	KODAKANDLA	5678	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43015	686	KOTHAGUDEM	5679	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43016	686	KURAVI	5680	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43017	687	LINGALAGHANPUR	5681	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43018	690	MADDUR	5682	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43019	686	MAHBUBABAD	5683	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43020	685	MANGAPET	5684	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43021	686	MARIPEDA	5685	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43022	685	MOGULLAPALLE	5686	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43023	685	MULUG	5687	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43024	677	NALLA BELLI	5688	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43025	686	NALLIKUDUR	5689	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43026	687	NARMETTA	5690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43027	677	NARSAMPET	5691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43028	686	NARSIMHULAPET	5692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43029	677	NEKKONDA	5693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43030	687	PALAKURTHI	5694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43031	677	PARKAL	5695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43032	677	PARVATHAGIRI	5696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43033	687	RAGHUNATHPALLE	5697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43034	677	RAIPARTHY	5698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43035	685	REGONDA	5699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43036	677	SANGAM	5700	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43037	677	SHYAMPET	5701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43038	685	TADVAI	5702	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43039	686	THORRUR	5703	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43040	685	VENKATAPUR	5704	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43041	677	WARDHANNA PET	5705	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43042	687	ZAFFERGADH	5706	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43043	585	ACHANTA	5707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43044	585	AKIVIDU	5708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43045	585	ATTILI	5709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43046	585	BHIMADOLE	5710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43047	585	BHIMAVARAM	5711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43048	585	BUTTAYAGUDEM	5712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43049	585	CHAGALLU	5713	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43050	585	CHINTALAPUDI	5714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43051	585	DENDULURU	5715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43052	585	DEVARAPALLE	5716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43053	585	DWARAKATIRUMALA	5717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43054	585	ELAMANCHILI	5718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43055	585	ELURU	5719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43056	585	GANAPAVARAM	5720	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43057	585	GOPALAPURAM	5721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43058	585	IRAGAVARAM	5722	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43059	585	JANGAREDDIGUDEM	5723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43060	585	JEELUGUMILLI	5724	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43061	585	KALLA	5725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43062	585	KAMAVARAPUKOTA	5726	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43063	585	KOVVUR	5727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43064	585	KOYYALAGUDEM	5728	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43065	585	LINGAPALEM	5729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43066	585	MOGALTHUR	5730	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43067	585	NALLAJERLA	5731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43068	585	NARSAPUR	5732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43069	585	NIDADAVOLE	5733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43070	585	NIDAMARRU	5734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43071	585	PALACOLE	5735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43072	585	PALAKODERU	5736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43073	585	PEDAPADU	5737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43074	585	PEDAVEGI	5738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43075	585	PENTAPADU	5739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43076	585	PENUGONDA	5740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43077	585	PENUMANTRA	5741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43078	585	PERAVALI	5742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43079	585	PODURU	5743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43080	585	POLAVARAM	5744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43081	585	T.NARASAPURAM	5745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43082	585	TADEPALLIGUDEM	5746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43083	585	TANUKU	5747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43084	585	THALLAPUDI	5748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43085	585	UNDI	5749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43086	585	UNDRAJAVARAM	5750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43087	585	UNGUTURU	5751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43088	585	VEERAVASARAM	5752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43089	586	BADAMI	5753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43090	586	BAGALKOT	5754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43091	586	BILAGI	5755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43092	586	HUNGUND	5756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43093	586	JAMKHANDI	5757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43094	586	MUDHOL	5758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43095	587	ANEKAL	5759	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43096	587	BENGALURU EAST	5760	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43097	587	BENGALURU NORTH	5761	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43098	587	BENGALURU SOUTH	5762	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43099	614	CHANNAPATNA	5763	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43100	588	DEVANHALLI	5764	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43101	588	DODBALLAPUR	5765	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43102	588	HOSKOTE	5766	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43103	614	KANAKAPURA	5767	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43104	614	MAGADI	5768	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43105	588	NELAMANGALA	5769	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43106	614	RAMANAGARA	5770	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43107	589	ATHNI	5771	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43108	589	BELAGAVI	5772	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43109	589	BYLAHONGAL	5773	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43110	589	CHIKODI	5774	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43111	589	GOKAK	5775	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43112	589	HUKERI	5776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43113	589	KHANAPUR	5777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43114	589	SAVADATHI	5778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43115	589	RAMDURG	5779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43116	589	RAYBAG	5780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43117	590	BALLARI	5781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43118	590	HADAGALLI	5782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43119	590	HAGARIBOMMANAHALLI	5783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43120	590	HOSAPETE	5784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43121	590	KUDLIGI	5785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43122	590	SANDUR	5786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43123	590	SIRUGUPPA	5787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43124	591	AURAD	5788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43125	591	BASAVAKALYAN	5789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43126	591	BHALKI	5790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43127	591	BIDAR	5791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43128	591	HUMNABAD	5792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43129	592	BASAVANA BAGEWADI	5793	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43130	592	VIJAYAPURA	5794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43131	592	INDI	5795	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43132	592	MUDDEBIHAL	5796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43133	592	SINDAGI	5797	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43134	593	CHAMARAJANAGAR	5798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43135	593	GUNDLUPET	5799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43136	593	KOLLEGALA	5800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43137	593	YELANDUR	5801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43138	594	CHIKKAMAGALURU	5802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43139	594	KADUR	5803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43140	594	KOPPA	5804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43141	594	MUDIGERE	5805	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43142	594	NARASIMHARAJAPURA	5806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43143	594	SRINGERI	5807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43144	594	TARIKERE	5808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43145	595	CHALLAKERE	5809	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43146	595	CHITRADURGA	5810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43147	595	HIRIYUR	5811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43148	595	HOLALKERE	5812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43149	595	HOSDURGA	5813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43150	595	MOLAKALMURU	5814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43151	596	BANTVAL	5815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43152	596	BELTANGADI	5816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43153	596	MANGALURU	5817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43154	596	PUTTUR	5818	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43155	596	SULYA	5819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43156	597	CHANNAGIRI	5820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43157	597	DAVANAGERE	5821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43158	597	HARAPPANAHALLI	5822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43159	597	HARIHARA	5823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43160	597	HONNALI	5824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43161	597	JAGALUR	5825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43162	598	DHARWAD	5826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43163	598	HUBBALLI	5827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43164	598	KALGHATGI	5828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43165	598	KUNDGOL	5829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43166	598	NAVALGUND	5830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43167	599	GADAG	5831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43168	599	MUNDARAGI	5832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43169	599	NARAGUND	5833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43170	599	RON	5834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43171	599	SHIRAHATTI	5835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43172	600	AFZALPUR	5836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43173	600	ALAND	5837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43174	600	CHINCHOLI	5838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43175	600	CHITAPUR	5839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43176	600	KALABURAGI	5840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43177	600	JEVARGI	5841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43178	600	SEDAM	5842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43179	615	SHAHAPUR	5843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43180	615	SHORAPUR	5844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43181	615	YADGIR	5845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43182	601	ALUR	5846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43183	601	ARKALGUD	5847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43184	601	ARSIKERE	5848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43185	601	BELUR	5849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43186	601	CHANNARAYAPATNA	5850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43187	601	HASSAN	5851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43188	601	HOLENARSIPUR	5852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43189	601	SAKALESHPUR	5853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43190	602	BYADGI	5854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43191	602	HANAGAL	5855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43192	602	HAVERI	5856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43193	602	HIREKERUR	5857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43194	602	RANEBENNUR	5858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43195	602	SAVANUR	5859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43196	602	SHIGGAON	5860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43197	603	MADIKERI	5861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43198	603	SOMVARPET	5862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43199	603	VIRAJPET	5863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43200	613	BAGEPALLI	5864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43201	604	BANGARAPET	5865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43202	613	CHIKBALLAPUR	5866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43203	613	CHINTAMANI	5867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43204	613	GAURIBIDANUR	5868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43205	613	GUDIBANDA	5869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43206	604	KOLAR	5870	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43207	604	MALUR	5871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43208	604	MULBAGAL	5872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43209	613	SIDLAGHATTA	5873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43210	604	SRINIVASPUR	5874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43211	605	GANGAVATHI	5875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43212	605	KOPPAL	5876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43213	605	KUSHTAGI	5877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43214	605	YELBURGA	5878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43215	606	KRISHNARAJPET	5879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43216	606	MADDUR	5880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43217	606	MALVALLI	5881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43218	606	MANDYA	5882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43219	606	NAGAMANGALA	5883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43220	606	PANDAVAPURA	5884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43221	606	SHRIRANGAPATTANA	5885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43222	607	HEGGADADEVANKOTE	5886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43223	607	HUNSUR	5887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43224	607	KRISHNARAJANAGARA	5888	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43225	607	MYSURU	5889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43226	607	NANJANGUD	5890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43227	607	PIRIYAPATNA	5891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43228	607	TIRUMAKUDAL-NARSIPUR	5892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43229	608	DEVADURGA	5893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43230	608	LINGSUGUR	5894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43231	608	MANVI	5895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43232	608	RAICHUR	5896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43233	608	SINDHANUR	5897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43234	609	BHADRAVATI	5898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43235	609	HOSANAGARA	5899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43236	609	SAGAR	5900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43237	609	SHIKARPUR	5901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43238	609	SHIVAMOGGA	5902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43239	609	SORAB	5903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43240	609	TIRTHAHALLI	5904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43241	610	CHIKNAYAKANHALLI	5905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43242	610	GUBBI	5906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43243	610	KORATAGERE	5907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43244	610	KUNIGAL	5908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43245	610	MADHUGIRI	5909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43246	610	PAVAGADA	5910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43247	610	SIRA	5911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43248	610	TIPTUR	5912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43249	610	TUMAKURU	5913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43250	610	TURUVEKERE	5914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43251	611	KARKAL	5915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43252	611	KUNDAPURA	5916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43253	611	UDUPI	5917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43254	612	ANKOLA	5918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43255	612	BHATKAL	5919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43256	612	HALIYAL	5920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43257	612	HONAVAR	5921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43258	612	KARWAR	5922	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43259	612	KUMTA	5923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43260	612	MUNDGOD	5924	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43261	612	SIDDAPUR	5925	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43262	612	SIRSI	5926	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43263	612	SUPA	5927	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43264	612	YELLAPUR	5928	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43265	616	BARDEZ	5929	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43266	616	BICHOLIM	5930	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43267	616	PERNEM	5931	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43268	617	PONDA	5932	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43269	616	SATARI	5933	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43270	616	TISWADI	5934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43271	617	CANACONA	5935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43272	617	MORMUGAO	5936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43273	617	QUEPEM	5937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43274	617	SALCETE	5938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43275	617	SANGUEM	5939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43276	618	AMBALAPPUZHA	5949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43277	618	ARYAD	5950	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43278	618	BHARANICAVU	5951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43279	618	CHAMPAKULAM	5952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43280	618	CHENGANNUR	5953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43281	618	HARIPPAD	5954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43282	618	KANJIKKUZHY	5955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43283	618	MAVELIKKARA	5956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43284	618	MUTHUKULAM	5957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43285	618	PATTANAKKAD	5958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43286	618	THYCATTUSSERY	5959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43287	618	VELIYANAD	5960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43288	619	ALANGAD	5961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43289	619	ANGAMALI	5962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43290	619	EDAPPALLY	5963	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43291	619	KOOVAPPADY	5964	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43292	619	KOTHAMANGALAM	5965	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43293	619	MULANTHURUTHY	5966	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43294	619	MUVATTUPUZHA	5967	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43295	619	PALLURUTHY	5968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43296	619	PAMPAKUDA	5969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43297	619	PARAKKADAV	5970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43298	619	PARAVUR	5971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43299	619	VADAVUCODE	5972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43300	619	VAZHAKKULAM	5973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43301	619	VYPEEN	5974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43302	620	ADIMALY	5976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43303	620	AZHUTHA	5977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43304	620	DEVIKULAM	5978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43305	620	ELEMDESAM	5979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43306	620	IDUKKI	5980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43307	620	KATTAPPANA	5981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43308	620	NEDUMKANDOM	5982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43309	620	THODUPUZHA	5983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43310	621	EDAKKAD	5984	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43311	621	IRIKKUR	5985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43312	621	IRITTY	5986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43313	621	KANNUR	5987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43314	621	KUTHUPARAMBA	5988	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43315	621	PAYYANNUR	5989	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43316	621	PERAVOOR	5990	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43317	621	TALIPARAMBA	5991	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43318	621	THALASSERY	5992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43319	622	KANHANGAD	5993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43320	622	KASARGOD	5994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43321	622	MANJESHWAR	5995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43322	622	NILESHWAR	5996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43323	623	ANCHAL	5997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43324	623	CHADAYAMANGALAM	5999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43325	623	CHAVARA	6000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43326	623	CHITTUMALA	6001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43327	623	ITHIKKARA	6002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43328	623	KOTTARAKKARA	6004	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43329	623	MUKHATHALA	6005	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43330	623	OACHIRA	6006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43331	623	PATHANAPURAM	6007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43332	623	SASTHAMCOTTAH	6008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43333	623	VETTIKKAVALA	6009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43334	624	ERATTUPETTA	6010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43335	624	ETTUMANOOR	6011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43336	624	KADUTHURUTHY	6012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43337	624	KANJIRAPPALLY	6013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43338	624	LALAM	6014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43339	624	MADAPPALLY	6015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43340	624	PALLOM	6016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43341	624	PAMPADY	6017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43342	624	UZHAVOOR	6018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43343	624	VAIKOM	6019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43344	624	VAZHOOR	6020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43345	625	BALUSSERI	6021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43346	625	CHELANNUR	6022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43347	625	KODUVALLY	6023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43348	625	KOZHIKODE	6024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43349	625	KUNNAMANGALAM	6025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43350	625	KUNNUMMAL	6026	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43351	625	MELDAY	6027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43352	625	PANTHALAYANI	6028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43353	625	PERAMBRA	6029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43354	625	THODANNUR	6030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43355	625	THUNERI	6031	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43356	625	VADAKARA	6032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43357	626	AREAKODE	6033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43358	626	KONDOTTY	6034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43359	626	KUTTIPPURAM	6035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43360	626	MALAPPURAM	6036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43361	626	MANKADA	6037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43362	626	NILAMBUR	6038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43363	626	PERINTHALMANNA	6039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43364	626	PERUMPADAPPU	6040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43365	626	PONNANI	6041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43366	626	TANUR	6042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43367	626	TIRUR	6043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43368	626	TIRURANGADI	6044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43369	626	VENGARA	6045	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43370	626	WANDOOR	6046	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43371	627	ALATHUR	6047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43372	627	ATTAPPADI	6048	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43373	627	CHITTUR	6049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43374	627	KOLLENGODE	6050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43375	627	KUZHALMANNAM	6051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43376	627	MALAMPUZHA	6052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43377	627	MANNARKAD	6053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43378	627	NEMMARA	6054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43379	627	OTTAPPALAM	6055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43380	627	PALAKKAD	6056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43381	627	PATTAMBI	6057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43382	627	SREEKRISHNAPURAM	6058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43383	627	TRITHALA	6059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43384	628	ELANTHOOR	6060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43385	628	KOIPURAM	6061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43386	628	KONNI	6062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43387	628	MALLAPPALLY	6064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43388	628	PANDLAM	6065	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43389	628	PARAKODE	6066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43390	628	PULIKEEZHU	6067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43391	628	RANNI	6068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43392	629	ATHIYANNOOR	6069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43393	629	CHIRAYINKEEZHU	6070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43394	629	POTHENCODE	6071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43395	629	KILIMANOOR	6072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43396	629	NEDUMANGAD	6073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43397	629	NEMOM	6074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43398	629	PARASSALA	6075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43399	629	PERUMKADAVILA	6076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43400	629	VAMANAPURAM	6078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43401	629	VARKALA	6079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43402	629	VELLANAD	6080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43403	630	ANTHIKKAD	6081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43404	630	CHALAKKUDY	6082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43405	630	CHAVAKKAD	6083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43406	630	CHERPU	6084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43407	630	CHOWANNUR	6085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43408	630	IRINJALAKKUDA	6086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43409	630	KODAKARA	6087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43410	630	MALA	6089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43411	630	MATHILAKAM	6090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43412	630	MULLASSERY	6091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43413	630	OLLUKKARA	6092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43414	630	PAZHAYANNUR	6093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43415	630	PUZHAKKAL	6094	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43416	630	THALIKKULAM	6095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43417	630	VELLANGALLUR	6096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43418	630	WADAKKANCHERY	6097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43419	631	KALPETTA	6098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43420	631	MANANTHAVADY	6099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43421	631	SULTHAN BATHERY	6100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43422	632	ANAMALAI	6101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43423	632	ANNUR	6102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43424	662	AVANASHI	6103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43425	662	GUDIMANGALAM	6104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43426	632	KARAMADAI	6105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43427	632	KINATHUKADAVU	6106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43428	662	MADATHUKULAM	6107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43429	632	MADUKKARAI	6108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43430	662	PALLADAM	6109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43431	632	PERIYANAYAKKANPALAYAM	6110	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43432	632	POLLACHI NORTH	6111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43433	632	POLLACHI SOUTH	6112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43434	662	PONGALUR	6113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43435	632	SARCARSAMAKULAM	6114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43436	632	SULTANPET	6115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43437	632	SULUR	6116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43438	632	THONDAMUTHUR	6117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43439	662	TIRUPPUR	6118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43440	662	UDUMALPET	6119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43441	633	ANNAGRAMAM	6120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43442	633	CUDDALORE	6121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43443	633	KAMMAPURAM	6122	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43444	633	KATTUMANNARKOIL	6123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43445	633	KEERAPALAYAM	6124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43446	633	KOMARATCHI	6125	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43447	633	KURINJIPADI	6126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43448	633	MANGALUR	6127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43449	633	MELBHUVANAGIRI	6128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43450	633	NALLUR	6129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43451	633	PANRUTI	6130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43452	633	PARANGIPETTAI	6131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43453	633	VRIDDHACHALAM	6132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43454	634	DHARMAPURI	6133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43455	634	HARUR	6134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43456	634	KARIMANGALAM	6135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43457	634	MORAPPUR	6136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43458	634	NALLAMPALLI	6137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43459	634	PALAKKODU	6138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43460	634	PAPPIREDDIPATTY	6139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43461	634	PENNAGARAM	6140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43462	635	ATHOOR	6141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43463	635	DINDIGUL	6142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43464	635	GUZILIAMPARAI	6143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43465	635	KODAIKANAL	6144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43466	635	NATTAM	6145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43467	635	NILAKOTTAI	6146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43468	635	ODDANCHATRAM	6147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43469	635	PALANI	6148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43470	635	REDDIYARCHATIRAM	6149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43471	635	SHANARPATTI	6150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43472	635	THOPPAMPATTI	6151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43473	635	VADAMADURAI	6152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43474	635	VATTALKUNDU	6153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43475	635	VEDASANDUR	6154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43476	636	AMMAPET	6155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43477	636	ANDIYUR	6156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43478	636	BHAVANI	6157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43479	636	BHAVANISAGAR	6158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43480	636	CHENNIMALAI	6159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43481	662	DHARAPURAM	6160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43482	636	ERODE	6161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43483	636	GOPICHETTIPALAIYAM	6162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43484	662	KANGAYAM	6163	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43485	636	KODUMUDI	6164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43486	662	KUNDADAM	6165	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43487	636	MODAKURICHI	6166	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43488	662	MULANUR	6167	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43489	636	NAMBIYUR	6168	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43490	636	PERUNDURAI	6169	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43491	636	SATYAMANGALAM	6170	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43492	636	TALAVADI	6171	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43493	636	THOOCKANAICKENPALAIYAM	6172	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43494	662	UTTUKKULI	6173	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43495	662	VELLAKOIL	6174	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43496	637	ACHARAPAKKAM	6175	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43497	637	CHITHAMUR	6176	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43498	637	KANCHIPURAM	6177	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43499	637	KATTANKOLATHUR	6178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43500	637	KUNNATTUR	6179	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43501	637	LATHUR	6180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43502	637	MADURANTAKAM	6181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43503	637	SRIPERUMBUDUR	6182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43504	637	ST.THOMAS MOUNT	6183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43505	637	THIRUPORUR	6184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43506	637	TIRUKKALUKUNRAM	6185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43507	637	UTTIRAMERUR	6186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43508	637	WALAJABAD	6187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43509	638	AGASTISWARAM	6188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43510	638	KILLIYOOR	6189	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43511	638	KURUNTHANCODE	6190	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43512	638	MELPURAM	6191	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43513	638	MUNCHIRA	6192	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43514	638	RAJAKKAMANGALAM	6193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43515	638	THACKALAI	6194	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43516	638	THIRUVATTAR	6195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43517	638	THOVALA	6196	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43518	639	ARAVAKURICHI	6197	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43519	639	K.PARAMATHY	6198	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43520	639	KADAVUR	6199	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43521	639	KARUR	6200	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43522	639	KRISHNARAYAPURAM	6201	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43523	639	KULITTALAI	6202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43524	639	THANTHONI	6203	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43525	639	THOGAIMALAI	6204	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43526	640	BARGUR	6205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43527	640	HOSUR	6206	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43528	640	KAVERIPATTINAM	6207	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43529	640	KELAMANGALAM	6208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43530	640	KRISHNAGIRI	6209	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43531	640	MATHUR	6210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43532	640	SHOOLAGIRI	6211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43533	640	THALLY	6212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43534	640	UTHANGARAI	6213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43535	640	VEPPANAPALLI	6214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43536	641	ALANGANALLUR	6215	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43537	641	CHELLAMPATTI	6216	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43538	641	KALLIKUDI	6217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43539	641	KOTTAMPATTI	6218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43540	641	MADURAI EAST	6219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43541	641	MADURAI WEST	6220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43542	641	MELUR	6221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43543	641	SEDAPATTI	6222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43544	641	T.KALLUPATTI	6223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43545	641	TIRUMANGALAM	6224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43546	641	TIRUPPARANGUNRAM	6225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43547	641	USILAMPATTI	6226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43548	641	VADIPATTI	6227	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43549	642	KEELAIYUR	6228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43550	642	KILVELUR	6229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43551	642	KOLLIDAM	6230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43552	642	KUTTALAM	6231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43553	642	MAYILADUTHURAI	6232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43554	642	NAGAPPATTINAM	6233	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43555	642	SEMBANAR KOIL	6234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43556	642	SIRKAZHI	6235	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43557	642	THALANAYAR	6236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43558	642	THIRUMARUGAL	6237	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43559	642	VEDARANYAM	6238	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43560	643	ELACIPALAYAM	6239	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43561	643	ERUMAPATTY	6240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43562	643	KABILAMALAI	6241	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43563	643	KOLLI HILLS	6242	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43564	643	MALLASAMUDRAM	6243	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43565	643	MOHANUR	6244	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43566	643	NAMAGIRIPET	6245	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43567	643	NAMAKKAL	6246	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43568	643	PALLIPALAYAM	6247	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43569	643	PARAMATHY	6248	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43570	643	PUDUCHATRAM	6249	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43571	643	RASIPURAM	6250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43572	643	SENDAMANGALAM	6251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43573	643	TIRUCHENGODU	6252	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43574	643	VENNANDUR	6253	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43575	644	ALATHUR	6254	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43576	661	ANDIMADAM	6255	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43577	661	ARIYALUR	6256	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43578	661	JAYAMKONDAM	6257	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43579	644	PERAMBALUR	6258	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43580	661	SENDURAI	6259	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43581	661	T. PALUR	6260	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43582	661	THIRUMANUR	6261	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43583	644	VEPPANTHATTAI	6262	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43584	644	VEPPUR	6263	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43585	645	ANNAVASAL	6264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43586	645	ARANTANGI	6265	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43587	645	ARIMALAM	6266	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43588	645	AVADAIYARKOVIL	6267	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43589	645	GANDARAVAKOTTAI	6268	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43590	645	KARAMBAKUDI	6269	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43591	645	KUNNANDARKOIL	6270	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43592	645	MANALMELKUDI	6271	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43593	645	PONNAMARAVATI	6272	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43594	645	PUDUKKOTTAI	6273	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43595	645	THIRUVARANKULAM	6274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43596	645	TIRUMAYAM	6275	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43597	645	VIRALIMALAI	6276	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43598	646	BOGALUR	6277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43599	646	KADALADI	6278	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43600	646	KAMUDI	6279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43601	646	MANDAPAM	6280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43602	646	MUDUKULATHUR	6281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43603	646	NAINARKOIL	6282	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43604	646	PARAMAKKUDI	6283	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43605	646	RAJASINGAMANGALAM	6284	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43606	646	RAMANATHAPURAM	6285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43607	646	TIRUPPULLANI	6286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43608	646	TIRUVADANAI	6287	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43609	647	ATTUR	6288	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43610	647	AYODHIYAPATTINAM	6289	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43611	647	GANGAVALLI	6290	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43612	647	IDAPPADI	6291	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43613	647	KADAIYAMPATTY	6292	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43614	647	KOLATHUR	6293	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43615	647	KONGANAPURAM	6294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43616	647	MACDONALDS CHOULTRY	6295	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43617	647	MECHERI	6296	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43618	647	NANGAVALLI	6297	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43619	647	OMALUR	6298	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43620	647	PANAMARATHUPATTI	6299	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43621	647	PEDDANAICKENPALAYAM	6300	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43622	647	SALEM	6301	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43623	647	SANKARI	6302	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43624	647	TALAVASAL	6303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43625	647	TARAMANGALAM	6304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43626	647	VALAPADY	6305	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43627	647	VEERAPANDI	6306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43628	647	YERCAUD	6307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43629	648	DEVAKOTTAI	6308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43630	648	ILAYANKUDI	6309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43631	648	KALAIYARKOIL	6310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43632	648	KALLAL	6311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43633	648	KANNANKUDI	6312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43634	648	MANAMADURAI	6313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43635	648	S. PUDUR	6314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43636	648	SAKKOTTAI	6315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43637	648	SINGAMPUNARI	6316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43638	648	SIVAGANGA	6317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43639	648	TIRUPPATHUR	6318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43640	648	TIRUPPUVANAM	6319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43641	649	AMMAPETTAI	6320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43642	649	BUDALUR	6321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43643	649	KUMBAKONAM	6322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43644	649	MADUKKUR	6323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43645	649	ORATTANADU	6324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43646	649	PAPANASAM	6325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43647	649	PATTUKKOTTAI	6326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43648	649	PERAVURANI	6327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43649	649	SETHUBHAVACHATRAM	6328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43650	649	THANJAVUR	6329	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43651	649	THIRUPPANANDAL	6330	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43652	649	THIRUVAIYARU	6331	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43653	649	THIRUVONAM	6332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43654	649	TIRUVIDAIMARUDUR	6333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43655	650	COONOOR	6334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43656	650	GUDALUR	6335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43657	650	KOTAGIRI	6336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43658	650	UDHAGAMANDALAM	6337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43659	651	ANDIPATTI	6338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43660	651	BODINAYAKKANUR	6339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43661	651	CHINNAMANUR	6340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43662	651	KADAMALAIKUNDRU MYLADUMPARAI	6341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43663	651	KAMBAM	6342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43664	651	PERIYAKULAM	6343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43665	651	THENI	6344	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43666	651	UTTAMAPALAIYAM	6345	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43667	652	ELLAPURAM	6346	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43668	652	GUMMIDIPUNDI	6347	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43669	652	KADAMBATHUR	6348	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43670	652	MINJUR	6349	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43671	652	PALLIPATTU	6350	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43672	652	POONAMALLEE	6351	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43673	652	POONDI	6352	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43674	652	PULAL	6353	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43675	652	R.K.PET	6354	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43676	652	SHOLAVARAM	6355	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43677	652	TIRUTTANI	6356	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43678	652	TIRUVALLUR	6357	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43679	652	TIRUVELANGADU	6358	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43680	652	VILLIVAKKAM	6359	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43681	653	KODAVASAL	6360	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43682	653	KORADACHERRY	6361	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43683	653	KOTTUR	6362	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43684	653	MANNARGUDI	6363	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43685	653	MUTHUPETTAI	6364	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43686	653	NANNILAM	6365	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43687	653	NIDAMANGALAM	6366	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43688	653	THIRUVARUR	6367	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43689	653	TIRUTTURAIPPUNDI	6368	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43690	653	VALANGAIMAN	6369	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43691	654	ANDANALLUR	6370	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43692	654	LALGUDI	6371	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43693	654	MANACHANELLUR	6372	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43694	654	MANAPPARAI	6373	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43695	654	MANIKANDAM	6374	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43696	654	MARUNGAPURI	6375	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43697	654	MUSIRI	6376	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43698	654	PULLAMBADI	6377	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43699	654	TATTAYYANGARPETTAI	6378	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43700	654	THIRUVERAMBUR	6379	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43701	654	THOTTIAM	6380	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43702	654	TURAIYUR	6381	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43703	654	UPPILIAPURAM	6382	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43704	654	VAIYAMPATTI	6383	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43705	655	ALANGULAM	6384	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43706	655	AMBASAMUDRAM	6385	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43707	655	CHERANMAHADEVI	6386	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43708	655	KADAIYANALLUR	6387	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43709	655	KADAYAM	6388	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43710	655	KALAKADU	6389	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43711	655	KEELAPAVOOR	6390	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43712	655	KURUVIKULAM	6391	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43713	655	MANUR	6392	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43714	655	MELANEELITHANALLUR	6393	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43715	655	NANGUNERI	6394	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43716	655	PALAYANKOTTAL	6395	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43717	655	PAPPAKUDI	6396	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43718	655	RADHAPURAM	6397	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43719	655	SANKARANKOVIL	6398	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43720	655	SHENCOTTAH	6399	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43721	655	TENKASI	6400	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43722	655	VALLIYOOR	6401	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43723	655	VASUDEVANALLUR	6402	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43724	656	ANAKKAVUR	6403	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43725	656	ARANI	6404	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43726	656	CHENGAM	6405	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43727	656	CHETPUT	6406	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43728	656	CHEYYAR	6407	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43729	656	JAWATHU HILLS	6408	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43730	656	KALASAPAKKAM	6409	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43731	656	KEELPENNATHUR	6410	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43732	656	PERNAMALLUR	6411	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43733	656	POLUR	6412	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43734	656	PUDUPALAYAM	6413	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43735	656	THANDRAMPET	6414	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43736	656	THELLAR	6415	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43737	656	THURINJAPURAM	6416	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43738	656	TIRUVANNAMALAI	6417	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43739	656	VANDAVASI	6418	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43740	656	VEMBAKKAM	6419	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43741	656	WEST ARANI	6420	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43742	657	ALWARTHIRUNAGARI	6421	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43743	657	KARUNGULAM	6422	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43744	657	KAYATHAR	6423	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43745	657	KOVILPATTI	6424	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43746	657	OTTAPIDARAM	6425	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43747	657	PUDUR	6426	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43748	657	SATTANKULAM	6427	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43749	657	SRIVAIKUNDAM	6428	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43750	657	THOOTHUKKUDI	6429	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43751	657	TIRUCHENDUR	6430	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43752	657	UDANGUDI	6431	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43753	657	VILATHIKULAM	6432	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43754	658	ALANGAYAN	6433	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43755	658	ANAICUT	6434	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43756	658	ARAKKONAM	6435	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43757	658	ARCOT	6436	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43758	658	GUDIYATTAM	6437	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43759	658	JOLARPET	6438	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43760	658	K.V.KUPPAM	6439	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43761	658	KANDILI	6440	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43762	658	KANIYAMBADI	6441	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43763	658	KATPADI	6442	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43764	658	KAVERIPAKKAM	6443	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43765	658	MADHANUR	6444	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43766	658	NATRAMPALLI	6445	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43767	658	NEMILI	6446	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43768	658	PERANAMBATTU	6447	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43769	658	SHOLINGHUR	6448	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43770	658	TIMIRI	6449	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43771	658	TIRUPPATTUR	6450	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43772	658	VELLORE	6451	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43773	658	WALAJAPET	6452	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43774	659	CHINNASALEM	6453	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43775	659	GINGEE	6454	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43776	659	KALLAKKURICHI	6455	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43777	659	KALRAYANHILLS	6456	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43778	659	KANAI	6457	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43779	659	KANDAMANGALAM	6458	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43780	659	KOLIYANUR	6459	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43781	659	MAILAM	6460	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43782	659	MARAKKANAM	6461	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43783	659	MELMALAYANUR	6462	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43784	659	MUGAIYUR	6463	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43785	659	OLAKKUR	6464	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43786	659	RISHIVANDIAM	6465	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43787	659	SANKARAPURAM	6466	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43788	659	THIAGADURGAM	6467	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43789	659	THIRUVENNAINALLUR	6468	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43790	659	TIRUKKOYILUR	6469	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43791	659	TIRUNAVALUR	6470	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43792	659	ULUNDURPET	6471	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43793	659	VALLAM	6472	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43794	659	VANUR	6473	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43795	659	VIKRAVANDI	6474	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43796	660	ARUPPUKOTTAI	6475	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43797	660	KARIAPATTI	6476	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43798	660	NARIKUDI	6477	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43799	660	RAJAPALAIYAM	6478	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43800	660	SATTUR	6479	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43801	660	SIVAKASI	6480	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43802	660	SRIVILLIPUTTUR	6481	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43803	660	TIRUCHULI	6482	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43804	660	VEMBAKOTTAI	6483	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43805	660	VIRUDHUNAGAR	6484	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43806	660	WATRAP	6485	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43807	663	KARAIKAL	6486	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43808	664	ARIANKUPPAM	6488	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43809	664	VILLIANUR	6490	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43811	665	FERRARGUNJ	6493	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43812	665	LITTLE ANDAMAN	6494	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43813	667	MAYABUNDER	6495	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43814	665	PROTHRAPUR	6496	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43815	667	RANGAT	6497	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43818	666	NANCOWRIE	6500	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43819	576	Routhulapudi	6501	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43820	576	RAJAHMUNDRY URBAN	6502	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43821	576	KAKINADA URBAN	6503	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43822	26	DHARAMSHALA	6504	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43823	238	ARWAL	6505	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43824	238	KALER	6506	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43825	238	KAPRI	6507	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43817	666	CAR NICOBAR	64992	\N	System	2018-10-24 11:34:41.360697	NLMA.001	2018-10-24 11:34:41.360697	A	RU
43810	667	DIGLIPUR	6492	\N	System	2018-10-24 11:34:41.360697	NLMA.001	2018-10-24 11:34:41.360697	I	RU
43826	238	SONBHADRA-BANSI-SURAJPUR	6508	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43827	238	KURTHA	6509	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43828	270	SURUHOTO	6510	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43829	272	KIPHIRE	6511	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43830	272	PUNGRO	6512	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43831	272	SITIMI	6513	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43832	273	LONGLENG	6514	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43833	273	TAMLU	6515	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43834	297	Serchhip	6516	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43835	297	East Lungdar	6519	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43836	291	CHAMPHAI	6520	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43837	292	BILKHAWTHLIR	6521	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43838	240	Passingdang	6522	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43839	240	KABI TINGDA	6523	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43840	241	TEMI	6524	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43841	241	Wok	6525	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43842	241	YANGANG	6526	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43843	241	SUMBUK	6527	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43844	242	YUKSOM	6528	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43845	242	DENTAM	6529	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43846	242	KALUK	6530	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43847	242	DARAMDIN	6531	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43848	239	KHAMDONG	6532	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43849	239	DUGA	6533	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43850	239	RAKDONG TINTEK	6534	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43851	239	RANKA	6535	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43852	239	RHENOCK	6536	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43853	239	REGHU	6537	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43854	31	NANKHARI	6538	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43855	12	THANA MANDI	6539	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43856	6	GM PORA (TRESPONE)	6540	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43857	6	LUNGNAK	6541	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43858	9	Saspol	6542	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43859	9	Chuchot	6543	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43860	9	Panamic	6544	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43861	18	TULAIL	6545	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43862	21	WAKOORA	6546	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43863	342	ODALGURI	6548	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43864	342	BHERGAON	6549	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43865	342	MAZBAT	6550	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43866	342	ROWTA	6551	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43867	342	KALAIGAON	6552	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43868	342	BORSOLA	6554	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43869	342	BECHIMARI	6555	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43870	342	DALGAON-SIALMARI	6556	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43871	342	PUB-MANGALDAI	6557	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43872	342	PASCHIM-MANGALDAI	6558	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43873	322	HATIDHURA	6559	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43874	343	RANI (PT)	6560	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43875	239	MARTAM	6562	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43876	241	JORETHANG	6563	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43877	241	NAMTHANG	6564	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43878	276	Henglep	6565	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43879	331	Chapor-Salkocha-BTC	6566	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43880	331	Bilashipara-BTC	6567	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43881	331	Mahamaya-BTC	6568	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43882	331	Golakganj-BTC	6569	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43883	331	Rupshi-BTC	6570	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43884	276	Lamka	6571	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43885	276	Saikot	6572	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43886	276	Samulamlan	6573	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43887	276	Sangaikot	6574	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43888	276	Singngat	6575	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43889	287	Thanlon	6576	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43890	276	Tuibong	6578	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43891	275	KHENGJOY	6580	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43892	280	KHOUPUM	6581	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43893	331	Debitola-BTC	6595	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43894	95	CHHOTI SARWAN	6606	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43895	282	LUNGCHONG MEIPHAI	6607	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43896	393	HATGAMHARIA	6608	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43897	393	ANANDPUR	6609	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43898	393	GUDRI	6610	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43899	392	PAKARTANR	6611	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43900	392	KERSAI	6612	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43901	392	BANSJORE	6613	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43902	108	PILIBANGA	6614	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43903	108	SANGARIA	6615	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43904	108	TIBBI	6616	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43905	108	RAWATSAR	6617	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43906	124	LASADIYA	6620	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43907	35	ATTARI	6621	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43908	374	SONARAITHARI	6623	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43909	374	MARGOMUNDA	6624	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43910	381	ALBERT EKKA	6625	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43911	372	CHANDRAPURA	6626	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43912	378	KETAR	6627	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43913	378	DANDA	6628	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43914	378	BISHUNPURA	6629	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43915	378	BARDIHA	6630	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43916	378	SAGMA	6631	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43917	377	BORAM	6632	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43918	377	GURABANDA	6633	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43919	385	BARIYATU	6634	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43920	385	HERHANJ	6635	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43921	389	NAGRI	6636	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43922	389	ITKI	6637	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43923	389	RAHE	6638	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43924	389	KHELARI	6639	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43925	380	BASANTRAY	6641	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43926	375	PURVI TUNDI	6642	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43927	379	SURIYA	6643	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43928	388	MOHAMADGANJ	6644	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43929	388	PIPRA	6645	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43930	388	NAWDIHA BAZAR	6646	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43931	388	UNTARI ROAD	6647	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43932	388	NAWA BAZAR	6648	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43933	388	PADWA	6649	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43934	388	TARHASI	6650	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43935	384	DOMCHANCH	6651	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43936	391	KUKRU	6652	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43937	383	FATEHPUR	6653	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43938	383	KARMATANR VIDYASAGAR	6654	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43939	373	KANHACHATTI	6690	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43940	373	MAYURHAND	6691	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43941	626	KALIKAVU	6692	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43942	631	PANAMARAM	6693	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43943	621	PANOOR	6694	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43944	621	KALLIASSERI	6695	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43945	622	PARAPPA	6696	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43946	622	KARADKA	6697	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43947	386	KAIRO	6698	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43948	386	PESHRAR	6699	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43949	12	DOONGI	6701	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43950	382	DARU	6707	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43951	382	KATKAMDAG	6708	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43952	382	DADI	6709	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43953	382	TATIJHARIYA	6710	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43954	382	CHALKUSHA	6711	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43955	1	QAZIGUND (PARTLY)	6712	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43956	193	KARAUDIKALA	6714	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43957	100	KHAJUWALA	6715	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43958	395	CHITARPUR	6716	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43959	395	DULMI	6717	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43960	114	BAWADI	6718	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43961	107	GHARSANA	6719	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43962	301	Lefunga	6721	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43963	300	Jolaibari	6723	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43964	304	Silachari	6725	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43965	299	Jubarajnagar	6727	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43966	298	Durgachowmuhani	6729	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43967	82	SIHMA	6731	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43968	111	CHITALWANA	6732	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43969	81	ISMAILABAD	6733	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43970	91	PRITHLA	6734	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43971	55	Arniwala Shiekh Subhan	6735	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43972	51	DIRBA	6736	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43973	264	Sechu Zubza	6737	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43974	264	Botsa	6738	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43975	264	Chunlikha	6739	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43976	265	Chuchuyimlang	6740	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43977	265	Tuli	6741	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43978	265	Tsurangkong	6742	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43979	269	Changpang	6743	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43980	269	Ralan	6744	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43981	270	Akuhaito	6745	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43982	270	Satoi	6746	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43983	273	Sakshi	6747	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43984	263	CHUMUKEDIMA	6748	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43985	263	AGHUNAQA	6749	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43986	266	Aboi	6750	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43987	266	ANGJANGYANG	6751	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43988	268	PANSO	6752	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43989	267	WEZIHO	6753	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43990	267	CHETHEBA	6754	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43991	267	CHIZAMI	6755	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43992	271	ATHIBUNG	6756	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43993	272	LONGMATRA	6757	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43994	272	KHONSA	6758	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43995	82	NIZAMPUR	6776	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43996	82	SATNALI	6777	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43997	88	MURTHAL	6778	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43998	56	GHAROTA	6779	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
43999	298	Raishyabari	6780	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44000	298	Ganganagar	6781	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44001	304	Tepania	6782	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44002	299	Kalacherra	6783	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44003	299	Laljuri	6784	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44004	305	Chandipur	6785	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44005	303	Charilam	6786	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44006	303	Mohanbhog	6787	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44007	300	Poangbari	6788	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44008	300	Bharat Chandra Nagar	6789	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44009	301	Old Agartala	6790	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44010	301	Bamutia	6791	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44011	301	Belbari	6792	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44012	259	PONGCHAU	6794	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44013	259	NIAUSA	6796	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44014	255	LIMEKING	6798	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44015	255	PAYENG	6799	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44016	255	CHETAM	6800	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44017	255	BARIRIJO	6801	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44018	255	PUCHI GEKO	6802	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44019	255	Siyum	6803	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44020	256	Nafra	6804	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44021	256	Singchung	6805	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44022	252	KITPI	6806	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44023	252	ZEMITHANG DUDUNGHAR	6807	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44024	252	MUKTO BONGKHAR	6808	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44025	251	MENGIO	6810	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44026	251	BORUM	6811	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44027	251	BALIJAN	6812	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44028	251	KIMIN	6813	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44029	243	Khimiyang	6814	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44030	243	Manmao	6815	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44031	243	Diyum	6816	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44032	243	Vijoynagar	6817	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44033	99	BIJOLIYA	6819	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44034	109	Jalsu	6820	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44035	109	PAOTA	6821	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44036	95	GANGAR TALAI	6822	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44037	104	LAWAN	6823	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44038	120	Chauth Ka Barwara	6824	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44039	97	KALYANPUR	6825	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44040	106	JHOTHARI	6826	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44041	95	ARTHUNA	6827	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44042	95	TALWARA	6828	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44043	576	NELLIPAKA	6829	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44044	97	Patodi	6830	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44045	114	SEKHALA	6831	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44046	114	DECHU	6832	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44047	97	SAMDARI	6833	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44048	97	GADRA ROAD	6834	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44049	106	SABLA	6835	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44050	106	CHIKHALI	6836	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44051	106	GALIYAKOAT	6837	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44052	106	DOVADA	6838	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44053	97	GIRA	6839	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44054	97	SEDWA	6840	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44055	617	Dharbandora	6841	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44056	97	GUDHAMALANI	6842	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44057	97	RAMSAR	6843	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44058	97	DHANAU	6844	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44059	112	BHAWANI MANDI	6845	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44060	114	LOHAWAT	6846	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44061	114	BAPINI	6847	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44062	124	SEMARI	6848	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44063	124	SAYRA	6849	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44064	124	PHALASIYA	6850	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44065	124	RISHBHDEO	6851	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44066	114	Pipad Shahar	6852	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44067	112	AKLERA	6853	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44068	117	NAWA	6854	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44069	114	TINWARI	6855	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44070	121	PATAN	6856	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44071	117	KHINVSAR	6857	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44072	103	BIDASAR	6858	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44073	117	MOLASAR	6859	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44074	93	SARWAR	6860	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44075	1	Anantnag	6861	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44076	5	Arnia	6862	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44077	5	Bhalwal Brahmana	6863	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44078	5	Maira Mandrian	6864	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44079	5	Chowki Choura	6865	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44080	5	Samwan	6866	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44081	5	Nagrota	6867	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44082	5	Mandal Phallain	6868	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44083	107	VIJAINAGAR	6869	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44084	105	SAIPAU	6871	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44085	13	Hazratbal Batapora	6872	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44086	13	Srinagar North	6873	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44087	13	Srinagar South	6874	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44088	13	Harwan Rural Area Dara	6875	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44089	13	Khanmoh	6876	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44090	20	Keller	6877	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44091	20	Kanji Ullar	6878	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44092	20	Ramnagri	6879	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44093	20	Imamsahib	6880	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44094	20	Kaprin	6881	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44095	20	Chitragam	6882	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44096	20	Zainpora	6883	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44097	20	Harman	6884	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44098	21	Sherpathri	6885	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44099	21	Safapora	6886	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44100	21	Gund	6887	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44101	17	Kund	6889	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44102	17	Manzgam	6890	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44103	17	Frisal	6891	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44104	17	Pombay	6892	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44105	17	Behibag	6893	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44106	17	D K Marg	6894	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44107	11	Awantipora	6895	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44108	11	Newa	6896	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44109	11	Litter	6897	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44110	11	Aripal	6898	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44111	11	Dadsara	6899	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44112	11	Shadimarg	6900	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44113	15	Palmar	6901	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44114	15	Trigam	6902	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44115	15	Thakraie	6903	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44116	15	Bunjwah	6904	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44117	15	Mughalmaidan	6905	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44118	42	MEHATPUR	6906	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44119	101	BUNDI	6907	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44120	18	Aloosa	6908	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44121	18	Bonkoot	6909	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44122	18	Arin	6910	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44123	18	Naidkhay	6911	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44124	18	Ganstan	6912	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44125	18	Nowgam	6913	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44126	18	Baktoor	6914	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44127	2	Parnewa	6915	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44128	2	Sukhnag Hard Panzoo	6916	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44129	2	Waterhail	6917	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44130	2	Pakherpora	6918	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44131	2	Charisharief	6919	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44132	2	Surasyar	6920	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44133	2	Soibugh	6921	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44134	2	Rathsun	6922	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44135	2	S K Pora	6923	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44136	19	Nud	6934	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44137	19	Sumb	6935	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44138	19	Rajpura	6936	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44139	19	Ramgarh	6937	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44140	22	Bamagh	6938	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44141	22	Katra	6939	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44142	22	Panthal	6940	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44143	22	Thuroo	6941	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44144	22	Jig Bagli	6942	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44145	22	Thakrakote	6943	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44146	22	Gulab Garh	6944	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44147	22	Chassana	6945	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44148	16	Batote	6946	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44149	16	Rajgarh	6947	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44150	16	Ukhral	6948	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44151	16	Sangaldan	6949	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44152	16	Gundi Dharam	6950	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44153	16	Gandhri	6951	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44154	16	Khari	6952	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44155	12	Budhal New	6953	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44156	12	Khawas	6954	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44157	12	Panjgrian	6955	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44158	12	Qila Darhal	6956	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44159	12	Moughla	6957	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44160	12	Seri	6958	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44161	12	Dhangri	6959	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44162	12	Siot	6960	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44163	12	Lamberi	6961	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44164	12	Planger	6962	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44165	7	Duggain	6968	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44166	7	Baggan	6969	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44167	7	Bhoond	6970	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44168	7	Mahanpur	6971	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44169	7	Dhar Mahanpur	6972	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44170	7	Mandli	6973	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44171	7	Nagrota Gujroo	6974	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44172	7	Keerian Gangyal	6975	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44173	7	Nagri	6976	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44174	7	Dinga Amb	6977	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44175	7	Marheen	6978	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44176	5	Kharah Balli	6979	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44177	5	Pragwal	6980	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44178	5	Mathwar	6981	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44179	5	Suchetgarh	6982	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44180	4	Kastigarh	6983	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44181	4	Chiralla	6985	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44182	4	Kahara	6986	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44183	4	Bhalla	6987	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44184	8	Keran	6992	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44185	8	Meliyal	6993	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44186	8	Reddi Chowkibal	6994	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44187	8	Qadirabad	6995	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44188	8	Drugmulla	6996	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44189	8	Nutnoosa	6997	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44190	8	Hayhama	6998	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44191	8	Machil	6999	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44192	8	Tarathpora	7000	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44193	8	Magam	7001	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44194	8	Handwara	7002	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44195	8	Mawar Kalamabad	7003	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44196	8	Qaziabad SUPERNAGAMA	7004	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44197	3	Bijhama	7006	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44198	3	Chandil Wangam	7007	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44199	3	Hardaboora	7008	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44200	3	Kandi Rafiabad	7009	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44201	3	Khaipora	7010	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44202	3	Lalpora	7011	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44203	3	Nadihal	7012	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44204	3	Narwah	7013	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44205	3	Noorkah	7014	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44206	3	Paranpeela	7015	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44207	3	Sangrama	7016	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44208	3	Sherabad Khore	7017	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44209	3	Tujjar Sharief	7018	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44210	3	Wailoo	7019	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44211	1	Bijibehara	7020	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44212	1	Chathergul	7021	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44213	1	Hiller Shahabad	7022	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44214	84	SANAULI KHURD	7023	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44215	98	PAHARI	7024	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44216	261	LEKANG	7025	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44217	244	Anelih Arzu	7027	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44218	244	ETALIN MALINYE	7028	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44219	259	KANUBARI	7029	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44220	259	WAKKA	7030	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44221	1	Vessu	7032	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44222	1	Verinag	7033	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44223	1	Pahalgam	7034	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44224	1	Larnoo	7035	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44225	1	Sagam	7036	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44226	5	Miran Sahib	7037	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44227	6	Soudh	7038	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44228	6	Bhimbat	7039	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44229	6	Pashkum	7040	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44230	6	Lotsum	7041	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44231	6	Barsoo	7042	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44232	6	Karsha	7043	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44233	9	Thiksay	7044	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44234	9	Rupsho	7047	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44235	9	Sukerbachan	7049	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44236	9	Singay Lalok WANLA	7050	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44237	19	Purmandal Bari Brahamna	7051	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44238	249	DAMBUK	7052	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44239	246	Pasighat	7053	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44240	246	Ruksin	7054	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44241	262	Riga	7055	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44242	246	Ramle Bango	7056	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44243	262	Rebo Parging	7057	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44244	257	Along East	7058	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44245	257	Manigoan	7059	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44246	257	Likabali	7060	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44247	257	Darak	7061	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44248	257	Daring	7062	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44249	100	PANCHOO	7063	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44250	115	Mandrayal	7064	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44251	254	GEKU	7066	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44252	254	SINGA GELLING	7067	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44253	254	JENGGING	7068	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44254	258	CHAGLAGAM	7069	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44255	258	MANCHAL	7070	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44256	245	Bana	7071	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44257	245	Pipu	7072	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44258	245	Khenewa	7073	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44259	245	Seijosa	7074	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44260	250	PISTANA	7075	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44261	253	Namsang	7076	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44262	253	Khonsa	7077	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44263	253	Lazu	7078	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44264	247	SANGRAM	7079	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44265	247	SARLI	7080	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44266	260	PIPSORANG	7081	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44267	247	PARSIPARLO	7082	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44268	260	YANGTE	7083	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44269	260	GANGTE	7084	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44270	44	Maloud	7085	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44271	13	EIDGAH	7086	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44272	13	Qamarwari	7087	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44273	11	ICHEGOZA	7088	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44274	23	Shree Naina Devi	7089	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44275	257	TIRBIN	7090	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44276	37	Jaitu	7091	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44277	92	CHARKHI DADRI	7092	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44278	73	TIGAON	7093	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44279	74	NAGPUR	7094	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44280	77	BADLI	7095	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44281	78	UJHANA	7096	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44282	79	DHAND	7097	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44283	80	MUNAK	7098	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44284	80	KUNJPURA	7099	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44285	81	PIPLI	7100	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44286	90	INDRI	7101	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44287	90	PINGWAN	7102	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44288	91	BADOLI	7103	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44289	85	DAHINA	7104	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44290	89	KHIZRABAD	7105	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44291	92	BAUND	7106	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44292	92	JHOJHU	7107	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44293	509	Waghai	7108	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44294	509	Subir	7109	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44295	375	KALIASOL	7111	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44296	375	Egarkund	7112	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44297	124	JHALLARA	7113	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44298	124	KURABAD	7114	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44299	366	KALYANI	7115	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44300	518	KHERGAM	7116	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44301	508	JESAR	7117	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44302	516	JOTANA	7118	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44303	506	LAKHANI	7119	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44304	520	SANKHESHWAR	7120	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44305	520	SARASWATI	7121	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44306	527	VAPI	7123	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44307	510	SINGVAD	7124	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44308	526	DESAR	7126	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44309	528	DOLVAN	7127	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44310	515	GALTESHWAR	7128	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44311	517	GARUDESHWAR	7129	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44312	528	KUKARMUNDA	7130	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44313	515	VASO	7131	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44314	510	SANJELI	7132	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44315	522	VINCHHIYA	7133	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44316	523	POSHINA	7134	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44317	506	SUIGAM	7135	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44318	525	THANGADH	7136	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44319	239	PARKHA	7137	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44320	242	ARITHANG CHONGRANG	7138	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44321	242	HEE MARTAM	7139	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44322	242	CHUMBONG CHAKUNG	7140	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44323	242	MANGALBAREY	7141	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44324	668	AIDILABAD RURAL	7142	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44325	668	MAVALA	7143	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44326	436	BAIKUNTHPUR	7144	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44327	253	DADAM	7145	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44328	253	BORDURIA	7146	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44329	262	BOLENG	7147	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44330	245	SAWA	7148	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44331	261	NAMSAI	7149	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44332	261	CHOWKHAM	7150	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44333	340	Manikpur	7151	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44334	278	PATSOI	7152	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44335	278	HIYANGTHANg	7153	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44336	274	Nambol	7154	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44337	503	Dholera	7155	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44338	529	Bodeli	7156	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44339	507	Netrang	7157	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44340	534	GirGadhda	7158	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44341	281	LILONG CD BLOCK	7159	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44342	281	WANGJING CD BLOCK	7160	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44343	277	KSHETRIGAO CD BLOCK	7161	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44344	277	KEIRAO CD BLOCK	7162	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44345	285	BOROBEKRA CD BLOCK	7164	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44346	283	LANGMEIDONG	7178	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44347	316	DAMALGRE	7180	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44348	311	DEMDEMA	7181	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44349	309	BHOIRYMBONG	7182	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44350	307	SOHIONG	7183	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44351	313	BAJENGDOBA	7184	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44352	307	MAWLAI	7185	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44353	307	MAWPAT	7186	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44354	277	Heingang CD Block	7187	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44355	277	Sawombung CD Block	7188	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44356	682	Naspur	7193	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44357	682	Kannepally	7195	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44358	697	Penchicalpet	7202	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44359	670	Ganneruvaram	7205	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44360	679	Jagitial Rural	7208	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44361	685	Palimela	7210	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44362	693	Rajoli	7211	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44363	683	Bibipet	7212	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44364	683	Nasrullabad	7213	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44365	683	Rajampet	7214	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44366	686	Peddavangara	7217	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44367	672	Krishna	7218	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44368	672	Moosapet	7219	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44369	698	Dundigal Gandimaisamma	7220	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44370	698	Medipally	7221	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44371	674	Madugulapalli	7222	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44372	674	Tirumalagiri Sagar	7223	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44373	675	Mugpal	7224	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44374	676	Kadthal	7225	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44375	694	Ananthagiri	7226	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44376	691	Srirangapur	7228	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44377	684	Khazipet	7229	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44378	684	Khila Warangal	7230	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44379	684	Warangal	7231	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44380	688	Chunchupalli	7232	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44381	688	Sujathanagar	7234	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44382	680	Palakurthy	7236	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44383	681	Rudrangi	7240	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44384	684	Velair	7250	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44385	684	Inavole	7251	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44386	673	Narsingi	7264	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44387	690	Markook	7274	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44388	672	Marikal	7277	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44389	691	Chinnambavi	7279	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44390	691	Madanapur	7280	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44391	691	Amarachintha	7281	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44392	693	Undavelly	7285	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44393	693	Kaloor Thimmandoddi	7286	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44394	695	Motakonduru	7294	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44395	692	Urkonda	7303	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44396	689	Vatpally	7304	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44397	282	JESSAMI TD	7306	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44398	285	JIRIBAM C D BLOCK	7307	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44399	282	SAHAMPHUNG TD BLOCK	7308	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44400	286	Longmai	7309	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44401	288	MOREH	7310	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44402	286	Haochong	7311	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44403	276	KANGVAI	7312	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44404	276	SUANGDOH	7313	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44405	276	MUALNUAM	7314	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44406	276	LANVA	7315	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44407	276	LAMKA SOUTH	7316	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44408	275	Kangbarol	7317	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44409	284	BUNGTE CHIRU	7318	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44410	284	KANGCHUP GELJANG	7319	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44411	284	CHAMPHAI	7320	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44412	284	LHUNGTIN	7321	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44413	284	ISLAND	7322	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44414	284	T VAICHONG	7323	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44415	279	WILLONG	7324	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44416	279	SONG SONG	7325	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44417	287	TIPAIMUK	7326	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44418	287	VANGAI RANGE	7327	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44419	279	PHAIBUNG KHULLEN	7328	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44420	690	Akkannapet	7332	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44421	36	GONIANA	7333	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44422	677	Damera	7334	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44423	676	Jilled Choudergudem	7335	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44424	678	Nirmal Rural	7336	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44425	49	Shambu Kalan	7337	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44426	698	Alwal	7338	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44427	698	Balanagar	7339	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44428	698	Malkajgiri	7340	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44429	698	Kukatpally	7341	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44430	698	Uppal	7342	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
44431	677	Nadikuda	7343	\N	System	2018-10-24 11:34:41.360697	\N	2018-10-24 11:34:41.360697	A	RU
45325	704	Port	9901	\N	NLMA.001	2020-05-07 17:25:04.782063	NLMA.001	2020-05-07 17:25:04.782063	A	RU
\.


--
-- TOC entry 2962 (class 0 OID 17313)
-- Dependencies: 204
-- Data for Name: gis_district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gis_district (district_id, state_id, district_name, district_code, std_code, created_by, created_time, modified_by, modified_time, status) FROM stdin;
715	9	ekm	6143	0	NLMA.001	2019-01-10 14:49:31.737893	NLMA.001	2019-01-10 14:49:31.737893	A
93	7	AJMER	86	86	System	2018-10-23 20:27:09.726878	SLMA7.001	2018-10-23 20:27:09.726878	A
573	27	ANANTAPUR	502	0	System	2018-10-23 20:27:09.726878	NLMA.001	2018-10-23 20:27:09.726878	A
703	27	KKKY	999	0	NLMA.001	2018-11-30 11:18:17.895759	NLMA.001	2018-11-30 11:18:17.895759	A
704	43	South	2245	0	NLMA.001	2018-11-30 11:19:47.76043	NLMA.001	2018-11-30 11:19:47.76043	A
708	33	South	0123	0	NLMA.001	2018-11-30 11:21:48.88385	NLMA.001	2018-11-30 11:21:48.88385	A
248	11	LOHIT	234	0	System	2018-10-23 20:27:09.726878	NLMA.001	2018-10-23 20:27:09.726878	A
709	11	lllk	4443	0	NLMA.001	2018-11-30 11:24:14.87005	NLMA.001	2018-11-30 11:24:14.87005	A
341	17	BAKS	616	0	System	2018-10-23 20:27:09.726878	NLMA.001	2018-10-23 20:27:09.726878	A
238	9	ARWAL	611	0	System	2018-10-23 20:27:09.726878	NLMA.001	2018-10-23 20:27:09.726878	A
711	9	hhhh	3210	0	NLMA.001	2018-11-30 11:26:45.452071	NLMA.001	2018-11-30 11:26:45.452071	A
707	43	HHLL	1026	0	NLMA.001	2018-11-30 11:21:08.468528	NLMA.001	2018-11-30 11:21:08.468528	I
713	33	hhhhhhhhhh	0926	0	SLMA33.001	2018-11-30 12:54:38.582923	NLMA.001	2018-11-30 12:54:38.582923	A
714	33	lponj	1101	0	SLMA33.001	2018-11-30 12:55:18.636887	NLMA.001	2018-11-30 12:55:18.636887	A
57	4	CHANDIGAR	44	0	System	2018-10-23 20:27:09.726878	NLMA.001	2018-10-23 20:27:09.726878	A
1	1	ANANTNAG	1	1	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
2	1	BADGAM	2	2	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
3	1	BARAMULLA	3	3	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
4	1	DODA	4	4	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
5	1	JAMMU	5	5	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
6	1	KARGIL	6	6	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
7	1	KATHUA	7	7	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
8	1	KUPWARA	8	8	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
9	1	LEH LADAKH	9	9	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
10	1	POONCH	10	10	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
11	1	PULWAMA	11	11	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
12	1	RAJAURI	12	12	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
13	1	SRINAGAR	13	13	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
14	1	UDHAMPUR	14	14	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
15	1	KISHTWAR	620	620	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
16	1	RAMBAN	621	621	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
17	1	KULGAM	622	622	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
18	1	BANDIPORA	623	623	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
19	1	SAMBA	624	624	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
20	1	SHOPIAN	625	625	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
21	1	GANDERBAL	626	626	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
22	1	REASI	627	627	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
23	2	BILASPUR	15	15	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
24	2	CHAMBA	16	16	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
25	2	HAMIRPUR	17	17	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
26	2	KANGRA	18	18	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
27	2	KINNAUR	19	19	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
28	2	KULLU	20	20	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
29	2	LAHUL AND SPITI	21	21	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
30	2	MANDI	22	22	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
31	2	SHIMLA	23	23	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
32	2	SIRMAUR	24	24	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
33	2	SOLAN	25	25	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
34	2	UNA	26	26	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
35	3	AMRITSAR	27	27	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
36	3	BATHINDA	28	28	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
37	3	FARIDKOT	29	29	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
38	3	FATEHGARH SAHIB	30	30	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
39	3	FIROZEPUR	31	31	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
40	3	GURDASPUR	32	32	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
41	3	HOSHIARPUR	33	33	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
42	3	JALANDHAR	34	34	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
43	3	KAPURTHALA	35	35	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
44	3	LUDHIANA	36	36	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
45	3	MANSA	37	37	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
46	3	MOGA	38	38	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
47	3	SRI MUKTSAR SAHIB	39	39	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
48	3	Shahid Bhagat Singh Nagar	40	40	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
49	3	PATIALA	41	41	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
50	3	RUPNAGAR	42	42	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
51	3	SANGRUR	43	43	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
52	3	BARNALA	605	605	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
53	3	S.A.S Nagar	608	608	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
54	3	Tarn Taran	609	609	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
55	3	FAZILKA	651	651	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
56	3	PATHANKOT	662	662	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
58	5	ALMORA	45	45	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
59	5	BAGESHWAR	46	46	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
60	5	CHAMOLI	47	47	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
61	5	CHAMPAWAT	48	48	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
62	5	DEHRADUN	49	49	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
63	5	HARIDWAR	50	50	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
64	5	NAINITAL	51	51	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
65	5	PAURI GARHWAL	52	52	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
201	9	ARARIA	188	188	System	2018-10-23 20:27:09.726878	NLMAADM.005	2018-10-23 20:27:09.726878	A
66	5	PITHORAGARH	53	53	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
67	5	RUDRA PRAYAG	54	54	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
68	5	TEHRI GARHWAL	55	55	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
69	5	UDAM SINGH NAGAR	56	56	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
70	5	UTTAR KASHI	57	57	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
71	6	AMBALA	58	58	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
72	6	BHIWANI	59	59	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
73	6	FARIDABAD	60	60	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
74	6	FATEHABAD	61	61	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
75	6	GURUGRAM	62	62	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
76	6	HISAR	63	63	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
77	6	JHAJJAR	64	64	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
78	6	JIND	65	65	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
79	6	KAITHAL	66	66	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
80	6	KARNAL	67	67	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
81	6	KURUKSHETRA	68	68	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
82	6	MAHENDRAGARH	69	69	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
83	6	PANCHKULA	70	70	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
84	6	PANIPAT	71	71	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
85	6	REWARI	72	72	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
86	6	ROHTAK	73	73	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
87	6	SIRSA	74	74	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
88	6	SONIPAT	75	75	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
89	6	YAMUNANAGAR	76	76	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
90	6	MEWAT	604	604	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
91	6	PALWAL	619	619	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
92	6	CHARKI DADRI	701	701	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
95	7	BANSWARA	88	88	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
96	7	BARAN	89	89	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
97	7	BARMER	90	90	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
98	7	BHARATPUR	91	91	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
99	7	BHILWARA	92	92	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
100	7	BIKANER	93	93	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
101	7	BUNDI	94	94	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
102	7	CHITTORGARH	95	95	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
103	7	CHURU	96	96	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
104	7	DAUSA	97	97	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
105	7	DHOLPUR	98	98	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
106	7	DUNGARPUR	99	99	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
107	7	GANGANAGAR	100	100	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
108	7	HANUMANGARH	101	101	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
109	7	JAIPUR	102	102	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
110	7	JAISALMER	103	103	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
111	7	JALORE	104	104	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
112	7	JHALAWAR	105	105	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
113	7	JHUNJHUNU	106	106	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
114	7	JODHPUR	107	107	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
115	7	KARAULI	108	108	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
116	7	KOTA	109	109	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
117	7	NAGAUR	110	110	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
118	7	PALI	111	111	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
119	7	RAJSAMAND	112	112	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
120	7	SAWAI MADHOPUR	113	113	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
121	7	SIKAR	114	114	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
122	7	SIROHI	115	115	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
123	7	TONK	116	116	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
124	7	UDAIPUR	117	117	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
125	7	PRATAPGARH	629	629	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
126	8	AGRA	118	118	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
127	8	ALIGARH	119	119	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
128	8	ALLAHABAD	120	120	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
129	8	AMBEDKAR NAGAR	121	121	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
130	8	AURAIYA	122	122	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
131	8	AZAMGARH	123	123	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
132	8	BAGHPAT	124	124	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
133	8	BAHRAICH	125	125	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
134	8	BALLIA	126	126	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
135	8	BALRAMPUR	127	127	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
136	8	BANDA	128	128	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
137	8	BARABANKI	129	129	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
138	8	BAREILLY	130	130	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
139	8	BASTI	131	131	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
140	8	BIJNOR	132	132	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
141	8	BUDAUN	133	133	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
142	8	BULANDSHAHR	134	134	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
143	8	CHANDAULI	135	135	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
144	8	CHITRAKOOT	136	136	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
145	8	DEORIA	137	137	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
94	7	ALWAR	87	0	System	2018-10-23 20:27:09.726878	SLMA7.001	2018-10-23 20:27:09.726878	A
146	8	ETAH	138	138	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
147	8	ETAWAH	139	139	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
148	8	FAIZABAD	140	140	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
149	8	FARRUKHABAD	141	141	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
150	8	FATEHPUR	142	142	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
151	8	FIROZABAD	143	143	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
152	8	GAUTAM BUDDHA NAGAR	144	144	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
153	8	GHAZIABAD	145	145	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
154	8	GHAZIPUR	146	146	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
155	8	GONDA	147	147	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
156	8	GORAKHPUR	148	148	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
157	8	HAMIRPUR	149	149	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
158	8	HARDOI	150	150	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
159	8	JALAUN	151	151	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
160	8	JAUNPUR	152	152	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
161	8	JHANSI	153	153	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
162	8	AMROHA	154	154	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
163	8	KANNAUJ	155	155	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
164	8	KANPUR DEHAT	156	156	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
165	8	KANPUR NAGAR	157	157	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
166	8	KAUSHAMBI	158	158	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
167	8	KHERI	159	159	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
168	8	KUSHI NAGAR	160	160	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
169	8	LALITPUR	161	161	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
170	8	LUCKNOW	162	162	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
171	8	HATHRAS	163	163	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
172	8	MAHARAJGANJ	164	164	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
173	8	MAHOBA	165	165	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
174	8	MAINPURI	166	166	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
175	8	MATHURA	167	167	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
176	8	MAU	168	168	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
177	8	MEERUT	169	169	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
178	8	MIRZAPUR	170	170	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
179	8	MORADABAD	171	171	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
180	8	MUZAFFARNAGAR	172	172	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
181	8	PILIBHIT	173	173	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
182	8	PRATAPGARH	174	174	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
183	8	RAE BARELI	175	175	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
184	8	RAMPUR	176	176	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
185	8	SAHARANPUR	177	177	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
186	8	SANT KABEER NAGAR	178	178	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
187	8	BHADOHI	179	179	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
188	8	SHAHJAHANPUR	180	180	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
189	8	SHRAVASTI	181	181	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
190	8	SIDDHARTH NAGAR	182	182	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
191	8	SITAPUR	183	183	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
192	8	SONBHADRA	184	184	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
193	8	SULTANPUR	185	185	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
194	8	UNNAO	186	186	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
195	8	VARANASI	187	187	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
196	8	Kasganj	633	633	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
197	8	Amethi	640	640	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
198	8	SAMBHAL	659	659	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
199	8	SHAMLI	660	660	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
200	8	HAPUR	661	661	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
202	9	AURANGABAD	189	189	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
203	9	BANKA	190	190	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
204	9	BEGUSARAI	191	191	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
205	9	BHAGALPUR	192	192	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
206	9	BHOJPUR	193	193	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
207	9	BUXAR	194	194	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
208	9	DARBHANGA	195	195	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
209	9	GAYA	196	196	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
210	9	GOPALGANJ	197	197	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
211	9	JAMUI	198	198	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
212	9	JEHANABAD	199	199	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
213	9	KAIMUR (BHABUA)	200	200	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
214	9	KATIHAR	201	201	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
215	9	KHAGARIA	202	202	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
216	9	KISHANGANJ	203	203	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
217	9	LAKHISARAI	204	204	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
218	9	MADHEPURA	205	205	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
219	9	MADHUBANI	206	206	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
220	9	MUNGER	207	207	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
221	9	MUZAFFARPUR	208	208	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
222	9	NALANDA	209	209	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
223	9	NAWADA	210	210	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
224	9	PASHCHIM CHAMPARAN	211	211	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
225	9	PATNA	212	212	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
226	9	PURBI CHAMPARAN	213	213	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
227	9	PURNIA	214	214	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
228	9	ROHTAS	215	215	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
229	9	SAHARSA	216	216	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
230	9	SAMASTIPUR	217	217	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
231	9	SARAN	218	218	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
232	9	SHEIKHPURA	219	219	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
233	9	SHEOHAR	220	220	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
234	9	SITAMARHI	221	221	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
235	9	SIWAN	222	222	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
236	9	SUPAUL	223	223	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
237	9	VAISHALI	224	224	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
239	10	EAST DISTRICT	225	225	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
240	10	NORTH DISTRICT	226	226	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
241	10	SOUTH DISTRICT	227	227	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
242	10	WEST DISTRICT	228	228	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
243	11	CHANGLANG	229	229	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
244	11	DIBANG VALLEY	230	230	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
245	11	EAST KAMENG	231	231	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
246	11	EAST SIANG	232	232	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
247	11	KURUNG KUMEY	233	233	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
249	11	LOWER DIBANG VALLEY	235	235	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
250	11	LOWER SUBANSIRI	236	236	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
251	11	PAPUM PARE	237	237	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
252	11	TAWANG	238	238	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
253	11	TIRAP	239	239	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
254	11	UPPER SIANG	240	240	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
255	11	UPPER SUBANSIRI	241	241	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
256	11	WEST KAMENG	242	242	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
257	11	WEST SIANG	243	243	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
258	11	ANJAW	628	628	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
259	11	LONGDING	666	666	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
260	11	Kra Daadi	677	677	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
261	11	NAMSAI	678	678	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
262	11	SIANG	679	679	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
263	12	DIMAPUR	244	244	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
264	12	KOHIMA	245	245	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
265	12	MOKOKCHUNG	246	246	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
266	12	MON	247	247	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
267	12	PHEK	248	248	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
268	12	TUENSANG	249	249	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
269	12	WOKHA	250	250	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
270	12	ZUNHEBOTO	251	251	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
271	12	PEREN	613	613	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
272	12	KIPHIRE	614	614	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
273	12	LONGLENG	615	615	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
274	13	BISHNUPUR	252	252	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
275	13	CHANDEL	253	253	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
276	13	CHURACHANDPUR	254	254	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
277	13	IMPHAL EAST	255	255	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
278	13	IMPHAL WEST	256	256	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
279	13	SENAPATI	257	257	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
280	13	TAMENGLONG	258	258	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
281	13	THOUBAL	259	259	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
282	13	UKHRUL	260	260	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
283	13	KAKCHING	711	711	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
284	13	KANGPOKPI	712	712	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
285	13	JIRIBAM	713	713	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
286	13	NONEY	714	714	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
287	13	PHERZAWL	715	715	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
288	13	TENGNOUPAL	716	716	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
289	13	KAMJONG	717	717	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
290	14	AIZAWL	261	261	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
291	14	CHAMPHAI	262	262	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
292	14	KOLASIB	263	263	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
293	14	LAWNGTLAI	264	264	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
294	14	LUNGLEI	265	265	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
295	14	MAMIT	266	266	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
296	14	SAIHA	267	267	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
297	14	SERCHHIP	268	268	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
298	15	Dhalai	269	269	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
299	15	North Tripura	270	270	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
300	15	South Tripura	271	271	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
301	15	West Tripura	272	272	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
302	15	Khowai	652	652	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
303	15	Sepahijala	653	653	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
304	15	Gomati	654	654	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
305	15	Unakoti	655	655	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
306	16	EAST GARO HILLS	273	273	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
307	16	EAST KHASI HILLS	274	274	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
308	16	WEST JAINTIA HILLS	275	275	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
309	16	RI BHOI	276	276	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
310	16	SOUTH GARO HILLS	277	277	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
311	16	WEST GARO HILLS	278	278	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
312	16	WEST KHASI HILLS	279	279	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
396	20	ANUGUL	344	344	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
313	16	NORTH GARO HILLS	656	656	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
314	16	EAST JAINTIA HILLS	657	657	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
315	16	SOUTH WEST KHASI HILLS	658	658	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
316	16	SOUTH WEST GARO HILLS	663	663	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
317	17	BARPETA	280	280	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
318	17	BONGAIGAON	281	281	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
319	17	CACHAR	282	282	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
320	17	DARRANG	283	283	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
321	17	DHEMAJI	284	284	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
322	17	DHUBRI	285	285	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
323	17	DIBRUGARH	286	286	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
324	17	GOALPARA	287	287	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
325	17	GOLAGHAT	288	288	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
326	17	HAILAKANDI	289	289	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
327	17	JORHAT	290	290	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
328	17	KAMRUP	291	291	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
329	17	KARBI ANGLONG	292	292	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
330	17	KARIMGANJ	293	293	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
331	17	KOKRAJHAR	294	294	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
332	17	LAKHIMPUR	295	295	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
333	17	MARIGAON	296	296	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
334	17	NAGAON	297	297	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
335	17	NALBARI	298	298	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
336	17	DIMA HASAO	299	299	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
337	17	SIVASAGAR	300	300	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
338	17	SONITPUR	301	301	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
339	17	TINSUKIA	302	302	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
340	17	CHIRANG	612	612	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
342	17	UDALGURI	617	617	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
343	17	KAMRUP METRO	618	618	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
344	17	Biswanath	705	705	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
345	17	MAJULI	706	706	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
346	17	SOUTH SALMARA MANCACHAR	707	707	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
347	17	CHARAIDEO	708	708	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
348	17	HOJAI	709	709	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
349	17	WEST KARBI ANGLONG	710	710	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
350	18	24 PARAGANAS NORTH	303	303	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
351	18	24 PARAGANAS SOUTH	304	304	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
352	18	BANKURA	305	305	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
353	18	PURBA BARDHAMAN	306	306	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
354	18	BIRBHUM	307	307	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
355	18	COOCHBEHAR	308	308	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
356	18	DARJEELING	309	309	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
357	18	DINAJPUR DAKSHIN	310	310	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
358	18	DINAJPUR UTTAR	311	311	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
359	18	HOOGHLY	312	312	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
360	18	HOWRAH	313	313	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
361	18	JALPAIGURI	314	314	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
362	18	MALDAH	316	316	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
363	18	MEDINIPUR EAST	317	317	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
364	18	MEDINIPUR WEST	318	318	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
365	18	MURSHIDABAD	319	319	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
366	18	NADIA	320	320	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
367	18	PURULIA	321	321	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
368	18	Alipurduar	664	664	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
369	18	KALIMPONG	702	702	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
370	18	Jhargram	703	703	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
371	18	PASCHIM BARDHAMAN	704	704	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
372	19	BOKARO	322	322	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
373	19	CHATRA	323	323	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
374	19	DEOGHAR	324	324	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
375	19	DHANBAD	325	325	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
376	19	DUMKA	326	326	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
377	19	EAST SINGHBUM	327	327	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
378	19	GARHWA	328	328	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
379	19	GIRIDIH	329	329	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
380	19	GODDA	330	330	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
381	19	GUMLA	331	331	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
382	19	HAZARIBAGH	332	332	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
383	19	JAMTARA	333	333	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
384	19	KODERMA	334	334	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
385	19	LATEHAR	335	335	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
386	19	LOHARDAGA	336	336	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
387	19	PAKUR	337	337	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
388	19	PALAMU	338	338	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
389	19	RANCHI	339	339	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
390	19	SAHEBGANJ	340	340	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
391	19	SARAIKELA KHARSAWAN	341	341	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
392	19	SIMDEGA	342	342	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
393	19	WEST SINGHBHUM	343	343	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
394	19	KHUNTI	606	606	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
395	19	RAMGARH	607	607	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
397	20	BALANGIR	345	345	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
398	20	BALESHWAR	346	346	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
399	20	BARGARH	347	347	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
400	20	BHADRAK	348	348	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
401	20	BOUDH	349	349	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
402	20	CUTTACK	350	350	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
403	20	DEOGARH	351	351	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
404	20	DHENKANAL	352	352	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
405	20	GAJAPATI	353	353	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
406	20	GANJAM	354	354	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
407	20	JAGATSINGHAPUR	355	355	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
408	20	JAJAPUR	356	356	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
409	20	JHARSUGUDA	357	357	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
410	20	KALAHANDI	358	358	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
411	20	KANDHAMAL	359	359	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
412	20	KENDRAPARA	360	360	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
413	20	KENDUJHAR	361	361	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
414	20	KHORDHA	362	362	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
415	20	KORAPUT	363	363	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
416	20	MALKANGIRI	364	364	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
417	20	MAYURBHANJ	365	365	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
418	20	NABARANGPUR	366	366	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
419	20	NAYAGARH	367	367	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
420	20	NUAPADA	368	368	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
421	20	PURI	369	369	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
422	20	RAYAGADA	370	370	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
423	20	SAMBALPUR	371	371	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
424	20	SONEPUR	372	372	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
425	20	SUNDARGARH	373	373	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
426	21	BASTAR	374	374	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
427	21	BILASPUR	375	375	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
428	21	DANTEWADA	376	376	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
429	21	DHAMTARI	377	377	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
430	21	DURG	378	378	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
431	21	JANJGIR-CHAMPA	379	379	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
432	21	JASHPUR	380	380	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
433	21	KANKER	381	381	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
434	21	KABIRDHAM	382	382	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
435	21	KORBA	383	383	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
436	21	KOREA	384	384	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
437	21	MAHASAMUND	385	385	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
438	21	RAIGARH	386	386	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
439	21	RAIPUR	387	387	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
440	21	RAJNANDGAON	388	388	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
441	21	SURGUJA	389	389	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
442	21	BIJAPUR	636	636	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
443	21	NARAYANPUR	637	637	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
444	21	SUKMA	642	642	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
445	21	KONDAGAON	643	643	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
446	21	BALODA BAZAR	644	644	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
447	21	GARIYABAND	645	645	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
448	21	BALOD	646	646	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
449	21	MUNGELI	647	647	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
450	21	SURAJPUR	648	648	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
451	21	BALRAMPUR	649	649	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
452	21	BEMETARA	650	650	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
453	22	ANUPPUR	390	390	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
454	22	ASHOKNAGAR	391	391	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
455	22	BALAGHAT	392	392	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
456	22	BARWANI	393	393	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
457	22	BETUL	394	394	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
458	22	BHIND	395	395	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
459	22	BHOPAL	396	396	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
460	22	BURHANPUR	397	397	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
461	22	CHHATARPUR	398	398	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
462	22	CHHINDWARA	399	399	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
463	22	DAMOH	400	400	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
464	22	DATIA	401	401	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
465	22	DEWAS	402	402	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
466	22	DHAR	403	403	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
467	22	DINDORI	404	404	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
468	22	EAST NIMAR	405	405	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
469	22	GUNA	406	406	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
470	22	GWALIOR	407	407	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
471	22	HARDA	408	408	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
472	22	HOSHANGABAD	409	409	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
473	22	INDORE	410	410	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
474	22	JABALPUR	411	411	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
475	22	JHABUA	412	412	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
476	22	KATNI	413	413	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
477	22	KHARGONE	414	414	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
478	22	MANDLA	415	415	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
479	22	MANDSAUR	416	416	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
480	22	MORENA	417	417	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
481	22	NARSINGHPUR	418	418	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
482	22	NEEMUCH	419	419	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
483	22	PANNA	420	420	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
484	22	RAISEN	421	421	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
485	22	RAJGARH	422	422	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
486	22	RATLAM	423	423	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
487	22	REWA	424	424	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
488	22	SAGAR	425	425	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
489	22	SATNA	426	426	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
490	22	SEHORE	427	427	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
491	22	SEONI	428	428	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
492	22	SHAHDOL	429	429	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
493	22	SHAJAPUR	430	430	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
494	22	SHEOPUR	431	431	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
495	22	SHIVPURI	432	432	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
496	22	SIDHI	433	433	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
497	22	TIKAMGARH	434	434	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
498	22	UJJAIN	435	435	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
499	22	UMARIA	436	436	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
500	22	VIDISHA	437	437	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
501	22	SINGRAULI	638	638	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
502	22	ALIRAJPUR	639	639	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
503	23	AHMADABAD	438	438	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
504	23	AMRELI	439	439	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
505	23	ANAND	440	440	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
506	23	BANAS KANTHA	441	441	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
507	23	BHARUCH	442	442	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
508	23	BHAVNAGAR	443	443	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
509	23	DANG	444	444	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
510	23	DOHAD	445	445	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
511	23	GANDHINAGAR	446	446	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
512	23	JAMNAGAR	447	447	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
513	23	JUNAGADH	448	448	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
514	23	KACHCHH	449	449	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
515	23	KHEDA	450	450	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
516	23	MAHESANA	451	451	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
517	23	NARMADA	452	452	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
518	23	NAVSARI	453	453	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
519	23	PANCH MAHALS	454	454	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
520	23	PATAN	455	455	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
521	23	PORBANDAR	456	456	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
522	23	RAJKOT	457	457	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
523	23	SABAR KANTHA	458	458	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
524	23	SURAT	459	459	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
525	23	SURENDRANAGAR	460	460	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
526	23	VADODARA	461	461	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
527	23	VALSAD	462	462	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
528	23	TAPI	641	641	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
529	23	CHHOTAUDEPUR	668	668	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
530	23	Mahisagar	669	669	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
531	23	ARVALLI	672	672	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
532	23	MORBI	673	673	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
533	23	DEVBHUMI DWARKA	674	674	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
534	23	GIR SOMNATH	675	675	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
535	23	BOTAD	676	676	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
536	24	DAMAN	463	463	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
537	24	DIU	464	464	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
538	25	DADRA AND NAGAR HAVELI	465	465	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
539	26	AHMEDNAGAR	466	466	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
540	26	AKOLA	467	467	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
541	26	AMRAVATI	468	468	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
542	26	AURANGABAD	469	469	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
543	26	BEED	470	470	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
544	26	BHANDARA	471	471	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
545	26	BULDHANA	472	472	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
546	26	CHANDRAPUR	473	473	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
547	26	DHULE	474	474	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
548	26	GADCHIROLI	475	475	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
549	26	GONDIA	476	476	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
550	26	HINGOLI	477	477	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
551	26	JALGAON	478	478	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
552	26	JALNA	479	479	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
553	26	KOLHAPUR	480	480	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
554	26	LATUR	481	481	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
555	26	NAGPUR	484	484	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
556	26	NANDED	485	485	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
557	26	NANDURBAR	486	486	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
558	26	NASHIK	487	487	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
559	26	OSMANABAD	488	488	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
560	26	PARBHANI	489	489	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
561	26	PUNE	490	490	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
562	26	RAIGAD	491	491	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
563	26	RATNAGIRI	492	492	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
564	26	SANGLI	493	493	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
565	26	SATARA	494	494	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
566	26	SINDHUDURG	495	495	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
567	26	SOLAPUR	496	496	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
568	26	THANE	497	497	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
569	26	WARDHA	498	498	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
570	26	WASHIM	499	499	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
571	26	YAVATMAL	500	500	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
572	26	PALGHAR	665	665	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
574	27	CHITTOOR	503	503	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
575	27	Y.S.R.	504	504	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
576	27	EAST GODAVARI	505	505	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
577	27	GUNTUR	506	506	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
578	27	KRISHNA	510	510	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
579	27	KURNOOL	511	511	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
580	27	SPSR NELLORE	515	515	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
581	27	PRAKASAM	517	517	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
582	27	SRIKAKULAM	519	519	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
583	27	VISAKHAPATANAM	520	520	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
584	27	VIZIANAGARAM	521	521	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
585	27	WEST GODAVARI	523	523	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
586	28	BAGALKOT	524	524	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
587	28	BENGALURU URBAN	525	525	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
588	28	BENGALURU RURAL	526	526	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
589	28	BELAGAVI	527	527	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
590	28	BALLARI	528	528	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
591	28	BIDAR	529	529	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
592	28	VIJAYAPURA	530	530	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
593	28	CHAMARAJANAGAR	531	531	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
594	28	CHIKKAMAGALURU	532	532	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
595	28	CHITRADURGA	533	533	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
596	28	DAKSHIN KANNAD	534	534	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
597	28	DAVANGERE	535	535	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
598	28	DHARWAD	536	536	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
599	28	GADAG	537	537	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
600	28	KALABURAGI	538	538	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
601	28	HASSAN	539	539	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
602	28	HAVERI	540	540	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
603	28	KODAGU	541	541	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
604	28	KOLAR	542	542	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
605	28	KOPPAL	543	543	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
606	28	MANDYA	544	544	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
607	28	MYSURU	545	545	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
608	28	RAICHUR	546	546	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
609	28	SHIVAMOGGA	547	547	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
610	28	TUMAKURU	548	548	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
611	28	UDUPI	549	549	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
612	28	UTTAR KANNAD	550	550	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
613	28	CHIKBALLAPUR	630	630	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
614	28	RAMANAGARA	631	631	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
615	28	YADGIR	635	635	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
617	29	SOUTH GOA	552	552	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
618	30	ALAPPUZHA	554	554	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
619	30	ERNAKULAM	555	555	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
620	30	IDUKKI	556	556	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
621	30	KANNUR	557	557	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
622	30	KASARAGOD	558	558	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
623	30	KOLLAM	559	559	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
624	30	KOTTAYAM	560	560	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
625	30	KOZHIKODE	561	561	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
626	30	MALAPPURAM	562	562	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
627	30	PALAKKAD	563	563	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
628	30	PATHANAMTHITTA	564	564	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
629	30	THIRUVANANTHAPURAM	565	565	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
630	30	THRISSUR	566	566	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
631	30	WAYANAD	567	567	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
632	31	COIMBATORE	569	569	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
633	31	CUDDALORE	570	570	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
634	31	DHARMAPURI	571	571	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
635	31	DINDIGUL	572	572	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
636	31	ERODE	573	573	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
637	31	KANCHIPURAM	574	574	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
638	31	KANNIYAKUMARI	575	575	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
639	31	KARUR	576	576	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
640	31	KRISHNAGIRI	577	577	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
641	31	MADURAI	578	578	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
642	31	NAGAPATTINAM	579	579	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
643	31	NAMAKKAL	580	580	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
644	31	PERAMBALUR	581	581	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
645	31	PUDUKKOTTAI	582	582	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
646	31	RAMANATHAPURAM	583	583	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
647	31	SALEM	584	584	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
648	31	SIVAGANGA	585	585	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
649	31	THANJAVUR	586	586	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
650	31	THE NILGIRIS	587	587	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
651	31	THENI	588	588	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
652	31	THIRUVALLUR	589	589	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
653	31	THIRUVARUR	590	590	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
654	31	TIRUCHIRAPPALLI	591	591	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
655	31	TIRUNELVELI	592	592	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
656	31	TIRUVANNAMALAI	593	593	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
657	31	TUTICORIN	594	594	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
658	31	VELLORE	595	595	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
659	31	VILLUPURAM	596	596	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
660	31	VIRUDHUNAGAR	597	597	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
661	31	Ariyalur	610	610	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
662	31	TIRUPPUR	634	634	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
663	32	KARAIKAL	598	598	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
664	32	PONDICHERRY	600	600	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
665	33	SOUTH ANDAMANS	602	602	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
668	34	ADILABAD	501	501	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
669	34	HYDERABAD	507	507	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
670	34	KARIMNAGAR	508	508	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
671	34	KHAMMAM	509	509	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
672	34	MAHABUBNAGAR	512	512	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
673	34	MEDAK	513	513	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
674	34	NALGONDA	514	514	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
675	34	NIZAMABAD	516	516	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
676	34	RANGA REDDY	518	518	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
677	34	WARANGAL RURAL	522	522	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
678	34	Nirmal	680	680	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
679	34	Jagitial	681	681	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
680	34	PEDDAPALLI	682	682	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
681	34	RAJANNA SIRCILLA	683	683	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
682	34	MANCHERIAL	684	684	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
683	34	KAMAREDDY	685	685	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
684	34	WARANGAL URBAN	686	686	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
685	34	JAYASHANKAR BHUPALAPALLY	687	687	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
686	34	MAHABUBABAD	688	688	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
687	34	JANGOAN	689	689	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
688	34	BHADRADRI KOTHAGUDEM	690	690	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
689	34	SANGAREDDY	691	691	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
690	34	SIDDIPET	692	692	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
691	34	WANAPARTHY	693	693	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
692	34	NAGARKURNOOL	694	694	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
693	34	JOGULAMBA GADWAL	695	695	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
694	34	SURYAPET	696	696	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
695	34	YADADRI BHUVANAGIRI	697	697	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
696	34	VIKARABAD	698	698	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
697	34	KUMURAM BHEEM ASIFABAD	699	699	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
698	34	MEDCHAL MALKAJGIRI	700	700	System	2018-10-23 20:27:09.726878	\N	2018-10-23 20:27:09.726878	A
667	33	NORTH AND MIDDLE ANDAMAN	777	0	System	2018-10-23 20:27:09.726878	SLMA33.001	2018-10-23 20:27:09.726878	A
666	33	NICOBARS	603	0	System	2018-10-23 20:27:09.726878	NLMA.001	2018-10-23 20:27:09.726878	A
616	29	NORTH GOA	551	551	System	2018-10-23 20:27:09.726878	SLMAADM29.001	2018-10-23 20:27:09.726878	A
\.


--
-- TOC entry 2960 (class 0 OID 17297)
-- Dependencies: 202
-- Data for Name: gis_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gis_state (state_id, state_name, state_code, created_by, created_time, modified_by, modified_time, status) FROM stdin;
4	CHANDIGARH	4	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
30	KERALA	32	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
27	ANDHRA PRADESH	28	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
11	ARUNACHAL PRADESH	12	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
9	BIHAR	10	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
1	JAMMU AND KASHMIR	1	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
2	HIMACHAL PRADESH	2	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
3	PUNJAB	3	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
5	UTTARAKHAND	5	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
6	HARYANA	6	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
7	RAJASTHAN	8	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
8	UTTAR PRADESH	9	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
10	SIKKIM	11	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
12	NAGALAND	13	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
13	MANIPUR	14	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
14	MIZORAM	15	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
15	TRIPURA	16	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
16	MEGHALAYA	17	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
18	WEST BENGAL	19	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
19	JHARKHAND	20	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
20	ODISHA	21	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
22	MADHYA PRADESH	23	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
23	GUJARAT	24	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
24	DAMAN AND DIU	25	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
25	DADRA AND NAGAR HAVELI	26	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
26	MAHARASHTRA	27	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
28	KARNATAKA	29	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
29	GOA	30	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
31	TAMIL NADU	33	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
32	PUDUCHERRY	34	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
34	TELANGANA	36	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
17	ASSAM	18	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
21	CHHATTISGARH	22	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
43	ANDAMAN AND NICOBAR	99	NLMA.001	2018-11-30 11:10:07.70189	NLMA.001	2018-11-30 11:10:07.70189	A
33	ANDAMAN AND NICOBAR ISLANDS	75	System	2018-10-23 20:27:00.407191	\N	2018-10-23 20:27:00.407191	A
\.


--
-- TOC entry 2985 (class 0 OID 34404)
-- Dependencies: 227
-- Data for Name: master_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.master_config (record_id, state_code, config_type, district_level, block_level, school_level, status, created_by, created_time, modified_by, modified_time) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 25625)
-- Dependencies: 226
-- Data for Name: mst_class_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_class_section (record_id, class_name, section_name, status, created_by, created_time, modified_by, modified_time, school_id, udise_code) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 17428)
-- Dependencies: 218
-- Data for Name: mst_moi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_moi (record_id, moi) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 17422)
-- Dependencies: 217
-- Data for Name: mst_mother_tongue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_mother_tongue (record_id, language_name) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 17417)
-- Dependencies: 216
-- Data for Name: mst_religion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_religion (record_id, religion_name) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 17412)
-- Dependencies: 215
-- Data for Name: mst_social_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_social_category (record_id, category_name) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 17359)
-- Dependencies: 208
-- Data for Name: std_basic_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_basic_details (record_id, student_id, admission_num, date_of_admission, aadhar_num, std_name, father_name, mother_name, gender, social_category, religion, mother_tongue, child_homeless, state_id, district_id, city_id, locality_id, belong_bpl, disadvantage_group, type_of_disability, status, created_by, created_time, modified_by, modified_time, date_of_birth, class_section_id, "udise_code`", state_code, district_code, block_code, category_id, management_id, edu_type, locality) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 17367)
-- Dependencies: 209
-- Data for Name: std_class_section_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_class_section_mapping (record_id, student_id, status, created_by, created_time, class_name, section, mst_cls_sec_id, udise_code, state_code, district_code, block_code) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 17380)
-- Dependencies: 211
-- Data for Name: std_education_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_education_details (record_id, student_id, free_edu, class_attend, moi, academic_year, created_by, created_time, modified_by, modified_time, status_prev, class_prev_year, study_in_class) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 17388)
-- Dependencies: 212
-- Data for Name: std_incentive_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_incentive_details (record_id, student_id, academic_year, facility_cwsn, num_of_uniform_set, free_text_book, free_transport_facility, free_escort_facility, free_bicycle, free_hostal_facility, special_training, created_by, created_time, modified_by, modified_time) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 17396)
-- Dependencies: 213
-- Data for Name: std_result_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_result_details (record_id, student_id, academic_year, last_result, mark_obtain, schooling_status, stream, created_by, created_time, modified_by, modified_time) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 17372)
-- Dependencies: 210
-- Data for Name: std_school_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_school_mapping (record_id, school_id, udise_code, student_id, status, created_by, created_time) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 17404)
-- Dependencies: 214
-- Data for Name: std_vocational_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.std_vocational_detail (record_id, student_id, academic_year, trade, job_role, nsqf_level, student_opted_for, placement_status, salary_offered, created_by, created_time, modified_by, modified_time) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 207
-- Name: gis_block_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gis_block_block_id_seq', 45325, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 205
-- Name: gis_district_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gis_district_district_id_seq', 715, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 203
-- Name: gis_state_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gis_state_state_id_seq', 43, true);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 225
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 2, false);


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 219
-- Name: std_basic_details_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.std_basic_details_record_id', 1, false);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 220
-- Name: std_education_details_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.std_education_details_record_id', 1, false);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 222
-- Name: std_incentive_details_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.std_incentive_details_record_id', 1, false);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 223
-- Name: std_result_details_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.std_result_details_record_id', 1, false);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 224
-- Name: std_section_class_mapping_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.std_section_class_mapping_record_id', 1, false);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 221
-- Name: std_vocational_detail_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.std_vocational_detail_record_id', 1, false);


--
-- TOC entry 2801 (class 2606 OID 17348)
-- Name: gis_block block_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_block
    ADD CONSTRAINT block_code UNIQUE (block_code);


--
-- TOC entry 2795 (class 2606 OID 17324)
-- Name: gis_district district_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_district
    ADD CONSTRAINT district_code UNIQUE (district_code);


--
-- TOC entry 2803 (class 2606 OID 17350)
-- Name: gis_block gis_block_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_block
    ADD CONSTRAINT gis_block_pkey PRIMARY KEY (block_id);


--
-- TOC entry 2797 (class 2606 OID 17326)
-- Name: gis_district gis_district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_district
    ADD CONSTRAINT gis_district_pkey PRIMARY KEY (district_id);


--
-- TOC entry 2789 (class 2606 OID 17308)
-- Name: gis_state gis_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_state
    ADD CONSTRAINT gis_state_pkey PRIMARY KEY (state_id);


--
-- TOC entry 2831 (class 2606 OID 34408)
-- Name: master_config master_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_config
    ADD CONSTRAINT master_config_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2829 (class 2606 OID 25629)
-- Name: mst_class_section mst_class_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_class_section
    ADD CONSTRAINT mst_class_section_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2827 (class 2606 OID 17432)
-- Name: mst_moi mst_moi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_moi
    ADD CONSTRAINT mst_moi_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2825 (class 2606 OID 17426)
-- Name: mst_mother_tongue mst_mother_tongue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_mother_tongue
    ADD CONSTRAINT mst_mother_tongue_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2823 (class 2606 OID 17421)
-- Name: mst_religion mst_religion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_religion
    ADD CONSTRAINT mst_religion_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2821 (class 2606 OID 17416)
-- Name: mst_social_category mst_social_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_social_category
    ADD CONSTRAINT mst_social_category_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2791 (class 2606 OID 17310)
-- Name: gis_state state_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_state
    ADD CONSTRAINT state_code UNIQUE (state_code);


--
-- TOC entry 2807 (class 2606 OID 17366)
-- Name: std_basic_details std_basic_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_basic_details
    ADD CONSTRAINT std_basic_details_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2813 (class 2606 OID 17387)
-- Name: std_education_details std_education_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_education_details
    ADD CONSTRAINT std_education_details_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2815 (class 2606 OID 17395)
-- Name: std_incentive_details std_incentive_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_incentive_details
    ADD CONSTRAINT std_incentive_details_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2817 (class 2606 OID 17403)
-- Name: std_result_details std_result_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_result_details
    ADD CONSTRAINT std_result_details_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2811 (class 2606 OID 17379)
-- Name: std_school_mapping std_school_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_school_mapping
    ADD CONSTRAINT std_school_mapping_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2809 (class 2606 OID 17371)
-- Name: std_class_section_mapping std_section_class_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_class_section_mapping
    ADD CONSTRAINT std_section_class_mapping_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2819 (class 2606 OID 17411)
-- Name: std_vocational_detail std_vocational_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.std_vocational_detail
    ADD CONSTRAINT std_vocational_detail_pkey PRIMARY KEY (record_id);


--
-- TOC entry 2805 (class 2606 OID 17352)
-- Name: gis_block uk_area_a_cid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_block
    ADD CONSTRAINT uk_area_a_cid UNIQUE (block_code, district_id);


--
-- TOC entry 2799 (class 2606 OID 17328)
-- Name: gis_district uk_city_cn_sid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_district
    ADD CONSTRAINT uk_city_cn_sid UNIQUE (district_name, state_id);


--
-- TOC entry 2793 (class 2606 OID 17312)
-- Name: gis_state uk_state_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_state
    ADD CONSTRAINT uk_state_name UNIQUE (state_name);


--
-- TOC entry 2833 (class 2606 OID 17353)
-- Name: gis_block fk_area_cid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_block
    ADD CONSTRAINT fk_area_cid FOREIGN KEY (district_id) REFERENCES public.gis_district(district_id);


--
-- TOC entry 2832 (class 2606 OID 17329)
-- Name: gis_district fk_city_sid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_district
    ADD CONSTRAINT fk_city_sid FOREIGN KEY (state_id) REFERENCES public.gis_state(state_id);


-- Completed on 2020-12-23 13:32:03

--
-- PostgreSQL database dump complete
--

