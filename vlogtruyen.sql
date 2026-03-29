create database vlogtruyen;

use vlogtruyen;

create table users(
id int auto_increment primary key,
username varchar(255) not null,
password varchar(255) not null,
role int not null
);

create table roles (
id int auto_increment primary key,
name varchar(50) not null
);

insert into roles (name) values ("admin");
insert into roles (name) values ("user");
select * from roles;
 insert into users (username, password, role) values ("admin", "$2a$10$t6bkpk4e1eYYFO0a8S2Sju75wyquvgIizt6xCgdteBuMvQJGDh.CG", 1);
select * from users;

create table stories (
id int auto_increment primary key, 
title varchar(255) not null,
author varchar(255) ,
description text,
cover_image varchar(500),
status enum('active', 'paused', 'completed'),
created_at timestamp default current_timestamp
);

select * from stories;

create table chapters (
id int auto_increment primary key,
story_id int not null,
name varchar(255),
chapter_number int,
created_at timestamp default current_timestamp,
foreign key (story_id) references stories(id) on delete cascade
);
select * from chapters;

create table chapter_images(
id int auto_increment primary key,
chapter_id int not null,
image_url varchar(500),
image_order int,
foreign key (chapter_id) references chapters(id) on delete cascade
);
select * from chapter_images;


-- drop database vlogtruyen;