-- �������� ������� salary
create table salary(
-- �������� ������� id
	id serial primary key,
-- �������� ������� monthly_salary
	monthly_salary int not null 
);

-- ����� ������� salary
select * from salary;

-- �������� ������� roles
create table roles(
	id serial primary key,
	role_title varchar (30) unique not null
);

-- ����� ������� roles
select * from roles;

-- �������� ������� salary_roles
create table salary_roles(
	id serial primary key,
	id_role int unique not null,
	id_salary int not null,
-- �������� � id_role �� ������� salary_roles ������� id �� ������� roles
	foreign key (id_role)
		references roles(id),
-- �������� � id_salary �� ������� salary_roles ������� id �� ������� salary		
	foreign key (id_salary)
		references salary(id)
);

-- ����� ������� salary_roles
select * from salary_roles
-- ������������� id �� �����������
order by(id);

-- ��������� ������� salary � ������� monthly_salary
insert into salary(monthly_salary)
values(1200),
	  (1300),
	  (1400),
	  (1500),
	  (1600),
	  (1700),
	  (1800),
	  (1900),
	  (5000);
	  
-- ��������� ������� roles � ������� role_title
insert into roles(role_title)
values('QA_manual_junior'),
	  ('QA_manual_middle'),
	  ('QA_manual_senior'),
	  ('QA_automation_junior'),
	  ('QA_automation_middle'),
	  ('QA_automation_senior'),
	  ('Developer_Java_junior'),
	  ('Developer_Java_middle'),
	  ('Developer_Java_senior'),
	  ('Developer_Python_junior'),
	  ('Developer_Python_middle'),
	  ('Developer_Python_senior'),
	  ('HR'),
	  ('Designer'),
	  ('Manager');
	 
-- ��������� ������� salary_roles � ������� id_role � id_salary
insert into salary_roles(id_role, id_salary)
values(1, 1),
	  (2, 4),
	  (3, 2),
	  (4, 6),
	  (5, 8),
	  (6, 3),
	  (7, 8),
	  (8, 5),
	  (9, 9);

-- ��������� (��������) ������� salary_roles � ������� id_role � id_salary
insert into salary_roles(id_role, id_salary)
values(12, 3);
	
--�������� ������� devices � ������� salary_roles
alter table salary_roles
add column devices varchar(50);

-- ������� ������� devices �� ������� salary_roles
alter table salary_roles
drop column  devices;

-- ������� id=5 �� ������� salary_roles
delete from salary_roles
where  id=5;

-- �������� id=7 �� id=5
update salary_roles
set id=5
where id = 7;

-- �������� ������� parking � ������� roles
alter table roles
add column parking int;

-- ��������� �������� ��������
alter table roles 
rename column parking to taxi;

-- ��������� ���� ������ ������� 
alter table roles 
alter column taxi type int using taxi::integer;

-- ��������� ���� ������ ������� 
alter table roles 
alter column taxi type varchar(40) using taxi::varchar(30);

-- ����� ������� roles
select * from roles;


-- ������� �������
--drop table salary_roles;


