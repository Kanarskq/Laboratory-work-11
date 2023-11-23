CREATE OR REPLACE FUNCTION GetTemperature 
RETURN INTEGER IS
    v_temperature_state VARCHAR2(25);
    v_result INTEGER := 1;
BEGIN
    FOR temp_row IN (SELECT w.weatherstate
                     FROM windy w
                     WHERE w.region = p_region) 
    LOOP
        v_temperature_state := temp_row.weatherstate;
        EXIT;
    END LOOP;

    IF p_user_name IS NULL THEN
        v_result := -1; 
    ELSIF p_region IS NULL THEN
        v_result := -1; 
    ELSIF REGEXP_LIKE(p_region, '[[:digit:][:punct:]]') THEN
        v_result := -1; 
    ELSIF LENGTH(p_region) > 25 THEN
        v_result := -1; 
    ELSE
        v_result := 1;
        DBMS_OUTPUT.PUT_LINE('Today in ' || p_region || ' is a good temperature of ' || v_temperature_state || ' degrees Celsius');
    END IF;

    RETURN v_result;
END GetTemperature;
/
