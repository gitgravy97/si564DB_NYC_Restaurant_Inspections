CREATE DATABASE FinalProject;
USE FinalProject;

CREATE TABLE IF NOT EXISTS Outcomes(
    ID INT NOT NULL AUTO_INCREMENT,
    Outcome VARCHAR(150),
    CONSTRAINT pk Primary Key (ID)
);

CREATE TABLE IF NOT EXISTS InspectionTypes(
    ID INT NOT NULL AUTO_INCREMENT,
    Type VARCHAR(100),
    CONSTRAINT pk Primary Key (ID)
);

CREATE TABLE IF NOT EXISTS Inspection(
    ID INT NOT NULL AUTO_INCREMENT,
    InspectionType_ID INT,
    Inspection_Date DATE,
    Score INT,
    Grade varchar(2),
    Date_Imported DATE,
    Outcome_ID INT,
    CONSTRAINT pk Primary Key (ID),
    CONSTRAINT fk1 Foreign Key (InspectionType_ID)
        REFERENCES InspectionTypes(ID),
    CONSTRAINT fk2 Foreign Key (Outcome_ID)
        REFERENCES Outcomes(ID)
);

CREATE TABLE IF NOT EXISTS FoodType(
    ID INT NOT NULL AUTO_INCREMENT,
    Type varchar(100),
    CONSTRAINT pk Primary Key (ID)
);

CREATE TABLE IF NOT EXISTS Business(
    ID INT NOT NULL AUTO_INCREMENT,
    OperatingName varchar(100),
    FoodType_ID int,
    CONSTRAINT pk Primary Key (ID),
    CONSTRAINT fk FOREIGN KEY (FoodType_ID)
        REFERENCES FoodType(ID)
);


CREATE TABLE IF NOT EXISTS Infraction(
    ID INT NOT NULL AUTO_INCREMENT,
    Description varchar(100),
    CONSTRAINT pk Primary Key (ID)
);

CREATE TABLE IF NOT EXISTS Address(
    ID INT NOT NULL AUTO_INCREMENT,
    # BuildingNo CAN contain letters
    BuildingNo varchar(25),
    Street varchar(100),
    Zip int,
    OwnerPhone int,
    CONSTRAINT pk Primary Key (ID)
);

CREATE TABLE IF NOT EXISTS Violations(
    Incident_ID INT NOT NULL AUTO_INCREMENT,
    Address_ID int,
    Business_ID int,
    Inspection_ID int,
    Infraction_ID int,
    Borough varchar(25),
    Critical_Flag bool,
    Data_Imported date,
    CONSTRAINT pk Primary Key (Incident_ID)
);

CREATE TABLE IF NOT EXISTS Location_GIS(
    Incident_ID INT NOT NULL AUTO_INCREMENT,
    Latitude float, Longitude float,
    BIN int, BBL int,
    NTA varchar(50),
    CommunityBoard int, CommunityDistrict int,
    CouncilDistrict int, CensusTract int,
    CONSTRAINT fkf Foreign Key (Incident_ID)
        REFERENCES Violations(Incident_ID)
);