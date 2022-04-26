--Joins Sql Queries--

select * from EMPLOYEE_DETAIL_TBL

Create table Project_Detail_TBL(ProjectDetail_ID int primary key identity, 
EmployeeDetail_ID int foreign key references EMPLOYEE_DETAIL_TBL(EmployeeID), 
ProjectName varchar(50))

insert into Project_Detail_TBL values
(1, 'Task Track'),
(1, 'CLP'),
(1, 'Survey Management'),
(2, 'HR Management'),
(3, 'Task Track'),
(3, 'GRS'),
(3, 'DDS'),
(4, 'HR Management'),
(6, 'GL Management')


--1. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.

SELECT FName, ProjectName FROM EMPLOYEE_DETAIL_TBL A INNER JOIN Project_Detail_TBL B ON A.EmployeeID = B.EmployeeDetail_ID ORDER BY FName


--Ques 2- Get employee name, project name order by firstname from "EmployeeDetail" and 
--"ProjectDetail" for all employee even they have not assigned project

SELECT FName,ProjectName FROM EMPLOYEE_DETAIL_TBL A LEFT OUTER JOIN Project_Detail_TBL B ON A.EmployeeID = B.EmployeeDetail_ID ORDER BY FName

--Ques 3- Get employee name, project name order by firstname from "EmployeeDetail" and 
--"ProjectDetail" for all employee if project is not assigned then display "-No Project 
--Assigned".

SELECT FName, ISNULL(ProjectName,'No Project Assigned') FROM EMPLOYEE_DETAIL_TBL A LEFT OUTER JOIN Project_Detail_TBL B
ON A.EmployeeID = B.EmployeeDetail_ID ORDER BY FName


--Ques 4- Get all project name even they have not matching any employeeid, in left table, 
--order by firstname from "EmployeeDetail" and "ProjectDetail".SELECT FName,ProjectName FROM EMPLOYEE_DETAIL_TBL A RIGHT OUTER JOIN Project_Detail_TBL B ON A.EmployeeID = B.EmployeeDetail_ID ORDER BY FName--Ques 5- Get complete record(employeename, project name) from both 
--tables([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.SELECT FName,ProjectName FROM EMPLOYEE_DETAIL_TBL A FULL OUTER JOIN Project_Detail_TBL BON A.EmployeeID = B.EmployeeDetail_ID ORDER BY FName
--Ques 6- Write a query to find out the employeename who has not assigned any project, and 
--display "-No Project Assigned".

SELECT FName, ISNULL(ProjectName,'-No Project Assigned') AS ProjectName FROM EMPLOYEE_DETAIL_TBL A LEFT OUTER JOIN Project_Detail_TBL B
ON A.EmployeeID = B.EmployeeDetail_ID
WHERE ProjectName IS NULL

--Ques 7- Write a query to find out the project name which is not assigned to any employee.
SELECT ProjectName FROM EMPLOYEE_DETAIL_TBL A RIGHT OUTER JOIN Project_Detail_TBL B ON A.EmployeeID = B.EmployeeDetail_ID
WHERE FName IS NULL

--Ques 8- Write down the query to fetch EmployeeName and Project who has assign more 
--than one project.Select EmployeeID, FName, ProjectName from EMPLOYEE_DETAIL_TBL E INNER JOIN Project_Detail_TBL P
ON E.EmployeeID = P.EmployeeDetail_ID
WHERE EmployeeID IN (SELECT EmployeeDetail_ID FROM Project_Detail_TBL GROUP BY EmployeeDetail_ID HAVING COUNT(*) >1 )

--Ques 9-Write down the query to fetch ProjectName on which more than one employee are 
--working along with EmployeeName
Select P.ProjectName, E.FName from Project_Detail_TBL P INNER JOIN EMPLOYEE_DETAIL_TBL E
on p.EmployeeDetail_ID = E.EmployeeID where P.ProjectName in(select ProjectName from Project_Detail_TBL group by ProjectName having COUNT(1)>1)
