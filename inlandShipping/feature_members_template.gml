{% extends "base_template.gml" %}
{% block featureMembers %}
<imaer:featureMembers>
    {% for f in featureMembers %}
    <imaer:InlandShippingEmissionSource sectorId="{{ f['sectorId'] }}" gml:id="{{ f['gmlId'] }}">
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
        {% for is in f['inlandShippings'] %}
            <imaer:inlandShipping>
                <imaer:InlandShipping shipType="{{ is['shipType'] }}">
                    <imaer:description>{{ is['description'] }}</imaer:description>
                    <imaer:numberOfShipsAtoB>{{ is['noAB'] }}</imaer:numberOfShipsAtoB>
                    <imaer:numberOfShipsBtoA>{{ is['noBA'] }}</imaer:numberOfShipsBtoA>
                    <imaer:percentageLadenAtoB>{{ is['pLadenAB'] }}</imaer:percentageLadenAtoB>
                    <imaer:percentageLadenBtoA>{{ is['pLadenBA'] }}</imaer:percentageLadenBtoA>
                </imaer:InlandShipping>
            </imaer:inlandShipping>
        {% endfor %}
    </imaer:InlandShippingEmissionSource>
    {% endfor %}
</imaer:featureMembers>
{% endblock %}

