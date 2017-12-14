DROP TABLE if exists students;
DROP TABLE if exists houses;


CREATE TABLE houses (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(50) UNIQUE,
  logo VARCHAR(1000)
);

CREATE TABLE students (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(50),
  second_name VARCHAR(50),
  age INT,
  house_id SERIAL4 REFERENCES houses(id)
);
