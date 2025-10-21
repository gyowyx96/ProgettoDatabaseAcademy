DROP DATABASE IF EXISTS DB_Academy;
CREATE DATABASE DB_Academy;
use DB_Academy;

create table Subject(
    SubjectID int not null primary key auto_increment,
    SubjectName varchar(60) unique not null,
    isDeleted tinyint(1) default 0
);
create table Province(
    ProvinceID int not null primary key auto_increment,
    ProvinceName varchar(25) unique not null,
    isDeleted tinyint(1) default 0
);
create table City(
    CityID int not NULL primary key auto_increment,
    ProvinceID int not null,
    CityName varchar(25) unique not null,
    isDeleted tinyint(1) default 0,
    constraint fkCityProvinceID foreign key (ProvinceID) references Province(ProvinceID)
);
create table Site(
    SiteID int not NULL primary key auto_increment,
    CityID int not null,
    SiteName varchar(50) not null unique,
    SiteAddress varchar(60) not null unique,
    isDeleted tinyint(1) default 0,
    constraint fkSiteCityID foreign key (CityID) references City(CityID)
);
create TABLE UserInfo( 
    UserInfoID int not NULL primary key auto_increment,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    Email varchar(50) not null unique,
    PhoneNumber varchar(15) unique,
    BirthDate date,
    UserAddress varchar(60) unique,
    CityID int not null,
    isDeleted tinyint(1) default 0,
    constraint fkUserInfoCityID foreign key (CityID) references City(CityID)
);
create table Tutor(
    TutorID int not null primary key auto_increment,
    UserInfoID int not null,
    HireDate date,
    isDeleted tinyint(1) default 0,
    constraint fkTutorUserInfoID foreign key (UserInfoID) references UserInfo(UserInfoID)
);
create table Teacher(
    TeacherID int not null primary key auto_increment,
    UserInfoID int not null,
    HireDate date,
    isDeleted tinyint(1) default 0,
    constraint fkTeacherUserInfoID foreign key (UserInfoID) references UserInfo(UserInfoID)
);
create table Course(
    CourseID int not null primary key auto_increment,
    CourseName varchar(30) not null unique,
    SiteID int not null,
    TutorID int not null,
    StartDate date,
    EndDate date,
    isDeleted tinyint(1) default 0,
    constraint fkCourseSiteID foreign key (SiteID) references Site(SiteID),
    constraint fkCourseTutorID foreign key (TutorID) references Tutor(TutorID)
);
create table Module(
    ModuleID int not null primary key auto_increment,
    CourseID int not null,
    TeacherID int not null,
    SubjectID int not null,
    ModuleHours int not null,
    isDeleted tinyint(1) default 0,
    constraint fkModuleCourseID foreign key (CourseID) references Course(CourseID),
    constraint fkModuleTeacherID foreign key (TeacherID) references Teacher(TeacherID),
    constraint fkModuleSubjectID foreign key (SubjectID) references Subject(SubjectID)
);
create table Student(
    StudentID int not null primary key auto_increment,
    UserInfoID int not null,
    CourseID int not null,
    isDeleted tinyint(1) default 0,
    constraint fkStudentUserInfoID foreign key (UserInfoID) references UserInfo(UserInfoID),
    constraint fkStudentCourseID foreign key (CourseID) references Course(CourseID)
);
create TABLE Grade( 
    GradeID int not NULL primary key auto_increment,
    StudentID int not null,
    ModuleID int not null,
    Grade decimal(4,2) not null,
    isDeleted tinyint(1) default 0,
    constraint fkGradeStudentID foreign key (StudentID) references Student(StudentID),
    constraint fkGradeModuleID foreign key (ModuleID) references Module(ModuleID)
);
