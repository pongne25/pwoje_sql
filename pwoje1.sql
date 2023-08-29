create database to_do_list character set 'utf8';
grant all privileges on to_do_list.* to 'melissa'@'localhost';
use to_do_list;

create table tasks(
	task_id int primary key auto_increment,
    task_name varchar(30),
    description_tasks varchar(50),
    due_date datetime,
    status_tasks varchar(10)
);

insert into tasks(task_id, task_name, description_tasks, due_date,status_tasks)
	values(1, 'dentiste', 'prendre rendez-vous avec le dentiste', '2023-08-20 06:54:00','completed' ),
		  (2, 'repas', 'preparer le repas pour tout le monde', '2023-08-28 08:00:00', 'completed' ),
          (3, 'coder', 'rediger les tp SQL', '2023-08-29 12:30:00', 'pending' ),
          (4, 'appel', 'appeler mes parents', '2023-08-30 06:00:00', 'pending' ),
          (5, 'sommeil', 'etablir une routine de sommeil adequate', '2023-08-30 07:30:00', 'pending' );

		-- REKET
select * from tasks;
select*from tasks where status_tasks='pending';
update tasks set due_date='2023-09-03 06:00:00' where task_id=3;
		select* from tasks where datediff(now(), '2023-09-03 06:00:00');
select*from tasks where status_tasks='completed';
		
        -- MODIFIKASYON
UPDATE tasks set status_tasks='completed' where task_id=3;

			-- DEFI
 Alter table tasks add priority int not null;
Update tasks set priority = 1 where task_id=2;
Update tasks set priority = 2 where task_id=3;
Update tasks set priority = 1 where task_id=4;
Update tasks set priority = 3 where task_id=1;
Update tasks set priority = 4 where task_id=5;

create table categories(
	task_id2 int ,
	category_name varchar(10),
    foreign key (task_id2) references tasks(task_id) on delete cascade on update cascade
);

select* from tasks where priority=1 ;

delete from tasks where status_tasks='completed';