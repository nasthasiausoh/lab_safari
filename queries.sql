-- Do work in here
-- Why use DISTINCT?
-- Stops repeated values and only prints once if the value is mentioned.
-- for example if Penguin is mentioned twice then it will say 2
-- rather than it just saying 1 as it is the same animal.
 

--MVP:

-- The names of the animals in a given enclosure
-- SELECT animals.name, animals.enclosure_id, enclosures.name FROM animals
-- INNER JOIN enclosures 
-- ON animals.enclosure_id = enclosures.id;

--SOLUTION GIVEN:

-- - The names of the animals in a given enclosure (solution: choosing enclosure id = 1)
-- SELECT animals.name, enclosure_id FROM animals
-- INNER JOIN enclosures
-- ON animals.enclosure_id = enclosures.id
-- WHERE enclosures.id = 1;



-- The names of the staff working in a given enclosure
-- SELECT employees.name, assignments.enclosure_id, enclosures.name FROM employees
-- INNER JOIN assignments
-- ON employees.id = assignments.employee_id
-- INNER JOIN enclosures
-- ON assignments.enclosure_id = enclosures.id;

-- SOLUTION GIVEN:

--The names of the staff working in a given enclosure (solution: choosing enclosure id = 1)
-- SELECT  employees.name, enclosure_id FROM employees
-- INNER JOIN assignments
-- ON assignments.employee_id = employee_id
-- WHERE assignments.enclosure_id = 1;



-- EXTENSION:

--  The names of staff working in enclosures which are closed for maintenance:
-- SELECT employees.name, assignments.enclosure_id, enclosures.name FROM enclosures
-- INNER JOIN assignments
-- ON assignments.enclosure_id = enclosures.id
-- INNER JOIN employees
-- ON employees.id = assignments.employee_id
-- WHERE enclosures.closed_for_maintenance = TRUE;

-- SOLUTION GIVEN:

-- SELECT DISTINCT employees.name, enclosure_id, enclosures.name FROM employees
-- INNER JOIN assignments
-- ON assignments.employee_id = employees.id
-- INNER JOIN enclosures
-- ON assignments.enclosure_id = enclosures.id
-- WHERE enclosures.closed_for_maintenance IS TRUE;



-- - The name of the enclosure where the oldest animal lives. 
--   If there are two animals who are the same age choose the first one alphabetically.
-- SELECT animals.name, animals.age, animals.enclosure_id, enclosures.name FROM animals
-- INNER JOIN enclosures 
-- ON animals.enclosure_id = enclosures.id
-- ORDER BY animals.age DESC, animals.name ASC;

-- SOLUTION GIVEN:

-- SELECT animals.name, animals.age, animals.enclosure_id, enclosures.name FROM animals
-- INNER JOIN enclosures
-- ON animals.enclosure_id = enclosures.id
-- ORDER BY animals.age DESC, animals.name ASC
-- LIMIT 1;



-- The number of different animal types a given keeper has been assigned to work with.
-- what we did in the paired programming lab:
-- SELECT employees.name, COUNT(DISTINCT animals.type) FROM employees
-- INNER JOIN assignments
-- ON employees.id = assignments.employee_id
-- INNER JOIN enclosures
-- ON assignments.enclosure_id = enclosures.id
-- INNER JOIN animals
-- ON enclosures.id = animals.enclosure_id
-- GROUP BY employees.name;

-- what i did on my own:
-- SELECT employees.name, assignments.employee_id, COUNT(DISTINCT animals.type) FROM animals
-- INNER JOIN enclosures
-- ON animals.enclosure_id = enclosures.id
-- INNER JOIN assignments
-- ON assignments.enclosure_id = enclosures.id
-- INNER JOIN employees
-- ON assignments.employee_id = employees.id
-- GROUP BY employees.name, assignments.employee_id;


-- SOLUTION GIVEN: 
-- SELECT COUNT(DISTINCT animals.type) FROM animals
-- INNER JOIN enclosures
-- ON animals.enclosure_id = enclosures.id
-- INNER JOIN assignments
-- ON assignments.enclosure_id = enclosures.id
-- WHERE assignments.employee_id = 1;





--  The number of different keepers who have been assigned to work in a given enclosure
-- What i did alone but it doesn't work properly:
-- SELECT DISTINCT enclosure_id, enclosures.name, COUNT(assignments.employee_id) FROM enclosures
-- INNER JOIN assignments
-- ON assignments.enclosure_id = enclosures.id
-- GROUP BY assignments.employee_id, enclosure_id, enclosures.name
-- ORDER BY enclosure_id ASC;

-- SOLUTION GIVEN this is only for one enclosure at a time:
-- SELECT COUNT(DISTINCT employees.name) FROM employees
-- INNER JOIN assignments
-- ON employees.id = assignments.employee_id
-- WHERE assignments.enclosure_id = 1;



-- - The names of the other animals sharing an enclosure with a given animal
--  (eg. find the names of all the animals sharing the big cat field with Tony)

-- - SOLUTION GIVEN:
-- SELECT roommates.name FROM animals
-- INNER JOIN enclosures
-- ON animals.enclosure_id = enclosures.id
-- INNER JOIN animals AS roommates
-- ON enclosures.id = roommates.enclosure_id
-- WHERE animals.id = 2;
-- -- AS is renaming a column or table with an alias. an alias only exists for the duration of the query.
-- -- not sure if this code is working though because when using below to check, it is giving differences.
-- SELECT name FROM animals WHERE enclosure_id = '2';


