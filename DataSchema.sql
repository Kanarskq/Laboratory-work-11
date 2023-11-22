CREATE TABLE Users (
    Userno INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Region VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureRequests (
    TemperatureRequestno INT NOT NULL,
    Userno INT NOT NULL,
    Region VARCHAR(255) NOT NULL,
    Info VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureAnswers (
    TemperatureAnswerno INT NOT NULL,
    TemperatureRequestno INT NOT NULL,
    Windyno INT NOT NULL,
    Answer INT NOT NULL,
    Date VARCHAR(255) NOT NULL
);

CREATE TABLE Windy (
    Windyno INT NOT NULL,
    Region VARCHAR(255) NOT NULL,
    WheatherState VARCHAR(255) NOT NULL
);

CREATE TABLE HealthConsultationRequests (
    HealthConsultationRequestno INT NOT NULL,
    Userno INT NOT NULL,
    Date DATE NOT NULL,
    Description VARCHAR(255) NOT NULL,
    UserInfo VARCHAR(255) NOT NULL
);

CREATE TABLE Doctors (
    Doctorno INT NOT NULL,
    HealthConsultationRequestno INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Speciality VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL
);

/* Первинні ключі */
ALTER TABLE Users ADD CONSTRAINT User_Pk
PRIMARY KEY (Userno);

ALTER TABLE TemperatureRequests ADD CONSTRAINT TemperatureRequests_Pk
PRIMARY KEY (TemperatureRequestno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT TemperatureAnswers_Pk
PRIMARY KEY (TemperatureAnswerno);

ALTER TABLE Windy ADD CONSTRAINT Windy_Pk
PRIMARY KEY (Windyno);

ALTER TABLE Doctors ADD CONSTRAINT Doctors_Pk
PRIMARY KEY (Doctorno);

ALTER TABLE HealthConsultationRequests ADD CONSTRAINT HealthConsultationRequests_Pk
PRIMARY KEY (HealthConsultationRequestno);

/* Зовнішні ключі */
ALTER TABLE TemperatureRequests ADD CONSTRAINT Userno_Fk
FOREIGN KEY (Userno) REFERENCES Users (Userno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT TemperatureRequestno_Fk
FOREIGN KEY (TemperatureRequestno) REFERENCES TemperatureRequests (
    TemperatureRequestno
);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT Windyno_Fk
FOREIGN KEY (Windyno) REFERENCES Windy (Windyno);

ALTER TABLE HealthConsultationRequests ADD CONSTRAINT Userno_Fk1
FOREIGN KEY (Userno) REFERENCES Users (Userno);

ALTER TABLE Doctors ADD CONSTRAINT HealthConsultationRequestno_Fk
FOREIGN KEY (
    HealthConsultationRequestno
) REFERENCES HealthConsultationRequests (HealthConsultationRequestno);

/* Обмеження змісту атрибутів таблиць */

ALTER TABLE Users
ADD CONSTRAINT VALID_EMAIL_FORMAT
CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));

ALTER TABLE Users
ADD CONSTRAINT VALID_PHONE_FORMAT
CHECK (REGEXP_LIKE(Phone_Number, '^[0-9]{10}$'));

ALTER TABLE HealthConsultationRequests
ADD CONSTRAINT REQUEST_DATE_IN_PAST
CHECK (Date <= TRUNC(SYSDATE));
