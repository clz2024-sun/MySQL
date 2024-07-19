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
where first_name like 'L___';

select 	first_name
		salary
from employees
where first_name like '%L';

select 	first_name
		salary
from employees
where first_name like '%L%';

#이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select 	first_name,
		salary
from employees
where first_name like '%am%';

#이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select 	first_name,
		salary
from employees
where first_name like '_a%';

#이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select *
from employees
where first_name like '___a%';

#이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 
#이름을 출력하세요
select 	first_name
from employees
where first_name like '__a_';

-- null
select *
from employees
where salary >= 13000
and salary <= 15000
; 

-- null 은 계산되지 않는다(계속 null)
-- 수당을 계산계하세요(between 13000 and 15000)
select 	first_name,
		salary,
        commission_pct,
        salary * commission_pct + 200  수당  
from employees
where salary between 13000 and 15000; 

select 	first_name,
		salary,
		commission_pct,
        salary * commission_pct 수당
from employees
where commission_pct is not null  -- 주의: commission_pct != null 
and salary >= 13000
and salary <= 15000;

#커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select 	first_name,
		salary,
		commission_pct
from employees
where commission_pct is not null;

#담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select 	first_name,
		manager_id,
        commission_pct
from employees
where manager_id is null
and commission_pct is null;

#부서가 없는 직원의 이름과 월급을 출력하세요
select 	first_name,
		salary,
		department_id
from employees
where department_id is null;

-- order by 절
#직원의 이름과 월급을 월급이 많은 직원부터 출력하세요
select 	first_name,
		salary
from employees
order by salary asc; -- asc:오름차순, desc:내림차순

#월급이 9000이상(where절)인 직원의 이름과 월급(select절)을 월급이 많은 직원(order by절)부터 출력하세요
select 	first_name,
		salary
from employees
where salary >= 9000
order by salary desc
;

-- 정렬조건 1.월급높은 사람부터 desc, 2.동률일때 이름의 내림차순(Z->A) desc
select 	first_name,
		salary
from employees
where salary >= 9000
order by salary desc, first_name desc 
;


#부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select *
from employees;

#월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select 	first_name,
		salary
from employees
where salary >= 10000
order by salary desc;

select * from employees;


#부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 
#부서번호 월급 이름을 출력하세요  
select 	department_id,
		salary,
        first_name
from employees
order by department_id asc, salary desc
;


#직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select 	first_name,
		salary,
        hire_date
from employees
order by first_name asc;

#직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select 	first_name,
		salary,
        hire_date
from employees
order by hire_date asc; 

-- 실행순서 공부
select 	first_name n,
		salary s
from employees
where salary >= 10000
order by s desc;     -- 가능

-- 실행 안되는 이유 공부
select 	first_name n,
		salary s
from employees
where s >= 10000    -- 불가능
order by salary desc;     

/***************************************
* 단일행 함수
****************************************/
-- 단일행함수 > 숫자함수

-- round() : 반올림
select 	round(123.123, 2),   -- 123.12 2째자리까지표현
		round(123.126, 2),    -- 123.13 3째자리에서반올림
        round(234.567, 0),     -- 235
        round(123.456, 0),     -- 123
        round(123.456),        -- 123
        round(123.126, -1),    -- 120
        round(125.126, -1),     -- 130
        round(125.126, -2)     -- 100
from dual;

-- ceil() : 올림
select 	ceil(123.456),
		ceil(123.789),
        ceil(123.7892313),
        ceil(987.1234)
from dual;

-- floor() : 내림
select 	floor(123.456),
		floor(123.789),
        floor(123.7892313),
        floor(987.1234)
from dual;

-- truncate(): 자리수 버림
select 	truncate(1234.34567, 2),		
		truncate(1234.34567, 3),
        truncate(1234.34567, 0),
        truncate(1235.34567, -2)
from dual;




