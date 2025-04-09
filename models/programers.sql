Table Company {
  company_id bigint [pk, increment]
  name varchar(100) [not null]
  logo_url varchar(255)
  industry varchar(100)
  description text
  homepage_url varchar(255)
  location varchar(100)
  employee_count int
}

Table JobPost {
  job_id bigint [pk, increment]
  company_id bigint [ref: > Company.company_id]
  title varchar(200) [not null]
  career_level varchar(50)
  location varchar(100)
  salary_range varchar(50)
  job_type varchar(50)
  apply_deadline date
  created_at datetime [default: `CURRENT_TIMESTAMP`]
}

Table User {
  user_id int [pk, increment]
  email varchar(100) [unique, not null]
  password_hash varchar(255) [not null]
  name varchar(50)
  created_at datetime [default: `CURRENT_TIMESTAMP`]
}

Table Bookmark {
  user_id int [ref: > User.user_id]
  job_id int [ref: > JobPost.job_id]
  saved_at datetime [default: `CURRENT_TIMESTAMP`]
  [pk: user_id, job_id]
}
