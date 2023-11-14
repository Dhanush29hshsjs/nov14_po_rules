using CatalogService as service from '../../srv/service';

annotate service.notification_rules with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Label : 'mail_subject',
                Value : mail_subject,
            },
            {
                $Type : 'UI.DataField',
                Label : 'mail_body',
                Value : mail_body,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.notification_rules with {
    status @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'rule_statuses',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status,
                    ValueListProperty : 'value2',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'table_key',
                    LocalDataProperty : table_key,
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true
)};
