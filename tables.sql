
create database db_proj1;
use db_proj1;

-- Create a table for users
CREATE TABLE `main_user` (
  user_id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id)
);

-- Change the column name from 'email' to 'user_kind'
ALTER TABLE main_user
CHANGE COLUMN email user_kind VARCHAR(255) NOT NULL UNIQUE;

-- Recreate the table
CREATE TABLE `family` (
  family_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE `student` (
  student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  FName VARCHAR(255) NOT NULL,
  LName VARCHAR(255) NOT NULL,
  attribute VARCHAR(255) NOT NULL,
  familymember VARCHAR(255) NOT NULL,
  family_id INT,  -- Add this line for the foreign key reference to family table
  user_id INT,    -- Add this line for the foreign key reference to main_user table
  FOREIGN KEY (family_id) REFERENCES family(family_id),
  FOREIGN KEY (user_id) REFERENCES main_user(user_id)
);


CREATE TABLE `teacher` (
  teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  FName VARCHAR(255) NOT NULL,
  LName VARCHAR(255) NOT NULL,
  familymember VARCHAR(255) NOT NULL,
  family_id INT,  -- Add this line for the foreign key reference to family table
  user_id INT,    -- Add this line for the foreign key reference to main_user table
  FOREIGN KEY (family_id) REFERENCES family(family_id),
  FOREIGN KEY (user_id) REFERENCES main_user(user_id)
);


CREATE TABLE `manager` (
  manager_id INT NOT NULL AUTO_INCREMENT,
  user_id VARCHAR(255) NOT NULL UNIQUE,
  FName VARCHAR(255) NOT NULL,
  LName VARCHAR(255) NOT NULL,
  managertype VARCHAR(255) NOT NULL,
  PRIMARY KEY (manager_id)
);


CREATE TABLE `expense` (
  expense_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  manager_id INT NOT NULL,  -- Change the data type to INT
  descriptionExp VARCHAR(255) NOT NULL,
  amount INT NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);


CREATE TABLE `announcement` (
  announcement_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  manager_id INT NOT NULL,  -- Match the data type
  FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);


CREATE TABLE `budget` (
  budget_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  manager_id INT NOT NULL,  -- Match the data type
  categor VARCHAR(255) NOT NULL,
  amount INT NOT NULL,
  FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);

CREATE TABLE `taskAssignment` (
  assignment_id INT NOT NULL AUTO_INCREMENT,
  organizer_id VARCHAR(255) NOT NULL UNIQUE,
  task VARCHAR(255) NOT NULL UNIQUE,
  statusAss VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (assignment_id)
);

CREATE TABLE `attendance` (
  attendace_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  event_date INT NOT NULL,
  family_member_Attendance VARCHAR(255) NOT NULL UNIQUE,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES main_user(user_id)
);



CREATE TABLE `invitation` (
  invitation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  statusInv VARCHAR(255) NOT NULL UNIQUE,
  method VARCHAR(255) NOT NULL UNIQUE,
  user_id INT NOT NULL,  -- Add this line for the foreign key reference to main_user table
  FOREIGN KEY (user_id) REFERENCES main_user(user_id)
);


CREATE TABLE `menu_suggestion` (
  menuSuggest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  items VARCHAR(255) NOT NULL UNIQUE,
  votes VARCHAR(255) NOT NULL UNIQUE,
  student_id int,
  foreign key(student_id) references student(student_id)
);

CREATE TABLE `performance_proposal` (
  perProposal_id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  student_id INT NOT NULL,
  duration VARCHAR(255) NOT NULL UNIQUE,
  votes VARCHAR(255) NOT NULL UNIQUE,
  specialRe VARCHAR(255) NOT NULL UNIQUE,
  performanceType VARCHAR(255) NOT NULL UNIQUE,
  foreign key(student_id) references student(student_id)
  
);



