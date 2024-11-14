SET SERVEROUTPUT on;

--SENTENCIAS IF--

DECLARE

    primero number:=3;
    segundo number:=6;
    tercero number:=18;
    
    mayor number;

BEGIN

    IF primero > segundo then
        mayor := primero;
    ELSE
        mayor:= segundo;
    END IF;
    
    if tercero > mayor then
        mayor := tercero;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('El mayor es : ' || mayor);

END;

--SENTENCIAS IF CON VARIABLE DE SUSTITUCI�N--

DECLARE

    primero number:=&introduce_el_primer_numero;
    segundo number:=&introduce_el_segundo_numero;
    tercero number:=&introduce_el_tercer_numero;
    
    mayor number;

BEGIN

    IF primero > segundo then
        mayor := primero;
    ELSE
        mayor:= segundo;
    END IF;
    
    if tercero > mayor then
        mayor := tercero;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('El mayor es : ' || mayor);

END;

--BUCLES LOOP--

DECLARE

    base number:= 2;
    exponente number:= 3;
    
    potencia number:=1;
    
    contador number:=0;  --Inicializacion

BEGIN

    LOOP
        potencia:= potencia * base;
        
        contador:= contador+1; -- Incremento
        
        EXIT WHEN contador >= exponente; --Condici�n
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('El resultado de elevar ' || base || ' a ' || exponente || ' es de ' || potencia);

END;

--BUCLE LOOP CON VARIABLE DE SUSTITUCI�N--

DECLARE

    base number:= &introduzca_base;
    exponente number:=&introduzca_exponente;
    
    potencia number:=1;
    
    contador number:=0;  --Inicializacion

BEGIN

    LOOP
        potencia:= potencia * base;
        
        contador:= contador+1; -- Incremento
        
        EXIT WHEN contador >= exponente; --Condici�n
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('El resultado de elevar ' || base || ' a ' || exponente || ' es de ' || potencia);

END;

--BUCLES WHILE--

DECLARE

    base number:= &introduzca_base;
    exponente number:=&introduzca_exponente;
    
    potencia number:=1;
    
    contador number:=0;  --Inicializacion

BEGIN

    WHILE contador < exponente --Condici�n while para que entre
    
    LOOP
        potencia:= potencia * base;
        
        contador:= contador+1; -- Incremento
        
        
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('WHILE: El resultado de elevar ' || base || ' a ' || exponente || ' es de ' || potencia);

END;

--BUCLES FOR--

DECLARE

    base number:= &introduzca_base;
    exponente number:=&introduzca_exponente;
    
    potencia number:=1;
    


BEGIN

    FOR i in 1..exponente
    
    LOOP
        potencia:= potencia * base;
        
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('FOR: El resultado de elevar ' || base || ' a ' || exponente || ' es de ' || potencia);

END;