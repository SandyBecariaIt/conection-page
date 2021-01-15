CREATE DATABASE LibraryTest;
USE LibraryTest;

CREATE TABLE userType (
	idType INT PRIMARY KEY AUTO_INCREMENT,
    descriptionType VARCHAR(40)
);

CREATE TABLE literaryGenre (
	idGene INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(100)
);

CREATE TABLE editorial (
	idEditorial INT PRIMARY KEY AUTO_INCREMENT,
    nameEditorial VARCHAR(100)
);

CREATE TABLE User (
	enrollment VARCHAR(100) PRIMARY KEY,
    nameUser VARCHAR(100),
    birthdate VARCHAR(12),
    phone VARCHAR(10),
    email VARCHAR(100),
    idType INT REFERENCES userType (idType)
);

CREATE TABLE userAdmin (
	idAdmin INT PRIMARY KEY AUTO_INCREMENT,
    enrollment VARCHAR(100) REFERENCES User (enrollment)
);

CREATE TABLE userOperator (
	idOperator INT PRIMARY KEY AUTO_INCREMENT,
    enrollment VARCHAR(100) REFERENCES User (enrollment)
);

CREATE TABLE userReader (
	idReader INT PRIMARY KEY AUTO_INCREMENT,
    enrollment VARCHAR(100) REFERENCES User (enrollment)
);

CREATE TABLE bookLoan (
	idLoan INT PRIMARY KEY AUTO_INCREMENT,
    loanDate VARCHAR(12),
    returnDate VARCHAR(12),
    idReader INT REFERENCES userReader (idReader)
);

CREATE TABLE operatorLoan (
	idOpReques INT PRIMARY KEY AUTO_INCREMENT,
    idOperator INT REFERENCES userOperator (idOperator),
    movemenType VARCHAR(10),
    operationDay VARCHAR(12),
    CONSTRAINT chkMovement CHECK (movemenType='loan' OR movemenType='return')
);


CREATE TABLE Books (
	idBook INT PRIMARY KEY AUTO_INCREMENT,
    nameBook VARCHAR(100),
    quantity INT,
    bookDescription VARCHAR(300),
    idGene INT REFERENCES literaryGenre (idGene),
    idEditorial INT REFERENCES editorial (idEditorial)
);

CREATE TABLE loanDescription (
	id INT PRIMARY KEY AUTO_INCREMENT,
    idLoan INT REFERENCES bookLoan (idLoan),
    idBook INT REFERENCES Books (idBook)
);

-- INSERTS

-- userType
INSERT INTO userType(descriptionType) VALUES('ADMIN');
INSERT INTO userType(descriptionType) VALUES('OPERATOR');
INSERT INTO userType(descriptionType) VALUES('LECTOR');

-- literaryGenre
INSERT INTO literaryGenre(description) VALUES('Terror');
INSERT INTO literaryGenre(description) VALUES('Drama');
INSERT INTO literaryGenre(description) VALUES('Ciencia Ficción');
INSERT INTO literaryGenre(description) VALUES('Amor');

-- editorial
INSERT INTO editorial(nameEditorial) VALUES('Diana');
INSERT INTO editorial(nameEditorial) VALUES('Deusto');
INSERT INTO editorial(nameEditorial) VALUES('De bolsillo');
INSERT INTO editorial(nameEditorial) VALUES('Espasa');

-- User
INSERT INTO User VALUES('12345', 'Sandy', '20-12-1997', '5546958692', 'saandrafcortes@outlook.com', 1);
INSERT INTO User VALUES('89324', 'Jose Luis', '12-12-1997', '5546958692', 'joseL@outlook.com', 2);
INSERT INTO User VALUES('56789', 'Marisol', '04-11-1997', '5546958692', 'marisol@outlook.com', 2);
INSERT INTO User VALUES('74125', 'Rogelio', '02-01-1995', '5546958692', 'Rogelio@outlook.com', 3);
INSERT INTO User VALUES('58963', 'Francisco', '13-09-1991', '5546958692', 'Francisco@outlook.com', 3);
INSERT INTO User VALUES('25968', 'Maximiliano', '02-09-1994', '5546958692', 'Maximiliano@outlook.com', 3);
INSERT INTO User VALUES('85647', 'Laura', '10-05-1992', '5546958692', 'Laura@outlook.com', 3);

-- userAdmin
INSERT INTO userAdmin(enrollment) VALUES('12345');

-- userOperator
INSERT INTO userOperator(enrollment) VALUES('56789');
INSERT INTO userOperator(enrollment) VALUES('89324');

-- userReader
INSERT INTO userReader(enrollment) VALUES('25968');
INSERT INTO userReader(enrollment) VALUES('58963');
INSERT INTO userReader(enrollment) VALUES('74125');
INSERT INTO userReader(enrollment) VALUES('85647');

-- bookLoan
INSERT INTO bookLoan(loanDate, returnDate, idReader) VALUES('01-12-2020', '05-12-2020', 1);

-- operatorLoan
INSERT INTO operatorLoan(idOperator, movemenType, operationDay) VALUES(1, 'loan', '01-12-2020');
INSERT INTO operatorLoan(idOperator, movemenType, operationDay) VALUES(1, 'return', '05-12-2020');

-- Books
INSERT INTO Books(nameBook, quantity, bookDescription, idGene, idEditorial) VALUES('Las mil y una noches', 10, 'Historias', 1, 1);
INSERT INTO Books(nameBook, quantity, bookDescription, idGene, idEditorial) VALUES('La tregua', 10, 'Historias', 2, 1);
INSERT INTO Books(nameBook, quantity, bookDescription, idGene, idEditorial) VALUES('Dracula', 10, 'Historias', 3, 4);
INSERT INTO Books(nameBook, quantity, bookDescription, idGene, idEditorial) VALUES('Quiubule con...', 10, 'Historias', 4, 3);
INSERT INTO Books(nameBook, quantity, bookDescription, idGene, idEditorial) VALUES('Lolita', 10, 'Historias', 1, 2);

-- loanDescription
INSERT INTO loanDescription(idLoan, idBook) VALUES(1, 1);
