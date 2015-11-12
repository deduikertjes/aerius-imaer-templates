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

import xml.dom.minidom
import re
from jinja2 import FileSystemLoader, Environment

# constants
_gmlNS = "http://www.opengis.net/gml/3.2"
_imaerNS = "http://imaer.aerius.nl/1.0"
_imaerSchemaLocation = "http://imaer.aerius.nl/1.0/IMAER.xsd"

class _WKTParser:
    """ Private class to grab gml posList and geoType from WKT
        Modified from pysal which is Modified from... 
        #URL: http://dev.openlayers.org/releases/OpenLayers-2.7/lib/OpenLayers/Format/WKT.js
        #Reg Ex Strings copied from OpenLayers.Format.WKT
    """
    regExes = {'typeStr': re.compile('^\s*([\w\s]+)\s*\(\s*(.*)\s*\)\s*$'),
               'spaces': re.compile('\s+'),
               'parenComma': re.compile('\)\s*,\s*\('),
               'doubleParenComma': re.compile('\)\s*\)\s*,\s*\(\s*\('),  # can't use {2} here
               'trimParens': re.compile('^\s*\(?(.*?)\)?\s*$')}

    def __init__(self):
        self.parsers = p = {}
        p['point'] = self.Point
        p['linestring'] = self.LineString
        p['polygon'] = self.Polygon

    def Point(self, geoStr):
        return geoStr.strip()

    def LineString(self, geoStr):
        return geoStr.strip().replace(',',' ')

    def Polygon(self, geoStr):
        rings = self.regExes['parenComma'].split(geoStr.strip())
        for i, ring in enumerate(rings):
            ring = self.regExes['trimParens'].match(ring).groups()[0]
            ring = self.LineString(ring)
            rings[i] = ring
        return rings
        
    def fromWKT(self, wkt, returnGeoType = False):
        matches = self.regExes['typeStr'].match(wkt)
        if matches:
            geoType, geoStr = matches.groups()
            geoType = geoType.lower().strip()
            try:
                if returnGeoType:
                    return geoType, self.parsers[geoType](geoStr)
                else:
                    return self.parsers[geoType](geoStr)
            except KeyError:
                raise NotImplementedError("Unsupported WKT Type: %s" % geoType)
        else:
            return None
    
    __call__ = fromWKT

class IMAERgeometry():
    def __init__(self, wktGeometry, gmlId, isCalculationPoint = False):
        if not gmlId:
            raise ValueError("EmissionSource:gmlId cannot be empty")
        if not gmlId[0:3] == 'ES.':
            gmlId = 'ES.%s' % gmlId
        _idCheck = re.compile(r'^[a-zA-Z_][\w.-]*$')
        if not _idCheck.match(str(gmlId)):
            raise ValueError("EmissionSource:gmlId of '%s' not allowed (It can only contain letters, digits, underscores, hyphens, and periods)" % gmlId)

        self.wktGeometry = wktGeometry
        self.gmlId = str(gmlId)
        self.isCalculationPoint = isCalculationPoint 
    
    def  __str__(self):
            return self.dom.toprettyxml(indent='  ', encoding="UTF-8")
            
    @property
    def dom(self):
        '''
        Returns a domNode containing Imaer gml geometry'''
              
        if self.wktGeometry:
            return self.getImaerGeomFromWkt(self.wktGeometry, self.gmlId, self.isCalculationPoint)

    def getImaerGeomFromWkt(self, wktGeometry, gmlId, isCalculationPoint):
        '''
        Creates a valid IMAER geometry domNode from a wkt geometry.
        This wkt geometry must be in EPSG:28992, 
        have a type of 'POINT','LINESTRING' or 'POLYGON'
        and have a precision of 3.'''

        doc = xml.dom.minidom.Document()
        geometry = doc.createElementNS(_imaerNS,"imaer:geometry")
        _emissionSourceGeometry = doc.createElementNS(_imaerNS,"imaer:EmissionSourceGeometry")
        _point = doc.createElementNS(_imaerNS,"imaer:GM_Point")
        _curve = doc.createElementNS(_imaerNS,"imaer:GM_Curve")
        _surface = doc.createElementNS(_imaerNS,"imaer:GM_Surface")

        _wkt = _WKTParser()
        _wktGeomType, _posLists = _wkt(self.wktGeometry, True)

        if _wktGeomType == 'point':
            _gmlPoint = doc.createElementNS(_gmlNS,"gml:Point")
            _gmlPoint.setAttributeNS(_gmlNS, 'gml:id', '%s.POINT' % self.gmlId)
            _gmlPos = doc.createElementNS(_gmlNS, "gml:pos")
            _gmlPos.appendChild(doc.createTextNode(_posLists))
            _gmlPoint.appendChild(_gmlPos)
            _point.appendChild(_gmlPoint)
            if isCalculationPoint:
                return _point
            _emissionSourceGeometry.appendChild(_point)
        if _wktGeomType == 'linestring':
            _gmlLine = doc.createElementNS(_gmlNS,"gml:LineString")
            _gmlLine.setAttributeNS(_gmlNS, 'gml:id', '%s.LINE' % self.gmlId)
            _gmlPosList = doc.createElementNS(_gmlNS, "gml:posList")
            _gmlPosList.appendChild(doc.createTextNode(_posLists))
            _gmlLine.appendChild(_gmlPosList)
            _curve.appendChild(_gmlLine)
            _emissionSourceGeometry.appendChild(_curve)
        if _wktGeomType == 'polygon':
            _gmlPoly = doc.createElementNS(_gmlNS,"gml:Polygon")
            _gmlPoly.setAttributeNS(_gmlNS, 'gml:id', '%s.POLYGON' % self.gmlId)
            _gmlExterior = doc.createElementNS(_gmlNS,"gml:exterior")
            _gmlRing = doc.createElementNS(_gmlNS,"gml:LinearRing")
            _gmlPosList = doc.createElementNS(_gmlNS, "gml:posList")
            _gmlPosList.appendChild(doc.createTextNode(_posLists[0]))
            _gmlRing.appendChild(_gmlPosList)
            _gmlExterior.appendChild(_gmlRing)
            _gmlPoly.appendChild(_gmlExterior)
            for _posList in _posLists[1:]:
                _gmlInterior = doc.createElementNS(_gmlNS,"gml:interior")
                _gmlRing = doc.createElementNS(_gmlNS,"gml:LinearRing")
                _gmlPosList = doc.createElementNS(_gmlNS, "gml:posList")
                _gmlPosList.appendChild(doc.createTextNode(_posList))
                _gmlRing.appendChild(_gmlPosList)
                _gmlInterior.appendChild(_gmlRing)
                _gmlPoly.appendChild(_gmlInterior)
                
            _surface.appendChild(_gmlPoly)
            _emissionSourceGeometry.appendChild(_surface)

        geometry.appendChild(_emissionSourceGeometry)
        return geometry


def render_gml_from_IMAERtemplate(directory, template_name, **kwargs):
    loader = FileSystemLoader(directory)
    env = Environment(loader=loader)
    template = env.get_template(template_name)
    return template.render(**kwargs)
