
--ASSIGNMENT : 03

--SELECT 
--		username, 
--		default_tablespace, 
--		profile, 
--		authentication_type
--	FROM
--		dba_users 
--	WHERE 
--		account_status = 'OPEN'
--	ORDER BY
--		username;
--1.Display all the information of the EMP table?
SELECT * FROM emp;
--2. Display unique Jobs from EMP table?
SELECT UNIQUE job from emp;
--3.List the emps in the asc order of their Salaries?
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
ORDER BY
    sal;
--4.List the details of the emps in asc order of the Dptnos and desc of Jobs?
SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
FROM
    emp
ORDER BY
   deptno ASC,job DESC;
--5  Display all the unique job groups in the descending order?
SELECT UNIQUE job FROM emp
ORDER BY job DESC;
--6. Display all the details of all ‘Mgrs’
    SELECT 

    empno,ename,job,mgr,sal,comm,deptno
FROM
    emp
    WHERE empno IN (SELECT mgr from emp);

7. List the emps who joined before 1981
SELECT 
    empno,ename,job,sal,comm,deptno
FROM 
    emp
WHERE hiredate < ('01-jan-81');
--8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
SELECT 
    empno,ename,sal,ROUND(sal/30,2) AS dailysal,12*sal AS annsal
FROM
    emp
ORDER BY
    annsal asc;
--9. Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT empno,ename,job,hiredate,ROUND(months_between(sysdate,hiredate)/12,0) year
from 
emp;
--10.List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT 
    empno,ename,job,hiredate,ROUND(months_between(sysdate,hiredate)/12,0) year
FROM 
    emp
    WHERE mgr=7369;
 
--11. Display all the details of the emps whose Comm  Is more than their Sal   
SELECT 
    empno,ename,job,sal,comm,deptno
FROM 
    emp
    WHERE
    comm>sal;

--12. List the emps along with their Exp and Daily Sal is more than Rs 100
SELECT 
  *
FROM
    emp
    WHERE
    sal/30 > 100;

--13. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT  * FROM emp
    WHERE
    job='CLERK' OR job='ANALYST'
    ORDER BY
    job DESC;

--14. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority

SELECT  * FROM emp
    WHERE 
    hiredate IN ('1-may-81','3-dec-81','17-dec-81','19-jan-80 ')
    ORDER BY
    hiredate ASC;
    
--15. List the emp who are working for the Deptno 10 or20
SELECT * FROM emp
    WHERE
    deptno = 20 OR deptno =10;
--16. List the emps who are joined in the year 81
SELECT * FROM emp
    WHERE
    hiredate like '%81';

--17. List the emps Who Annual sal ranging from 22000 and 45000
SELECT 
    empno,ename,sal,12*sal AS annsal
FROM 
    emp
    WHERE 
    12*sal  BETWEEN 22000 and 45000;
--18. List the Enames those are having five characters in their Names
SELECT 
    empno,ename,sal,comm
FROM
    emp
    WHERE length(ename)=5;
--19. List the Enames those are starting with ‘S’ and with five characters
SELECT 
    empno,ename,sal,comm
FROM
    emp
    WHERE length(ename)=5 AND ename like 'S%';
--20. List the emps those are having four chars and third character must be ‘r’
SELECT 
    empno,ename,sal,comm
FROM
    emp
    WHERE length(ename)=4 AND ename like '__R%';
--21. List the Five character names starting with ‘S’ and ending with ‘H’
SELECT 
    empno,ename,sal,comm
FROM
    emp
    WHERE ename like 'S%H';
--22. List the emps who joined in January
SELECT 
    empno,ename,sal,comm,hiredate
FROM
    emp
    WHERE
    to_char(hiredate,'mon')='jan';
    
--23. List the emps whose names having a character set ‘ll’ together

SELECT 
    empno,ename,sal,comm
FROM
    emp
    WHERE ename like '%LL%';
--24. List the emps who does not belong to Deptno 20
SELECT * FROM emp
WHERE deptno <> 20;
--25. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries
SELECT * FROM emp
WHERE job <>'PRESIDENT' AND job <> 'MANAGER' 
ORDER BY sal ASC;
--26. List the emps whose Empno not starting with digit78
SELECT * FROM emp
WHERE empno NOT LIKE '78%';
--27. List the emps who are working under ‘MGR’
SELECT * FROM emp
WHERE empno  IN (SELECT mgr FROM EMP); 

--28.List the emps who joined in any year but not belongs to the month of March
SELECT * from emp
WHERE TO_CHAR(hiredate,'mon')<>'mar';
--29. List all the Clerks of Deptno 20
SELECT * FROM emp 
WHERE deptno=20 AND job='CLERK';
--30. List the emps of Deptno 30 or 10 joined in the year 1981
SELECT * FROM emp
WHERE to_char(hiredate,'YYYY')='1981' AND (deptno=10 OR deptno=30);
--31. Display the details of SMITH
SELECT * FROM emp
WHERE ename='SMITH';
