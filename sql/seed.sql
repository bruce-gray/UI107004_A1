USE highlandwildlifetrust;

# Fill the db 10 volunteers, 8 sites, 15 species and 32 sightings
# AI was used to generate the majority of this sample data, this was cleared as an acceptable use of AI prior to beginning this assessment

INSERT INTO volunteers (volunteer_id, first_name, last_name, email, phone, date_joined, is_active, region) VALUES
('VL001', 'Eilidh', 'MacLeod', 'eilidh.m@email.com', '07700900001', '2022-03-10', TRUE, 'Highlands'),
('VL002', 'Calum', 'Ross', 'c.ross@email.com', '07700900002', '2021-07-22', TRUE, 'Cairngorms'),
('VL003', 'Morag', 'Stewart', 'morag.s@email.com', '07700900003', '2020-11-05', FALSE, 'Islands'),
('VL004', 'Fionnlagh', 'MacKenzie', 'fionnlagh.m@email.com', '07700900004', '2023-01-18', TRUE, 'Highlands'),
('VL005', 'Isla', 'Campbell', 'isla.c@email.com', '07700900005', '2022-09-30', TRUE, 'Moray'),
('VL006', 'Ruaridh', 'Fraser', 'r.fraser@email.com', NULL, '2021-04-14', TRUE, 'Cairngorms'),
('VL007', 'Sine', 'MacDonald', 'sine.macd@email.com', '07700900007', '2023-06-01', TRUE, 'Islands'),
('VL008', 'Alasdair', 'Grant', 'a.grant@email.com', '07700900008', '2020-08-19', FALSE, 'Moray'),
('VL009', 'Catriona', 'Murray', 'cat.murray@email.com', '07700900009', '2024-02-11', TRUE, 'Highlands'),
('VL010', 'Tormod', 'Nicolson', 't.nicolson@email.com', NULL, '2023-10-07', TRUE, 'Cairngorms');

INSERT INTO sites (site_id, site_name, grid_reference, region, habitat_type, access_difficulty, is_active) VALUES
('SS001', 'Loch Morlich Shore', 'NH9609', 'Cairngorms', 'Freshwater', 'Easy', TRUE),
('SS002', 'Moray Firth Headland', 'NH7862', 'Moray', 'Coastal', 'Moderate', TRUE),
('SS003', 'Rothiemurchus Forest', 'NH9107', 'Cairngorms', 'Woodland', 'Easy', TRUE),
('SS004', 'Rannoch Moor', 'NN3653', 'Highlands', 'Moorland', 'Difficult', TRUE),
('SS005', 'Isle of Skye Cliffs', 'NG1749', 'Islands', 'Coastal', 'Difficult', TRUE),
('SS006', 'Speyside Woodland Trail', 'NJ0742', 'Moray', 'Woodland', 'Easy', TRUE),
('SS007', 'Cairngorm Plateau', 'NH9903', 'Cairngorms', 'Moorland', 'Difficult', TRUE),
('SS008', 'Cromarty Firth Shore', 'NH7165', 'Highlands', 'Coastal', 'Easy', FALSE);

INSERT INTO species_reference (species_name, scientific_name, category, conservation_status, is_priority) VALUES
('Red Squirrel', 'Sciurus vulgaris', 'Mammal', 'Endangered', TRUE),
('Golden Eagle', 'Aquila chrysaetos', 'Bird', 'Least Concern', TRUE),
('Pine Marten', 'Martes martes', 'Mammal', 'Least Concern', FALSE),
('Bottlenose Dolphin', 'Tursiops truncatus', 'Marine', 'Least Concern', TRUE),
('Scottish Wildcat', 'Felis silvestris', 'Mammal', 'Critically Endangered', TRUE),
('Red Kite', 'Milvus milvus', 'Bird', 'Near Threatened', TRUE),
('Osprey', 'Pandion haliaetus', 'Bird', 'Least Concern', TRUE),
('Otter', 'Lutra lutra', 'Mammal', 'Near Threatened', TRUE),
('Common Seal', 'Phoca vitulina', 'Marine', 'Least Concern', FALSE),
('Harbour Porpoise', 'Phocoena phocoena', 'Marine', 'Least Concern', FALSE),
('Great Crested Newt', 'Triturus cristatus', 'Amphibian', 'Vulnerable', TRUE),
('Common Frog', 'Rana temporaria', 'Amphibian', 'Least Concern', FALSE),
('Red Grouse', 'Lagopus lagopus scotica', 'Bird', 'Vulnerable', FALSE),
('Mountain Hare', 'Lepus timidus', 'Mammal', 'Near Threatened', FALSE),
('White-tailed Eagle', 'Haliaeetus albicilla', 'Bird', 'Least Concern', TRUE);

INSERT INTO sightings (sighting_id, volunteer_id, site_id, species_name, count, sighting_date, sighting_time, weather_conditions, notes, photo_submitted) VALUES
('SG001', 'VL001', 'SS003', 'Red Squirrel', 2, '2025-03-15', '1015', 'Clear', 'Spotted near the pine stand', TRUE),
('SG002', 'VL002', 'SS007', 'Golden Eagle', 1, '2025-11-16', '1320', 'Cloudy', NULL, FALSE),
('SG003', 'VL001', 'SS003', 'Pine Marten', 1, '2025-03-15', '1430', 'Clear', 'Crossing the forest track', FALSE),
('SG004', 'VL002', 'SS002', 'Bottlenose Dolphin', 8, '2025-12-01', '1100', 'Clear', 'Pod moving east along firth', TRUE),
('SG005', 'VL004', 'SS004', 'Red Grouse', 5, '2025-01-10', '0900', 'Snow', NULL, FALSE),
('SG006', 'VL005', 'SS006', 'Red Squirrel', 3, '2025-02-20', '1130', 'Cloudy', 'Feeding at base of oak', TRUE),
('SG007', 'VL006', 'SS007', 'Mountain Hare', 4, '2025-01-25', '0830', 'Snow', 'Winter coats visible', TRUE),
('SG008', 'VL006', 'SS007', 'Golden Eagle', 2, '2025-02-14', '1400', 'Clear', 'Pair circling above plateau', TRUE),
('SG009', 'VL007', 'SS005', 'White-tailed Eagle', 1, '2025-03-05', '0915', 'Cloudy', NULL, FALSE),
('SG010', 'VL007', 'SS005', 'Common Seal', 12, '2025-03-05', '1045', 'Cloudy', 'Hauled out on rocks', TRUE),
('SG011', 'VL009', 'SS001', 'Osprey', 1, '2026-01-03', '1230', 'Clear', 'Diving for fish', TRUE),
('SG012', 'VL009', 'SS001', 'Otter', 2, '2026-02-03', '1315', 'Clear', 'Mother and cub', TRUE),
('SG013', 'VL001', 'SS003', 'Red Squirrel', 1, '2025-04-07', '1000', 'Clear', NULL, FALSE),
('SG014', 'VL010', 'SS003', 'Pine Marten', 1, '2025-04-07', '1145', 'Clear', 'Resting in tree hollow', TRUE),
('SG015', 'VL002', 'SS007', 'Red Grouse', 7, '2025-02-28', '0845', 'Fog', NULL, FALSE),
('SG016', 'VL004', 'SS004', 'Mountain Hare', 6, '2025-03-20', '1050', 'Clear', NULL, FALSE),
('SG017', 'VL005', 'SS002', 'Harbour Porpoise', 3, '2025-03-22', '1400', 'Rain', 'Close to shore', FALSE),
('SG018', 'VL001', 'SS006', 'Red Kite', 2, '2026-03-05', '1115', 'Clear', 'Soaring over treeline', TRUE),
('SG019', 'VL006', 'SS004', 'Scottish Wildcat', 1, '2025-01-30', '0630', 'Clear', 'Possible sighting, photo inconclusive', TRUE),
('SG020', 'VL009', 'SS001', 'Common Frog', 15, '2025-04-10', '1000', 'Rain', 'Spawn observed at edge', FALSE),
('SG021', 'VL010', 'SS007', 'Golden Eagle', 1, '2025-04-08', '1330', 'Clear', NULL, FALSE),
('SG022', 'VL004', 'SS005', 'White-tailed Eagle', 2, '2025-03-18', '0900', 'Cloudy', 'Pair nesting nearby', TRUE),
('SG023', 'VL005', 'SS006', 'Osprey', 1, '2025-04-12', '1200', 'Clear', 'Perched above river bend', TRUE),
('SG024', 'VL009', 'SS005', 'Harbour Porpoise', 5, '2025-04-02', '1030', 'Clear', NULL, FALSE),
('SG025', 'VL002', 'SS003', 'Red Squirrel', 4, '2026-04-09', '1015', 'Clear', 'Busy feeding day', TRUE),
('SG026', 'VL001', 'SS001', 'Otter', 1, '2025-03-28', '0800', 'Fog', 'Brief sighting at dawn', FALSE),
('SG027', 'VL002', 'SS007', 'Red Grouse', 9, '2025-03-10', '0900', 'Clear', NULL, FALSE),
('SG028', 'VL009', 'SS002', 'Bottlenose Dolphin', 4, '2025-04-11', '1130', 'Clear', 'Feeding near headland', TRUE),
('SG029', 'VL009', 'SS006', 'Great Crested Newt', 3, '2025-04-06', '1900', 'Cloudy', 'Found near pond edge after dusk', TRUE),
('SG030', 'VL004', 'SS004', 'Mountain Hare', 2, '2025-04-13', '0730', 'Clear', NULL, FALSE),
('SG031', 'VL002', 'SS002', 'Common Seal', 7, '2025-04-14', '1300', 'Clear', 'Resting on sandbar', TRUE),
('SG032', 'VL010', 'SS005', 'Red Kite', 1, '2025-04-15', '1045', 'Cloudy', NULL, FALSE);