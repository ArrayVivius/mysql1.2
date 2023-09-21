CREATE DATABASE EVALUACION01;

USE EVALUACION;
CREATE TABLE Estudiante (
    Id INT PRIMARY KEY,
    Empleado BOOLEAN,
    Nombre VARCHAR(255),
    PrimerApellido VARCHAR(255),
    SegundoApellido VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    FechaDeNacimiento DATE,
    Edad INT,
    Empresa VARCHAR(255)
);


CREATE TABLE Curso (
    CodigoDeCurso INT PRIMARY KEY,
    ProgramaDelCurso VARCHAR(255),
    HorasDeDuracion INT,
    Titulo VARCHAR(255),
    FechaDeInicio DATE,
    FechaDeFin DATE,
    NumeroDeCurso INT,
    IdDelDocente INT
);

CREATE TABLE Docente (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellidos VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);


CREATE TABLE Nota (
    IdDelEstudiante INT,
    CodigoDelCurso INT,
    Calificacion DECIMAL(5, 2),
    PRIMARY KEY (IdDelEstudiante, CodigoDelCurso)
);


CREATE TABLE Empresa (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);









INSERT INTO Estudiante (Id, Empleado, Nombre, PrimerApellido, SegundoApellido, Direccion, Telefono, FechaDeNacimiento, Edad, Empresa)
VALUES
    (1, 1, 'Juan', 'Perez', 'Lopez', 'Calle 123', '123456789', '1999-01-15', 24, 'Empresa1'),
    (2, 1, 'Ana', 'Gomez', 'Martinez', 'Calle 456', '987654321', '1995-03-20', 28, 'Empresa2');



INSERT INTO Curso (CodigoDeCurso, ProgramaDelCurso, HorasDeDuracion, Titulo, FechaDeInicio, FechaDeFin, NumeroDeCurso, IdDelDocente)
VALUES
    (1, 'Analytis de datos', 80, 'Curso 1', '2022-01-10', '2022-04-01', 101, 1),
    (2, 'mecánica de motores', 60, 'Curso 2', '2022-02-15', '2022-05-10', 102, 2);
   


INSERT INTO Docente (Id, Nombre, Apellidos, Direccion, Telefono)
VALUES
    (1, 'Profesor1', 'Apellido1', 'Dirección1', '111111111'),
    (2, 'Profesor2', 'Apellido2', 'Dirección2', '222222222');
  



SELECT PrimerApellido, SegundoApellido, Nombre
FROM Estudiante
ORDER BY PrimerApellido, SegundoApellido, Nombre;



SELECT DISTINCT E.Nombre, E.PrimerApellido, E.SegundoApellido, C.ProgramaDelCurso
FROM Estudiante E
JOIN Nota N ON E.Id = N.IdDelEstudiante
JOIN Curso C ON N.CodigoDelCurso = C.CodigoDeCurso;

SELECT *
FROM Estudiante
WHERE YEAR(FechaDeNacimiento) = 1999;


SELECT C.Titulo, D.Nombre, D.Apellidos
FROM Curso C
LEFT JOIN Docente D ON C.IdDelDocente = D.Id
ORDER BY D.Apellidos, D.Nombre;



SELECT E.Nombre, E.PrimerApellido, E.SegundoApellido
FROM Estudiante E
JOIN Nota N ON E.Id = N.IdDelEstudiante
JOIN Curso C ON N.CodigoDelCurso = C.CodigoDeCurso
WHERE C.ProgramaDelCurso = 'Analytis de datos' AND YEAR(C.FechaDeInicio) = 2020;


SELECT Titulo, YEAR(FechaDeInicio) AS AñoDeInicio, YEAR(FechaDeFin) AS AñoDeFin
FROM Curso;
