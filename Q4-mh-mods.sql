
/* (i)*/
--The hospital is experiencing an issue where stocks of some items are allowed to get
--unreasonably low and as a consequence cause admission procedures to be postponed due to
--insufficient stock. The hospital administration would like to include a re-order level for items so that
--when a stock item falls to this level it will be a warning to procurement staff that the item needs to be re-ordered.

--add new column
ALTER TABLE item ADD (
    reorder_level NUMBER(3)
);
--add comment

COMMENT ON COLUMN item.reorder_level IS
    'The re-order level of item';
--set values to reorder_level

UPDATE item
SET
    reorder_level = item_stock * 0.5;

COMMIT;
--set reorder_level is not null

ALTER TABLE item MODIFY (
    reorder_level NUMBER(3) NOT NULL
);

/* (ii)*/
--Initially, the hospital administration was only interested in the lead doctor who performed an
--admission procedure. A review of this approach has resulted in a request to change the database
--so that, from this point forward, all doctors who perform an admission procedure will be recorded.
--Some procedures, for example, an Angiogram may require a team of doctors.\

--The hospital wishes to record, for all the doctors involved, whether the doctor was the Lead doctor
--(the doctor in charge) or an Ancillary doctor (a doctor assisting).

--Prior admission procedures will be viewed as only having a Lead doctor based on the doctor who
--is recorded as performing the admission procedure.

--Change the database to satisfy this requirement. After making the change add a doctor to one of
--your admission procedures as an Ancillary doctor

--create prc_doctor table

DROP TABLE prc_doctor;

CREATE TABLE prc_doctor
    AS
        SELECT
            adprc_no,
            perform_dr_id AS doctor_id
        FROM
            adm_prc
        WHERE
            perform_dr_id IS NOT NULL;

COMMENT ON COLUMN prc_doctor.adprc_no IS
    'Admission procedure number';

COMMENT ON COLUMN prc_doctor.doctor_id IS
    'Carried out doctor id';
--add constraint 

ALTER TABLE prc_doctor ADD CONSTRAINT prc_doctor_pk PRIMARY KEY ( adprc_no,
                                                                  doctor_id );

ALTER TABLE prc_doctor
    ADD CONSTRAINT prc_doctor_doctor_fk FOREIGN KEY ( doctor_id )
        REFERENCES doctor ( doctor_id );

ALTER TABLE prc_doctor
    ADD CONSTRAINT prc_doctor_adm_prc_fk FOREIGN KEY ( adprc_no )
        REFERENCES adm_prc ( adprc_no );
--add one attribute

ALTER TABLE prc_doctor ADD (
    doctor_role CHAR(1) DEFAULT 'L' NOT NULL
);

COMMENT ON COLUMN prc_doctor.doctor_role IS
    'The role of doctor in procedure';

ALTER TABLE prc_doctor
    ADD CONSTRAINT define_doctor_role CHECK ( doctor_role IN (
        'L',
        'A'
    ) );
    
--delete perform doctor attribute
ALTER TABLE adm_prc DROP COLUMN perform_dr_id;

--insert a doctor
INSERT INTO prc_doctor VALUES (
    170244,
    1056,
    'A'
);

COMMIT;