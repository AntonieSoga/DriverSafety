-- Create Qtable
CREATE TABLE Qtable (
    IdQ SERIAL PRIMARY KEY,
    PunctajQ INT
);

-- Create Result table with foreign key reference to Qtable
CREATE TABLE Result (
    IdR SERIAL PRIMARY KEY,
    IdQ INT REFERENCES Qtable(IdQ),
    Rezultat VARCHAR(255),
    Latency BOOLEAN
);

-- Create Survey table with foreign key reference to Result
CREATE TABLE Survey (
    IdS SERIAL PRIMARY KEY,
    IdR INT REFERENCES Result(IdR),
    Obosit BOOLEAN
);




ALTER TABLE Qtable
ADD COLUMN Intrebare VARCHAR(250);






INSERT INTO Qtable (idq, punctajq, intrebare)
VALUES
    (1, 3, 'Ai avut parte de situații tensionate în cadrul relațiilor tale personale recent?'),
    (2, 1, 'Ai făcut pași pentru a-ți organiza spațiul de lucru și a evita haosul în ultima săptămână?'),
    (3, 2, 'Ai experimentat schimbări în regimul alimentar în ultima perioadă?'),
    (4, 4, 'Ai avut dificultăți în a-ți găsi motivația pentru sarcinile zilnice în ultima săptămână?'),
    (5, 3, 'Ai avut parte de perioade de ploaie sau vreme nefavorabilă care ți-au afectat starea de spirit?'),
    (6, 2, 'Ai petrecut timp în activități creative sau recreative care să îți aducă bucurie în ultima perioadă?'),
    (7, 3, 'Ai acordat atenție nevoilor tale de relaxare înainte de culcare în ultimele zile?'),
    (8, 1, 'Ai avut parte de momente de comunicare eficientă în cadrul echipei de lucru recent?'),
    (9, 4, 'Ai simțit că ai prea multe lucruri de rezolvat într-un timp scurt în ultima perioadă?'),
    (10, 1, 'Ai avut parte de momente de autoreflecție asupra obiectivelor tale în ultima săptămână?'),
    (11, 5, 'Ai resimțit presiune din partea responsabilităților financiare în ultima perioadă?'),
    (12, 2, 'Ai fost capabil să-ți păstrezi optimismul și atitudinea pozitivă în ciuda provocărilor recente?'),
    (13, 3, 'Ai avut parte de momente de satisfacție și recompensă în urma eforturilor depuse în activitățile tale?'),
    (14, 4, 'Ai simțit că ai avut prea multe cerințe de gestionat într-un interval de timp scurt?'),
    (15, 2, 'Ai observat schimbări în nivelul de activitate socială în ultima perioadă');



INSERT INTO qtable (idq, punctajq, intrebare)
VALUES
	(16, 1, 'Ai avut momente de reflecție și autocunoaștere în ultima perioadă?'),
	(17, 4, 'Ai avut parte de zile aglomerate și solicitante din punct de vedere mental recent?'),
	(18, 2, 'Ai reușit să îți menții un echilibru între viața personală și profesională în ultima săptămână?'),
	(19, 3, 'Ai avut dificultăți în a-ți gestiona timpul și prioritățile în ultima perioadă?'),
	(20, 1, 'Ai acordat atenție nevoilor tale de hidratare în ultimele zile?'),
	(21, 2, 'Ai avut parte de momente de bucurie și relaxare în compania celor dragi în ultima săptămână?'),
	(22, 3, 'Ai observat schimbări în modul în care îți reglezi starea de spirit în ultima perioadă?'),
	(23, 2, 'Ai petrecut timp suficient în activități recreative și de divertisment recent?'),
	(24, 5, 'Ai avut parte de momente de izolare socială sau lipsă de suport în ultima săptămână?'),
	(25, 4, 'Ai acordat suficientă atenție nevoilor tale de somn în ultimele zile?'),
	(26, 5, 'Ai fost implicat în proiecte sau activități care au generat presiune suplimentară în ultima perioadă?'),
	(27, 3, 'Ai avut parte de schimbări bruște în programul tău de lucru în ultima săptămână?'),
	(28, 1, 'Ai avut parte de momente de râs și relaxare în ultimele zile?'),
	(29, 4, 'Ai simțit că ai avut prea multe responsabilități de gestionat în ultima perioadă?'),
	(30, 2, 'Ai avut parte de experiențe noi și stimulante în ultima săptămână?');


INSERT INTO qtable (idq, punctajq, intrebare)
VALUES
	(31, 3, 'Ai avut parte de situații tensionate în cadrul relațiilor tale personale recent?'),
	(32, 1, 'Ai făcut pași pentru a-ți organiza spațiul de lucru și a evita haosul în ultima săptămână?'),
	(33, 2, 'Ai experimentat schimbări în regimul alimentar în ultima perioadă?'),
	(34, 4, 'Ai avut dificultăți în a-ți găsi motivația pentru sarcinile zilnice în ultima săptămână?'),
	(35, 3, 'Ai avut parte de perioade de ploaie sau vreme nefavorabilă care ți-au afectat starea de spirit?'),
	(36, 2, 'Ai petrecut timp în activități creative sau recreative care să îți aducă bucurie în ultima perioadă?'),
	(37, 3, 'Ai acordat atenție nevoilor tale de relaxare înainte de culcare în ultimele zile?'),
	(38, 1, 'Ai avut parte de momente de comunicare eficientă în cadrul echipei de lucru recent?'),
	(39, 4, 'Ai simțit că ai prea multe lucruri de rezolvat într-un timp scurt în ultima perioadă?'),
	(40, 1, 'Ai avut parte de momente de autoreflecție asupra obiectivelor tale în ultima săptămână?'),
	(41, 5, 'Ai resimțit presiune din partea responsabilităților financiare în ultima perioadă?'),
	(42, 2, 'Ai fost capabil să-ți păstrezi optimismul și atitudinea pozitivă în ciuda provocărilor recente?'),
	(43, 3, 'Ai avut parte de momente de satisfacție și recompensă în urma eforturilor depuse în activitățile tale?'),
	(44, 4, 'Ai simțit că ai avut prea multe cerințe de gestionat într-un interval de timp scurt?'),
	(45, 2, 'Ai observat schimbări în nivelul de activitate socială în ultima perioadă?');

SELECT * FROM public.qtable
ORDER BY idq ASC


-- Add foreign key to Result table referencing Qtable
ALTER TABLE Result
ADD CONSTRAINT fk_result_qtable
FOREIGN KEY (IdQ) REFERENCES Qtable(IdQ);

-- Add foreign key to Survey table referencing Result
ALTER TABLE Survey
ADD CONSTRAINT fk_survey_result
FOREIGN KEY (IdR) REFERENCES Result(IdR);


