CREATE TABLE Users (
    Userno INT PRIMARY KEY,
    UsersName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Region VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureRequests (
    TemperatureRequestno INT PRIMARY KEY,
    Userno INT NOT NULL,
    Region VARCHAR(255) NOT NULL,
    Info VARCHAR(255) NOT NULL
);

CREATE TABLE TemperatureAnswers (
    TemperatureAnswerno INT PRIMARY KEY,
    TemperatureRequestno INT NOT NULL,
    Windyno INT NOT NULL,
    Answer INT NOT NULL,
    AnswerDate DATE NOT NULL
);

CREATE TABLE Windy (
    Windyno INT PRIMARY KEY,
    Region VARCHAR(255) NOT NULL,
    WheatherState VARCHAR(255) NOT NULL
);

CREATE TABLE HealthConsultationRequests (
    HealthConsultationRequestno INT PRIMARY KEY,
    Userno INT NOT NULL,
    RequestDate DATE NOT NULL,
    Description VARCHAR(255) NOT NULL,
    UserInfo VARCHAR(255) NOT NULL
);

CREATE TABLE Doctors (
    Doctorno INT PRIMARY KEY,
    HealthConsultationRequestno INT NOT NULL,
    DoctorsName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Speciality VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL
);

/* Зовнішні ключі */
ALTER TABLE TemperatureRequests ADD CONSTRAINT UsernoFk FOREIGN KEY (Userno) REFERENCES Users(Userno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT TemperatureRequestnoFk
    FOREIGN KEY (TemperatureRequestno) REFERENCES TemperatureRequests(TemperatureRequestno);

ALTER TABLE TemperatureAnswers ADD CONSTRAINT WindynoFk
    FOREIGN KEY (Windyno) REFERENCES Windy(Windyno);

ALTER TABLE HealthConsultationRequests ADD CONSTRAINT UsernoFk1
    FOREIGN KEY (Userno) REFERENCES Users(Userno);

ALTER TABLE Doctors ADD CONSTRAINT HealthConsultationRequestnoFk
    FOREIGN KEY (HealthConsultationRequestno) REFERENCES HealthConsultationRequests(HealthConsultationRequestno);

/* Обмеження змісту атрибутів таблиць */
ALTER TABLE Users
ADD CONSTRAINT ValidEmailFormat
CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));

ALTER TABLE Users
ADD CONSTRAINT ValidPhoneFormat
CHECK (REGEXP_LIKE(PhoneNumber, '^[0-9]{10}$'));

ALTER TABLE HealthConsultationRequests
ADD CONSTRAINT RequestDateInPast
CHECK (RequestDate <= TRUNC(SYSDATE));

ALTER TABLE AirConditionStateRequests
ADD CONSTRAINT ValidLocationFormat
CHECK (Region ~* '^[A-Za-z ]+$');
