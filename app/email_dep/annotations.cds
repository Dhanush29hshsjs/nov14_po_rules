using CatalogService as service from '../../srv/service';
annotate service.email with @UI.PresentationVariant: {
    Visualizations: ['@UI.LineItem'],
    SortOrder     : [{
        $Type     : 'Common.SortOrderType',
        Property  : DATE,
        Descending: true
    },{
        $Type     : 'Common.SortOrderType',
        Property  : TIME,
        Descending: true
    }, ],
};
annotate service.email with @(
    UI.DeleteHidden : true,
     UI.FieldGroup #FieldGroup3 : {
    Data : [
         {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.buttomaction',
            Label : 'Process',
            Criticality : 3 ,
            Inline : true,
             ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'isReaded'}, 'yes']}}
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.buttomaction1',
            Label : 'Processed',
            Criticality : 1 ,
            Inline : true,
            ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'isReaded'}, 'no']}}
        },
    ]
},  UI.LineItem :  [
        {
            $Type : 'UI.DataField',
            Label : 'FROM',
            Value : FROM_,
            
        },
        {
            $Type : 'UI.DataField',
            Label : 'DATE',
            Value : DATE,
        },
        {
            $Type : 'UI.DataField',
            Label : 'TIME',
            Value : TIME,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SUBJECT',
            Value : SUBJECT,
        },
        {
            $Type : 'UI.DataField',
            Value : ass2.invoice_no,
            Label : 'INVOICE NO',
        },
        {
            $Type : 'UI.DataField',
            Value : TIME_TAKEN,
            Label : 'TIME TAKEN',
        },
        {
            $Type : 'UI.DataField',
            Value : ass1.filename,
            Label : 'ATTACHMENTS',
        },
         {
        $Type : 'UI.DataFieldForAnnotation',
        Target : '@UI.FieldGroup#FieldGroup3',
        Label : ' '
    },
       
    ]
);
annotate service.email with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'msg_id',
                Value : msg_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FROM_',
                Value : FROM_,
            },
            {
                $Type : 'UI.DataField',
                Label : 'DATE',
                Value : DATE,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TIME',
                Value : TIME,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SUBJECT',
                Value : SUBJECT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TIME_TAKEN',
                Value : TIME_TAKEN,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isReaded',
                Value : isReaded,
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
