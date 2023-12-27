--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age numeric,
    size character varying(35)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_host_planet_in_km numeric,
    size_in_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    age numeric,
    distance_from_earth character varying(35),
    size_in_km integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(35) NOT NULL,
    is_spherical boolean NOT NULL,
    age character varying(35),
    distance_from_earth character varying(35),
    size numeric,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'largest object in the asteroid belt between Mars and Jupiter', true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', ' one of the largest asteroids in the asteroid belt', false);
INSERT INTO public.asteroid VALUES (3, 'Eros', 'elongated, peanut-shaped asteroid', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral galaxy containing our solar system.', true, 13600000000, '100,000 light-years.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'spiral galaxy and is the nearest spiral galaxy to the Milky Way', false, 13600000000, '220,000 light-years');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'spiral galaxy and a member of the Local Group', false, 13600000000, '60,000 light-years');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'satellite galaxy of the Milky Way.', false, NULL, '14,000 light-years');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'another satellite galaxy of the Milky Way.', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'giant elliptical galaxy in the Virgo Cluster, known for containing a supermassive black hole', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'spiral galaxy known for its bright nucleus and large central bulge', false, NULL, '50,000 light-years');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', '''Earth''s only natural satellite, with a barren surface marked by craters and plains.''', true, 384400, 34747, 1);
INSERT INTO public.moon VALUES (2, 'Io', 'Volcanically active moon of Jupiter', true, 422000, 3643, 5);
INSERT INTO public.moon VALUES (3, 'Europa ', 'Smooth icy surface with a subsurface ocean beneath, moon of Jupiter', true, 670900, 3122, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the solar system, with a mix of ice and rock on its surface', true, 1070400, 5268, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Heavily cratered moon of Jupiter with an ancient and icy surface', true, 1882700, 4821, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 'Saturn''s largest moon, featuring a thick atmosphere and lakes of liquid methane and ethane', true, 1221850, 5150, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Icy moon of Saturn with geysers of water erupting from its south pole', true, 238042, 504, 6);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Known for its large Herschel Crater, resembling the Death Star from Star Wars, moon of Saturn', true, 185539, 396, 6);
INSERT INTO public.moon VALUES (9, 'Triton', 'Largest moon of Neptune with a unique retrograde orbit and geysers spewing nitrogen', true, 354760, 2700, 8);
INSERT INTO public.moon VALUES (10, 'Proteus', 'Irregularly shaped moon of Neptune, the second-largest after Triton', true, 117647, 418, 8);
INSERT INTO public.moon VALUES (11, 'Charon', 'Largest moon of Pluto, with a diameter almost half that of Pluto itself', true, 19640, 1212, 8);
INSERT INTO public.moon VALUES (12, 'Phobos', 'One of the two moons of Mars, with an irregular shape and closer to Mars than any other moon in the solar system', false, 9378, 22, 4);
INSERT INTO public.moon VALUES (13, 'Deimos', 'The smaller and outer moon of Mars, irregularly shaped and heavily cratered', false, 23460, 12, 4);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Small, icy moon of Uranus with a complex and varied terrain', false, 128000, 470, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Moon of Uranus with a relatively smooth surface, composed of water ice and other volatile compounds', true, 190900, 1158, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Dark and heavily cratered moon of Uranus, composed mostly of water ice and silicate rock', true, 429000, 1170, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 'Largest moon of Uranus, featuring a diverse terrain of valleys, craters, and plains.', true, 436000, 1578, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Outermost and second-largest moon of Uranus, with a heavily cratered surface', true, 587000, 1521, 7);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'Irregularly shaped moon of Saturn with a porous and impact-scarred surface', true, 1481100, 270, 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 'Two-toned moon of Saturn with a dark leading hemisphere and a bright trailing hemisphere', true, 3561300, 1486, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 'second planet from the Sun, with a thick atmosphere and high surface temperatures', true, 4600000000, '38-261 million km', 12104, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'third planet from the Sun, supporting diverse life forms', true, 4600000000, '0 km', 12742, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', ' fourth planet from the Sun, known for its reddish appearance and diverse surface features', true, 4600000000, '54.6-401 million km', 6779, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'largest planet in our solar system, with a prominent system of rings and numerous moons', true, 4600000000, '54.6-401 million km', 6779, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'known for its stunning ring system and a diverse collection of moons', true, 4600000000, '1.2-1.6 billion km', 116460, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'gas giant with a unique rotation axis lying almost in the plane of its orbit', true, 4600000000, '2.6-3 billion km', 50742, false, 1);
INSERT INTO public.planet VALUES (1, 'Mecury', 'smallest planet in our solar system, known for extreme temperature variations.', true, 4600000000, '77 million km', 4880, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'farthest known planet from the Sun, with a dynamic atmosphere and a system of dark rings', true, 4600000000, '4.3-4.7 billion km', 49244, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Earth-sized exoplanet orbiting in the habitable zone of the star Kepler-186', true, 4000000000, '500 light-years', 14000, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'exoplanet orbiting the closest known star to the Sun, Proxima Centauri', true, 4000000000, '4.24 light-years', 140000, false, 2);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'one of the seven Earth-sized planets in the TRAPPIST-1 system', true, 7600000000, '39 light-years', 13000, false, 2);
INSERT INTO public.planet VALUES (12, 'WASP-121b', 'hot Jupiter exoplanet known for its high temperature and unique atmospheric characteristics', true, 4500000000, '880 light-years', NULL, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, '4.6 billion years.', '149.6 million km.', 1400000, 'G-type main-sequence star and the center of our solar system.', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, NULL, '4.24 light-years', NULL, 'red dwarf star, part of the Alpha Centauri star system', 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', true, NULL, '4.37 light-years', 1400000, 'larger component of the Alpha Centauri binary star system', 3);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', true, NULL, '4.37 light-years', NULL, 'smaller component of the Alpha Centauri binary star system', 4);
INSERT INTO public.star VALUES (5, 'Sirius', true, '200 million years', '8.6 light-years', NULL, 'binary star system, and Sirius A is the brightest star in Earths night sky.', 5);
INSERT INTO public.star VALUES (6, 'Betelgeuse', true, NULL, ' 640 light-years', NULL, 'red supergiant star located in the constellation Orion', 6);
INSERT INTO public.star VALUES (7, 'Vega', true, NULL, '25 light-years', NULL, 'bright star in the constellation Lyra and one of the most luminous stars in the Milky Way', 7);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

