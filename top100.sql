-- 1. Crear base de datos llamada películas
CREATE DATABASE peliculas;

-- 2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas.
CREATE TABLE peliculas(id SERIAL, pelicula VARCHAR(100), año_estreno INT, director VARCHAR(50), PRIMARY KEY(id));
CREATE TABLE reparto(pelicula_id INT, actor VARCHAR(50), FOREIGN KEY(pelicula_id) REFERENCES peliculas(id));

-- 3. Cargar ambos archivos a su tabla correspondiente
\copy peliculas FROM '~/Escritorio/Desafios_Intro_a_BD/Desafio_top_100/peliculas.csv' CSV HEADER
\copy reparto FROM '~/Escritorio/Desafios_Intro_a_BD/Desafio_top_100/reparto.csv' CSV HEADER

-- 4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto.
SELECT pelicula AS "Título de la Película", año_estreno AS "Año de Estreno", director AS "Director" FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.pelicula_id WHERE id=2;

-- 5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula AS "Título de la Película" FROM peliculas INNER JOIN reparto ON peliculas.id=reparto.pelicula_id WHERE actor='Harrison Ford';

-- 6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100

-- 7. Indicar cuantos actores distintos hay
SELECT actor FROM reparto GROUP BY actor;
SELECT DISTINCT actor FROM reparto;


-- 8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.
SELECT pelicula FROM peliculas WHERE año_estreno>=1990 AND año_estreno<=1999;


-- 9. Listar el reparto de las películas lanzadas el año 2001
SELECT pelicula FROM peliculas WHERE año_estreno=2001;


-- 10. Listar los actores de la película más nueva
SELECT MAX(año_estreno) FROM peliculas;

SELECT id, pelicula FROM peliculas WHERE año_estreno=2008;

SELECT actor FROM reparto WHERE pelicula_id=6;