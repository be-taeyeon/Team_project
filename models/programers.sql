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

Table job_applications {
  application_id int [pk, increment]
  job_id int [not null, ref: > job_postings.job_id]
  user_id int [not null, ref: > users.user_id]
  applied_at datetime [not null]
  status varchar(30) [default: '지원 완료']
  resume_url varchar(255)
  cover_letter text
  feedback text
  is_visible boolean [default: true]
  updated_at datetime [default: `CURRENT_TIMESTAMP`, note: 'ON UPDATE CURRENT_TIMESTAMP']
}
