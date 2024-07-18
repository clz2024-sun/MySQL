/***********************************
select 문(조회)
************************************/

-- *select ~ from 절
-- 테이블 전체 조회하기
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from jobs;
select * from job_history;
SELECT * FROM JOB_HISTORY;
SELECT * fRom joB_History;

-- *select 절
select first_name, phone_number from employees;

-- 모든 직원의 이름(fisrt_name)과 전화번호 입사일 월급을 출력하세요
select first_name, phone_number, hire_date, salary from employees;

-- 모든 직원의 이름(first_name)과 성(last_name), 월급, 전화번호, 이메일, 입사일을 출력하세요
select  email,
		first_name, 
		last_name, 
		phone_number, 
        hire_date,
        salary
from employees;

select   email
		,first_name 
		,hire_date
		,phone_number 
        ,last_name 
		,salary
from employees;

-- * 컬럼명에 별명 사용하기
select first_name as 이름, last_name as 성 from employees;

-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select 	first_name as 이름,
		phone_number as 전화번호,
        hire_date as 입사일,
        salary as 월급
from employees;
-- 별명에 공백, 특수문자인경우 ' 따옴표 사용
select 	first_name as '이름(first_name)',
		phone_number as '전화-번호',
        hire_date as 입사일,
        salary as '월 급'
from employees;

-- as를 생략할수 있다
select 	first_name '이름(first_name)',
		phone_number '전화-번호',
        hire_date 입사일,
        salary '월 급'
from employees;

-- 직원아이디, 이름, 월급을 출력하세요. 
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select 	employee_id as empNo,
		first_name as 'f-name',
        salary as '월 급'
from employees;

-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select 	first_name 이름,
		phone_number 전화번호,
        hire_date 입사일,
        salary 월급
from employees;


-- 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 
-- 월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요

-- *산술연산자
-- 정수/정수 소수점까지 계산됨
select 	salary 월급,
		salary-100 '월급-식대',
		salary*12 연봉,
        salary*12+5000 '연봉+보너스',
        salary/30 '일급',
        employee_id%3 워크샵팀, 
        employee_id/3 
from employees;

-- 문자열은 0으로 계산됨 ->오류가 나지 않으므로 주의
select job_id*12
from employees; 

select *
from employees; 

-- *컬럼 합치기
select first_name, last_name,
       concat(first_name, last_name),
       concat(first_name, last_name) as 이름,
       concat(first_name, '-', last_name) as 이름,
       concat(first_name, ' ', last_name, ' 입사일은 ', hire_date, ' 입니다') 이름2 
from employees;   

-- 전체직원의 정보를 다음과 같이 출력하세요
select 	concat(first_name, '-', last_name) 성명,
		salary 월급,
        salary*12 연봉,
        salary*12+5000 보너스,
		phone_number 전화번호
from employees;

select 	first_name,
		salary,
        now() as 기준일,
        3 as 옵션,
        '자바ex' 회사명
from employees;

-- 테이블명을 생략할때도 있다
select now() ;


-- * where 절

-- 이름 부서아이디 출력하세요
select 	first_name,
		department_id,
        salary
from employees
where department_id = 10;

-- 월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select 	first_name,
		salary
from employees
where salary >= 15000
;

-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select 	first_name,
		hire_date
from employees
where hire_date >= '2007-01-01'
;

-- 이름이 Lex인 직원의 이름과 월급을 출력하세요 
select 	first_name,
		salary
from employees
where first_name = 'lex';

-- 문자열 대소문자를 구별하지 않는다.  구별하려면 binary 사용
select 	first_name,
		salary
from employees
where binary first_name = 'lex';

-- 월급이 14000이상 17000이하인 사원의 이름과 월급을 구하시오
select 	first_name,
		salary
from employees
where salary >= 14000 
and salary <= 17000
;

-- 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select 	first_name,
		salary
from employees
where salary <= 14000
or salary >= 17000
;



-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select 	first_name,
		hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31'
;

-- * BETWEEN 연산자로 특정구간 값 출력하기
-- 월급이 14000 이상 17000이하인 사원의 이름과 월급을 구하시오
select 	first_name,
		salary
from employees
where salary >= 14000
and salary <= 17000
;

select 	first_name,
		salary
from employees
where salary between 14000 and 17000 
;

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select 	first_name,
		salary	
from employees
where salary = 2100
or    salary = 3100
or	  salary = 4100
or    salary = 5100
;

select 	first_name,
		salary	
from employees
where salary in(2100, 3100, 4100, 5100) 
;

-- Neena, Lex, John 의 이름, 성, 월급의 구하시오
select 	first_name,
		last_name,
		salary
from employees
where first_name in('Neena', 'Lex', 'John')
;


