CREATE OR REPLACE FUNCTION GetTemperature (user IN T_USERS, region IN VARCHAR2) RETURN INTEGER IS
    VTemperatureState VARCHAR2(25);
    VResult INTEGER := 1;

/
