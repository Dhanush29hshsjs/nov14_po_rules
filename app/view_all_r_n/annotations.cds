using CatalogService as service from '../../srv/service';
using from '../../db/schema';

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
            Value : apprtoapp.position,
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
    UI.CreateHidden:true,
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
annotate service.emailnotification with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Rules Notification',
            ID : 'RulesNotification',
            Facets : [
            {
            $Type : 'UI.ReferenceFacet',
            ID : 'Status',
            Target : '@UI.FieldGroup#Status',
        },
                {
            $Type : 'UI.ReferenceFacet',
            Label : 'CC',
            ID : 'tab',
            Target : 'mailtocc/@UI.LineItem#tab',
        },
                ],
        },
    ],
    UI.FieldGroup #Status : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_desc,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Value : subject,
                Label : 'Mail Subject',
            },{
                $Type : 'UI.DataField',
                Value : body,
                Label : 'Mail Body',
            },],
    }
);

annotate service.emailnotification with {
    status_desc @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'rule_statuses',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_desc,
                    ValueListProperty : 'value2',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'table_key',
                    LocalDataProperty : invoice_status,
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.mail_cc with {
    name @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'cc_s_h',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'fs_name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'member_id',
                    LocalDataProperty : member_id,
                },
            ],
            Label : 'CC',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.cc_s_h with {
    fs_name @Common.Text : {
            $value : position,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.mail_cc with @(
    UI.LineItem #cctable : [
    ]
);
annotate service.mail_cc with @(
    UI.LineItem #tab : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },]
);
annotate service.emailnotification with {
    subject @Common.FieldControl : #Mandatory
};
annotate service.emailnotification with {
    body @UI.MultiLineText : true
};
annotate service.emailnotification with {
    status_desc @Common.FieldControl : #ReadOnly
};
annotate service.approval_rules with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'c2',
            ID : 'c2',
            Facets : [
            {
            $Type : 'UI.ReferenceFacet',
            Label : 'Rule tab',
            ID : 'Ruletab',
            Target : 'apprtocri/@UI.LineItem#Ruletab',
        },
                {
            $Type : 'UI.ReferenceFacet',
            Label : 'form1',
            ID : 'form1',
            Target : '@UI.FieldGroup#form1',
        },
                ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Modify Approval Rules',
            ID : 'ModifyApprovalRules',
            Facets : [
            {
            $Type : 'UI.ReferenceFacet',
            Label : 'approvers',
            ID : 'approvers1',
            Target : 'apprtoapp/@UI.LineItem#approvers',
        },
                {
            $Type : 'UI.ReferenceFacet',
            Label : 'comments',
            ID : 'comments',
            Target : '@UI.FieldGroup#comments',
        },
                ],
        },
        // {
        //     $Type : 'UI.ReferenceFacet',
        //     Label : 'hide',
        //     ID : 'hide',
        //     Target : '@UI.FieldGroup#hide',
        // },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'demooo',
            ID : 'demooo',
            Target : 'apprtocri/@UI.LineItem#demooo',
        },
    ],
    UI.FieldGroup #form1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : approval_type,
                Label : 'Approval Type',
            },],
    }
);
annotate service.approval_rules with {
    criteria @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'approvalrulesdecider_s_h',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : criteria,
                    ValueListProperty : 'value2',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
//  
// 
// 
//  
annotate service.criteria with @(
    UI.LineItem #Ruletab : [
        {
            $Type : 'UI.DataField',
            Value : Criteria,
            Label : 'Criteria',
        },{
            $Type : 'UI.DataField',
            Value : Condition,
            Label : 'Condition',
        },{
            $Type : 'UI.DataField',
            Value : Value1,
            Label : 'Value',
             ![@UI.Hidden] : {$edmJson : {$Eq : [{$Path : 'Criteria'}, 'Amount']}}
        },
        {
            $Type : 'UI.DataField',
            Value : Value2,
            Label : 'Amount',
             ![@UI.Hidden] : {$edmJson : 
                              
                       {$Or: [ {$Or: [    {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'Cost Center']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Default']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'Department']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]},

                                  {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'Document Type']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'G/ L Account']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]}, ]},{$Or: [    {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'Item Category']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'Jurisdiction Code']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]},

                                  {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'PO Type']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'Vendor']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]}, ]},]},
                                         
                                         },
        },
        {
            $Type : 'UI.DataField',
            Value : currCondition,
            Label : 'Amount-To',
              ![@UI.Hidden] : {$edmJson : 
                              
                              {$Or: [{$Or: [   {$Eq : [{$Path : 'Condition'}, 'Equal To']},
                                 {$Eq : [{$Path : 'Condition'}, 'Less Than']},
                                   ]     },
                                    {$Or: [   {$Eq : [{$Path : 'Condition'}, 'Equal To']},
                                 {$Eq : [{$Path : 'Condition'}, 'More Than']},
                                   ]     }]}
                                   },
                                    
        },
        {
            $Type : 'UI.DataField',
            Value : currValue1,
            Label : 'Currency',
             ![@UI.Hidden] : {$edmJson : 
                              
                       {$Or: [ {$Or: [    {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'Cost Center']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Default']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'Department']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]},

                                  {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'Document Type']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'G/ L Account']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]}, ]},{$Or: [    {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'Item Category']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'Jurisdiction Code']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]},

                                  {$Or: [       {$Or: [ {$Eq : [{$Path : 'Criteria'}, 'PO Type']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},  ]},
                             
                             { $Or: [    {$Eq : [{$Path : 'Criteria'}, 'Vendor']},
                                 {$Eq : [{$Path : 'Criteria'}, 'Condition2']},]},    ]}, ]},]},
                                         
                                         },
            // ![@UI.Hidden] : {$Path : 'PresentationVariant', $Eq : 'NonDraft'}

            // ![@UI.Hidden] : {$edmJson :{$Not :{PresentationVariant, NonDraft}}},
        },]
);
annotate service.criteria with {
    Condition @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'rules_n_status_s_h',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Condition,
                    ValueListProperty : 'value2',
                },
                {
                    $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'table_key',
                    LocalDataProperty : Criteria,
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.criteria with {
    Criteria @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'approvalrulesdecider_s_h',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Criteria,
                    ValueListProperty : 'value2',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.criteria with {
    currValue1 @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currValue1,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.criteria with {
    Value1 @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'value1sh',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Value1,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'master_name',
                    LocalDataProperty : Criteria,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'description',
                    LocalDataProperty : descri,
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        
        
)};
annotate service.value1sh with {
    code @Common.Text : {
        $value : description,
        ![@UI.TextArrangement] : #TextLast,
    }
};


annotate service.approval_rules with {
    approval_type @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'approvaltype_s_h',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : approval_type,
                    ValueListProperty : 'sh',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.approvers1 with @(
    UI.LineItem #approvers : [
        {
            $Type : 'UI.DataField',
            Value : approver,
            Label : 'approver',
        },{
            $Type : 'UI.DataField',
            Value : isgroup,
            Label : 'isgroup',
        },{
            $Type : 'UI.DataField',
            Value : m_id,
            Label : 'm_id',
        },{
            $Type : 'UI.DataField',
            Value : position,
            Label : 'position',
        },{
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },]
);
annotate service.approvers1 with {
    position @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'approvers_s_h',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : position,
                    ValueListProperty : 'value2',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'table_key',
                    LocalDataProperty : approver,
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.approvers1 with {
    name @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'approvers_s_h1',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'iid',
                    LocalDataProperty : m_id,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'is_group',
                    LocalDataProperty : isgroup,
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.approval_rules with @(
    UI.FieldGroup #comments : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : comments,
                Label : 'COMMENTS(optional)',
            },],
    }
);
annotate service.approval_rules with {
    comments @UI.MultiLineText : true
};
annotate service.criteria with {
    Value1 @Common.Text : {
            $value : descri,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.criteria with @(
    UI.LineItem #demooo : [
        {
            $Type : 'UI.DataField',
            Value : Condition,
            Label : 'Condition',
        },{
            $Type : 'UI.DataField',
            Value : Criteria,
            Label : 'Criteria',
        },{
            $Type : 'UI.DataField',
            Value : currCriteria,
            Label : 'currCriteria',
        },{
            $Type : 'UI.DataField',
            Value : currCondition,
            Label : 'currCondition',
        },{
            $Type : 'UI.DataField',
            Value : currValue1,
            Label : 'currValue1',
        },{
            $Type : 'UI.DataField',
            Value : d_value,
            Label : 'd_value',
        },{
            $Type : 'UI.DataField',
            Value : d_value2,
            Label : 'd_value2',
        },{
            $Type : 'UI.DataField',
            Value : Value2,
            Label : 'Value2',
        },{
            $Type : 'UI.DataField',
            Value : Value1,
            Label : 'Value1',
        },{
            $Type : 'UI.DataField',
            Value : rule_id,
            Label : 'rule_id',
        },{
            $Type : 'UI.DataField',
            Value : rule,
            Label : 'rule',
        },{
            $Type : 'UI.DataField',
            Value : operator,
            Label : 'operator',
        },{
            $Type : 'UI.DataField',
            Value : descri,
            Label : 'descri',
        },{
            $Type : 'UI.DataField',
            Value : decider_type,
            Label : 'decider_type',
        },]
);
annotate service.approval_rules with @(
    UI.FieldGroup #hide : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : apprtocri.Condition,
                Label : 'Condition',
            },],
    }
);
