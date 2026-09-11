create table dep (
    idDep integer primary key, 
    nDep varchar(14), 
    loc varchar(20));

create table emp (
    idEmp integer primary key, 
    nEmp varchar(20) NOT NULL, 
    metier varchar(10),
    idMgr integer, 
    dateEmb date, 
    sal numeric(7,2),
    comm numeric(7,2),
    idDep integer references dep);
 
create table grille (
    grade integer primary key, 
    losal numeric(7) NOT NULL, 
    hisal numeric(7) NOT NULL);
 
    

insert into dep values (10,'ACCOUNTING','NEW YORK');
insert into dep values (20,'RESEARCH','DALLAS');
insert into dep values (30,'SALES','CHICAGO');
insert into dep values (40,'OPERATIONS','BOSTON');



insert into grille values (1, 700, 1200);
insert into grille values (2, 1201, 1400);
insert into grille values (3, 1401, 2000);
insert into grille values (4, 2001, 3000);
insert into grille values (5, 3001, 9999);
	
insert into emp values (7369,'SMITH','CLERK',7902,'17-DEC-80',812.24,null,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1645.85,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,'22-FEB-81',1253.12,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,'02-APR-81',2975.24,null,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1251.45,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,'01-MAY-81',2852.56,null,30);
insert into emp values (7782,'CLARK','MANAGER',7839,'09-JUN-81',2455.92,null,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,'09-DEC-82',3034.62,null,20);
insert into emp values (7839,'KING','PRESIDENT',null,'17-NOV-81',5000.00,null,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,'08-SEP-81',1578.45,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,'12-JAN-83',1104.67,null,20);
insert into emp values (7900,'JAMES','CLERK',7698,'03-DEC-81',953.65,null,30);
insert into emp values (7902,'FORD','ANALYST',7566,'03-DEC-81',3056.33,null,20);
insert into emp values (7934,'MILLER','CLERK',7782,'23-JAN-82',1305.45,null,10);