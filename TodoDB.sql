CREATE TABLE "todos" (
  "id" uuid PRIMARY KEY,
  "task" varchar NOT NULL,
  "start_dates" date NOT NULL,
  "end_dates" date NOT NULL,
  "is_complete" bool DEFAULT true
);
insert into todos
(
	id,
	task,
	start_dates,
    end_dates,
	is_complete
) values 
(
	'30736f5a-4519-4d42-a19b-33098191bee4',
	'Complete Login Component React Project',
	'2022/09/16',
	'2022/09/20',
	true
),
(
	'973be659-7adf-429f-a532-03cf5c8ec930',
	'Finish CSS components of the first FNC_3 project window',
	'2022/09/18',
	'2022/09/23',
	false	
),
(
	'81c9653d-2d49-4cb6-a4c9-49c5401161d5',
	'Take English Test',
	'2022/09/11',
	'2022/09/21',
	true	
),
(
	'f959030e-a875-40b9-82dc-38c14db510ca',
	'Pay for the MIT course',
	'2022/09/14',
	'2022/09/24',
	true	
),
(
	'ae50b398-7a2d-444d-b131-2486b2b4e3a3',
	'Check GitHub repositories',
	'2022/09/29',
	'2022/09/30',
	false
);

select * from todos;

select * from todos where is_complete = true;

--By Luis David Fernandez 