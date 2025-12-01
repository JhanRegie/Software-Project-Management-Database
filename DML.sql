INSERT INTO skills(Skill_id,Name,Type) VALUES(1,'HTML','Frontend');
INSERT INTO skills(Skill_id,Name,Type) VALUES(2,'CSS','Backend');
INSERT INTO skills(Skill_id,Name,Type) VALUES(3,'JavaScript','Frontend');
INSERT INTO skills(Skill_id,Name,Type) VALUES(4,'Java','Designer');
INSERT INTO skills(Skill_id,Name,Type) VALUES(5,'Python','Data Science');
INSERT INTO skills(Skill_id,Name,Type) VALUES(6,'Python','Machine Learning');

INSERT INTO address(Address_id,Address_Line_1,Address_Line_2,Address_postcode)VALUES(1,'20 New Road','London','LD1 9NO');
INSERT INTO address(Address_id,Address_Line_1,Address_Line_2,Address_postcode)VALUES(2,'47 Fifth Avenue','Birmingham','BP2 ZMO');

INSERT INTO pool_member(Pool_member_id,Address_id,FirstName,LastName,Email,PhoneNumber,Work)
VALUES(1,1,'Marcus','Dominguez','md@gmail.com','12345678909','Analyst');
INSERT INTO pool_member(Pool_member_id,Address_id,FirstName,LastName,Email,PhoneNumber,Work)
VALUES(2,2,'Ethan','Smith','Esmith@gmail.com','09876543212','Programmer');

INSERT INTO share_skills(Pool_member_id,Skill_id,Experience)
VALUES(1,1,'Junior');
INSERT INTO share_skills(Pool_member_id,Skill_id,Experience)
VALUES(2,5,'Professional');


INSERT INTO client(Organisation_id,Address_id,Organisation,FirstName,LastName,Email,MethodOfContact)
VALUES(1,1,'MPC','Michael','Prince','Michaelp@gmail.com','Email');
INSERT INTO client(Organisation_id,Address_id,Organisation,FirstName,LastName,Email,MethodOfContact)
VALUES(2,2,'APC','Victor','Adamo','VictorA@gmail.com','Post');

INSERT INTO project(Project_id,Organisation_id,Pool_member_id,Title,Start_date,End_date,Budget,Phase)
VALUES(1,1,2,'Machine Learning',STR_TO_DATE('10-01-2023','%d-%m-%Y'),STR_TO_DATE('10-01-2024','%d-%m-%Y'),500000,'Development');

INSERT INTO project_skills(Project_id,Skill_id)VALUES(1,5);
INSERT INTO project_skills(Project_id,Skill_id)VALUES(1,1);

SELECT * FROM share_skills INNER JOIN project_skills ON share_skills.Skill_id = project_skills.Skill_id;

UPDATE project_skills SET FirstName = 'Ethan', LastName = 'Smith' WHERE Skill_id = 5;

SELECT * FROM share_skills INNER JOIN project_skills ON share_skills.Skill_id = project_skills.Skill_id;

SELECT share_skills.Pool_member_id, share_skills.Skill_id, pool_member.FirstName, pool_member.LastName, project_skills.Project_id, project_skills.Skill_id FROM share_skills, pool_member, project_skills WHERE share_skills.Pool_member_id = pool_member.Pool_member_id;

