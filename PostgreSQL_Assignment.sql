-- Problem 1
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- Problem 3
SELECT * FROM sightings WHERE location LIKE '%Pass%';

-- Problem 4
SELECT name, COUNT(sighting_id) AS total_sightings FROM rangers
    JOIN sightings ON rangers.ranger_id = sightings.ranger_id
    GROUP BY name ORDER BY name ASC;

-- Problem 5
SELECT sp.common_name FROM species AS sp
    LEFT JOIN sightings AS si ON sp.species_id = si.species_id
    WHERE si.species_id IS NULL;

-- Problem 6
SELECT sp.common_name, si.sighting_time, ra.name FROM sightings si
    JOIN species sp ON si.species_id = sp.species_id
    JOIN rangers ra ON si.ranger_id = ra.ranger_id
    ORDER BY si.sighting_time DESC LIMIT 2;

-- -- Problem 7
UPDATE species SET conservation_status = 'Historic'
    WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

-- Problem 8
SELECT sighting_id,
    CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time ) < 17 THEN 'Afternoon'
    ELSE 'Evening'
    END AS time_of_day FROM sightings;

-- Problem 9
DELETE FROM rangers
    WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
    );