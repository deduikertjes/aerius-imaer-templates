import csv
from gml_templating_lib import render_gml_from_IMAERtemplate, IMAERgeometry

data = {}

old_gmlId = 'a bogus string which will be never ased as an id'
data['featureMembers'] = []

with open('example.csv', 'rt') as csvFile:
    reader = csv.DictReader(csvFile)
    for row in reader:
        if not old_gmlId == row['gmlId']:
            # add a complete new featureMember
            old_gmlId = row['gmlId']
            data['featureMembers'].append({
                'gmlId': row['gmlId'],
                'cp_label': row['cp_label'],
                'geometry': str(IMAERgeometry(row['WKT'],row['gmlId'], isCalculationPoint = True))
            })
        else:
            # should not happen
            pass

print render_gml_from_IMAERtemplate(".", "feature_members_template.gml", **data).strip()
