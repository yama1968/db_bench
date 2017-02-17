

CREATE DATABASE Avazu;

USE Avazu;

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP
   ON Avazu.*
   TO 'avazu'@'localhost'
      IDENTIFIED BY 'a123';

FLUSH PRIVILEGES;

USE mysql;

SELECT host, user, password
  FROM user;
