CREATE TABLE "User" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "email" email,
  "password_hash" varchar,
  "last_login" timestamp,
  "xp_points" float
);

CREATE TABLE "Language" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "code" varchar
);

CREATE TABLE "Course" (
  "id" integer PRIMARY KEY,
  "language_id" integer,
  "name" varchar
);

CREATE TABLE "Section" (
  "id" integer PRIMARY KEY,
  "course_id" int,
  "name" varchar
);

CREATE TABLE "Unit" (
  "id" integer PRIMARY KEY,
  "section_id" integer,
  "name" varchar
);

CREATE TABLE "Lesson" (
  "id" integer PRIMARY KEY,
  "unit_id" int,
  "name" varchar
);

CREATE TABLE "User_course" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "course_id" integer,
  "start_date" timestamp,
  "end_date" timestamp
);

CREATE TABLE "User_lesson" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "lesson_id" integer,
  "start_date" timestamp,
  "end_date" timestamp
);

ALTER TABLE "Section" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("id");

ALTER TABLE "Unit" ADD FOREIGN KEY ("section_id") REFERENCES "Section" ("id");

ALTER TABLE "Lesson" ADD FOREIGN KEY ("unit_id") REFERENCES "Unit" ("id");

ALTER TABLE "Language" ADD FOREIGN KEY ("id") REFERENCES "Course" ("language_id");

ALTER TABLE "User" ADD FOREIGN KEY ("id") REFERENCES "User_course" ("user_id");

ALTER TABLE "User" ADD FOREIGN KEY ("id") REFERENCES "User_lesson" ("user_id");
