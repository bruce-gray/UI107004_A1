USE highlandwildlifetrust;

# 8 queries with at least one from each category specified in the scenario brief

# 1. Retrieve all sightings for a specific species across all sites.
# Basic SELECT with WHERE
SELECT * FROM sightings
WHERE species_name = 'Red Squirrel';

# 2. Find the total number of sightings per volunteer, sorted from highest to lowest.
# SELECT with COUNT aggregate, JOIN, GROUP BY and ORDER BY DESC
SELECT s.volunteer_id, v.first_name, v.last_name, COUNT(s.sighting_id) AS total_sightings
FROM sightings s
JOIN volunteers v ON s.volunteer_id = v.volunteer_id
GROUP BY s.volunteer_id, v.first_name, v.last_name
ORDER BY total_sightings DESC;

# 3. List all priority species that have been sighted in the last 6 months, with the site name and count.
# SELECT with multiple JOINs, 2 DATE functions and 2 WHERE clauses
SELECT sg.site_id, ss.site_name, sg.species_name, sg.count, sg.sighting_date
FROM sightings sg
JOIN sites ss ON sg.site_id = ss.site_id
JOIN species_reference sp ON sg.species_name = sp.species_name
WHERE sighting_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND sp.is_priority = TRUE;

# 4. Find sites where no sightings have been recorded (to identify underused sites).
# SELECT with LEFT OUTER JOIN
SELECT ss.site_id, ss.site_name
FROM sites ss
LEFT OUTER JOIN sightings sg ON ss.site_id = sg.site_id
WHERE sg.site_id IS NULL
GROUP BY ss.site_id;

# 5. Calculate the average number of individuals sighted per observation, grouped by species category.
# SELECT with AVG aggregate function
SELECT species_category, AVG(count) AS avg_per_sighting
FROM sightings
GROUP BY species_category;

# 6. Update a volunteer’s active status and demonstrate a deletion of a test record.
# UPDATE and DELETE
# The SELECT at the top can be run before and after the UPDATE to show that it is working as intended
# A test record is inserted before the DELETE to be deleted so that it does not fail due to foreign key constraints
SELECT * FROM volunteers WHERE volunteer_id = 'VL010';

UPDATE volunteers
SET is_active = FALSE
WHERE volunteer_id = 'VL010';

INSERT INTO volunteers VALUES ('VL011', 'Bruce', 'Gray', 'b.gray@gmail.com', NULL, '2026-04-22', TRUE, 'Moray');

DELETE FROM volunteers
WHERE volunteer_id = 'VL011';

# Queries of my choice that would be useful to the trust

# 7. List all endangered or critically endangered species that have not been sighted within the past 3 months, and show the date of the most recent sighting (if any) outside of this window
# Value: May help the trust prioritise monitoring efforts for species with declining populations
# SELECT with LEFT JOIN, DATE functions, MAX aggregate function, HAVING
SELECT sp.species_name, sp.conservation_status, MAX(sg.sighting_date) AS last_sighted
FROM species_reference sp
LEFT JOIN sightings sg ON sp.species_name = sg.species_name
WHERE sp.conservation_status IN ('Endangered', 'Critically Endangered')
GROUP BY sp.species_name, sp.conservation_status
HAVING MAX(sg.sighting_date) < DATE_SUB(CURDATE(), INTERVAL 3 MONTH) OR MAX(sg.sighting_date) IS NULL;

# 8. List all volunteers who have not submitted any sightings
# Value: Helps the Trust identify inactive volunteers, displays contact details so the trust can reach out to them if required
# SELECT with LEFT JOIN
SELECT v.volunteer_id, v.first_name, v.last_name, v.email, v.phone, v.region
FROM volunteers v
LEFT JOIN sightings sg ON v.volunteer_id = sg.volunteer_id
WHERE sg.volunteer_id IS NULL;