USE highlandwildlifetrust;

# Stored procedure
# Accepts a site_id and a date range as parameters.
# Returns a summary of all sightings at that site within the date range, including: total number of sightings, number of distinct species observed, the most commonly sighted species, and whether any priority species were seen.
# Includes control flow logic: if no sightings are found for the given parameters, it should return a meaningful message rather than empty results.

DELIMITER $$
CREATE PROCEDURE summary (
p_site_id VARCHAR(5),
p_start_date DATE,
p_end_date DATE 
)

BEGIN
	# Declare variable to hold the total sightings
	DECLARE total_sightings INT;
    SELECT COUNT(sighting_id) INTO total_sightings
    FROM sightings
    WHERE site_id = p_site_id AND sighting_date >= p_start_date AND sighting_date <= p_end_date;
    
    # If there are no sightings, display this as a message
    # Other SELECT statements are inside the ELSE so they will run if any sightings do exist
    IF total_sightings = 0 THEN
		SELECT 'No sightings were found for the given site and date range.' AS message;
    ELSE
    
    # All queries return records for the site_id and between the dates provided by the user's input
	# List the number of sightings per distinct species
	SELECT COUNT(sighting_id) AS total_sightings, COUNT(DISTINCT(species_name)) AS distinct_species
    FROM sightings
    WHERE site_id = p_site_id AND sighting_date >= p_start_date AND sighting_date <= p_end_date;
    
    # List the most commonly sighted species
    SELECT species_name AS most_sighted, COUNT(sighting_id) AS times_sighted
    FROM sightings
    WHERE site_id = p_site_id AND sighting_date >= p_start_date AND sighting_date <= p_end_date
    GROUP BY species_name
    ORDER BY times_sighted DESC
    LIMIT 1;
    
    # List if any priority species were sighted
    SELECT IF(COUNT(*) > 0, 'YES', 'NO') AS priority_species_sighted
    FROM sightings sg
    JOIN species_reference sp ON sg.species_name = sp.species_name
    WHERE sg.site_id = p_site_id AND sg.sighting_date >= p_start_date AND sg.sighting_date <= p_end_date AND sp.is_priority = TRUE;
    
    END IF;
END$$
DELIMITER ;

# These CALLs can be executed to test the procedure
CALL summary('SS003', '2025-01-01', '2026-04-28'); # Should return results
CALL summary('SS003', '2020-01-01', '2020-12-31'); # Should return the 'no sightings' message