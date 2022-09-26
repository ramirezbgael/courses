CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int,
  "role_id" int NOT NULL
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "level" varchar NOT NULL,
  "category_id" int,
  "teacher_id" uuid
);

CREATE TABLE "course_videos" (
  "id" serial PRIMARY KEY,
  "course_id" int NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "users_courses" (
  "id" serial PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "course_id" int NOT NULL,
  "porcentage" int,
  "review" text
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

-- Insertando roles 
insert into roles (name) values(
	'student'
),
(
	'teacher'
),
(
	'admin'
);

-- Insertando categorías para los cursos
insert into categories (name) values (
	'React'
), (
	'React Native'
), (
	'PostgreSQL'
), (
	'Node'
);

-- Insertando usuarios (admin, maestro y estudiante)
insert into users (id, name, email, password, age, role_id) values (
	'b5f520a3-00ac-4205-97ee-fb75d7e8264b',
	'Gael',
	'gael@gmail.com',
	'root',
	19,
	3
),(
	'1e791afc-3762-4293-ac4c-7fec2e57e14c',
	'Frida',
	'frida@gmail.com',
	'root',
	20,
	1
), (
	'586a5ae5-6d71-43b4-900a-f722aee136f0',
	'Profe Paco',
	'paco@gmail.com',
	'root',
	20,
	2
);

-- Insertando cursos 
insert into courses (title, description, level, category_id, teacher_id) values(
	'React desde cero',
	'Aprende React desde cero en 19 días',
	'Novato',
	1,
	'586a5ae5-6d71-43b4-900a-f722aee136f0'
), (
	'Node desde cero',
	'Aprende Node en 30 días',
	'Experto',
	4,
	'586a5ae5-6d71-43b4-900a-f722aee136f0'
), (
	'PostgreSQL zero to hero',
	'Learn PostgreSQL now',
	'Noobie',
	3,
	'586a5ae5-6d71-43b4-900a-f722aee136f0'
);

-- Insertando videos en los cursos 
insert into course_videos (course_id, title, url) values(
	1,
	'Introducción',
	'www.video.com'
), (
	1,
	'Mitad del curso',
	'www.video.com'
),(
	1,
	'Final del curso',
	'www.video.com'
), (
	2,
	'Fundamentos de node',
	'www.video.com'
);

-- Relacionando usuarios con sus cursos
insert into users_courses  (user_id, course_id, porcentage, review) values(
	'1e791afc-3762-4293-ac4c-7fec2e57e14c',
	1,
	90,
	'Es un curso buenísimo'
), (
	'1e791afc-3762-4293-ac4c-7fec2e57e14c',
	2,
	100,
	'Es un asco de curso'
);