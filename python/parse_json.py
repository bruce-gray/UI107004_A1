import json

# Load the JSON export sample file and return the data
def load_export():
    try:
        with open('../data/sightings_export.json', 'r') as f:
            data = json.load(f)
            return data
    except FileNotFoundError:
        print('File not found.')

# Display a summary of the site and all sightings
def display_summary(data):
    site = data["site"]
    print(f'Site: {site["site_name"]}')
    print(f'Total Sightings: {len(site["sightings"])}')
    for sighting in site["sightings"]:
        print(f'{sighting["species_name"]}, count: {sighting["count"]}')

# Filter and display only sightings of priority species
def display_priority_sightings(data):
    site = data["site"]
    print(f'\nPriority Species Sightings at {site["site_name"]}')
    priority = [sighting for sighting in site["sightings"] if sighting["is_priority"] == True]
    if len(priority) == 0:
        print('No priority species sightings found.')
    else:
        for sighting in priority:
            print(f'{sighting["species_name"]}: {sighting["count"]} ({sighting["date"]})')

def main():
    data = load_export()
    display_summary(data)
    display_priority_sightings(data)

if __name__ == '__main__':
    main()