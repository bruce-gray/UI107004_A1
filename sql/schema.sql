# Create schema and drop existing triggers/tables where required for clean re-execution of this script
CREATE SCHEMA IF NOT EXISTS highlandwildlifetrust;
USE highlandwildlifetrust;
DROP TRIGGER IF EXISTS before_sightings_insert;
DROP TABLE IF EXISTS sightings;
DROP TABLE IF EXISTS species_reference;
DROP TABLE IF EXISTS sites;
DROP TABLE IF EXISTS volunteers;

# Create the required tables

CREATE TABLE volunteers (
	volunteer_id VARCHAR(5) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(11),
    date_joined DATE NOT NULL,
    is_active BOOL NOT NULL,
    region ENUM('Highlands','Islands','Moray','Cairngorms') NOT NULL
);

CREATE TABLE sites (
	site_id VARCHAR(5) PRIMARY KEY,
    site_name VARCHAR(100) NOT NULL,
    grid_reference VARCHAR(6) NOT NULL,
    region ENUM('Highlands','Islands','Moray','Cairngorms') NOT NULL,
    habitat_type ENUM('Coastal','Woodland','Moorland','Freshwater','Urban') NOT NULL,
    access_difficulty ENUM('Easy','Moderate','Difficult') NOT NULL,
    is_active BOOL NOT NULL
);

CREATE TABLE species_reference (
	species_name VARCHAR(50) PRIMARY KEY,
    scientific_name VARCHAR(100) NOT NULL,
    category ENUM('Bird','Mammal','Marine','Amphibian','Insect') NOT NULL,
    conservation_status ENUM('Least Concern','Near Threatened','Vulnerable','Endangered','Critically Endangered') NOT NULL,
    is_priority BOOL NOT NULL
);

CREATE TABLE sightings (
	sighting_id VARCHAR(5) PRIMARY KEY,
    volunteer_id VARCHAR(5) NOT NULL,
    site_id VARCHAR(5) NOT NULL,
    species_name VARCHAR(50) NOT NULL,
    species_category ENUM('Bird','Mammal','Marine','Amphibian','Insect') NOT NULL,
    count INTEGER NOT NULL,
    sighting_date DATE NOT NULL,
    sighting_time VARCHAR(4) NOT NULL,
    weather_conditions ENUM('Clear','Cloudy','Rain','Snow','Fog') NOT NULL,
    notes VARCHAR(255),
    photo_submitted BOOL NOT NULL,
    
    CONSTRAINT fk_volunteer_id FOREIGN KEY (volunteer_id) REFERENCES volunteers(volunteer_id),
    CONSTRAINT fk_site_id FOREIGN KEY (site_id) REFERENCES sites(site_id),
    CONSTRAINT fk_species_name FOREIGN KEY (species_name) REFERENCES species_reference(species_name)
);

# Creating a trigger to set the correct category in sightings when inserting a new sighting based on the category from species_reference for the corresponding species_name
# I implemented this because species_name is a foreign key in the sightings table but the scenario brief wants both species_name and species_category stored in the sightings table
# Without this the volunteer can mistakenly enter the wrong category for the species sighted
DELIMITER $$
CREATE TRIGGER before_sightings_insert
BEFORE INSERT ON sightings
FOR EACH ROW
BEGIN
	DECLARE sighting_category VARCHAR(9);
    SELECT category INTO sighting_category
    FROM species_reference WHERE species_name = NEW.species_name;
    SET NEW.species_category = sighting_category;
END$$
DELIMITER ;