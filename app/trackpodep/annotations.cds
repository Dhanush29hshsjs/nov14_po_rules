using CatalogService as service from '../../srv/service';

annotate service.Track_po with @(
    UI.DeleteHidden: true,
    UI.LineItem    : [
        {
            $Type: 'UI.DataField',
            Label: 'PO NO',
            Value: po_number,
        },
        {
            $Type: 'UI.DataField',
            Label: 'REF.PO NO',
            Value: ref_po_no,
        },
        {
            $Type: 'UI.DataField',
            Value: supplier_name,
            Label: 'SUPPLIER NAME',
        },
        {
            $Type: 'UI.DataField',
            Label: 'PO DATE',
            Value: Date,
        },
        {
            $Type: 'UI.DataField',
            Label: 'MODIFIED BY',
            Value: modified_by,
        },
        {
            $Type: 'UI.DataField',
            Value: status,
            Label: 'STATUS',
        },
        {
            $Type: 'UI.DataField',
            Label: 'ERROR LOG',
            Value: error_log,
        },
    ]
);

annotate service.Track_po with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ref_po_no',
                Value: ref_po_no,
            },
            {
                $Type: 'UI.DataField',
                Label: 'error_log',
                Value: error_log,
            },
            {
                $Type: 'UI.DataField',
                Label: 'modified_by',
                Value: modified_by,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Date',
                Value: Date,
            },
            {
                $Type: 'UI.DataField',
                Label: 'po_number',
                Value: po_number,
            },
            {
                $Type: 'UI.DataField',
                Label: 'status',
                Value: status,
            },
            {
                $Type: 'UI.DataField',
                Label: 'supplier_name',
                Value: supplier_name,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
