import csv
from gml_templating_lib import render_gml_from_IMAERtemplate, IMAERgeometry

data = {
    'year': 2020,
    'situationName': 'test'
}


old_gmlId = 'a bogus string which will be never ased as an id'
data['featureMembers'] = []

with open('example.csv', 'rt') as csvFile:
    reader = csv.DictReader(csvFile)
    for row in reader:
        if not old_gmlId == row['gmlId']:
            # add a complete new featureMember
            old_gmlId = row['gmlId']
            data['featureMembers'].append({
                'sectorId': row['sectorId'],
                'gmlId': row['gmlId'],
                'geometry': str(IMAERgeometry(row['WKT'],row['gmlId'])),
                'NH3': row['NH3'],
                'NOX': row['NOX'],
                'PM10': row['PM10'],
                'NO2': row['NO2']
            })
        else:
            # should not happen
            pass

print render_gml_from_IMAERtemplate(".", "feature_members_template.gml", **data).strip()
