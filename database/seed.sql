INSERT INTO Category (IDCategory,nameCategory,descriptionCategory) 
VALUES
    (1, 'Sitcom', 'Comedic television series typically featuring a group of characters in funny situations.'),
    (2, 'Drama', 'Television series or shows that focus on intense, emotional, and often serious storytelling.'),
    (3, 'Fiction', 'Television programs that feature non-real stories and scenarios.'),
    (4, 'Horror', 'TV shows designed to scare viewers, often featuring supernatural elements or terrifying situations.'),
    (5, 'Mystery', 'Television series centered around solving mysteries and puzzles, often involving crime or suspenseful elements.');

INSERT INTO Actor (IDActor, nameActor, dateofbirthActor, nationality, biography, mainCategory)
VALUES
    (1, 'Kristen Bell', '1980-07-18', 'American', 'Kristen Anne Bell is an American actress. She began her acting career starring in stage productions, while attending the Tisch School of the Arts at New York University.', 1),
    (8, 'Zendaya', '1996-09-01', 'American', 'Zendaya Maree Stoermer Coleman is an American actress and singer. Known mononymously as Zendaya, she has received various accolades, including two Primetime Emmy Awards and a Golden Globe Award. Time magazine named her one of the 100 most influential people in the world in 2022', 2),
    (22, 'Selena Gomez', '1992-07-22', 'American', 'Selena Marie Gomez is an American singer, actress, businesswoman and producer. Gomez has won numerous accolades, including an American Music Award, two MTV Video Music Awards, broke 16 Guinness World Records, and was nominated for two Grammy Awards, a Golden Globe Award, and four Emmy Awards.', 5),
    (9, 'Louis Hofmann', '1997-06-03', 'German', 'Louis Hofmann is a German actor. He first gained attention as the lead in the 2011 German film Tom Sawyer and won the Bodil Award for Best Supporting Actor for his role as a teenage German prisoner of war in the 2015 Danish film Land of Mine', 4);

INSERT INTO Show (IDShow,nameShow,releaseYearShow,descriptionShow,mainActor,IDCategory)
VALUES
    (1, 'The Good Place', 2016, 'Comedy series about the afterlife', 1, 1),
    (2, 'Euphoria', 2019, 'Drama series exploring the lives of teenagers', 8, 2),
    (3, 'Only Murderers In The Building', 2021, 'Three friends beggining a podcast about the murders in their building', 22, 5),
    (4, 'Dark', 2017, 'Timetravel and a missing child', 9, 5);

INSERT INTO Episode (IDEpisode, titleEpisode, seasonEpisode, IDShow)
VALUES
    (85, 'Everything Is Fine', 1, 1),
    (90, 'Bonnie and Clyde', 2, 2),
    (12, 'I Know Who Did It', 2, 3),
    (503, 'Deja-vu', 3, 4);

INSERT INTO Review (IDReview, IDShow, IDEpisode, rating, created_at)
VALUES
    (909, 1, 85, 1, '2023-09-29 10:21:00'),
    (52, 2, 90, 1, '2023-09-29 18:53:00'),
    (1, 3, 12, 4, '2023-09-29 20:13:00'),
    (276, 4, 503, 5, '2023-09-29 01:36:00');