{% extends "base_template.gml" %}
{% block featureMembers %}
<imaer:featureMembers>
    {% for f in featureMembers %}
    <imaer:EmissionSource sectorId="{{ f['sectorId'] }}" gml:id="{{ f['gmlId'] }}">
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
    {% if f['NH3'] %}
    <imaer:emission>
        <imaer:Emission substance="NH3">
            <imaer:value>{{ f['NH3'] }}</imaer:value>
        </imaer:Emission>
    </imaer:emission>
    {% endif %}
    {% if f['NOX'] %}
    <imaer:emission>
        <imaer:Emission substance="NOX">
            <imaer:value>{{ f['NOX'] }}</imaer:value>
        </imaer:Emission>
    </imaer:emission>
    {% endif %}
    {% if f['PM10'] %}
    <imaer:emission>
        <imaer:Emission substance="PM10">
            <imaer:value>{{ f['PM10'] }}</imaer:value>
        </imaer:Emission>
    </imaer:emission>
    {% endif %}
    {% if f['NO2'] %}
    <imaer:emission>
        <imaer:Emission substance="NO2">
            <imaer:value>{{ f['NO2'] }}</imaer:value>
        </imaer:Emission>
    </imaer:emission>
    {% endif %}
    </imaer:EmissionSource>
    {% endfor %}
</imaer:featureMembers>
{% endblock %}
