﻿--第六章--------------------------------------------------
--1显示平均工资为>2000的职位
select job ,avg(sal) from emp group by job having avg(sal)>2000;
--2. 计算工资在 2000以上，各种职位的平均工资大于 3000的职位及平均工资
select job ,avg(sal) from emp where sal>2000 group by job having avg(sal)>3000;
--3. 找每个部门的最高和最低的工资
select dept.dname, max(emp.sal),min(emp.sal)
 from emp join  dept on emp.deptno = dept.deptno group by dept.dname;
--4. 找每个部门中每种职位的最高和最低的工资
select max(emp.sal),min(emp.sal),dept.dname,emp.job from emp join dept 
on emp.deptno = dept.deptno group by emp.job,dept.dname;
--5. 显示出工作名称(job)中包含"MAN"的员工平均工资，最高工资，最低工资及工资的和
select job, avg(sal) ,min(sal),max(sal),sum(sal)
 from emp where job like '%MAN%' 
group by job;
--6. 显示出 20号部门的员工人数
select count(*) from emp where deptno = 20 ;
--7. 显示出平均工资大于 2000的部门名称及平均工资
select dept.dname ,avg(emp.sal) from emp join dept on emp.deptno = dept.deptno
group by dept.dname having avg(emp.sal)>2000;
--8. 显示每个部门每种工作平均工资大于 2500的部门及工作
select dept.dname , emp.job  from emp join dept on emp.deptno=dept.deptno
group by emp.job,dept.dname  having avg(emp.sal)>2500;
--9. 显示出工作名称中包含"MAN"，并且平均工资大于 1000的工作名称及平均工资
select job,avg(sal) from emp where job like '%MAN%' group by job having avg(sal)>1000;
--10. 显示出平均工资最高的部门平均工资
select max(avg(sal)) from emp group by deptno;
--11. 列出最低工资大于 1500的各种工作
select job from emp group by job having min(sal)>1500;
--12. 列出各部门的员工数量及平均工作年限
select deptno,count(*),round(avg(months_between(sysdate,hiredate)/12))
 "平均工作年限"
from emp
group by deptno;
