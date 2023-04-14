-- Do work in here

-- SELECT animals.name, animals.enclosure_id, enclosures.name FROM animals
-- INNER JOIN enclosures 
-- ON animals.enclosure_id = enclosures.id;

-- SELECT employees.name, assignments.enclosure_id, enclosures.name FROM employees
-- INNER JOIN assignments
-- ON employees.id = assignments.employee_id
-- INNER JOIN enclosures
-- ON assignments.enclosure_id = enclosures.id;

-- NAMES OF STAFF WORKING IN ENCLOSURES WHICH ARE CLOSED FOR MAINTENACE
-- SELECT employees.name, assignments.enclosure_id, enclosures.name FROM enclosures
-- INNER JOIN assignments
-- ON assignments.enclosure_id = enclosures.id
-- INNER JOIN employees
-- ON employees.id = assignments.employee_id
-- WHERE enclosures.closed_for_maintenance = TRUE;

-- NAME OF ENCLOSURE WHERE THE OLDEST ANIMAL LIVES
SELECT animals.name, animals.age, animals.enclosure_id, enclosures.name FROM animals
INNER JOIN enclosures 
ON animals.enclosure_id = enclosures.id
ORDER BY animals.age DESC, animals.name ASC ;
