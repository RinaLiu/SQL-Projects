

/* (i)*/
DROP SEQUENCE pat_no_seq;

DROP SEQUENCE adm_no_seq;

DROP SEQUENCE adm_prc_no_seq;

CREATE SEQUENCE pat_no_seq START WITH 200000 INCREMENT BY 10;

CREATE SEQUENCE adm_no_seq START WITH 200000 INCREMENT BY 10;

CREATE SEQUENCE adm_prc_no_seq START WITH 200000 INCREMENT BY 10;

/* (ii)*/

INSERT INTO patient VALUES (
    pat_no_seq.NEXTVAL,
    'Peter',
    'Xiue',
    '14 Narrow Lane Caulfield',
    TO_DATE('1/10/1981', 'dd-mm-yyyy'),
    '0123456789'
);

INSERT INTO admission VALUES (
    adm_no_seq.NEXTVAL,
    TO_DATE('16/05/2019 10:00 am', 'dd-mm-yyyy hh:mi pm'),
    NULL,
    pat_no_seq.CURRVAL,
    (
        SELECT
            doctor_id
        FROM
            doctor
        WHERE
            lower(doctor_fname) = 'sawyer'
            AND lower(doctor_lname) = 'haisell'
            AND lower(doctor_title) = 'dr'
    )
);

COMMIT;
/* (iii)*/

UPDATE doctor_speciality
SET
    spec_code = (
        SELECT
            spec_code
        FROM
            speciality
        WHERE
            lower(spec_description) = 'vascular surgery'
    )
WHERE
    spec_code = (
        SELECT
            spec_code
        FROM
            speciality
        WHERE
            lower(spec_description) = 'thoracic surgery'
    )
    AND doctor_id = (
        SELECT
            doctor_id
        FROM
            doctor
        WHERE
            lower(doctor_fname) = 'decca'
            AND lower(doctor_lname) = 'blankhorn'
            AND lower(doctor_title) = 'dr'
    );

COMMIT;
      
/* (iv)*/

DELETE FROM doctor_speciality
WHERE
    spec_code = (
        SELECT
            spec_code
        FROM
            speciality
        WHERE
            lower(spec_description) = 'medical genetics'
    );

DELETE FROM speciality
WHERE
    lower(spec_description) = 'medical genetics';

COMMIT;