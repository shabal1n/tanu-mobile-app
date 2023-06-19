CREATE TABLE "User" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "email" varchar,
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
  "name" varchar,
  CONSTRAINT "course_unique_id" UNIQUE ("id")
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
  "lesson_id" integer,
  "unit_id" integer,
  "section_id" integer,
  "start_date" timestamp,
  "end_date" timestamp
);

ALTER TABLE "Section" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("id");

ALTER TABLE "Unit" ADD FOREIGN KEY ("section_id") REFERENCES "Section" ("id");

ALTER TABLE "Lesson" ADD FOREIGN KEY ("unit_id") REFERENCES "Unit" ("id");

ALTER TABLE "Course" ADD FOREIGN KEY ("language_id") REFERENCES "Language" ("id");

ALTER TABLE "User_course" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "User_course" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("id");

ALTER TABLE "User_course" ADD FOREIGN KEY ("lesson_id") REFERENCES "Lesson" ("id");

ALTER TABLE "User_course" ADD FOREIGN KEY ("unit_id") REFERENCES "Unit" ("id");

ALTER TABLE "User_course" ADD FOREIGN KEY ("section_id") REFERENCES "Section" ("id");
