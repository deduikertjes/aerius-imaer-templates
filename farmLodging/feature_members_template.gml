{% extends "base_template.gml" %}

{% block featureMembers %}

<imaer:featureMembers>
{% for f in featureMembers %}
    <imaer:FarmLodgingEmissionSource sectorId="{{ f['sectorId'] }}" gml:id="{{ f['gmlId'] }}">
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
       {% for is in f['farmLodgings'] %}
        <imaer:farmLodging>
            <imaer:StandardFarmLodging farmLodgingType="{{ is['farmLodgingType']}}">
                <imaer:numberOfAnimals>{{ is['numberOfAnimals'] }}</imaer:numberOfAnimals>
                <imaer:farmLodgingSystemDefinitionType>{{ is['farmLodgingSystemDefinitionType'] }}</imaer:farmLodgingSystemDefinitionType>
                 {% if is['fodderMeasureType'] %}
                <imaer:fodderMeasure>
                    <imaer:LodgingFodderMeasure>
                        <imaer:fodderMeasureType>{{ is['fodderMeasureType'] }}</imaer:fodderMeasureType>
                    </imaer:LodgingFodderMeasure>
                </imaer:fodderMeasure>
                {% endif %}
                {% if is['lodgingSystemType'] and is['lst_numberOfAnimals'] %}
                <imaer:lodgingSystem>
                    <imaer:AdditionalLodgingSystem>
                        <imaer:lodgingSystemType>{{ is['lodgingSystemType'] }}</imaer:lodgingSystemType>
                        <imaer:numberOfAnimals>{{ is['lst_numberOfAnimals'] }}</imaer:numberOfAnimals>
                        </imaer:AdditionalLodgingSystem>
                </imaer:lodgingSystem>
                {% endif %}
            </imaer:StandardFarmLodging>
        </imaer:farmLodging>
        {% endfor %}
    </imaer:FarmLodgingEmissionSource>
{% endfor %}
</imaer:featureMembers>
{% endblock %}
