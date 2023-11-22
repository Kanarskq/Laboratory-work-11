CREATE OR REPLACE FUNCTION GetTemperature (UserName IN T_USERS, Region IN VARCHAR2)
RETURN INTEGER IS
  VTemperatureState VARCHAR2(10);
  VResult INTEGER := 1;
BEGIN

  FOR TempRow IN (SELECT W.WHEATHERSTATE
                   FROM WINDY W
                   WHERE W.REGION = Region) 
  LOOP
    VTemperatureState := TempRow.WHEATHERSTATE;

    EXIT;
  END LOOP;

  IF UserName IS NULL THEN
    VResult := -1; 
  ELSIF Region IS NULL THEN
    VResult := -1; 
  ELSIF REGEXP_LIKE(Region, '[[:digit:][:punct:]]') THEN
    VResult := -1; 
  ELSIF LENGTH(Region) > 25 THEN
    VResult := -1; 
  ELSE
    VResult := 1;
    DBMS_OUTPUT.PUT_LINE('Today in ' || Region || ' is a good temperature of ' || VTemperatureState || ' degrees Celsius');
  END IF;

  RETURN VResult;

END GetTemperature;
/
