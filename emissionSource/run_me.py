#!/usr/bin/env python2.7
"""
Copyright [Participants AERIUS Masterclass: Marco Duiker, Peer vd Sande, Alex Bouthoorn, Laurens vd Burgt, Rik Zegers, Lotte Dijk, Kaj Fabri, Esther Kokmeyer, Christa Blokhuis, Anneke Donkersloot, Japer Harbers, Roy Laurijsse, Luc Meegens, Marike Aalbers]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 
"""

import os
os.chdir(os.path.dirname(os.path.realpath(__file__)))

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
