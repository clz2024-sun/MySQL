/***************************************
* 복습
****************************************/
-- 기본구조 select문 =  select절, from절
select * 
from employees;

-- 특수한경우
select now() from dual; -- 가상의 테이블 dual
select now();  -- mysql에서만 가능

-- 4칙연산
-- 사친연산 가능, as생략가능
select 	first_name 'f-name', 
		salary as 월급,
		salary*12 '연 봉'  
from employees;

-- 컬럼 합치기
select  first_name 이름,
		last_name 성,
		concat(first_name, " ", last_name) 성명    
from employees;

-- where 절
select 	first_name,
		salary
from employees
where salary >= 17000;

-- 비교연산자, 조건이여러개일때, between, in
-- --------------------------------------
/***************************************
* 2일차
****************************************/
select 	first_name,
		salary
from employees
where first_name = 'Lex';

select 	first_name
		salary
from employees
where first_name like 'L%';

