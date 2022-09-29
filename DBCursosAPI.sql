CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

insert into users
(
	id,
	name,
	email,
    password,
	age
) values 
(
	'1d59470c-bb5a-4d4e-9edb-42f1eaf2643f',
	'Juan Perez',
	'juan@gmail.com',
	'juanperez',
	25
),
(
	'9edf4a7e-3207-4c6a-ade4-706965cff963',
	'Luis Lopez',
	'luis@gmail.com',
	'luizperez',
	21
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "name" varchar DEFAULT 'student'
);

insert into roles 
(
	id,
	user_id,
	name
) values
(
	'6cacd2ee-f07a-405f-bde5-f70909977838',
	'1d59470c-bb5a-4d4e-9edb-42f1eaf2643f',
	'teacher'
),
(
	'd89ead85-dacc-4e45-854d-77ac7cd9139a',
	'9edf4a7e-3207-4c6a-ade4-706965cff963',
	'student'
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

insert into categories 
(
	id,
	name
) 
values
(
	'cbdf18de-f5c0-4530-8fd6-06678d6a8ae8',
	'IT'
),
(
	'8c7dc8e9-4ca0-4d79-8ac9-db679342bc54',
	'IoT'
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid NOT NULL,
  "categories_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level" varchar DEFAULT 'beginer',
  "teacher" varchar NOT NULL
);

insert into courses
(
  id,
  users_id,
  categories_id,
  title,
  description,
  teacher
)
values
(
    '1fe6525d-f6b8-4ca1-90d2-aa863f2531a9',
	'9edf4a7e-3207-4c6a-ade4-706965cff963',
	'8c7dc8e9-4ca0-4d79-8ac9-db679342bc54',
	'IT Fundamentals',
	'Know the roots of information technology',
	'Mike Thomson'	
),
(
	'b7ce5c61-83e4-4482-870f-3eb589fa48b7',
	'1d59470c-bb5a-4d4e-9edb-42f1eaf2643f',
	'cbdf18de-f5c0-4530-8fd6-06678d6a8ae8',
	'IoT Advance',
	'Change IoT execution diagrams',
	'Marck Daniels'
);


CREATE TABLE "courses_video" (
  "users_id" uuid NOT NULL,
  "categories_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL
);


insert into courses_video
(
  users_id,
  categories_id,
  title,
  url
)
values
(
	'1d59470c-bb5a-4d4e-9edb-42f1eaf2643f',
	'cbdf18de-f5c0-4530-8fd6-06678d6a8ae8',
	'Fundations DevNet',
	'https://education.com/devnetfundations'	
),
(
	'9edf4a7e-3207-4c6a-ade4-706965cff963',
	'8c7dc8e9-4ca0-4d79-8ac9-db679342bc54',
	'Fundations NodeRed',
	'https://education.com/noderedfundations'
);


CREATE TABLE "users_courses" (
  "users_id" uuid NOT NULL,
  "courses_users_id" uuid NOT NULL,
  PRIMARY KEY ("users_id", "courses_users_id")
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");
ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_users_id") REFERENCES "courses" ("users_id");

CREATE TABLE "courses_video_users" (
  "courses_video_users_id" uuid NOT NULL,
  "users_id" uuid NOT NULL,
  PRIMARY KEY ("courses_video_users_id", "users_id")
);

ALTER TABLE "courses_video_users" ADD FOREIGN KEY ("courses_video_users_id") REFERENCES "courses_video" ("users_id");
ALTER TABLE "courses_video_users" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "roles" ("user_id");
ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");
ALTER TABLE "courses_video" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

select * from users;
select * from categories;
select * from courses;
select * from courses_video;
select * from roles;
select * from courses_video_users;
select * from  users_courses;

--By Luis David Fernandez Ch.