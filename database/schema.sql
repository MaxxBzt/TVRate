CREATE TABLE Category (
    IDCategory SMALLINT NOT NULL,
    nameCategory VARCHAR(50) NOT NULL,
    descriptionCategory TEXT,
    PRIMARY KEY (IDCategory)
);

CREATE TABLE Actor(
    IDActor SMALLINT NOT NULL,
    nameActor VARCHAR(200), 
    dateofbirthActor DATE, 
    nationality VARCHAR(50),
    biography TEXT,
    mainCategory SMALLINT,
    PRIMARY KEY (IDActor),
    FOREIGN KEY (mainCategory) REFERENCES Category(IDCategory)
);

CREATE TABLE Show (
    IDShow SMALLINT NOT NULL,
    nameShow VARCHAR(100) NOT NULL,
    releaseYearShow SMALLINT NOT NULL,
    descriptionShow TEXT NOT NULL,
    mainActor SMALLINT NOT NULL,
    IDCategory SMALLINT NOT NULL,
    PRIMARY KEY (IDShow),
    FOREIGN KEY (IDCategory) REFERENCES Category(IDCategory),
    FOREIGN KEY (mainActor) REFERENCES Actor(IDActor)
);

CREATE TABLE Episode(
    IDEpisode SMALLINT NOT NULL,
    titleEpisode VARCHAR(100),
    seasonEpisode SMALLINT,
    IDShow SMALLINT,
    PRIMARY KEY (IDEpisode),
    FOREIGN KEY (IDShow) REFERENCES Show(IDShow)
);



CREATE TABLE Review(
    IDReview SMALLINT NOT NULL,
    IDShow SMALLINT,
    IDEpisode SMALLINT,
    rating SMALLINT,
    created_at TIMESTAMP,
    PRIMARY KEY (IDReview,IDShow,IDEpisode),
    FOREIGN KEY (IDShow) REFERENCES Show(IDShow),
    FOREIGN KEY (IDEpisode) REFERENCES Episode(IDEpisode),
    CHECK (rating between 1 and 5)
);
