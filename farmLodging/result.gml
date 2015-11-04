<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<imaer:FeatureCollectionCalculator xmlns:imaer="http://imaer.aerius.nl/1.0" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" gml:id="NL.IMAER.Collection" xsi:schemaLocation="http://imaer.aerius.nl/1.0 http://imaer.aerius.nl/1.0/IMAER.xsd">

<imaer:aeriusCalculatorMetaData>
    <imaer:year>2020</imaer:year>
    <imaer:version>BETA11_20150421_7cd628b230</imaer:version>
    <imaer:databaseVersion>BETA11_20150421_7cd628b230</imaer:databaseVersion>
    <imaer:situationName>bouwfase2020</imaer:situationName>
</imaer:aeriusCalculatorMetaData>



<imaer:featureMembers>

    <imaer:FarmLodgingEmissionSource sectorId="4110" gml:id="ES.1">
        <imaer:identifier>
            <imaer:NEN3610ID>
                <imaer:namespace>NL.IMAER</imaer:namespace>
                <imaer:localId>ES.1</imaer:localId>
            </imaer:NEN3610ID>
        </imaer:identifier>
        <imaer:label>stal</imaer:label>
        
        <imaer:emissionSourceCharacteristics>
            <imaer:EmissionSourceCharacteristics>
                <imaer:heatContent>1</imaer:heatContent>
                <imaer:emissionHeight>5</imaer:emissionHeight>
                
            </imaer:EmissionSourceCharacteristics>
        </imaer:emissionSourceCharacteristics>
        

<imaer:geometry>
  <imaer:EmissionSourceGeometry>
    <imaer:GM_Point>
      <gml:Point gml:id="ES.1.POINT">
        <gml:pos>177412.54 442275.12</gml:pos>
      </gml:Point>
    </imaer:GM_Point>
  </imaer:EmissionSourceGeometry>
</imaer:geometry>

       
        <imaer:farmLodging>
            <imaer:StandardFarmLodging farmLodgingType="A1.17">
                <imaer:numberOfAnimals>600</imaer:numberOfAnimals>
                <imaer:farmLodgingSystemDefinitionType>BWL2012.02.V2</imaer:farmLodgingSystemDefinitionType>
            </imaer:StandardFarmLodging>
        </imaer:farmLodging>
        
        <imaer:farmLodging>
            <imaer:StandardFarmLodging farmLodgingType="A1.18">
                <imaer:numberOfAnimals>500</imaer:numberOfAnimals>
                <imaer:farmLodgingSystemDefinitionType>BWL2012.02.V2</imaer:farmLodgingSystemDefinitionType>
            </imaer:StandardFarmLodging>
        </imaer:farmLodging>
        
    </imaer:FarmLodgingEmissionSource>

</imaer:featureMembers>


</imaer:FeatureCollectionCalculator>
