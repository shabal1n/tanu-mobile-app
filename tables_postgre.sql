CREATE TABLE "Users" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "email" varchar,
  "password_hash" varchar,
  "last_login" timestamp,
  "xp_points" float
);

CREATE TABLE "Languages" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "code" varchar
);

CREATE TABLE "Courses" (
  "id" SERIAL PRIMARY KEY,
  "language_id" integer,
  "name" varchar,
  CONSTRAINT "course_unique_id" UNIQUE ("id")
);

CREATE TABLE "Sections" (
  "id" SERIAL PRIMARY KEY,
  "course_id" int,
  "name" varchar
);

CREATE TABLE "Units" (
  "id" SERIAL PRIMARY KEY,
  "section_id" integer,
  "name" varchar
);

CREATE TABLE "Lessons" (
  "id" SERIAL PRIMARY KEY,
  "unit_id" int,
  "name" varchar
);

CREATE TABLE "User_courses" (
  "id" SERIAL PRIMARY KEY,
  "user_id" integer,
  "course_id" integer,
  "lesson_id" integer,
  "unit_id" integer,
  "section_id" integer,
  "start_date" timestamp,
  "end_date" timestamp
);

ALTER TABLE "Sections" ADD FOREIGN KEY ("course_id") REFERENCES "Courses" ("id");

ALTER TABLE "Units" ADD FOREIGN KEY ("section_id") REFERENCES "Sections" ("id");

ALTER TABLE "Lessons" ADD FOREIGN KEY ("unit_id") REFERENCES "Units" ("id");

ALTER TABLE "Courses" ADD FOREIGN KEY ("language_id") REFERENCES "Languages" ("id");

ALTER TABLE "User_courses" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "User_courses" ADD FOREIGN KEY ("course_id") REFERENCES "Courses" ("id");

ALTER TABLE "User_courses" ADD FOREIGN KEY ("lesson_id") REFERENCES "Lessons" ("id");

ALTER TABLE "User_courses" ADD FOREIGN KEY ("unit_id") REFERENCES "Units" ("id");

ALTER TABLE "User_courses" ADD FOREIGN KEY ("section_id") REFERENCES "Sections" ("id");
