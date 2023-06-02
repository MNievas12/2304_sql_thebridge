--Check escena del crimen
SELECT *
FROM crime_scene_report
WHERE 
    date = 20180115 
    AND type = "murder" 
    AND city = "SQL City";
    
-- Obtenemos dos pistas: testigo 1 Northwestern Dr última casa.
-- Testigo 2 Annabel Franklin Ave

SELECT * FROM person
WHERE name LIKE "%Annabel%" AND address_street_name = "Franklin Ave";
-- id 16371

SELECT * FROM person
WHERE address_street_name = "Northwestern Dr"
AND address_number = (SELECT 
                        MAX(address_number) 
                      FROM person 
                      WHERE
                          address_street_name = "Northwestern Dr");
-- id Morty 14887

SELECT * FROM interview
WHERE person_id IN (16371, 14887);

--I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT * FROM get_fit_now_member
WHERE id LIKE "48Z%" AND membership_status = "gold";

-- 28819 Joe Germuska
-- 67318 Jeremy Bowers

SELECT * FROM drivers_license
WHERE plate_number LIKE "%H42W%";

SELECT p.* FROM get_fit_now_member gf
INNER JOIN person AS p ON gf.person_id = p.id
INNER JOIN drivers_license AS dl ON p.license_id = dl.id
WHERE gf.id LIKE "48Z%" AND gf.membership_status = "gold" AND dl.plate_number LIKE "%H42W%";

-- Jeremy Bowers!!!! 67318
;

SELECT * FROM interview
WHERE person_id = 67318;

--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.


SELECT 
    person_id, 
    COUNT(event_id)
FROM facebook_event_checkin
WHERE event_name LIKE "%SQL Symphony Concert%"
AND date >"20171201" AND date <= "20171231"
GROUP BY 1
ORDER BY 2 DESC;

-- 99716
-- 24556

SELECT *
FROM person p
INNER JOIN drivers_license dl ON p.license_id = dl.id
WHERE p.id IN (99716, 24556);

--Miranda Priestly!!!
