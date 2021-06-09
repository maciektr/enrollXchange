-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: gjbpwwee
-- Generation Time: 2021-06-09 10:17:24.9670
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS auth_group_id_seq;

-- Table Definition
CREATE TABLE "public"."auth_group" (
    "id" int4 NOT NULL DEFAULT nextval('auth_group_id_seq'::regclass),
    "name" varchar(150) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS auth_group_permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."auth_group_permissions" (
    "id" int4 NOT NULL DEFAULT nextval('auth_group_permissions_id_seq'::regclass),
    "group_id" int4 NOT NULL,
    "permission_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS auth_permission_id_seq;

-- Table Definition
CREATE TABLE "public"."auth_permission" (
    "id" int4 NOT NULL DEFAULT nextval('auth_permission_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "content_type_id" int4 NOT NULL,
    "codename" varchar(100) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS auth_user_id_seq;

-- Table Definition
CREATE TABLE "public"."auth_user" (
    "id" int4 NOT NULL DEFAULT nextval('auth_user_id_seq'::regclass),
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
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS auth_user_groups_id_seq;

-- Table Definition
CREATE TABLE "public"."auth_user_groups" (
    "id" int4 NOT NULL DEFAULT nextval('auth_user_groups_id_seq'::regclass),
    "user_id" int4 NOT NULL,
    "group_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS auth_user_user_permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."auth_user_user_permissions" (
    "id" int4 NOT NULL DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass),
    "user_id" int4 NOT NULL,
    "permission_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS django_admin_log_id_seq;

-- Table Definition
CREATE TABLE "public"."django_admin_log" (
    "id" int4 NOT NULL DEFAULT nextval('django_admin_log_id_seq'::regclass),
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" int2 NOT NULL CHECK (action_flag >= 0),
    "change_message" text NOT NULL,
    "content_type_id" int4,
    "user_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS django_content_type_id_seq;

-- Table Definition
CREATE TABLE "public"."django_content_type" (
    "id" int4 NOT NULL DEFAULT nextval('django_content_type_id_seq'::regclass),
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS django_migrations_id_seq;

-- Table Definition
CREATE TABLE "public"."django_migrations" (
    "id" int4 NOT NULL DEFAULT nextval('django_migrations_id_seq'::regclass),
    "app" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."django_session" (
    "session_key" varchar(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    PRIMARY KEY ("session_key")
);

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

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS graphql_auth_userstatus_id_seq;

-- Table Definition
CREATE TABLE "public"."graphql_auth_userstatus" (
    "id" int4 NOT NULL DEFAULT nextval('graphql_auth_userstatus_id_seq'::regclass),
    "verified" bool NOT NULL,
    "archived" bool NOT NULL,
    "secondary_email" varchar(254),
    "user_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);



-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS refresh_token_refreshtoken_id_seq;

-- Table Definition
CREATE TABLE "public"."refresh_token_refreshtoken" (
    "id" int8 NOT NULL DEFAULT nextval('refresh_token_refreshtoken_id_seq'::regclass),
    "token" varchar(255) NOT NULL,
    "created" timestamptz NOT NULL,
    "revoked" timestamptz,
    "user_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user status', 7, 'add_userstatus'),
(26, 'Can change user status', 7, 'change_userstatus'),
(27, 'Can delete user status', 7, 'delete_userstatus'),
(28, 'Can view user status', 7, 'view_userstatus'),
(29, 'Can add refresh token', 8, 'add_refreshtoken'),
(30, 'Can change refresh token', 8, 'change_refreshtoken'),
(31, 'Can delete refresh token', 8, 'delete_refreshtoken'),
(32, 'Can view refresh token', 8, 'view_refreshtoken'),
(33, 'Can add user', 9, 'add_usermodel'),
(34, 'Can change user', 9, 'change_usermodel'),
(35, 'Can delete user', 9, 'delete_usermodel'),
(36, 'Can view user', 9, 'view_usermodel'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user'),
(41, 'Can add class time', 11, 'add_classtime'),
(42, 'Can change class time', 11, 'change_classtime'),
(43, 'Can delete class time', 11, 'delete_classtime'),
(44, 'Can view class time', 11, 'view_classtime'),
(45, 'Can add course', 12, 'add_course'),
(46, 'Can change course', 12, 'change_course'),
(47, 'Can delete course', 12, 'delete_course'),
(48, 'Can view course', 12, 'view_course'),
(49, 'Can add enrollment', 13, 'add_enrollment'),
(50, 'Can change enrollment', 13, 'change_enrollment'),
(51, 'Can delete enrollment', 13, 'delete_enrollment'),
(52, 'Can view enrollment', 13, 'view_enrollment'),
(53, 'Can add offer', 14, 'add_offer'),
(54, 'Can change offer', 14, 'change_offer'),
(55, 'Can delete offer', 14, 'delete_offer'),
(56, 'Can view offer', 14, 'view_offer'),
(57, 'Can add lecturer', 15, 'add_lecturer'),
(58, 'Can change lecturer', 15, 'change_lecturer'),
(59, 'Can delete lecturer', 15, 'delete_lecturer'),
(60, 'Can view lecturer', 15, 'view_lecturer'),
(61, 'Can add content type', 4, 'add_contenttype'),
(62, 'Can change content type', 4, 'change_contenttype'),
(63, 'Can delete content type', 4, 'delete_contenttype'),
(64, 'Can view content type', 4, 'view_contenttype'),
(65, 'Can add session', 5, 'add_session'),
(66, 'Can change session', 5, 'change_session'),
(67, 'Can delete session', 5, 'delete_session'),
(68, 'Can view session', 5, 'view_session'),
(69, 'Can add user status', 6, 'add_userstatus'),
(70, 'Can change user status', 6, 'change_userstatus'),
(71, 'Can delete user status', 6, 'delete_userstatus'),
(72, 'Can view user status', 6, 'view_userstatus'),
(73, 'Can add user', 7, 'add_user'),
(74, 'Can change user', 7, 'change_user'),
(75, 'Can delete user', 7, 'delete_user'),
(76, 'Can view user', 7, 'view_user'),
(77, 'Can add class time', 8, 'add_classtime'),
(78, 'Can change class time', 8, 'change_classtime'),
(79, 'Can delete class time', 8, 'delete_classtime'),
(80, 'Can view class time', 8, 'view_classtime'),
(81, 'Can add course', 9, 'add_course'),
(82, 'Can change course', 9, 'change_course'),
(83, 'Can delete course', 9, 'delete_course'),
(84, 'Can view course', 9, 'view_course'),
(85, 'Can add enrollment', 10, 'add_enrollment'),
(86, 'Can change enrollment', 10, 'change_enrollment'),
(87, 'Can delete enrollment', 10, 'delete_enrollment'),
(88, 'Can view enrollment', 10, 'view_enrollment'),
(89, 'Can add offer', 11, 'add_offer'),
(90, 'Can change offer', 11, 'change_offer'),
(91, 'Can delete offer', 11, 'delete_offer'),
(92, 'Can view offer', 11, 'view_offer'),
(93, 'Can add lecturer', 12, 'add_lecturer'),
(94, 'Can change lecturer', 12, 'change_lecturer'),
(95, 'Can delete lecturer', 12, 'delete_lecturer'),
(96, 'Can view lecturer', 12, 'view_lecturer'),
(97, 'Can add student request', 13, 'add_studentrequest'),
(98, 'Can change student request', 13, 'change_studentrequest'),
(99, 'Can delete student request', 13, 'delete_studentrequest'),
(100, 'Can view student request', 13, 'view_studentrequest'),
(101, 'Can add student', 14, 'add_student'),
(102, 'Can change student', 14, 'change_student'),
(103, 'Can delete student', 14, 'delete_student'),
(104, 'Can view student', 14, 'view_student');

INSERT INTO "public"."django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES
(52, '2021-04-15 11:31:33.342443+00', '1', 'admin (new_user)', 3, '', 7, 7),
(53, '2021-04-15 12:33:37.168594+00', '7', 'maciektr (moderator)', 2, '[{"changed": {"fields": ["User type"]}}]', 7, 7),
(54, '2021-05-06 12:48:01.309536+00', '9', 'Algorytmy i Struktury Danych | MONDAY 12:00', 1, '[{"added": {}}]', 8, 7),
(55, '2021-05-06 12:48:18.965309+00', '10', 'Algorytmy i Struktury Danych | TUESDAY 12:30', 1, '[{"added": {}}]', 8, 7),
(56, '2021-05-06 12:48:36.363447+00', '10', 'Jan (student) - Algorytmy i Struktury Danych | MONDAY 12:00', 1, '[{"added": {}}]', 10, 7),
(57, '2021-05-06 12:48:46.155994+00', '11', 'Stanisław (student) - Algorytmy i Struktury Danych | MONDAY 12:00', 1, '[{"added": {}}]', 10, 7),
(58, '2021-05-06 12:48:56.57966+00', '12', 'Kacper (student) - Algorytmy i Struktury Danych | TUESDAY 12:30', 1, '[{"added": {}}]', 10, 7),
(59, '2021-05-24 19:22:10.372636+00', '11', 'Algorytmy dla Problemów Trudnych Obliczeniowo | MONDAY 12:00', 1, '[{"added": {}}]', 8, 7),
(60, '2021-06-08 17:08:14.570667+00', '5', 'Jan (student)', 2, '[{"changed": {"fields": ["Email address"]}}]', 7, 7),
(61, '2021-06-08 17:13:26.339095+00', '4', 'Analiza', 1, '[{"added": {}}]', 9, 7),
(62, '2021-06-08 17:14:43.445964+00', '8', 'Wacław (new_user)', 1, '[{"added": {}}]', 7, 7),
(63, '2021-06-08 17:15:27.466879+00', '8', 'Wacław (teacher)', 2, '[{"changed": {"fields": ["User type"]}}]', 7, 7),
(64, '2021-06-08 17:15:45.904377+00', '3', 'Wacław Frydrych', 1, '[{"added": {}}]', 12, 7),
(65, '2021-06-08 17:17:04.849579+00', '5', 'Metody Obliczeniowe w Nauce i Technice', 1, '[{"added": {}}]', 9, 7),
(66, '2021-06-08 17:17:41.982746+00', '6', 'Język Miłości', 1, '[{"added": {}}]', 9, 7),
(67, '2021-06-08 17:18:05.566264+00', '12', 'Metody Obliczeniowe w Nauce i Technice | MONDAY 10:00', 1, '[{"added": {}}]', 8, 7),
(68, '2021-06-08 17:18:32.815251+00', '13', 'Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 1, '[{"added": {}}]', 8, 7),
(69, '2021-06-08 17:19:36.263448+00', '7', 'Piwo z Maćkiem', 1, '[{"added": {}}]', 9, 7),
(70, '2021-06-08 17:23:19.919663+00', '1', 'Jan Gargas #123456', 1, '[{"added": {}}]', 14, 7),
(71, '2021-06-08 17:23:51.151818+00', '2', 'Kacper Karoń #234561', 1, '[{"added": {}}]', 14, 7),
(72, '2021-06-08 17:24:28.218459+00', '3', 'Stanisław Denkowski #345612', 1, '[{"added": {}}]', 14, 7),
(73, '2021-06-08 17:24:44.289302+00', '9', 'macius (student)', 1, '[{"added": {}}]', 7, 7),
(74, '2021-06-08 17:25:15.210128+00', '13', 'Jan Gargas #123456 - Algorytmy dla Problemów Trudnych Obliczeniowo | MONDAY 08:00', 1, '[{"added": {}}]', 10, 7),
(75, '2021-06-08 17:25:24.286567+00', '14', 'Jan Gargas #123456 - Kompetencje Interpersonalne | WEDNESDAY 08:00', 1, '[{"added": {}}]', 10, 7),
(76, '2021-06-08 17:25:36.045547+00', '15', 'Jan Gargas #123456 - Algorytmy i Struktury Danych | TUESDAY 12:30', 1, '[{"added": {}}]', 10, 7),
(77, '2021-06-08 17:25:41.834838+00', '4', 'Maciuś Trątni #692137', 1, '[{"added": {}}]', 14, 7),
(78, '2021-06-08 17:25:57.089557+00', '16', 'Jan Gargas #123456 - Metody Obliczeniowe w Nauce i Technice | MONDAY 10:00', 1, '[{"added": {}}]', 10, 7),
(79, '2021-06-08 17:26:20.686838+00', '17', 'Kacper Karoń #234561 - Algorytmy dla Problemów Trudnych Obliczeniowo | TUESDAY 08:00', 1, '[{"added": {}}]', 10, 7),
(80, '2021-06-08 17:26:26.357944+00', '18', 'Kacper Karoń #234561 - Kompetencje Interpersonalne | WEDNESDAY 08:00', 1, '[{"added": {}}]', 10, 7),
(81, '2021-06-08 17:26:34.992768+00', '19', 'Kacper Karoń #234561 - Algorytmy i Struktury Danych | MONDAY 12:00', 1, '[{"added": {}}]', 10, 7),
(82, '2021-06-08 17:26:43.549679+00', '20', 'Kacper Karoń #234561 - Metody Obliczeniowe w Nauce i Technice | MONDAY 10:00', 1, '[{"added": {}}]', 10, 7),
(83, '2021-06-08 17:33:45.58018+00', '14', 'Analiza | FRIDAY 09:30', 1, '[{"added": {}}]', 8, 7),
(84, '2021-06-08 17:34:11.228838+00', '15', 'Analiza | WEDNESDAY 16:00', 1, '[{"added": {}}]', 8, 7),
(85, '2021-06-08 17:34:34.383659+00', '16', 'Analiza | FRIDAY 15:00', 1, '[{"added": {}}]', 8, 7),
(86, '2021-06-08 17:34:45.542106+00', '21', 'Jan Gargas #123456 - Analiza | FRIDAY 09:30', 1, '[{"added": {}}]', 10, 7),
(87, '2021-06-08 17:36:02.859546+00', '2', 'Algorytmy dla Problemów Trudnych Obliczeniowo | MONDAY 08:00', 2, '[{"changed": {"fields": ["Lecturer"]}}]', 8, 7),
(88, '2021-06-08 17:36:50.272554+00', '12', 'Jan Gargas #123456 - Analiza | FRIDAY 09:30', 3, '', 11, 7),
(89, '2021-06-08 17:36:50.287427+00', '11', 'Jan Gargas #123456 - Kompetencje Interpersonalne | WEDNESDAY 08:00', 3, '', 11, 7),
(90, '2021-06-08 17:36:50.295259+00', '10', 'Jan Gargas #123456 - Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 3, '', 11, 7),
(91, '2021-06-08 17:36:50.303994+00', '9', 'Jan Gargas #123456 - Algorytmy dla Problemów Trudnych Obliczeniowo | MONDAY 08:00', 3, '', 11, 7),
(92, '2021-06-08 17:38:02.730103+00', '17', 'Kompetencje Interpersonalne | TUESDAY 11:30', 1, '[{"added": {}}]', 8, 7),
(93, '2021-06-08 17:38:24.191704+00', '18', 'Kompetencje Interpersonalne | THURSDAY 14:30', 1, '[{"added": {}}]', 8, 7),
(94, '2021-06-08 18:00:53.050108+00', '15', 'Jan Gargas #123456 - Analiza | FRIDAY 09:30', 3, '', 11, 7),
(95, '2021-06-08 18:00:53.058215+00', '14', 'Jan Gargas #123456 - Kompetencje Interpersonalne | WEDNESDAY 08:00', 3, '', 11, 7),
(96, '2021-06-08 18:00:53.062695+00', '13', 'Jan Gargas #123456 - Algorytmy dla Problemów Trudnych Obliczeniowo | MONDAY 12:00', 3, '', 11, 7),
(97, '2021-06-08 19:07:14.633865+00', '17', 'Jan Gargas #123456 - Analiza | FRIDAY 09:30', 3, '', 11, 7),
(98, '2021-06-08 19:07:14.638496+00', '16', 'Kacper Karoń #234561 - Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 3, '', 11, 7),
(99, '2021-06-08 19:26:53.405825+00', '21', 'Jan Gargas #123456 - Kompetencje Interpersonalne | WEDNESDAY 08:00', 3, '', 11, 7),
(100, '2021-06-08 19:26:53.411129+00', '20', 'Jan Gargas #123456 - Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 3, '', 11, 7),
(101, '2021-06-08 19:26:53.41477+00', '19', 'Jan Gargas #123456 - Analiza | FRIDAY 09:30', 3, '', 11, 7),
(102, '2021-06-08 19:26:53.41828+00', '18', 'Kacper Karoń #234561 - Metody Obliczeniowe w Nauce i Technice | MONDAY 10:00', 3, '', 11, 7),
(103, '2021-06-08 19:29:09.187853+00', '22', 'Jan Gargas #123456 - Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 3, '', 11, 7),
(104, '2021-06-08 19:29:18.871094+00', '3', 'Jan Gargas #123456 - Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 3, '', 13, 7),
(105, '2021-06-08 19:29:18.876572+00', '2', 'Jan Gargas #123456 - Metody Obliczeniowe w Nauce i Technice | FRIDAY 12:00', 3, '', 13, 7),
(106, '2021-06-08 19:29:18.880828+00', '1', 'Kacper Karoń #234561 - Algorytmy i Struktury Danych | THURSDAY 09:35', 3, '', 13, 7);

INSERT INTO "public"."django_content_type" ("id", "app_label", "model") VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'graphql_auth', 'userstatus'),
(7, 'enroll', 'user'),
(8, 'enroll', 'classtime'),
(9, 'enroll', 'course'),
(10, 'enroll', 'enrollment'),
(11, 'enroll', 'offer'),
(12, 'enroll', 'lecturer'),
(13, 'enroll', 'studentrequest'),
(14, 'enroll', 'student');

INSERT INTO "public"."django_migrations" ("id", "app", "name", "applied") VALUES
(1, 'contenttypes', '0001_initial', '2021-04-12 20:24:45.424954+00'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-04-12 20:24:45.437087+00'),
(3, 'auth', '0001_initial', '2021-04-12 20:24:45.491914+00'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-04-12 20:24:45.50069+00'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-04-12 20:24:45.509469+00'),
(6, 'auth', '0004_alter_user_username_opts', '2021-04-12 20:24:45.517674+00'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-04-12 20:24:45.528257+00'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-04-12 20:24:45.532471+00'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-04-12 20:24:45.542023+00'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-04-12 20:24:45.551789+00'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-04-12 20:24:45.56279+00'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-04-12 20:24:45.572047+00'),
(13, 'auth', '0011_update_proxy_permissions', '2021-04-12 20:24:45.58115+00'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-04-12 20:24:45.590539+00'),
(15, 'enroll', '0001_initial', '2021-04-12 20:24:45.81687+00'),
(16, 'admin', '0001_initial', '2021-04-12 20:24:45.856452+00'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-04-12 20:24:45.870714+00'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-12 20:24:45.886282+00'),
(19, 'enroll', '0002_auto_20210404_1400', '2021-04-12 20:24:45.931331+00'),
(20, 'graphql_auth', '0001_initial', '2021-04-12 20:24:45.962699+00'),
(21, 'sessions', '0001_initial', '2021-04-12 20:24:45.981702+00'),
(22, 'enroll', '0003_studentrequest', '2021-05-15 12:03:22.327665+00'),
(23, 'enroll', '0004_auto_20210515_1318', '2021-06-08 17:14:33.177733+00');

INSERT INTO "public"."django_session" ("session_key", "session_data", "expire_date") VALUES
('0bsd5f4pdoyiwnaj2t0qz69yv5dxhsmz', '.eJxVjEsOwiAUAO_C2hDKH5fuewby3gOkamhS2pXx7oakC93OTObNIhx7jUfPW1wSuzLJLr8MgZ65DZEe0O4rp7Xt24J8JPy0nc9ryq_b2f4NKvQ6tiVpnCaAQMEbnTxqRRKFtKRUkcWATaTQWCDlBAbnipYaPWUtZAZkny_v2ThP:1llGBu:T5xO1cgwyCJsaBnDCag6Z8gH9H2TzJJyrw11jrDwOlk', '2021-06-07 19:24:42.677878+00'),
('38u0g71k9jtoyyealpxg7viiait0y3a8', '.eJxVjMsOwiAQAP-FsyHl7Xr07jeQhd1K1UBS2pPx3w1JD3qdmcxbRNy3EvfOa1xIXEQQp1-WMD-5DkEPrPcmc6vbuiQ5EnnYLm-N-HU92r9BwV7G1p8NJrCsPRAD4OwYyZmJEUATOI05WE45KWt8cMmxms2EIWB2bJT4fAH1FzhE:1lX0DL:C-HXG99d5RZNVWDZYHVg9PLFZJlsP1OZG-Nuiprox44', '2021-04-29 11:31:15.158214+00'),
('472mkzau458eh16fy3w1nt1hsszfiz8l', '.eJxVjMsOwiAQAP-FsyHl7Xr07jeQhd1K1UBS2pPx3w1JD3qdmcxbRNy3EvfOa1xIXEQQp1-WMD-5DkEPrPcmc6vbuiQ5EnnYLm-N-HU92r9BwV7G1p8NJrCsPRAD4OwYyZmJEUATOI05WE45KWt8cMmxms2EIWB2bJT4fAH1FzhE:1lqfKT:knTllETkDoWAiW_i5zFg-WoQGuTTIBPDzZv0vhuxNDg', '2021-06-22 17:15:53.301912+00'),
('b7x0v6r2xj96o4tjy1vfdaj3575kzmvr', '.eJxVjDsOwjAQBe_iGllZf2Kbkp4zRLvrNQmgWIqTCnF3iJQC2jcz76UG3NZx2Josw5TVWYE6_W6E_JB5B_mO861qrvO6TKR3RR-06WvN8rwc7t_BiG381rZI7D2TWEd9DmJAXMgcyGFyAD4Y6hLHEpGBHUNXLHqQZDtIxnhS7w_xLjfG:1lW3AN:cqonxhPQm5SAPXj78ly_o0UDDOJKOdIGjpfRpDTZG0s', '2021-04-26 20:28:15.902629+00'),
('g8s4s1go0ir9cyox47v7mx4kuq4bziky', '.eJxVjEEOwiAQRe_C2pAROkxx6d4zkAGmUjU0Ke3KeHfbpAvd_vfef6vA61LC2mQOY1YXher0u0VOT6k7yA-u90mnqS7zGPWu6IM2fZuyvK6H-3dQuJWtBhwgMVkSg4mtBXbRIDKQyJm8tYbJbILvnAPvuBdvBpewjxgJTKc-X89DNw8:1lZIBT:fCbjAexrdyP_NXVEovoEu8xNuFSZGMALzC-fGTEsISY', '2021-05-05 19:06:47.393182+00'),
('g8vgcalodctbfy79yxzlhpa1776vnxan', '.eJxVjEEOwiAQRe_C2hBsgUGX7j0DGWYYqRpISrsy3l2bdKHb_977LxVxXUpce57jxOqsQB1-t4T0yHUDfMd6a5paXeYp6U3RO-362jg_L7v7d1Cwl28tQiMNzNbxkZAZhcMpiEnIKTgL3omz4kNARpMRiIz3KUOwAJDHQb0_MmA5Ow:1lqfmu:EWnufPd897loo8hXIWtor1jQmlRCIYwS4_fau1aW2bI', '2021-06-22 17:45:16.698009+00'),
('maanh8uuszx3mr6w0leuhq9ecb74wr0d', '.eJxVjEEOwiAQRe_C2pAROkxx6d4zkAGmUjU0Ke3KeHfbpAvd_vfef6vA61LC2mQOY1YXher0u0VOT6k7yA-u90mnqS7zGPWu6IM2fZuyvK6H-3dQuJWtBhwgMVkSg4mtBXbRIDKQyJm8tYbJbILvnAPvuBdvBpewjxgJTKc-X89DNw8:1laGiI:rEOa90ixuHWdGq3M-ZYWozincFkryHhoX4hPEXIOkXY', '2021-05-08 11:44:42.986521+00'),
('mwdyxaccybfy1h2mpyt1ai7jlyjoaa8z', '.eJxVjMsOwiAQRf-FtSGAUx4u3fcbyAxMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJcxYXAeL0uxGmB9cd5DvWW5Op1XWZSe6KPGiXY8v8vB7u30HBXr61t4O2ZNGyD3qY2CF4ZQ1YBIUYknZgwASlyU2YGSmfnWYM7AIzaRDvD8wiN9c:1lqfsd:PEXLUxrXujm43645OE6DKju0plXOWyd0FbuXlclIm9E', '2021-06-22 17:51:11.861016+00'),
('pitw75pj8w3dtwkrfnd97375plb4gw49', '.eJxVjMEOwiAQRP-FsyG7CEI9eu83EBYWqRpISnsy_rtt0oMmc5r3Zt7Ch3Upfu08-ymJqzDi9NtRiE-uO0iPUO9NxlaXeSK5K_KgXY4t8et2uH8HJfSyrTO4C0XAwBYcg9UalEVyLiMpSDQAIxraYgcGNBzOmhQq47JTnK34fAHMBDcu:1lqhOm:HnV86z09Sc81sNAsWiTwVWnPTIoNNR_mKBi-S9tvJxs', '2021-06-22 19:28:28.285486+00'),
('s27mswchm9mznsbxpb9d4zw9hwjim42y', '.eJxVjMsOwiAQAP-FsyHl7Xr07jeQhd1K1UBS2pPx3w1JD3qdmcxbRNy3EvfOa1xIXEQQp1-WMD-5DkEPrPcmc6vbuiQ5EnnYLm-N-HU92r9BwV7G1p8NJrCsPRAD4OwYyZmJEUATOI05WE45KWt8cMmxms2EIWB2bJT4fAH1FzhE:1lX1OR:v2N0uboBpSMsqXuwmlgQ80hC4ScNyrAJuc1Yfv9bG2U', '2021-04-29 12:46:47.908018+00'),
('u5gkuznosnai76ee778ox3197nkxvjj1', '.eJxVjDsOgzAQRO_iOrLAxp9NmZ4zWOvdJSaJQMJQRbl7QKJIypn3Zt4q4baWtFVZ0sjqqlp1-e0y0lOmA_ADp_usaZ7WZcz6UPRJq-5nltftdP8OCtayr9ENHgwgEgeUFsTmwINYsh1AjLAn6zvwJjgjTRcbjuzJsRWyxDmqzxf3kjhW:1lWPpQ:s-r4kyc-1_L8STRlKV8UsoL85wDTPYIue79TcvemtTc', '2021-04-27 20:40:08.53813+00'),
('u86ckzt46h3ni2q1ylqleeymazkbbj44', '.eJxVjMsOwiAQAP-FsyHl7Xr07jeQhd1K1UBS2pPx3w1JD3qdmcxbRNy3EvfOa1xIXEQQp1-WMD-5DkEPrPcmc6vbuiQ5EnnYLm-N-HU92r9BwV7G1p8NJrCsPRAD4OwYyZmJEUATOI05WE45KWt8cMmxms2EIWB2bJT4fAH1FzhE:1lqewM:WTcY0tKtIxFzJgJRtsgwj8JllCKRYDKbuca5mSmY7L8', '2021-06-22 16:50:58.303327+00'),
('vxo4x106ph9g90l1a620efg4oes6e0o2', '.eJxVjEEOwiAQRe_C2hCowKBL956BDMyMVA1NSrsy3l2bdKHb_977L5VwXWpaO89pJHVWTh1-t4zlwW0DdMd2m3SZ2jKPWW-K3mnX14n4edndv4OKvX7r6FCOQIEs2MA8eCTILkDATMbEiMiebCHrHDkRocGfQCKYEgKxF_X-APf2OKU:1lcCV5:W1endHa_f0_9FimfdkEkjXszToNcDQknpKxLZmdRSbY', '2021-05-13 19:39:03.068761+00'),
('w80j05kw7qpphcswxi9hemqo8vyuzv68', '.eJxVjMEOwiAQRP-FsyG7CEI9eu83EBYWqRpISnsy_rtt0oMmc5r3Zt7Ch3Upfu08-ymJqzDi9NtRiE-uO0iPUO9NxlaXeSK5K_KgXY4t8et2uH8HJfSyrTO4C0XAwBYcg9UalEVyLiMpSDQAIxraYgcGNBzOmhQq47JTnK34fAHMBDcu:1lqh5u:baIW7QfxwSG9b253NHiZFaZmV-ILOc63zJIS5cgCyMg', '2021-06-22 19:08:58.602341+00'),
('xp9hbia5ze0nakuwy1dlh3wa5yducx1h', '.eJxVjEEOwiAQRe_C2hCowKBL956BDMyMVA1NSrsy3l2bdKHb_977L5VwXWpaO89pJHVWTh1-t4zlwW0DdMd2m3SZ2jKPWW-K3mnX14n4edndv4OKvX7r6FCOQIEs2MA8eCTILkDATMbEiMiebCHrHDkRocGfQCKYEgKxF_X-APf2OKU:1lZIAj:GJq1D20lFDlYmFWrNU_uxldGzN_0o9h16nNPG_Ec2tE', '2021-05-05 19:06:01.611216+00'),
('z7532gsfoeovoordauoihijgeo9c136a', '.eJxVjEEOwiAQRe_C2hBKywy4dO8ZCAODVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-TuIsRnH63SjEB9cdpHuotyZjq-syk9wVedAury3x83K4fwcl9PKtw4jZJCSNWWUFlmJgQ6iijowWDLPRbogGcARtYeBJGSYCcBYn7bR4fwDsSDdb:1lWLf2:ZqnahZ62JKYW3_vLG1jD75Ewsjww7VpXls8P3MWpRUI', '2021-04-27 16:13:08.502999+00'),
('z9nlvvlv89mp6bx9lw9dq9bxd8x4wlgu', '.eJxVjEEOwiAQRe_C2pAROkxx6d4zkAGmUjU0Ke3KeHfbpAvd_vfef6vA61LC2mQOY1YXher0u0VOT6k7yA-u90mnqS7zGPWu6IM2fZuyvK6H-3dQuJWtBhwgMVkSg4mtBXbRIDKQyJm8tYbJbILvnAPvuBdvBpewjxgJTKc-X89DNw8:1ljhhe:Vsf1vC5XBmcuCTLuPwR2ko1HD0_zeHKjeqsJUF7b18g', '2021-06-03 12:23:02.698742+00');

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

INSERT INTO "public"."graphql_auth_userstatus" ("id", "verified", "archived", "secondary_email", "user_id") VALUES
(2, 'f', 'f', NULL, 2),
(3, 'f', 'f', NULL, 3),
(4, 'f', 'f', NULL, 4),
(5, 'f', 'f', NULL, 5),
(6, 'f', 'f', NULL, 6),
(7, 'f', 'f', NULL, 7),
(8, 'f', 'f', NULL, 8),
(9, 'f', 'f', NULL, 9);

ALTER TABLE "public"."auth_group_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id");
ALTER TABLE "public"."auth_user_groups" ADD FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id");
ALTER TABLE "public"."auth_user_groups" ADD FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id");
ALTER TABLE "public"."auth_user_user_permissions" ADD FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id");
ALTER TABLE "public"."auth_user_user_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id");
ALTER TABLE "public"."django_admin_log" ADD FOREIGN KEY ("user_id") REFERENCES "public"."enroll_user"("id");
ALTER TABLE "public"."django_admin_log" ADD FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id");
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
ALTER TABLE "public"."graphql_auth_userstatus" ADD FOREIGN KEY ("user_id") REFERENCES "public"."enroll_user"("id");
CREATE VIEW "public"."pg_stat_statements" AS SELECT pg_stat_statements.userid,
    pg_stat_statements.dbid,
    pg_stat_statements.queryid,
    pg_stat_statements.query,
    pg_stat_statements.calls,
    pg_stat_statements.total_time,
    pg_stat_statements.min_time,
    pg_stat_statements.max_time,
    pg_stat_statements.mean_time,
    pg_stat_statements.stddev_time,
    pg_stat_statements.rows,
    pg_stat_statements.shared_blks_hit,
    pg_stat_statements.shared_blks_read,
    pg_stat_statements.shared_blks_dirtied,
    pg_stat_statements.shared_blks_written,
    pg_stat_statements.local_blks_hit,
    pg_stat_statements.local_blks_read,
    pg_stat_statements.local_blks_dirtied,
    pg_stat_statements.local_blks_written,
    pg_stat_statements.temp_blks_read,
    pg_stat_statements.temp_blks_written,
    pg_stat_statements.blk_read_time,
    pg_stat_statements.blk_write_time
   FROM pg_stat_statements(true) pg_stat_statements(userid, dbid, queryid, query, calls, total_time, min_time, max_time, mean_time, stddev_time, rows, shared_blks_hit, shared_blks_read, shared_blks_dirtied, shared_blks_written, local_blks_hit, local_blks_read, local_blks_dirtied, local_blks_written, temp_blks_read, temp_blks_written, blk_read_time, blk_write_time);
ALTER TABLE "public"."refresh_token_refreshtoken" ADD FOREIGN KEY ("user_id") REFERENCES "public"."enroll_usermodel"("id");
