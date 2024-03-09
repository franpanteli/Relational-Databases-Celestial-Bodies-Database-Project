--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    is_spherical boolean
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    star_id integer,
    galaxy_star_id integer NOT NULL
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(30),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', 'barred spiral galaxy', 13000, 26000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'barred spiral galaxy', 10000, 2000000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'irregularly shaped galaxy', 7000, 25000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 'radio galaxy', 3, 600000000, false, false);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'the closest irregular galaxy', 1000, 158200, false, false);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1 and 2', 'Maffei 1 Lenticular Maffei 2 Spiral', 10000, 10000000, false, false);
INSERT INTO public.galaxy VALUES (7, 'Centaurus', 'fifth brightest galaxy in the sky', NULL, 12000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Ursa Major', 'a constellation in the northern sky', NULL, 123, NULL, NULL);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES ('Milky_Way_Sun', 'Sun of the milky Way', 2, 2, 1);
INSERT INTO public.galaxy_star VALUES ('Andromeda_Alpheratz', 'Star of the Andromeda Galaxy', 3, 3, 2);
INSERT INTO public.galaxy_star VALUES ('Canis_Major_Dwarf_Sirius', 'Star of the Canis Major Dwarf', 4, 4, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', NULL, 384400, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Ganymede', 'Largest and most massive natural satellite of Jupiter', NULL, 628300000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 'The smallest of the four Galilean moons orbiting Jupiter', NULL, 628300000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Titan', 'The largest moon of Saturn and the second-largest in the Solar System', NULL, 1523300000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'Io', 'The innermost and third-largest of the four moons of Jupiter', NULL, 628300000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (6, 'Enceladus', 'The sixth-largest moon of Saturn', NULL, 1272000000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (7, 'Triton', 'The largest natural satellite of the planet Neptune', NULL, 4338000000, NULL, NULL, 8);
INSERT INTO public.moon VALUES (8, 'Mimas', 'A natural satellite of Saturn with the second-largest crater on any moon', NULL, 1272000000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Iapetus', 'The third-largest moon of Saturn and the eleventh-largest in the Solar System', NULL, 1272000000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Callisto', 'The second-largest moon of Jupiter, after Ganymede', NULL, 628300000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (11, 'Thebe', 'The fourth of Jupiter''s moons by distance from the planet', NULL, 654000000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (12, 'Himalia', 'The largest irregular satellite of Jupiter', NULL, 654000000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (13, 'Themisto', 'A small prograde irregular satellite of Jupiter', NULL, 654000000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (14, 'Adrastea', 'The second by distance and the smallest of the four inner moons of Jupiter', NULL, 654000000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (15, 'Cyllene', 'Known as Jupiter XLVIII, it is a natural satellite of Jupiter', NULL, 654000000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (16, 'Methone', 'Methone is a small, egg-shaped moon of Saturn', NULL, 1523400000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'Phobos', 'The innermost and larger of the two natural satellites of Mars', NULL, 78000000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (18, 'Dione', 'Dione, also designated Saturn IV, is the fourth-largest moon of Saturn', NULL, 1272000000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Tethys, or Saturn III, is a mid-sized moon of Saturn about 1,060 km across', NULL, 1272000000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (20, 'Megaclite', 'Megaclite, also known as Jupiter XIX, is a natural satellite of Jupiter', NULL, 714000000, NULL, NULL, 2);



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known celestial body to support life', NULL, 0, NULL, NULL, 2);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in our Solar System', NULL, 654000000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 'Mars is the fourth planet and the farthest terrestrial planet from the Sun', NULL, 368000000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, following Jupiter', NULL, 1419000000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-colored ice giant.', NULL, 2822700000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (6, 'Venus', 'Venus is the second planet from the Sun', NULL, 169210000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Mercury is the first planet from the Sun and the smallest in the Solar System', NULL, 101360000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune is the eighth and most distant planet from the Sun', NULL, 4487900000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Pluto is a dwarf planet located in the Kuiper belt, beyond the orbit of Neptune', NULL, 5353800000, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'An exoplanet orbiting the red dwarf star Proxima Centauri', NULL, 42000000, NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Cb', 'An exoplanet situated within the habitable zone of the red dwarf star Proxima Centauri', NULL, 42000000, NULL, NULL, 7);
INSERT INTO public.planet VALUES (15, 'Lalande 21185 b', 'Exoplanet orbiting Lalande 21185', NULL, 83070000, NULL, NULL, 11);



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'The Sun, the center of our Solar System', 5500, 150000000, false, true, 2);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Located in the northeast corner of the Great Square constellation', 70000000, 100, false, false, 3);
INSERT INTO public.star VALUES (3, 'Sirius', 'Known as the "Dog Star," it is the brightest in the night sky', 240, 8, false, false, 4);
INSERT INTO public.star VALUES (4, 'Deneb', 'A bluish-white star with a surface temperature of 8,500 Kelvin', 15, 1600, false, false, 6);
INSERT INTO public.star VALUES (6, 'S Doradus', 'One of the prominent stars in the Large Magellanic Cloud', NULL, 170000, false, false, 5);
INSERT INTO public.star VALUES (7, 'R71', 'Situated in the Large Magellanic Cloud in the constellation Mensa', NULL, 165000, false, false, 5);
INSERT INTO public.star VALUES (11, 'Lalande 21185', 'A star located in the southern region of Ursa Major', NULL, 8.307, false, false, 8);



--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_description_key UNIQUE (description);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_star_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--