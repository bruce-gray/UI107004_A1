import xml.etree.ElementTree as ET

# Load the XML export sample file and return the data
def load_export():
    try:
        tree = ET.parse('../data/sightings_export.xml')
        return tree.getroot()
    except FileNotFoundError:
        print('File not found.')

# Display a summary of the site and all sightings
def display_summary(root):
    print(f'Site: {root.find("site_name").text}')
    print(f'Total Sightings: {len(root.findall("sightings/sighting"))}')
    sightings = root.findall('sightings/sighting')
    for sighting in sightings:
        print(f'{sighting.find("species_name").text}, count: {sighting.find("count").text}')

# Extract and print the names of all unique species observed
# For each sighting, append any newly found species_name to observed list and check against this on each loop to only print unique species
def display_species(root):
    print('\nUnique Species Observed:')
    observed = []
    sightings = root.findall('sightings/sighting')
    for sighting in sightings:
        species = sighting.find('species_name').text
        if species not in observed:
            print(f'{species}')
            observed.append(species)

def main():
    root = load_export()
    display_summary(root)
    display_species(root)

if __name__ == '__main__':
    main()