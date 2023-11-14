using CatalogService as service from '../../srv/service';

annotate service.assignment_ruless with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'f1',
            Value : f1,
        },
        {
            $Type : 'UI.DataField',
            Label : 'f2',
            Value : f2,
        },
        {
            $Type : 'UI.DataField',
            Label : 'f3',
            Value : f3,
        },
        {
            $Type : 'UI.DataField',
            Label : 'f4',
            Value : f4,
        },
    ]
);
annotate service.assignment_ruless with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'f1',
                Value : f1,
            },
            {
                $Type : 'UI.DataField',
                Label : 'f2',
                Value : f2,
            },
            {
                $Type : 'UI.DataField',
                Label : 'f3',
                Value : f3,
            },
            {
                $Type : 'UI.DataField',
                Label : 'f4',
                Value : f4,
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
