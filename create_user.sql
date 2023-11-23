sqlplus student/p1234@91.219.60.189:1521/XEPDB1

CREATE USER guda IDENTIFIED BY p1P34ab#;
-- GRANT CONNECT, RESOURCE TO student;
GRANT DBA TO guda;
-- ALTER USER student quota unlimited on USERS;
ALTER USER guda quota 50M on USERS;

/*
Доброго дня.
Для вас створено обліковий запис:
login = guda
password = p1P34ab#

Приклад встановлення з'єднання через SQLPlus:
sqlplus guda/p1P34ab#@91.219.60.189:1521/XEPDB1

Приклад програмного коду java-програми із
методами доступу до Oracle БД наведено
в лабораторній роботі.

*/