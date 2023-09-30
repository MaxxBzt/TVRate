SELECT * FROM Actor;

SELECT nameShow FROM Show;

SELECT titleEpisode,seasonEpisode FROM Episode WHERE seasonEpisode=2;

SELECT nameShow,nameActor FROM Show JOIN Actor ON Show.mainActor = Actor.IDActor WHERE Actor.nameActor='Zendaya';

SELECT nameShow, titleEpisode FROM Show JOIN Review USING(IDShow) JOIN Episode USING(IDEpisode) WHERE rating>=4;

SELECT nameActor FROM Actor JOIN Category ON Category.IDCategory = Actor.mainCategory WHERE nameCategory = 'Sitcom';