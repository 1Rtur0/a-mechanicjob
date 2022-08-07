-- Armario
INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanic', 'Mirror Park Mechanic', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanic', 'Mirror Park Mechanic', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mechanic', 'Mirror Park Mechanic', 1)
;


-- Trabajo
INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mirror Park Mechanic')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic',0,'novato','Novato',12,'{}','{}'),
	('mechanic',1,'experimentado','Experimentado',24,'{}','{}'),
	('mechanic',2,'profesional','Profesional',36,'{}','{}'),
	('mechanic',3,'ingeniero',"Ingeniero",48,'{}','{}'),
	('mechanic',4,'subjefe',"Sub Jefe",48,'{}','{}'),
	('mechanic',5,'boss','Jefe',0,'{}','{}')
;