import csv
from gml_templating_lib import render_gml_from_IMAERtemplate, IMAERgeometry

data = {
    'year': 2020,
    'situationName': 'voorbeeld snelweg'
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
                'maxspeed': row['maxspeed'],
                'vehicles': [{
                    'vehicleType': row['vehicleType'],
                    'VEHpDAY': row['VEHpDAY'],
                    'Fstag': row['Fstag']
                }]
            })
        else:
            # add an inlandShipping to the last featureMember
            # this assumes that the data in the csv file is ordered bu gmlId
            data['featureMembers'][-1]['vehicles'].append({
                    'vehicleType': row['vehicleType'],
                    'VEHpDAY': row['VEHpDAY'],
                    'Fstag': row['Fstag']
            })

print render_gml_from_IMAERtemplate(".", "feature_members_template.gml", **data).strip()
