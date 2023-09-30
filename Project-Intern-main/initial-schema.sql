create database cit_project;
use cit_project;

create table staff (
  staff_id integer primary key auto_increment not null,
  username varchar(30) unique not null,
  email varchar(255) unique not null,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  passwd text not null,
  dept varchar(10),
  created_at timestamp default CURRENT_TIMESTAMP
);

CREATE TABLE student (
  student_id integer PRIMARY KEY AUTO_INCREMENT not null,
  rollno varchar(15) UNIQUE not null,
  email varchar(255) unique not null,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  passwd text not null,
  dob date,
  course varchar(5),
  dept varchar(10),
  batch_start_year integer,
  batch_end_year integer,
  created_at timestamp default CURRENT_TIMESTAMP
);

CREATE TABLE event (
  event_id integer PRIMARY KEY AUTO_INCREMENT not null,
  student_id integer not null REFERENCES student,
  event_name varchar(50) not null,
  event_type_id integer not null references event_type,
  date_of_event datetime COMMENT 'completion date for course type event',
  duration integer COMMENT 'Number of days',
  result_id integer COMMENT 'null for webinar and course',
  file text COMMENT 'Proof of participation',
  modified_at timestamp default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp default CURRENT_TIMESTAMP
);

create table event_type (
  event_type_id integer primary key auto_increment not null,
  event_type_name varchar(30) not null
);

insert into event_type(event_type_name) values
    ('Seminar'),
    ('Webinar'),
    ('Workshop'),
    ('Course Certification'),
    ('Hackathon'),
    ('Coding Contest');

create table result (
  result_id integer primary key auto_increment not null,
  result_status varchar(15) not null
);

insert into result(result_status) values
	('Winner'),
    ('Runner'),
    ('Participant');
