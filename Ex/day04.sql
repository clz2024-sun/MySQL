/***********************************************
* 04일차 수업
***********************************************/
-- ------------------------------
# inner join (equi join)
-- ------------------------------
-- where 절 사용한 equi join
-- 테이블이 2개일때
-- 보통 테이블 갯수 -1개의 where절이 발생
select 	e.first_name,
        e.salary,
        d.department_name,
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id
;

-- where 절 사용한 equi join
-- 테이블이 3개일때
-- 테이블 갯수 -1개  where절이 발생
select 	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id,
        l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;


-- inner join 사용한 equi join
-- 테이블이 2개일때
select 	e.first_name,
        e.salary,
        d.department_name,
        e.department_id,
        d.department_id
from employees e inner join departments d
on e.department_id = d.department_id;


-- inner join 사용한 equi join
-- 테이블이 3개일때
select 	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id,
        l.city
from employees e 
inner join departments d 
	on e.department_id = d.department_id
inner join locations l 
	on d.location_id = l.location_id;

-- ------------------------------------------

-- ------------------------------
# left outer join
-- ------------------------------
-- 왼쪽 테이블을 기준 ,기준테이블의 정보는 다 보여줌
-- (Kimberely 가 결과에 있어야 함:소속부서가 없는 직원)
select 	e.first_name,
		e.salary,
        d.department_name,
        e.department_id
from employees e 
left outer join departments d
	on e.department_id = d.department_id
;

-- ------------------------------
# right outer join
-- ------------------------------
--  오른쪽 테이블을 기준으로 조인
-- (Treasury, Corporate Tax 등 16개의 부서명이 결과에 있어야함:부서인원이 없는 부서명 )
select 	e.first_name,
		e.salary,
        d.department_name,
        e.department_id
from employees e 
right outer join departments d
	on e.department_id = d.department_id
;

-- ------------------------------
# right outer join --> left outer join
-- ------------------------------
-- 테이블의 위치를 바꾸고 기준테이블의 위치를 바꾸면 동일하게 사용할 수 있다
select 	e.first_name,
		e.salary,
        d.department_name,
        e.department_id
from departments d
left outer join employees e
	on e.department_id = d.department_id
;

-- ------------------------------
# full outer join
-- ------------------------------
-- mysql은 full outer join 문법이 없음
-- 그래서 각각의 결과를 구해서 합쳐야 함(union) 
(-- left조인
select 	e.employee_id,
		e.first_name,       
        e.department_id,
        d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
)
union
(-- right조인
select 	e.employee_id,
		e.first_name,
        d.department_id,
        d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id
)
;

# 조인 연습(equi join, inner join 두가지로 풀어볼것)
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명, 지역아이디, 지역명
-- Kimberely 도 나오게 해보세요
select 	e.employee_id,
		e.first_name,
        e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name,
        r.region_id,
        r.region_name
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
;

select 	e.employee_id,
		e.first_name,
        e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name,
        r.region_id,
        r.region_name
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id
;

select 	e.employee_id,
		e.first_name,
        e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name,
        r.region_id,
        r.region_name
from employees e
left outer join departments d on e.department_id = d.department_id
left outer join locations l on d.location_id = l.location_id
left outer join countries c on l.country_id = c.country_id
left outer join regions r on c.region_id = r.region_id
;


-- *직원아이디, 이름, 이메일, 관리자아이디, 관리자이름, 관리자이메일, 관라지전화번호
-- where절 표현
select 	e.employee_id,
		e.first_name,
        e.email,
        e.manager_id,
        m.first_name   'm_first_name',
        m.email        'm_email',
        m.phone_number 'm_ph'
from employees e, employees m
where e.manager_id = m.employee_id
;

-- inner join(106명)

-- outer join(107명)


select * from locations;

select *
from employees e, locations l
where e.salary = l.location_id
;

