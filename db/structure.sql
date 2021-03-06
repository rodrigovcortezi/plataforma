SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: order_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'refunded'
);


--
-- Name: ticket_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.ticket_status AS ENUM (
    'pending',
    'ready',
    'authenticated',
    'expired',
    'cancelled'
);


--
-- Name: transfer_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.transfer_status AS ENUM (
    'requested',
    'completed',
    'failed',
    'reversed'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    name character varying,
    address character varying NOT NULL,
    complement character varying,
    district character varying NOT NULL,
    city character varying NOT NULL,
    state character varying NOT NULL,
    zipcode character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude numeric(10,8),
    longitude numeric(11,8),
    number character varying NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bank_accounts (
    id bigint NOT NULL,
    moip_id character varying NOT NULL,
    legal_name character varying NOT NULL,
    document_type character varying NOT NULL,
    document_number character varying NOT NULL,
    bank_code character varying NOT NULL,
    agency_number character varying NOT NULL,
    agency_check_number character varying,
    account_number character varying NOT NULL,
    account_type character varying NOT NULL,
    account_check_number character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    document_number character varying NOT NULL,
    business_name character varying NOT NULL,
    name character varying NOT NULL,
    address_id bigint NOT NULL,
    seller_id bigint NOT NULL
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credit_cards (
    id bigint NOT NULL,
    cardid character varying NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: event_staff; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_staff (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: event_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_staff_id_seq OWNED BY public.event_staff.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    start_t timestamp without time zone NOT NULL,
    end_t timestamp without time zone,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    headline character varying,
    video character varying,
    address_id bigint NOT NULL,
    features text,
    invite_text text,
    fb_pixel character varying,
    ga_id character varying,
    seller_id bigint NOT NULL,
    CONSTRAINT chronological_order_check CHECK ((start_t < end_t))
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: finances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finances (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bank_account_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    id integer NOT NULL
);


--
-- Name: finances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finances_id_seq OWNED BY public.finances.id;


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    event_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer NOT NULL,
    start_t timestamp without time zone NOT NULL,
    end_t timestamp without time zone NOT NULL,
    price_cents integer DEFAULT 0 NOT NULL,
    allotment integer DEFAULT 1,
    sold integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    CONSTRAINT allotment_check CHECK ((allotment > 0)),
    CONSTRAINT chronological_order_check CHECK ((start_t < end_t)),
    CONSTRAINT quantity_check CHECK ((quantity > 0)),
    CONSTRAINT sold_check CHECK (((sold >= 0) AND (sold <= quantity)))
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    offer_id bigint NOT NULL,
    order_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT quantity_check CHECK ((quantity > 0))
);


--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: order_payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_payments (
    order_id bigint NOT NULL,
    amount_cents integer DEFAULT 0 NOT NULL,
    card_brand character varying NOT NULL,
    card_number_last_4 integer NOT NULL,
    installment_count integer DEFAULT 1 NOT NULL,
    interest_rate numeric(6,5) DEFAULT 0 NOT NULL,
    service_fee numeric(3,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: order_payments_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_payments_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_payments_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_payments_order_id_seq OWNED BY public.order_payments.order_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number bigint NOT NULL,
    status public.order_status DEFAULT 'pending'::public.order_status NOT NULL,
    event_id bigint NOT NULL,
    subtotal_cents integer DEFAULT 0 NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: seller_staff; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seller_staff (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: seller_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seller_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seller_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seller_staff_id_seq OWNED BY public.seller_staff.id;


--
-- Name: sellers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sellers (
    id bigint NOT NULL,
    moip_id character varying NOT NULL,
    moip_access_token character varying NOT NULL,
    email character varying,
    phone_area_code integer NOT NULL,
    phone_number integer NOT NULL,
    verified boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: ticket_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_tokens (
    id bigint NOT NULL,
    code character varying NOT NULL,
    owner_name character varying NOT NULL,
    owner_email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_item_id bigint NOT NULL,
    status public.ticket_status DEFAULT 'pending'::public.ticket_status NOT NULL
);


--
-- Name: ticket_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_tokens_id_seq OWNED BY public.ticket_tokens.id;


--
-- Name: transfers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transfers (
    id bigint NOT NULL,
    bank_account_id bigint NOT NULL,
    amount_cents integer NOT NULL,
    fee_cents integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status public.transfer_status DEFAULT 'requested'::public.transfer_status NOT NULL,
    seller_id bigint NOT NULL
);


--
-- Name: transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transfers_id_seq OWNED BY public.transfers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    cpf character varying,
    role integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gender character varying,
    birthday timestamp without time zone,
    actor_id bigint,
    actor_type character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: validations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.validations (
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ticket_token_id bigint NOT NULL
);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: event_staff id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_staff ALTER COLUMN id SET DEFAULT nextval('public.event_staff_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: finances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finances ALTER COLUMN id SET DEFAULT nextval('public.finances_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: order_payments order_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payments ALTER COLUMN order_id SET DEFAULT nextval('public.order_payments_order_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: seller_staff id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_staff ALTER COLUMN id SET DEFAULT nextval('public.seller_staff_id_seq'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Name: ticket_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_tokens ALTER COLUMN id SET DEFAULT nextval('public.ticket_tokens_id_seq'::regclass);


--
-- Name: transfers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfers ALTER COLUMN id SET DEFAULT nextval('public.transfers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: event_staff event_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_staff
    ADD CONSTRAINT event_staff_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: finances finances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finances
    ADD CONSTRAINT finances_pkey PRIMARY KEY (id);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: order_payments order_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payments
    ADD CONSTRAINT order_payments_pkey PRIMARY KEY (order_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: seller_staff seller_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_staff
    ADD CONSTRAINT seller_staff_pkey PRIMARY KEY (id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: ticket_tokens ticket_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_tokens
    ADD CONSTRAINT ticket_tokens_pkey PRIMARY KEY (id);


--
-- Name: transfers transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: validations validations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.validations
    ADD CONSTRAINT validations_pkey PRIMARY KEY (ticket_token_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_latitude_and_longitude; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_latitude_and_longitude ON public.addresses USING btree (latitude, longitude);


--
-- Name: index_companies_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_on_address_id ON public.companies USING btree (address_id);


--
-- Name: index_companies_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_seller_id ON public.companies USING btree (seller_id);


--
-- Name: index_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_user_id ON public.credit_cards USING btree (user_id);


--
-- Name: index_event_staff_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_staff_on_event_id ON public.event_staff USING btree (event_id);


--
-- Name: index_events_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_address_id ON public.events USING btree (address_id);


--
-- Name: index_events_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_seller_id ON public.events USING btree (seller_id);


--
-- Name: index_events_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_user_id ON public.events USING btree (user_id);


--
-- Name: index_finances_on_bank_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_finances_on_bank_account_id ON public.finances USING btree (bank_account_id);


--
-- Name: index_finances_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_finances_on_seller_id ON public.finances USING btree (seller_id);


--
-- Name: index_offers_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_offers_on_event_id ON public.offers USING btree (event_id);


--
-- Name: index_order_items_on_offer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_items_on_offer_id ON public.order_items USING btree (offer_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_order_items_on_order_id_and_offer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_order_items_on_order_id_and_offer_id ON public.order_items USING btree (order_id, offer_id);


--
-- Name: index_order_payments_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_payments_on_order_id ON public.order_payments USING btree (order_id);


--
-- Name: index_orders_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_event_id ON public.orders USING btree (event_id);


--
-- Name: index_orders_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_orders_on_number ON public.orders USING btree (number);


--
-- Name: index_orders_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_status ON public.orders USING btree (status);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_seller_staff_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_seller_staff_on_seller_id ON public.seller_staff USING btree (seller_id);


--
-- Name: index_ticket_tokens_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_ticket_tokens_on_code ON public.ticket_tokens USING btree (code);


--
-- Name: index_ticket_tokens_on_order_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ticket_tokens_on_order_item_id ON public.ticket_tokens USING btree (order_item_id);


--
-- Name: index_ticket_tokens_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ticket_tokens_on_status ON public.ticket_tokens USING btree (status);


--
-- Name: index_transfers_on_bank_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfers_on_bank_account_id ON public.transfers USING btree (bank_account_id);


--
-- Name: index_transfers_on_seller_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transfers_on_seller_id ON public.transfers USING btree (seller_id);


--
-- Name: index_users_on_actor_type_and_actor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_actor_type_and_actor_id ON public.users USING btree (actor_type, actor_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_validations_on_ticket_token_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_validations_on_ticket_token_id ON public.validations USING btree (ticket_token_id);


--
-- Name: index_validations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_validations_on_user_id ON public.validations USING btree (user_id);


--
-- Name: credit_cards fk_rails_069bf994f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT fk_rails_069bf994f3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: transfers fk_rails_09d60ae02b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT fk_rails_09d60ae02b FOREIGN KEY (bank_account_id) REFERENCES public.bank_accounts(id);


--
-- Name: events fk_rails_0cb5590091; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_0cb5590091 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: companies fk_rails_1ff0c5f1d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_1ff0c5f1d1 FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: events fk_rails_2a2c9250e8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_2a2c9250e8 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: order_items fk_rails_3bfa6dd6f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_3bfa6dd6f7 FOREIGN KEY (offer_id) REFERENCES public.offers(id);


--
-- Name: offers fk_rails_60bd59a32f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT fk_rails_60bd59a32f FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: orders fk_rails_64bd9e45d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_64bd9e45d4 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: finances fk_rails_786414e363; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finances
    ADD CONSTRAINT fk_rails_786414e363 FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: finances fk_rails_b08dce50c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finances
    ADD CONSTRAINT fk_rails_b08dce50c9 FOREIGN KEY (bank_account_id) REFERENCES public.bank_accounts(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: transfers fk_rails_da2471a4da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT fk_rails_da2471a4da FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: event_staff fk_rails_db598c0236; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_staff
    ADD CONSTRAINT fk_rails_db598c0236 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: seller_staff fk_rails_e4f6b79d65; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seller_staff
    ADD CONSTRAINT fk_rails_e4f6b79d65 FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: order_payments fk_rails_ecfe8f04cd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payments
    ADD CONSTRAINT fk_rails_ecfe8f04cd FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: ticket_tokens fk_rails_eeb18bfa0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_tokens
    ADD CONSTRAINT fk_rails_eeb18bfa0b FOREIGN KEY (order_item_id) REFERENCES public.order_items(id);


--
-- Name: events fk_rails_f57a335775; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_f57a335775 FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: companies fk_rails_fe683b53d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_fe683b53d0 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190123031005'),
('20190123032648'),
('20190123033111'),
('20190123034330'),
('20190123035403'),
('20190123232608'),
('20190124000023'),
('20190124000207'),
('20190124000735'),
('20190124013438'),
('20190124015506'),
('20190124040140'),
('20190124040237'),
('20190124040542'),
('20190124235709'),
('20190129033212'),
('20190129040512'),
('20190129170035'),
('20190129201839'),
('20190129212809'),
('20190129213014'),
('20190129221443'),
('20190131051622'),
('20190131211118'),
('20190131215227'),
('20190131221343'),
('20190206043945'),
('20190210170641'),
('20190212235025'),
('20190213201721'),
('20190215234546'),
('20190216002016'),
('20190217011746'),
('20190218033157'),
('20190221205121'),
('20190222013107'),
('20190223050444'),
('20190228200145'),
('20190228225237'),
('20190228233943'),
('20190301035621'),
('20190301195942'),
('20190301235126'),
('20190302210207'),
('20190303013336'),
('20190303233347'),
('20190304230710'),
('20190304231352'),
('20190305032615'),
('20190305033722'),
('20190306220207'),
('20190306220506'),
('20190307013717'),
('20190307040029'),
('20190309175919'),
('20190310231745'),
('20190311215457'),
('20190311220541'),
('20190312010449'),
('20190313213945'),
('20190422235052'),
('20190516182305'),
('20190517181953'),
('20190520224725'),
('20190528033921'),
('20190612195056'),
('20190701233746'),
('20190821023418'),
('20190902213136'),
('20191017222906'),
('20191018025854'),
('20191105182149');


