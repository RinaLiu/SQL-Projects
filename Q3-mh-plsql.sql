


/* (i)*/

--The hospital has decided that it would like to be able to change the item_code for an ITEM, for
--example, change KN056 for the "Right Knee Brace" to KNR56. Code a trigger which will support
--this request. A message should be displayed to indicate the change has occurred successfully.

--trigger body
CREATE OR REPLACE TRIGGER maintain_item_code AFTER
    UPDATE OF item_code ON item
    FOR EACH ROW
BEGIN
    UPDATE item_treatment
    SET
        item_code = :new.item_code
    WHERE
        item_code = :old.item_code;

    dbms_output.put_line('Item code: '
                         || :new.item_code
                         || ' has been changed');
END;
/

--test harness

SET ECHO ON;

SET SERVEROUTPUT ON

SELECT
    *
FROM
    item;

SELECT
    *
FROM
    item_treatment;

UPDATE item
SET
    item_code = 'KNR56'
WHERE
    lower(item_description) = 'right knee brace';

SELECT
    *
FROM
    item;

SELECT
    *
FROM
    item_treatment;

ROLLBACK;

SET ECHO OFF;

/* (ii)*/

--Write a trigger which will prevent a patient's first and last names from being entered with both
--names blank (null).

--trigger body

CREATE OR REPLACE TRIGGER check_name BEFORE
    INSERT ON patient
    FOR EACH ROW
BEGIN
    IF :new.patient_fname IS NULL AND :new.patient_lname IS NULL THEN
        raise_application_error(-20030, 'First name and last name cannot be null');
    END IF;
END;
/

--test harness

SET ECHO ON;

SET SERVEROUTPUT ON

SELECT
    *
FROM
    patient;

INSERT INTO patient VALUES (
    123452,
    NULL,
    NULL,
    '345 Caulfield',
    TO_DATE('05/02/1999', 'dd-mm-yyyy'),
    '1545200348'
);

INSERT INTO patient VALUES (
    123452,
    'Jack',
    NULL,
    '345 Caulfield',
    TO_DATE('05/02/1999', 'dd-mm-yyyy'),
    '1545200348'
);

INSERT INTO patient VALUES (
    123434,
    NULL,
    'Jack',
    '345 Caulfield',
    TO_DATE('05/02/1999', 'dd-mm-yyyy'),
    '1545200348'
);

SELECT
    *
FROM
    patient;

ROLLBACK;

SET ECHO OFF;

/* (iii)*/

--Write a trigger which will automatically adjust the stock level of an item when an item is
--recorded as being used in an admission procedure. The items used in an admission procedure are
--recorded immediately after the procedure has been completed. You may assume that the items
--used in an admission procedure after being recorded in the system are not permitted to be deleted
--or updated.

--trigger body

CREATE OR REPLACE TRIGGER reorder_level AFTER
    INSERT ON item_treatment
    FOR EACH ROW
BEGIN
    UPDATE item
    SET
        item_stock = item_stock - :new.it_qty_used
    WHERE
        item_code = :new.item_code;

END;
/

--test harness

SET ECHO ON;

SET SERVEROUTPUT ON

SELECT
    *
FROM
    item
WHERE
    item_code = 'SS006';

SELECT
    *
FROM
    item_treatment
WHERE
    item_code = 'SS006';

INSERT INTO item_treatment VALUES (
    182650,
    'SS006',
    2,
    30
);

SELECT
    *
FROM
    item
WHERE
    item_code = 'SS006';

SELECT
    *
FROM
    item_treatment
WHERE
    item_code = 'SS006';

ROLLBACK;

SET ECHO OFF;