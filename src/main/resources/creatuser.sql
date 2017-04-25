CREATE USER 'mb'@'127.0.0.1' IDENTIFIED BY '123456';
flush privileges;
 create database mb;
 alter database mb character set utf8; 
 grant all privileges on mb.* to mb@localhost identified by '123456';
 flush privileges;
 
 ---GRANT USAGE ON *.* TO 'appmonitor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;