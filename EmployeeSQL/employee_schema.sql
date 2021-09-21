--- Remove constraints in order to be able to drop tables
ALTER TABLE employee 
  DROP CONSTRAINT IF EXISTS fk_employee_emp_title_id;

ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_dept_manager_dept_no;

ALTER TABLE dept_manager 
  DROP CONSTRAINT IF EXISTS fk_dept_manager_emp_no;
 
ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_dept_emp_dept_no;

ALTER TABLE dept_emp 
  DROP CONSTRAINT IF EXISTS fk_dept_emp_emp_no;

ALTER TABLE salaries 
  DROP CONSTRAINT IF EXISTS fk_salaries_emp_no;

--- drop tables next to test

DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;

--- create tables next
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(20)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(20)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(20)   NOT NULL,
    "title" varchar(55)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "department" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(55)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(55)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(100)   NOT NULL,
    "last_name" varchar(100)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

--- add pk and fk 
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

