using CatalogService as service from '../../srv/service';

annotate service.assignment_ruless with @(
     UI.FieldGroup #FieldGroup4 : {
    Data : [
         {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.toggleon',
            Label : 'active',
            Criticality : #Positive ,
            Inline : true,
             ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'is_on'}, 'n']}},
              
            
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.toggleoff',
            Label : 'inactive',
            Criticality : #Negative ,
            Inline : true,
            ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'is_on'}, 'y']}},
            
        },
    ]
},
UI.DeleteHidden:true,
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : rule_name,
            Label : 'ASSIGNMENT RULE',
        },{
            $Type : 'UI.DataField',
            Value : asstoapp.name,
            Label : 'MEMBER(S)',
        },{
            $Type : 'UI.DataField',
            Value : comments,
            Label : 'COMMENTS',
        }, {
        $Type : 'UI.DataFieldForAnnotation',
        Target : '@UI.FieldGroup#FieldGroup4',
        Label : 'STATUS'
    },]
);
annotate service.assignment_ruless with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
           
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
annotate service.assignment_ruless with @(
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Assignment Rules',
    }
);
annotate service.approval_rules with @(
    UI.DeleteHidden:true,
       UI.FieldGroup #FieldGroup3 : {
    Data : [
         {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.apprtoggleon',
            Label : 'active',
            Criticality : #Positive ,
            Inline : true,
             ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'is_on'}, 'n']}},
              
            
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CatalogService.apprtoggleoff',
            Label : 'inactive',
            Criticality : #Negative ,
            Inline : true,
            ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'is_on'}, 'y']}},
            
        },
    ]
},
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : apprtocri.rule,
            Label : 'RULE',
        },{
            $Type : 'UI.DataField',
            Value : approval_type,
            Label : 'APPROVAL TYPE',
        },{
            $Type : 'UI.DataField',
            Value : apprtoapp.name,
            Label : 'APPROVER',
        },{
            $Type : 'UI.DataField',
            Value : comments,
            Label : 'COMMENTS',
        },{
        $Type : 'UI.DataFieldForAnnotation',
        Target : '@UI.FieldGroup#FieldGroup3',
        Label : 'STATUS'
    },
       
      ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Approval Rules',
    }
);
annotate service.emailnotification with @(
    UI.DeleteHidden:true,
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : status_desc,
            Label : 'STATUS',
        },{
            $Type : 'UI.DataField',
            Value : mailtocc.name,
            Label : 'CC',
        },{
            $Type : 'UI.DataField',
            Value : subject,
            Label : 'MAIL SUBJECT',
        },{
            $Type : 'UI.DataField',
            Value : body,
            Label : 'MAIL BODY',
        },],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Email Notifications',
    }
);
