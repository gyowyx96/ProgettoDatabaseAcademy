
-- INFO STUDENTE SINGOLO 
CREATE or replace view InfoStudente as 
SELECT 
concat(ui_s.FirstName," ", ui_s.LastName) as Studente,
sub.subjectName as Materia,
IF(g.Grade is NULL, "In corso",g.Grade) as Voto,
concat (ui_p.FirstName," ", ui_p.LastName) as Professore

from grade as g
inner JOIN module as m on g.moduleId = m.ModuleID
inner JOIN subject as sub on sub.SubjectID = m.SubjectID
inner JOIN student as s on s.StudentID = g.StudentID
INNER JOIN userinfo as ui_s on ui_s.UserInfoID = s.UserInfoID
INNER JOIN course as c on c.CourseID = s.CourseID
INNER JOIN teacher as t on t.TeacherID = m.TeacherID
INNER JOIN userinfo as ui_p on ui_p.UserInfoID = t.UserInfoID
where s.StudentID = 7
ORDER BY voto asc;

-- INFO MATERIE E CORSI SPECIFICI
create or replace view materiacorsospecifici as 
SELECT 
concat(ui_s.FirstName," ", ui_s.LastName) as Studente,
IF(g.Grade is NULL, "In corso",g.Grade) as Voto,
concat(c.CourseName," ", c.CourseNumber," ", CityName) as Corso,

concat(ui_p.FirstName," ", ui_p.LastName) as Professore

from grade as g
inner JOIN module as m on g.moduleId = m.ModuleID
inner JOIN subject as sub on sub.SubjectID = m.SubjectID
inner JOIN student as s on s.StudentID = g.StudentID
INNER JOIN userinfo as ui_s on ui_s.UserInfoID = s.UserInfoID
INNER JOIN course as c on c.CourseID = s.CourseID
INNER join Site on site.SiteID = c.SiteID
inner join City on city.CityID = site.CityID
INNER JOIN teacher as t on t.TeacherID = m.TeacherID
INNER JOIN userinfo as ui_p on ui_p.UserInfoID = t.UserInfoID
where c.CourseName like "%Data%" and sub.SubjectName like "%big%"

ORDER BY CourseName, voto asc;

-- Media delle materie per tutti i corsi

CREATE or replace view mediamateriacorsi as
SELECT
    CONCAT(c.CourseName, ' ', c.CourseNumber, ' ', CityName) AS Corso,
    sub.SubjectName AS Materia,
    if 
        (ROUND(AVG(g.Grade), 2) is NULL, "---", ROUND(AVG(g.Grade), 2) ) 
    AS MediaVoti
FROM grade AS g
INNER JOIN module AS m ON g.ModuleID = m.ModuleID
INNER JOIN subject AS sub ON sub.SubjectID = m.SubjectID
INNER JOIN student AS s ON s.StudentID = g.StudentID
INNER JOIN course AS c ON c.CourseID = s.CourseID
INNER JOIN site ON site.SiteID = c.SiteID
INNER JOIN city ON city.CityID = site.CityID
GROUP BY Corso, Materia
ORDER BY Corso, Materia;

-- Media di tutti i voti di tutti gli studenti
create or replace view MediaVotiTuttiStudenti as
SELECT
    s.StudentID,
    concat(ui_s.FirstName," ", ui_s.LastName) as Studente,
    if 
        (ROUND(AVG(g.Grade), 2) is NULL, "---", ROUND(AVG(g.Grade), 2) ) 
    AS MediaVoti,
    concat(c.CourseName," ", c.CourseNumber," ", CityName) as Corso
FROM grade AS g
INNER JOIN module AS m ON g.ModuleID = m.ModuleID
INNER JOIN subject AS sub ON sub.SubjectID = m.SubjectID
INNER JOIN student AS s ON s.StudentID = g.StudentID
INNER JOIN userinfo AS ui_s ON ui_s.UserInfoID = s.UserInfoID
INNER JOIN course AS c ON c.CourseID = s.CourseID
INNER JOIN site ON site.SiteID = c.SiteID
INNER JOIN city ON city.CityID = site.CityID
GROUP BY studente
ORDER BY AVG(g.Grade) DESC;

-- Studenti con più di 30 anni ordinati per merito accademico
CREATE or replace view Studenticonpiudi30anni asCREATE or replace view MediaVotiTuttiStudenti as
SELECT
    s.StudentID,
    concat(ui_s.FirstName," ", ui_s.LastName) as Studente,
    if 
        (ROUND(AVG(g.Grade), 2) is NULL, "---", ROUND(AVG(g.Grade), 2) ) 
    AS MediaVoti,
    concat(c.CourseName," ", c.CourseNumber," ", CityName) as Corso
FROM grade AS g
INNER JOIN module AS m ON g.ModuleID = m.ModuleID
INNER JOIN subject AS sub ON sub.SubjectID = m.SubjectID
INNER JOIN student AS s ON s.StudentID = g.StudentID
INNER JOIN userinfo AS ui_s ON ui_s.UserInfoID = s.UserInfoID
INNER JOIN course AS c ON c.CourseID = s.CourseID
INNER JOIN site ON site.SiteID = c.SiteID
INNER JOIN city ON city.CityID = site.CityID
GROUP BY studente
ORDER BY AVG(g.Grade) DESC