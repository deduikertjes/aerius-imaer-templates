import csv
from gml_templating_lib import render_gml_from_IMAERtemplate, IMAERgeometry

data = {
    'year': 2020,
    'version': 'BETA11_20150421_7cd628b230',
    'dbVersion': 'BETA11_20150421_7cd628b230',
    'situationName': 'bouwfase2020'
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
                'inlandShippings': [{
                    'shipType': row['shipType'],
                    'description': row['description'],
                    'noAB': row['noAB'],
                    'noBA': row['noBA'],
                    'pLadenAB': row['pLadenAB'],
                    'pLadenBA': row['pLadenBA']
                }]
            })
        else:
            # add an inlandShipping to the last featureMember
            # this assumes that the data in the csv file is ordered bu gmlId
            data['featureMembers'][-1]['inlandShippings'].append({
                    'shipType': row['shipType'],
                    'description': row['description'],
                    'noAB': row['noAB'],
                    'noBA': row['noBA'],
                    'pLadenAB': row['pLadenAB'],
                    'pLadenBA': row['pLadenBA']
            })

print render_gml_from_IMAERtemplate(".", "feature_members_template.gml", **data).strip()
