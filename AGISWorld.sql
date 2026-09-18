
-- CREATE TYPE TAvance AS ENUM ('inscripcion','finalizacion_exito','finalizacion_fracaso','abandono');
-- CREATE TYPE TEstado AS ENUM ('activo','cerrado','cancelado');
-- CREATE TYPE TPrioridad AS ENUM ('alta','media','baja');
-- CREATE TYPE TAccion AS ENUM ('C','A','E');
-- CREATE TYPE NEvento AS ENUM ('avance_registrado','evaluacion_pendiente','plan_cerrado');

-- Estructura. CICLO i.
-- Tablas. CRUD : cursos
-- XTablas. CICLO i.

CREATE TABLE Cursos(
    codigo VARCHAR(5) NOT NULL,
    nombre VARCHAR(50),
    detalle VARCHAR(30),
    metodologia VARCHAR(10),
    cerrado BOOLEAN)

-- Estructura. CICLO i.
-- Tablas. CRUD : Habilidades
-- XTablas. CICLO i.

CREATE TABLE Habilidades(
    nombreCorto VARCHAR(10) NOT NULL,
    nombre VARCHAR(50))

-- Estructura. CICLO i.
-- Tablas. CRUD : Candidatos
-- XTablas. CICLO i.

CREATE TABLE Candidatos(
    correo VARCHAR(100) NOT NULL,
    nombres VARCHAR(100) )

-- Estructura. CICLO i.
-- Tablas. CRUD : MetodologiaCursos
-- XTablas. CICLO i.

CREATE TABLE MetodologiaCursos(
    codigo VARCHAR(5) NOT NULL,
    metologia VARCHAR(10))

-- Estructura. CICLO i.
-- Tablas. CRUD : PlanFormaciones
-- XTablas. CICLO i.

CREATE TABLE PlanFormaciones(
    numero int NOT NULL,
    fecha DATE,
    estado varchar(10),
    evaluador VARCHAR(100) NOT NULL,
    fechaFin DATE,
    correo_candidato VARCHAR(100))


-- Estructura. CICLO i.
-- Tablas. CRUD : tienePrioridad
-- XTablas. CICLO i.

CREATE TABLE tienePrioridad(
    prioridad varchar(10))

-- Estructura. CICLO i.
-- Tablas. CRUD : Avances
-- XTablas. CICLO i.

CREATE TABLE Avances(
    fecha DATE,
    tipo varchar(20))

-- Estructura. CICLO i.
-- Tablas. CRUD : Certificaciones
-- XTablas. CICLO i.

CREATE TABLE Certificaciones(
    codigo_curso VARCHAR(5),
    vigencia NUMERIC(1,0),
    valor NUMERIC(5,0))

-- Estructura. CICLO i.
-- Tablas. CRUD : esNotificado
-- XTablas. CICLO i.

CREATE TABLE esNotificado(
    id INT NOT NULL,
    accion VARCHAR(1),
    evento VARCHAR(20),
    asunto CHAR(50),
    mensaje CHAR(50),
    destinatario CHAR(50),
    tiempo_lec INT,
    fecha_lec DATE,
    fecha_gen DATE,
    detalle_notificacion CHAR(50))



-- CREATE TABLE Candidato (
--     correo   VARCHAR(150) PRIMARY KEY,
--     nombres  VARCHAR(150) NOT NULL
-- );

-- CREATE TABLE Habilidades (
--     nombreCorto  VARCHAR(10) PRIMARY KEY,
--     nombre       VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE Curso (
--     codigo   VARCHAR(5) PRIMARY KEY,
--     nombre   VARCHAR(50) NOT NULL,
--     detalle  TEXT,
--     cerrado  BOOLEAN NOT NULL
-- );

-- CREATE TABLE Metodologiacursos (
--     codigo_curso  VARCHAR(5) NOT NULL REFERENCES Curso(codigo),
--     metodologia   VARCHAR(50) NOT NULL,
--     PRIMARY KEY (codigo_curso, metodologia)
-- );

-- CREATE TABLE Certificacion (
--     codigo_curso  VARCHAR(5) PRIMARY KEY REFERENCES Curso(codigo),
--     vigencia      INTEGER NOT NULL,
--     valor         INTEGER NOT NULL
-- );

-- CREATE TABLE PlanFormacion (
--     numero            SERIAL PRIMARY KEY,
--     fecha             DATE NOT NULL,
--     estado            VARCHAR(20) NOT NULL,
--     evaluador         VARCHAR(150) NOT NULL UNIQUE REFERENCES Candidato(correo),
--     fechaFin          DATE,
--     correo_candidato  VARCHAR(150) NOT NULL REFERENCES Candidato(correo)
-- );

-- CREATE TABLE TienePrioridad (
--     numero_plan             INTEGER NOT NULL REFERENCES PlanFormacion(numero),
--     nombreCorto_habilidades VARCHAR(10) NOT NULL REFERENCES Habilidades(nombreCorto),
--     prioridad               VARCHAR(20) NOT NULL,
--     PRIMARY KEY (numero_plan, nombreCorto_habilidades)
-- );

-- CREATE TABLE Avances (
--     id_avance     SERIAL PRIMARY KEY,
--     fecha         DATE NOT NULL,
--     tipo          VARCHAR(30) NOT NULL,
--     numero_plan   INTEGER NOT NULL REFERENCES PlanFormacion(numero),
--     codigo_curso  VARCHAR(5) NOT NULL REFERENCES Curso(codigo)
-- );

-- CREATE TABLE Notificaciones (
--     identificador          SERIAL PRIMARY KEY,
--     fecha_generacion       TIMESTAMP NOT NULL,
--     fecha_lectura          TIMESTAMP,
--     accion                 VARCHAR(30) NOT NULL,
--     tipo                   VARCHAR(30),
--     asunto                 VARCHAR(150),
--     mensaje                TEXT,
--     canal                  VARCHAR(30),
--     detalle_notificacion   TEXT,
--     id_avance              INTEGER NOT NULL UNIQUE REFERENCES Avances(id_avance),
--     destinatario           VARCHAR(150) NOT NULL REFERENCES Candidato(correo)
-- );

-- CREATE TABLE Conexiones (
--     correo_candidato_1  VARCHAR(150) NOT NULL REFERENCES Candidato(correo),
--     correo_candidato_2  VARCHAR(150) NOT NULL REFERENCES Candidato(correo),
--     PRIMARY KEY (correo_candidato_1, correo_candidato_2)
-- );