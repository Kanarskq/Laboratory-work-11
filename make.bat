REM set in Linux
REM export JAVA_HOME=/usr/lib/jvm/msopenjdk-11
REM export PATH=$JAVA_HOME/bin:$PATH
REM export CLASSPATH="./ojdbc8.jar:./"
REM javac OracleCon.java
REM java OracleCon

REM set in Windows
set JAVA_HOME="C:\Program Files\Microsoft\jdk-11.0.17.8-hotspot"
set JAVA_HOME="C:\Program Files\Java\jdk1.8.0_202"
set Path=%JAVA_HOME%\bin;%Path%

java -version
javac -cp "ojdbc8.jar;." OracleCon.java
java -cp "ojdbc8.jar;." OracleCon student p1234

rem javac -cp "ojdbc8.jar;." TestCases.java
rem java -cp "ojdbc8.jar;." TestCases

rem javac -cp "ojdbc8.jar;." AddUserPerformance.java
rem java -cp "ojdbc8.jar;." AddUserPerformance



