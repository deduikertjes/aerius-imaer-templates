{% extends "base_template.gml" %}
{# THIS TEMPLATE WILL NOT GENERATE A COMPLETE gml #}
{# THIS TEMPLATE DEMONSTRATES HOW TO GENERATE CALCULATION POINTS #}

{% block featureMembers %}

<imaer:featureMembers>
{% for f in featureMembers %}
<imaer:CalculationPoint gml:id="{{ f['gmlId'] }}">
    <imaer:identifier>
        <imaer:NEN3610ID>
            <imaer:namespace>NL.IMAER</imaer:namespace>
            <imaer:localId>{{ f['gmlId'] }}</imaer:localId>
        </imaer:NEN3610ID>
    </imaer:identifier>
{{ f['geometry'] }}
    {% if f['cp_label'] %}<imaer:label>{{ f['cp_label'] }}</imaer:label>{% endif %}
</imaer:CalculationPoint>
{% endfor %}
</imaer:featureMembers>
{% endblock %}
