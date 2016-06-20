<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<imaer:FeatureCollectionCalculator xmlns:imaer="http://imaer.aerius.nl/1.1" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" gml:id="NL.IMAER.Collection" xsi:schemaLocation="http://imaer.aerius.nl/1.1 http://imaer.aerius.nl/1.1/IMAER.xsd">

<imaer:aeriusCalculatorMetaData>
    {% if year %}<imaer:year>{{ year }}</imaer:year>{% endif %}
    {% if version %}<imaer:version>{{ version }}</imaer:version>{% endif %}
    {% if databaseVersion %}<imaer:databaseVersion>{{ dbVersion }}</imaer:databaseVersion>{% endif %}
    {% if situationName %}<imaer:situationName>{{ situationName }}</imaer:situationName>{% endif %}
    {% if corporation %}<imaer:corporation>{{ corporation }}</imaer:corporation>{% endif %}
    {% if temporaryPeriod %}<imaer:temporaryPeriod>{{ temporaryPeriod }}</imaer:temporaryPeriod>{% endif %}
    {% if description %}<imaer:description>{{ description }}</imaer:description>{% endif %}
</imaer:aeriusCalculatorMetaData>

{% block featureMembers %}
{% endblock %}

</imaer:FeatureCollectionCalculator>
