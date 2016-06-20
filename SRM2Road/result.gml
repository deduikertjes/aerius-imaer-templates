<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<imaer:FeatureCollectionCalculator xmlns:imaer="http://imaer.aerius.nl/1.1" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" gml:id="NL.IMAER.Collection" xsi:schemaLocation="http://imaer.aerius.nl/1.1 http://imaer.aerius.nl/1.1/IMAER.xsd">

<imaer:aeriusCalculatorMetaData>
    <imaer:year>2020</imaer:year>
    
    
    <imaer:situationName>voorbeeld snelweg</imaer:situationName>
    
    
    
</imaer:aeriusCalculatorMetaData>


<imaer:featureMembers>
    
    <imaer:SRM2Road sectorId="3111" gml:id="ES.1">
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

        
        <imaer:vehicles>
            <imaer:StandardVehicle vehicleType="LIGHT_TRAFFIC">
                <imaer:vehiclesPerDay>50000</imaer:vehiclesPerDay>
                <imaer:stagnationFactor>0.05</imaer:stagnationFactor>
            </imaer:StandardVehicle>
        </imaer:vehicles>
        
        <imaer:vehicles>
            <imaer:StandardVehicle vehicleType="NORMAL_FREIGHT">
                <imaer:vehiclesPerDay>4500</imaer:vehiclesPerDay>
                <imaer:stagnationFactor>0.07</imaer:stagnationFactor>
            </imaer:StandardVehicle>
        </imaer:vehicles>
        
        <imaer:vehicles>
            <imaer:StandardVehicle vehicleType="HEAVY_FREIGHT">
                <imaer:vehiclesPerDay>5000</imaer:vehiclesPerDay>
                <imaer:stagnationFactor>0.03</imaer:stagnationFactor>
            </imaer:StandardVehicle>
        </imaer:vehicles>
        
        <imaer:vehicles>
            <imaer:StandardVehicle vehicleType="AUTO_BUS">
                <imaer:vehiclesPerDay>0</imaer:vehiclesPerDay>
                <imaer:stagnationFactor>0</imaer:stagnationFactor>
            </imaer:StandardVehicle>
        </imaer:vehicles>
        
        <imaer:isFreeway>true</imaer:isFreeway>
        <imaer:maximumSpeed>120</imaer:maximumSpeed>
        <imaer:strictEnforcement>false</imaer:strictEnforcement>
        <imaer:elevation>NORMAL</imaer:elevation>
    </imaer:SRM2Road>
    
</imaer:featureMembers>


</imaer:FeatureCollectionCalculator>
