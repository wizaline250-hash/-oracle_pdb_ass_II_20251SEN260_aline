-- A3: Illegal GOTO and Fix
SET SERVEROUTPUT ON

-- PART 1: ILLEGAL. Jumping INTO an IF block is not allowed.
-- Compile error: PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_BLOCK'
-- (Take your screenshot of this error, then run PART 2.)
BEGIN
  GOTO inside_block;
  IF 1 = 1 THEN
    <<inside_block>>
    DBMS_OUTPUT.PUT_LINE('Inside the IF block');
  END IF;
END;
/

-- PART 2: FIX. Put the label at the same block level (or an enclosing one),
-- never inside a nested IF/LOOP/handler.
BEGIN
  GOTO outside_block;
  DBMS_OUTPUT.PUT_LINE('This line is skipped');
  <<outside_block>>
  DBMS_OUTPUT.PUT_LINE('Jumped to a legal label');
END;
/
