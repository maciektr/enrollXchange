-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: gjbpwwee
-- Generation Time: 2021-06-09 10:18:38.1990
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_classtime_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_classtime" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_classtime_id_seq'::regclass),
    "day" varchar(10) NOT NULL,
    "frequency" int2 NOT NULL CHECK (frequency >= 0),
    "start" time NOT NULL,
    "duration_minutes" int4 NOT NULL CHECK (duration_minutes >= 0),
    "seats" int4 NOT NULL CHECK (seats >= 0),
    "course_id" int4,
    "lecturer_id" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_course_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_course" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_course_id_seq'::regclass),
    "code" varchar(40) NOT NULL,
    "full_name" varchar(100) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_enrollment_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_enrollment" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_enrollment_id_seq'::regclass),
    "class_time_id" int4 NOT NULL,
    "student_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_lecturer_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_lecturer" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_lecturer_id_seq'::regclass),
    "first_name" varchar(100) NOT NULL,
    "last_name" varchar(100) NOT NULL,
    "account_id" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_offer_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_offer" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_offer_id_seq'::regclass),
    "comment" varchar(280) NOT NULL,
    "active" bool NOT NULL,
    "enrollment_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_offer_exchange_to_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_offer_exchange_to" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_offer_exchange_to_id_seq'::regclass),
    "offer_id" int4 NOT NULL,
    "classtime_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_student_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_student" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_student_id_seq'::regclass),
    "first_name" varchar(100) NOT NULL,
    "last_name" varchar(100) NOT NULL,
    "student_id" varchar(6) NOT NULL,
    "account_id" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_studentrequest_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_studentrequest" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_studentrequest_id_seq'::regclass),
    "comment" varchar(280) NOT NULL,
    "active" bool NOT NULL,
    "enrollment_id" int4 NOT NULL,
    "lecturer_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_studentrequest_exchange_to_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_studentrequest_exchange_to" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_studentrequest_exchange_to_id_seq'::regclass),
    "studentrequest_id" int4 NOT NULL,
    "classtime_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_user_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_user" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_user_id_seq'::regclass),
    "password" varchar(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" bool NOT NULL,
    "username" varchar(150) NOT NULL,
    "first_name" varchar(150) NOT NULL,
    "last_name" varchar(150) NOT NULL,
    "email" varchar(254) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" timestamptz NOT NULL,
    "user_type" int2 NOT NULL CHECK (user_type >= 0),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_user_groups_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_user_groups" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_user_groups_id_seq'::regclass),
    "user_id" int4 NOT NULL,
    "group_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_user_user_permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_user_user_permissions" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_user_user_permissions_id_seq'::regclass),
    "user_id" int4 NOT NULL,
    "permission_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_usermodel_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_usermodel" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_usermodel_id_seq'::regclass),
    "password" varchar(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" bool NOT NULL,
    "username" varchar(150) NOT NULL,
    "first_name" varchar(150) NOT NULL,
    "last_name" varchar(150) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" timestamptz NOT NULL,
    "email" varchar(254) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_usermodel_groups_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_usermodel_groups" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_usermodel_groups_id_seq'::regclass),
    "usermodel_id" int4 NOT NULL,
    "group_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS enroll_usermodel_user_permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."enroll_usermodel_user_permissions" (
    "id" int4 NOT NULL DEFAULT nextval('enroll_usermodel_user_permissions_id_seq'::regclass),
    "usermodel_id" int4 NOT NULL,
    "permission_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."enroll_classtime" ("id", "day", "frequency", "start", "duration_minutes", "seats", "course_id", "lecturer_id") VALUES
(1, 'MONDAY', 2, '08:00:00', 90, 10, 1, 1),
(2, 'MONDAY', 3, '08:00:00', 90, 10, 1, 2),
(3, 'TUESDAY', 2, '08:00:00', 90, 10, 1, 2),
(4, 'TUESDAY', 3, '09:30:00', 90, 10, 1, 2),
(5, 'WEDNESDAY', 1, '08:00:00', 90, 10, 3, 1),
(6, 'WEDNESDAY', 1, '08:00:00', 90, 10, 3, 2),
(7, 'WEDNESDAY', 1, '08:00:00', 90, 15, 2, 1),
(8, 'THURSDAY', 1, '09:35:00', 90, 15, 2, 2),
(9, 'MONDAY', 1, '12:00:00', 90, 22, 2, 2),
(10, 'TUESDAY', 1, '12:30:00', 90, 22, 2, 2),
(11, 'MONDAY', 2, '12:00:00', 3, 5, 1, 1),
(12, 'MONDAY', 1, '10:00:00', 90, 15, 5, 3),
(13, 'FRIDAY', 1, '12:00:00', 90, 17, 5, 3),
(14, 'FRIDAY', 1, '09:30:00', 90, 10, 4, 3),
(15, 'WEDNESDAY', 1, '16:00:00', 90, 10, 4, 1),
(16, 'FRIDAY', 1, '15:00:00', 90, 10, 4, 1),
(17, 'TUESDAY', 1, '11:30:00', 90, 12, 3, 3),
(18, 'THURSDAY', 1, '14:30:00', 90, 13, 3, 2);

INSERT INTO "public"."enroll_course" ("id", "code", "full_name") VALUES
(1, 'APTO', 'Algorytmy dla Problemów Trudnych Obliczeniowo'),
(2, 'ASD', 'Algorytmy i Struktury Danych'),
(3, 'KI', 'Kompetencje Interpersonalne'),
(4, 'A', 'Analiza'),
(5, 'MOWNIT', 'Metody Obliczeniowe w Nauce i Technice'),
(6, 'Chiński', 'Język Miłości'),
(7, 'Pifko', 'Piwo z Maćkiem');

INSERT INTO "public"."enroll_enrollment" ("id", "class_time_id", "student_id") VALUES
(13, 11, 1),
(14, 6, 1),
(15, 10, 1),
(16, 13, 2),
(17, 3, 2),
(18, 6, 2),
(19, 8, 2),
(20, 13, 1),
(21, 14, 1);

INSERT INTO "public"."enroll_lecturer" ("id", "first_name", "last_name", "account_id") VALUES
(1, 'Piotr', 'Faliszewski', 2),
(2, 'Marcin', 'Kurdziel', 6),
(3, 'Wacław', 'Frydrych', 8);

INSERT INTO "public"."enroll_student" ("id", "first_name", "last_name", "student_id", "account_id") VALUES
(1, 'Jan', 'Gargas', '123456', 5),
(2, 'Kacper', 'Karoń', '234561', 4),
(3, 'Stanisław', 'Denkowski', '345612', 3),
(4, 'Maciuś', 'Trątni', '692137', 9);

INSERT INTO "public"."enroll_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined", "user_type") VALUES
(2, 'pbkdf2_sha256$260000$pjc2q8IotpYezjCrwl7A2E$Xdg9bdLjbY802uH5oq/smmr2Oy8WMqJ99eyMWqLtSkk=', '2021-06-08 18:33:20.956636+00', 'f', 'Piotr', 'Piotr', 'Faliszewski', 'gargasj99@gmail.com', 'f', 't', '2021-04-12 20:30:44+00', 3),
(3, 'pbkdf2_sha256$260000$wAxnSaS3oovwj0s2CPVORj$E9QcTFtWOM1+X+rETVCKBOyy/hR6DqeSN5Mv1mhPiwI=', '2021-04-15 12:39:02.926677+00', 'f', 'Stanisław', 'Stanisław', 'Denkowski', 'gargasj99@gmail.com', 'f', 't', '2021-04-12 20:33:17+00', 2),
(4, 'pbkdf2_sha256$260000$D3BQ1GVTTrPjTCpG0XnEBc$au7vPiPsOy0Bp4EnGB8UF9ErkhAbySO3YXeHXn7RX5I=', '2021-06-08 19:26:14.589546+00', 'f', 'Kacper', 'Kacper', 'Karoń', 'gargasj99@gmail.com', 'f', 't', '2021-04-13 14:20:04+00', 2),
(5, 'pbkdf2_sha256$260000$afAE9KCfi71rWvBFqQBiY9$LK9Rq6Cy754GmodQ+qKQl3WIpU4CBDhQi+GwaqJvbbc=', '2021-06-08 19:28:28.266295+00', 'f', 'Jan', 'Jan', 'Gargas', 'gargasj99@gmail.com', 'f', 't', '2021-04-13 14:20:53+00', 2),
(6, 'pbkdf2_sha256$260000$L1gGmjxDQ5sTCTkX4aPh3V$2T8LAWlPdu2liOln60460Hh7f0koPdQhVq6MPcueGNg=', '2021-06-08 18:32:56.033616+00', 'f', 'Marcin', 'Marcin', 'Kurdziel', 'gargasj99@gmail.com', 'f', 't', '2021-04-13 14:21:34+00', 3),
(7, 'pbkdf2_sha256$260000$hvusCcV1xL3r9ycyacO6kQ$EKIB/95M2eR1YWO79imX7/wTAjahSj2DSmYPqi8srMA=', '2021-06-08 19:06:55.554281+00', 't', 'maciektr', '', '', 'gargasj99@gmail.com', 't', 't', '2021-04-15 11:30:53+00', 4),
(8, 'pbkdf2_sha256$260000$arAld0BrEZW1vraqkxzESs$TKeG3wnp5NF1uyshsIlpYF7QutPPcvTgAbrNiOFgBSI=', '2021-06-08 19:28:09.170648+00', 'f', 'Wacław', 'Wacław', 'Frydrych', 'gargasj99@gmail.com', 'f', 't', '2021-06-08 17:13:57+00', 3),
(9, 'pbkdf2_sha256$260000$k9awB1Jtz4lVAK5J1EWcD2$DIag7dt+ZiQw+8Bnk7QlfeA4ccjkBDrLfL6MR/Zurzs=', '2021-06-08 17:23:55+00', 'f', 'macius', 'Maciuś', 'Trątni', 'gargasj99@gmail.com', 'f', 't', '2021-06-08 17:23:42+00', 2);

ALTER TABLE "public"."enroll_classtime" ADD FOREIGN KEY ("lecturer_id") REFERENCES "public"."enroll_lecturer"("id");
ALTER TABLE "public"."enroll_classtime" ADD FOREIGN KEY ("course_id") REFERENCES "public"."enroll_course"("id");
ALTER TABLE "public"."enroll_enrollment" ADD FOREIGN KEY ("class_time_id") REFERENCES "public"."enroll_classtime"("id");
ALTER TABLE "public"."enroll_enrollment" ADD FOREIGN KEY ("student_id") REFERENCES "public"."enroll_student"("id");
ALTER TABLE "public"."enroll_lecturer" ADD FOREIGN KEY ("account_id") REFERENCES "public"."enroll_user"("id");
ALTER TABLE "public"."enroll_offer" ADD FOREIGN KEY ("enrollment_id") REFERENCES "public"."enroll_enrollment"("id");
ALTER TABLE "public"."enroll_offer_exchange_to" ADD FOREIGN KEY ("offer_id") REFERENCES "public"."enroll_offer"("id");
ALTER TABLE "public"."enroll_offer_exchange_to" ADD FOREIGN KEY ("classtime_id") REFERENCES "public"."enroll_classtime"("id");
ALTER TABLE "public"."enroll_student" ADD FOREIGN KEY ("account_id") REFERENCES "public"."enroll_user"("id");
ALTER TABLE "public"."enroll_studentrequest" ADD FOREIGN KEY ("enrollment_id") REFERENCES "public"."enroll_enrollment"("id");
ALTER TABLE "public"."enroll_studentrequest" ADD FOREIGN KEY ("lecturer_id") REFERENCES "public"."enroll_lecturer"("id");
ALTER TABLE "public"."enroll_studentrequest_exchange_to" ADD FOREIGN KEY ("classtime_id") REFERENCES "public"."enroll_classtime"("id");
ALTER TABLE "public"."enroll_studentrequest_exchange_to" ADD FOREIGN KEY ("studentrequest_id") REFERENCES "public"."enroll_studentrequest"("id");
ALTER TABLE "public"."enroll_user_groups" ADD FOREIGN KEY ("user_id") REFERENCES "public"."enroll_user"("id");
ALTER TABLE "public"."enroll_user_user_permissions" ADD FOREIGN KEY ("user_id") REFERENCES "public"."enroll_user"("id");
ALTER TABLE "public"."enroll_user_user_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id");
ALTER TABLE "public"."enroll_usermodel_groups" ADD FOREIGN KEY ("usermodel_id") REFERENCES "public"."enroll_usermodel"("id");
ALTER TABLE "public"."enroll_usermodel_groups" ADD FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id");
ALTER TABLE "public"."enroll_usermodel_user_permissions" ADD FOREIGN KEY ("usermodel_id") REFERENCES "public"."enroll_usermodel"("id");
ALTER TABLE "public"."enroll_usermodel_user_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id");
