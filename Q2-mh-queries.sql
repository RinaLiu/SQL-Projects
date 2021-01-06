

/* (i)*/
-- List the doctor title, first name, last name and contact phone number for all doctors who
--specialise in the area of "ORTHOPEDIC SURGERY" (this is the specialisation description). Order
--the list by the doctors' last name and within this, if two doctors have the same last name, order
--them by their respective first names.

--what doctor_title,doctor_fname,doctor_lname,doctor_phone,
--where doctor and specility
--condition spec_description = 'orthopedic surgery'
--order by doctor_lname, doctor_fname
SELECT
    d.doctor_title,
    d.doctor_fname,
    d.doctor_lname,
    d.doctor_phone
FROM
    doctor              d
    JOIN doctor_speciality   ds ON ds.doctor_id = d.doctor_id
    JOIN speciality          s ON s.spec_code = ds.spec_code
WHERE
    lower(spec_description) = 'orthopedic surgery'
ORDER BY
    doctor_lname,
    doctor_fname;

/* (ii)*/
--List the item code, item description, item stock and the cost centre title which provides these
--items for all items which have a stock greater than 50 items and include the word 'disposable' in
--their item description. Order the output by the item code.

--what item_code,item_description,item_stock,cc_title
--where item and costcentre
--condition item_stock > 50 and item_description like '%disposable%'
--order by item_code

SELECT
    i.item_code,
    i.item_description,
    i.item_stock,
    c.cc_title
FROM
    item         i
    JOIN costcentre   c ON i.cc_code = c.cc_code
WHERE
    i.item_stock > 50
    AND lower(i.item_description) LIKE '%disposable%'
ORDER BY
    i.item_code;
    
/* (iii)*/  
--List the patient id, patient's full name as a single column called 'Patient Name', admission date
--and time and the supervising doctor's full name (including title) as a single column called 'Doctor
--Name' for all those patients admitted on the 14th March 2019. Your output must include at least
--two admissions on this date which occurred at different times. Order the output by the admission
--time with the earliest admission first. Typical output would have the form:

--what p.patient_id,p.patient_fname || p.patient_lname as Patient Name, a.adm_date_time,d.doctor_id,
       -- d.doctor_title || d.doctor_fname ||d.doctor_lname as Doctor Name
-- where doctor,addmission, patient
--condition to_char(a.adm_date_time,'dd--mm-yyyy') = '14/03/2019'
--order by a.adm_date_time

SELECT
    p.patient_id,
    p.patient_fname
    || ' '
    || p.patient_lname AS "Patient Name",
    d.doctor_id,
    TO_CHAR(a.adm_date_time, 'dd-Mon-yyyy hh24:mi') AS admdatetime,
    d.doctor_title
    || ' '
    || d.doctor_fname
    || ' '
    || d.doctor_lname AS "Doctor Name"
FROM
    patient     p
    JOIN admission   a ON a.patient_id = p.patient_id
    JOIN doctor      d ON d.doctor_id = a.doctor_id
WHERE
    TO_CHAR(a.adm_date_time, 'dd-Mon-yyyy') = '14-Mar-2019'
ORDER BY
    a.adm_date_time;

/* (iv)*/
--List the procedure code, name, description, and standard cost where the procedure is less
--expensive than the average procedure standard cost. The output must show the most expensive
--procedure first. The procedure standard cost must be displayed with two decimal points and a
--leading $ symbol, for example as $120.54

--what p.proc_code, p.proc_name,p.proc_description,p.proc_std_cost
--where procedure p
--condition proc_std_cost < avg(proc_std_cost)
--order by proc_std_cost desc

SELECT
    p.proc_code,
    p.proc_name,
    p.proc_description,
    '$'
    || TO_CHAR(p.proc_std_cost, '99990.99') AS proc_standard_cost
FROM
    procedure p
WHERE
    p.proc_std_cost < (
        SELECT
            AVG(proc_std_cost)
        FROM
            procedure
    )
ORDER BY
    proc_std_cost DESC;                          
 
/* (v)*/

--List the patient id, first name, last name, date of birth and the number of times the patient has
--been admitted to the hospital where the number of admissions is greater than 2. The output should
--show patients with the most number of admissions first and for patients with the same number of
--admissions, show the patients in their date of birth order. Your output must include at least two
--patients with the same number of admissions

--what p.patient_id,p.patient_fname,p.patient_lname ,p.patient_dob, count(a.patient_id),
--where patient p and admission
--condition count(a.patient_id) > 2
--order by count(a.patient_id) desc,p.patient_dob

SELECT
    p.patient_id,
    p.patient_lname,
    p.patient_fname,
    TO_CHAR(p.patient_dob, 'dd-Mon-yyyy') AS dob,
    COUNT(a.patient_id) AS numberadmissions
FROM
    patient     p
    JOIN admission   a ON a.patient_id = p.patient_id
GROUP BY
    p.patient_id,
    p.patient_fname,
    p.patient_lname,
    p.patient_dob
HAVING
    COUNT(a.patient_id) > 2
ORDER BY
    numberadmissions DESC,
    p.patient_dob;

/* (vi)*/
-- List the admission number, patient id, first name, last name and the length of their stay in the
--hospital for all patients who have been discharged and who were in the hospital longer than the
--average stay for all discharged patients. The length of stay must be shown in the form 10 days 2.0
--hrs where hours are rounded to one decimal digit

--what a.adm_no,p.patient_id,p.patient_fname,p.patient_lname, 
--where patient p and admission a
-- condition adm_date_time - (adm_discharge is not null)

SELECT
    a.adm_no,
    p.patient_id,
    p.patient_fname,
    p.patient_lname,
    ceil(TO_CHAR(adm_discharge - adm_date_time, '99.99') - 1)
    || 'days'
    || ' '
    || round(((TO_CHAR(adm_discharge - adm_date_time, '99.99') - ceil(TO_CHAR(adm_discharge - adm_date_time, '99.99') - 1))) * 24
    , 1)
    || 'hrs' AS staylength
FROM
    patient     p
    JOIN admission   a ON a.patient_id = p.patient_id
WHERE
    adm_discharge - adm_date_time > (
        SELECT
            AVG(TO_CHAR(adm_discharge - adm_date_time, '99.99'))
        FROM
            admission a
        WHERE
            ( adm_discharge - adm_date_time ) IS NOT NULL
    )
ORDER BY
    staylength DESC;

/* (vii)*/
--Given a doctor may charge more or less than the standard charge for a procedure carried out
--during an admission procedure, the hospital administration is interested in finding out what
--variations on the standard price have been charged. The hospital terms the difference between the
--procedure standard cost and the average actual charged procedure cost which has been charged
--to patients for all such procedures which have been carried out as the "Procedure Price
--Differential". For all procedures which have been carried out on an admission determine the
--procedure price differential. The list should show the procedure code, name, description, standard
--time and the procedure price differential in procedure code order

--what p.proc_code,p.proc_name,p.proc_description,proc_time,
--where admission adm_prc

SELECT
    p.proc_code,
    p.proc_name,
    p.proc_description,
    p.proc_time,
    TO_CHAR((p.proc_std_cost - AVG(a.adprc_pat_cost)), '99990.99') AS "Price Differential"
FROM
    procedure   p
    JOIN adm_prc     a ON p.proc_code = a.proc_code
GROUP BY
    p.proc_code,
    p.proc_name,
    p.proc_description,
    p.proc_time,
    proc_std_cost
ORDER BY
    proc_code;

/* (viii)*/

--List for every procedure, the items which have been used and the maximum number of those
--items used when the procedure was carried on an admission. Your list must show the procedure
--code, procedure name, item code and item description and the maximum quantity of this item used
--for the given procedure

--what proc_code,proc_name,item_code,item_description,max_qty_used
--where pro,item.item_treatment,adm_prc

SELECT
    p.proc_code,
    proc_name,
    nvl(i.item_code, '---') AS item_code,
    nvl(i.item_description, '---') AS item_description,
    nvl(TO_CHAR(MAX(it_qty_used)), '---') AS max_qty_used
FROM
    item             i
    JOIN item_treatment   t ON t.item_code = i.item_code
    JOIN adm_prc          a ON a.adprc_no = t.adprc_no
    RIGHT OUTER JOIN procedure        p ON a.proc_code = p.proc_code
GROUP BY
    p.proc_code,
    proc_name,
    i.item_code,
    i.item_description
ORDER BY
    proc_name;