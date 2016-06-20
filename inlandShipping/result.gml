<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<imaer:FeatureCollectionCalculator xmlns:imaer="http://imaer.aerius.nl/1.1" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" gml:id="NL.IMAER.Collection" xsi:schemaLocation="http://imaer.aerius.nl/1.1 http://imaer.aerius.nl/1.1/IMAER.xsd">

<imaer:aeriusCalculatorMetaData>
    <imaer:year>2020</imaer:year>
    <imaer:version>BETA11_20150421_7cd628b230</imaer:version>
    <imaer:databaseVersion>BETA11_20150421_7cd628b230</imaer:databaseVersion>
    <imaer:situationName>bouwfase2020</imaer:situationName>
</imaer:aeriusCalculatorMetaData>


<imaer:featureMembers>
    
    <imaer:InlandShippingEmissionSource sectorId="7620" gml:id="ES.1">
        <imaer:identifier>
            <imaer:NEN3610ID>
                <imaer:namespace>NL.IMAER</imaer:namespace>
                <imaer:localId>ES.1</imaer:localId>
            </imaer:NEN3610ID>
        </imaer:identifier>
        
        

<imaer:geometry>
  <imaer:EmissionSourceGeometry>
    <imaer:GM_Curve>
      <gml:LineString gml:id="ES.1.LINE">
        <gml:posList>201182 502217 201197 502225 201213 502232 201231 502243 201247 502261 201263 502292</gml:posList>
      </gml:LineString>
    </imaer:GM_Curve>
  </imaer:EmissionSourceGeometry>
</imaer:geometry>

        
            <imaer:inlandShipping>
                <imaer:InlandShipping shipType="M2">
                    <imaer:description>M2 description</imaer:description>
                    <imaer:numberOfShipsAtoB>1</imaer:numberOfShipsAtoB>
                    <imaer:numberOfShipsBtoA>1</imaer:numberOfShipsBtoA>
                    <imaer:percentageLadenAtoB>65</imaer:percentageLadenAtoB>
                    <imaer:percentageLadenBtoA>65</imaer:percentageLadenBtoA>
                </imaer:InlandShipping>
            </imaer:inlandShipping>
        
            <imaer:inlandShipping>
                <imaer:InlandShipping shipType="M3">
                    <imaer:description>M3 description</imaer:description>
                    <imaer:numberOfShipsAtoB>2</imaer:numberOfShipsAtoB>
                    <imaer:numberOfShipsBtoA>2</imaer:numberOfShipsBtoA>
                    <imaer:percentageLadenAtoB>65</imaer:percentageLadenAtoB>
                    <imaer:percentageLadenBtoA>65</imaer:percentageLadenBtoA>
                </imaer:InlandShipping>
            </imaer:inlandShipping>
        
    </imaer:InlandShippingEmissionSource>
    
</imaer:featureMembers>


</imaer:FeatureCollectionCalculator>
