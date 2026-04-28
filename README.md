# UI107004_A1
## UI107004 - Assessment 1 - Practical Coding Assignment

# Highland Wildlife Trust — Sightings Database
A database system with report generation for the Highland Wildlife Trust, a conservation charity coordinating volunteer wildlife surveys across northern Scotland. Built with MySQL and Python.

- **sql/schema.sql** - Database schema including tables, constraints and trigger
- **sql/seed.sql** - Sample data for all tables
- **sql/queries.sql** - 8 queries demonstrating CRUD, filtering, aggregation and more
- **sql/procedure.sql** - Stored procedure for site summary reporting
- **data/sightings_export.json** - JSON data export for SS003 Rothiemurchus Forest
- **data/sightings_export.xml** - XML data export for SS003 Rothiemurchus Forest
- **data/sightings_schema.dtd** - DTD for XML validation
- **python/parse_json.py** - Parses and displays the JSON export
- **python/parse_xml.py** - Parses and displays the XML export

## Requirements
- MySQL installed https://www.mysql.com/downloads/
- Python installed https://www.python.org/downloads/

## Setting up the database
Open each SQL file in MySQL Workbench and run in the following order:

**1. Create the schema:**
```bash
schema.sql
```
**2. Populate with sample data:**
```bash
seed.sql
```
**3. Run the queries:**
```bash
queries.sql
```
**4. Create the stored procedure:**
```bash
procedure.sql
```

## Running the stored procedure
Two CALLs are present in procedure.sql for testing, but this can be tested with any site_id and date range (YYYY-MM-DD) inputs:
```sql
CALL summary('site_id', 'start_date', 'end_date');
```

## Running the Python scripts
Run from inside the `python/` folder:
```bash
cd python
python parse_json.py
python parse_xml.py
```