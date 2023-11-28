-- Add foreign key to Result table referencing Qtable
ALTER TABLE Result
ADD CONSTRAINT fk_result_qtable
FOREIGN KEY (IdQ) REFERENCES Qtable(IdQ);

-- Add foreign key to Survey table referencing Result
ALTER TABLE Survey
ADD CONSTRAINT fk_survey_result
FOREIGN KEY (IdR) REFERENCES Result(IdR);
