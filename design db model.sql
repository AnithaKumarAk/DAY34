create database zenclass;

use zenclass;

-- create user table
create table users( 
           user_id int auto_increment primary key,
           user_name varchar(255),
           email varchar(255),
           createdAt datetime,
           batch int
           );

show tables;
desc users;

-- insert users
insert into users(user_name,email,createdAt,batch) values 
('Anitha','anitha@gmail.com',current_timestamp(),1),
('Ash','ash@gmail.com',current_timestamp(),2),
('Suba','suba@gmail.com',current_timestamp(),3),
('Asmi','asmi@gmail.com',current_timestamp(),4),
('Arthi','arthi@gmail.com',current_timestamp(),5);

select * from users;

-- create codekata table
create table codekata(
         code_id int auto_increment primary key,
         user_id int,
         number_of_problem int,
         status_problem varchar(255),
         foreign key (user_id) references users(user_id)
         );
desc codekata;

-- insert value into codekata table
insert into codekata(user_id,number_of_problem,status_problem) values
(1,30,'Pending'),
(2,30,'Pending'),
(3,30,'Finished'),
(4,30,'Pending'),
(5,30,'Finished');
select * from codekata;

-- create company drives table
create table company_drives (
           drive_id int auto_increment primary key,
           user_id int,
           drive_date date,
           company varchar(100),
           foreign key (user_id) references users(user_id)
           );
desc company_drives;
-- insert value into company drives table
insert into company_drives(user_id, drive_date,company) values 
(1,makedate(2024,16),'Accenture'),
(2,makedate(2024,20),'Apple'),
(3,makedate(2024,17),'Amazon'),
(4,makedate(2024,25),'CTS'),
(5,makedate(2024,15),'TCS');
select * from company_drives;

-- create batch data table
create table batch_data (
            batch_id int auto_increment primary key,
            batch_name varchar(100)
            );
desc batch_data;

-- insert value into batch data table
insert into batch_data(batch_name) values 
('fsd-2022'),
('fsd-2023'),
('fsd-2024'),
('ds-2023'),
('ds-2024');
select * from batch_data;

-- create mentors table
create table mentors(
           mentor_id int auto_increment primary key,
           mentor_name varchar(100),
           mentor_email varchar(100)
           );
desc mentors;
-- insert values into mentors tables
insert into mentors (mentor_name,mentor_email) values
('Kowsi','kowsi@gmail.com'),
('Sanjay','sanjay@gmail.com'),
('PraveenKanth','pk@gmail.com'),
('Arun','arun@gmail.com'),
('Abitha','abi@gmail.com');
select * from mentors;

-- create topic table
create table topics (
            topic_id int auto_increment primary key,
            topic varchar(100),
            topic_date date,
            mentorid int,
            foreign key (mentorid) references mentors(mentor_id)
            );
desc topics;
-- insert values into topics table
insert into topics (topic,topic_date,mentorid) values
('HTML',makedate(2023,10),1),
('JS',makedate(2023,11),2),
('REACT',makedate(2023,12),3),
('mySQL',makedate(2023,13),4),
('Nodejs',makedate(2023,14),5);
select * from topics;

-- create task table
create table task(
           taskid int auto_increment primary key, 
           topicid int, 
           task varchar(1000), 
           batch_id int, 
           foreign key (topicid) references topics(topic_id)
           );
desc task;
-- insert values into task table
insert into task(topicid, task, batch_id ) values 
(1, 'HTML Task', 1), 
(2, 'JS Task', 2),
(3, 'REACT Task',3), 
(4, 'mySQL Task',4), 
(5, 'Nodejs task',5);
select * from task;

-- create attendance table
create table attendance (
              attendanceid int auto_increment primary key, 
              user_id int, 
              topics_id int, 
              attended boolean, 
              foreign key ( user_id) references users( user_id), 
              foreign key (topics_id) references topics(topic_id)
              );
desc attendance;
-- insert values into attendance table
insert into attendance( user_id, topics_id, attended) values 
(1, 3, true), 
(2, 1, true), 
(3, 2, false), 
(4, 4, true), 
(5, 4, false);
select * from attendance;