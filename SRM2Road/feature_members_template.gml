{% extends "base_template.gml" %}
{% block featureMembers %}
<imaer:featureMembers>
    {% for f in featureMembers %}
    <imaer:SRM2Road sectorId="{{ f['sectorId'] }}" gml:id="{{ f['gmlId'] }}">
        <imaer:identifier>
            <imaer:NEN3610ID>
                <imaer:namespace>NL.IMAER</imaer:namespace>
                <imaer:localId>{{ f['gmlId'] }}</imaer:localId>
            </imaer:NEN3610ID>
        </imaer:identifier>
        {% if f['label'] %}<imaer:label>{{ f['label'] }}</imaer:label>{% endif %}
        {% if f['heatContent'] and f['emissionHeight'] %}
        <imaer:emissionSourceCharacteristics>
            <imaer:EmissionSourceCharacteristics>
                <imaer:heatContent>{{ f['heatContent']}}</imaer:heatContent>
                <imaer:emissionHeight>{{ f['emissionHeight']}}</imaer:emissionHeight>
                {% if f['spread'] %}<imaer:spread>{{ f['spread'] }}</imaer:spread>{% endif %}
                {% if f['buildingHeight'] %}<imaer:buildingHeight>{{ f['buildingHeight'] }}</imaer:buildingHeight>{% endif %}
                {% if f['diurnalVariation'] %}<imaer:diurnalVariation>{{ f['diurnalVariation'] }}</imaer:diurnalVariation>{% endif %}
            </imaer:EmissionSourceCharacteristics>
        </imaer:emissionSourceCharacteristics>
        {% endif %}

{{ f['geometry'] }}
        {% for is in f['vehicles'] %}
        <imaer:vehicles>
            <imaer:StandardVehicle vehicleType="{{ is['vehicleType'] }}">
                <imaer:vehiclesPerDay>{{ is['VEHpDAY']}}</imaer:vehiclesPerDay>
                <imaer:stagnationFactor>{{ is['Fstag'] }}</imaer:stagnationFactor>
            </imaer:StandardVehicle>
        </imaer:vehicles>
        {% endfor %}
        <imaer:isFreeway>true</imaer:isFreeway>
        <imaer:maximumSpeed>{{ f['maxspeed'] }}</imaer:maximumSpeed>
        <imaer:strictEnforcement>false</imaer:strictEnforcement>
        <imaer:elevation>NORMAL</imaer:elevation>
    </imaer:SRM2Road>
    {% endfor %}
</imaer:featureMembers>
{% endblock %}

