sqlplus ${{ secrets.LOGIN }}/${{ secrets.PASSWORD }}@91.219.60.189:1521/XEPDB1

CREATE OR REPLACE FUNCTION GetTemperature (user IN T_USERS, region IN VARCHAR2) RETURN INTEGER IS
    VTemperatureState VARCHAR2(25);
    VResult INTEGER := 1;

/
