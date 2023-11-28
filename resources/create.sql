-- Create Qtable
CREATE TABLE Qtable (
    IdQ SERIAL PRIMARY KEY,
    PunctajQ INT,
    Intrebare VARCHAR(250)
);

-- Create Result table with foreign.sql key reference to Qtable
CREATE TABLE Result (
    IdR SERIAL PRIMARY KEY,
    IdQ INT REFERENCES Qtable(IdQ),
    Rezultat VARCHAR(255),
    Latency BOOLEAN
);

-- Create Survey table with foreign.sql key reference to Result
CREATE TABLE Survey (
    IdS SERIAL PRIMARY KEY,
    IdR INT REFERENCES Result(IdR),
    Obosit BOOLEAN
);
