using CatalogService as service from '../../srv/service';
annotate service.Submitted with @(
    UI.DeleteHidden : true,
    // Capabilities.InsertRestrictions : {
    // Insertable : false,
    // },
    UI.CreateHidden:true,
    UI.LineItem #tableView1 : [
         {
            $Type : 'UI.DataField',
            Label : 'PO NO',
            Value : PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'REF.PO NO',
            Value : Ref_PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CUSTOMER NAME',
            Value : Customer_Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DATE',
            Value : Date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MODIFIED DATE-TIME',
            Value : Modified_Date_Time,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_File,
            Label : 'PO FILE',
        },
    ],
    UI.SelectionPresentationVariant #tableView2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView1',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Submitted',
    }
);
annotate service.Draft with @(
    UI.DeleteHidden : true,
    // Capabilities.InsertRestrictions : {
    // Insertable : false,
    // },
    UI.CreateHidden : true,
    UI.LineItem#tableView2 : [
        {
            $Type : 'UI.DataField',
            Label : 'PO NO',
            Value : PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'REF.PO NO',
            Value : Ref_PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CUSTOMER NAME',
            Value : Customer_Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DATE',
            Value : Date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MODIFIED DATE-TIME',
            Value : Modified_Date_Time,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_File,
            Label : 'PO FILE',
        },
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView2',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Draft',
    }
);

annotate service.Newtab with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            
            {
                $Type : 'UI.DataField',
                Value : po_number,
                Label : 'PO Number',
            },
            {
                $Type : 'UI.DataField',
                Value : po_date,
                Label : 'PO Date',
            },
            {
                $Type : 'UI.DataField',
                Value : delivery_date,
                Label : 'Delivery date',
            },
            {
                $Type : 'UI.DataField',
                Value : delivery_address,
                Label : 'Delivery Address',
            },
            {
                $Type : 'UI.DataField',
                Value : bill_to_address,
                Label : 'Bill To Address',
            },
            {
                $Type : 'UI.DataField',
                Value : customer,
                Label : 'Customer',
            },
            {
                $Type : 'UI.DataField',
                Value : currency,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Value : purchase_group,
                Label : 'Purchase group',
            },
            {
                $Type : 'UI.DataField',
                Value : taxable_amount,
                Label : 'Taxable Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : amount_total,
                Label : 'Amount(Total.)',
            },
            {
                $Type : 'UI.DataField',
                Value : tax,
                Label : 'Tax %',
            },
            {
                $Type : 'UI.DataField',
                Value : company_code,
                Label : 'Company Code',
            },
            {
                $Type : 'UI.DataField',
                Value : plant,
                Label : 'Plant',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'NEW Details',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'New Items',
            ID : 'NewItems',
            Target : 'newtoitem/@UI.LineItem#NewItems',
        },
    ]
);
annotate service.po_data_item with @(
    // Capabilities : { Insertable:true },
    // UI.CreateHidden : false,
    UI.LineItem #NewItems : [
        {
            $Type : 'UI.DataField',
            Value : slno,
            Label : 'SL.NO',
        },{
            $Type : 'UI.DataField',
            Value : item_no,
            Label : 'ITEM NO',
        },{
            $Type : 'UI.DataField',
            Value : hsn_code,
            Label : 'HSN CODE',
        },{
            $Type : 'UI.DataField',
            Value : material_no,
            Label : 'MATERIAL',
        },{
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'QTY',
        },{
            $Type : 'UI.DataField',
            Value : unit_price,
            Label : 'UNIT PRICE',
        },{
            $Type : 'UI.DataField',
            Value : unit_of_measure,
            Label : 'UNIT OF MEASURE',
        },{
            $Type : 'UI.DataField',
            Value : tax_percentage,
            Label : 'TAX %',
        },{
            $Type : 'UI.DataField',
            Value : taxable_amount,
            Label : 'TAXABLE AMOUNT',
        },{
            $Type : 'UI.DataField',
            Value : tax_amount,
            Label : 'TAX AMOUNT',
        },{
            $Type : 'UI.DataField',
            Value : total_amount,
            Label : 'TOTAL AMOUNT',
        },]
);
annotate service.Newtab with @(
    UI.DeleteHidden : true,
    //  Capabilities.InsertRestrictions : {
    // Insertable : false,
    // },
    UI.CreateHidden:true,
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'PO NO',
            Value : PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'REF.PO NO',
            Value : Ref_PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CUSTOMER NAME',
            Value : Customer_Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DATE',
            Value : Date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MODIFIED DATE-TIME',
            Value : Modified_Date_Time,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_File,
            Label : 'PO FILE',
        },
    ],
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
        Text : 'New',
    }
);
annotate service.Draft with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Label : 'PO NO',
            Value : PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'REF.PO NO',
            Value : Ref_PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CUSTOMER NAME',
            Value : Customer_Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DATE',
            Value : Date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MODIFIED DATE-TIME',
            Value : Modified_Date_Time,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_File,
            Label : 'PO FILE',
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
        Text : 'Draft',
    }
);
annotate service.Submitted with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Label : 'PO NO',
            Value : PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'REF.PO NO',
            Value : Ref_PO_No,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CUSTOMER NAME',
            Value : Customer_Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DATE',
            Value : Date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MODIFIED DATE-TIME',
            Value : Modified_Date_Time,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_File,
            Label : 'PO FILE',
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
        Text : 'Submitted',
    }
);
annotate service.Draft with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Draft Details',
            ID : 'DraftDetails',
            Target : '@UI.FieldGroup#DraftDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Draft Items',
            ID : 'DraftItems',
            Target : 'drafttoitem/@UI.LineItem#DraftItems',
        },
       
    ],
    UI.FieldGroup #DraftDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
                 {
                $Type : 'UI.DataField',
                Value : po_number,
                Label : 'PO Number',
            },
            {
                $Type : 'UI.DataField',
                Value : po_date,
                Label : 'PO Date',
            },
            {
                $Type : 'UI.DataField',
                Value : delivery_date,
                Label : 'Delivery date',
            },
            {
                $Type : 'UI.DataField',
                Value : delivery_address,
                Label : 'Delivery Address',
            },
            {
                $Type : 'UI.DataField',
                Value : bill_to_address,
                Label : 'Bill To Address',
            },
            {
                $Type : 'UI.DataField',
                Value : customer,
                Label : 'Customer',
            },
            {
                $Type : 'UI.DataField',
                Value : currency,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Value : purchase_group,
                Label : 'Purchase group',
            },
            {
                $Type : 'UI.DataField',
                Value : taxable_amount,
                Label : 'Taxable Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : amount_total,
                Label : 'Amount(Total.)',
            },
            {
                $Type : 'UI.DataField',
                Value : tax,
                Label : 'Tax %',
            },
            {
                $Type : 'UI.DataField',
                Value : company_code,
                Label : 'Company Code',
            },
            {
                $Type : 'UI.DataField',
                Value : plant,
                Label : 'Plant',
            },],
    }
);
annotate service.Submitted with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'submitted details',
            ID : 'submitteddetails',
            Target : '@UI.FieldGroup#submitteddetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Submitted Items',
            ID : 'SubmittedItems',
            Target : 'submittedtoitem/@UI.LineItem#SubmittedItems',
        },
    ],
    UI.FieldGroup #submitteddetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : po_number,
                Label : 'PO Number',
            },
            {
                $Type : 'UI.DataField',
                Value : po_date,
                Label : 'PO Date',
            },
            {
                $Type : 'UI.DataField',
                Value : delivery_date,
                Label : 'Delivery date',
            },
            {
                $Type : 'UI.DataField',
                Value : delivery_address,
                Label : 'Delivery Address',
            },
            {
                $Type : 'UI.DataField',
                Value : bill_to_address,
                Label : 'Bill To Address',
            },
            {
                $Type : 'UI.DataField',
                Value : customer,
                Label : 'Customer',
            },
            {
                $Type : 'UI.DataField',
                Value : currency,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Value : purchase_group,
                Label : 'Purchase group',
            },
            {
                $Type : 'UI.DataField',
                Value : taxable_amount,
                Label : 'Taxable Amount',
            },
            {
                $Type : 'UI.DataField',
                Value : amount_total,
                Label : 'Amount(Total.)',
            },
            {
                $Type : 'UI.DataField',
                Value : tax,
                Label : 'Tax %',
            },
            {
                $Type : 'UI.DataField',
                Value : company_code,
                Label : 'Company Code',
            },
            {
                $Type : 'UI.DataField',
                Value : plant,
                Label : 'Plant',
            },],
    }
);
annotate service.po_data_itemD with @(
    UI.LineItem #DraftItems : [
         {
            $Type : 'UI.DataField',
            Value : slno,
            Label : 'SL.NO',
        },{
            $Type : 'UI.DataField',
            Value : item_no,
            Label : 'ITEM NO',
        },{
            $Type : 'UI.DataField',
            Value : hsn_code,
            Label : 'HSN CODE',
        },{
            $Type : 'UI.DataField',
            Value : material_no,
            Label : 'MATERIAL',
        },{
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'QTY',
        },{
            $Type : 'UI.DataField',
            Value : unit_price,
            Label : 'UNIT PRICE',
        },{
            $Type : 'UI.DataField',
            Value : unit_of_measure,
            Label : 'UNIT OF MEASURE',
        },{
            $Type : 'UI.DataField',
            Value : tax_percentage,
            Label : 'TAX %',
        },{
            $Type : 'UI.DataField',
            Value : taxable_amount,
            Label : 'TAXABLE AMOUNT',
        },{
            $Type : 'UI.DataField',
            Value : tax_amount,
            Label : 'TAX AMOUNT',
        },{
            $Type : 'UI.DataField',
            Value : total_amount,
            Label : 'TOTAL AMOUNT',
        },]
);
annotate service.po_data_itemS with @(
    UI.LineItem #SubmittedItems : [
         {
            $Type : 'UI.DataField',
            Value : slno,
            Label : 'SL.NO',
        },{
            $Type : 'UI.DataField',
            Value : item_no,
            Label : 'ITEM NO',
        },{
            $Type : 'UI.DataField',
            Value : hsn_code,
            Label : 'HSN CODE',
        },{
            $Type : 'UI.DataField',
            Value : material_no,
            Label : 'MATERIAL',
        },{
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'QTY',
        },{
            $Type : 'UI.DataField',
            Value : unit_price,
            Label : 'UNIT PRICE',
        },{
            $Type : 'UI.DataField',
            Value : unit_of_measure,
            Label : 'UNIT OF MEASURE',
        },{
            $Type : 'UI.DataField',
            Value : tax_percentage,
            Label : 'TAX %',
        },{
            $Type : 'UI.DataField',
            Value : taxable_amount,
            Label : 'TAXABLE AMOUNT',
        },{
            $Type : 'UI.DataField',
            Value : tax_amount,
            Label : 'TAX AMOUNT',
        },{
            $Type : 'UI.DataField',
            Value : total_amount,
            Label : 'TOTAL AMOUNT',
        },]
);
annotate service.po_data_item with {
    material_no @Common.Text : {
            $value : material_name,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.po_data_itemD with {
    material_no @Common.Text : {
            $value : material_name,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.po_data_itemS with {
    material_no @Common.Text : {
            $value : material_name,
            ![@UI.TextArrangement] : #TextLast,
        }
};
annotate service.Newtab with @(
    UI.HeaderInfo : {
        TypeName : ' ',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : Ref_PO_No,
        },
    }
);

annotate service.Draft with {
    currency @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currency,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Currency',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Draft with {
    company_code @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CompanyCode',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : company_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Company Code',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Draft with {
    plant @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Plant',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : plant,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Plant Code',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Draft with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Ref_PO_No,
        },
        TypeName : '',
        TypeNamePlural : '',
    }
);
annotate service.Newtab with {
    currency @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currency,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Currency',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Newtab with {
    company_code @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CompanyCode',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : company_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Search Company Code',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Newtab with {
    plant @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Plant',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : plant,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Plant Code',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Submitted with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Ref_PO_No,
        },
        TypeName : '',
        TypeNamePlural : '',
    }
);
annotate service.Submitted with {
    currency @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currency,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Currency',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Submitted with {
    company_code @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CompanyCode',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : company_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Company Code',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Submitted with {
    plant @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Plant',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : plant,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
            Label : 'Select Plant Code',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Newtab with @(
    UI.SelectionPresentationVariant #tableView1 : {
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
        Text : 'New',
    }
);
annotate service.Newtab with @(
    UI.SelectionPresentationVariant #tableView2 : {
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
        Text : 'New',
    }
);
annotate service.Draft with @(

    UI.SelectionPresentationVariant #tableView2 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView2',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Draft',
    }
);
annotate service.Submitted with @(
  
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView1',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Submitted',
    }
);
annotate service.po_data_itemD with {
    quantity @Common.FieldControl : #Mandatory
};
annotate service.po_data_itemD with {
    unit_price @Common.FieldControl : #Mandatory
};
annotate service.po_data_itemD with {
    material_no @Common.FieldControl : #Mandatory
};
annotate service.Draft with {
    po_number @Common.FieldControl : #Mandatory
};
annotate service.Draft with {
    po_date @Common.FieldControl : #Mandatory
};
annotate service.Draft with {
    delivery_date @Common.FieldControl : #Mandatory
};
annotate service.Draft with {
    company_code @Common.FieldControl : #Mandatory
};
annotate service.Draft with {
    plant @Common.FieldControl : #Mandatory
};
annotate service.Draft with {
    currency @Common.FieldControl : #Mandatory
};
annotate service.Submitted with {
    po_number @Common.FieldControl : #Mandatory
};
annotate service.Submitted with {
    po_date @Common.FieldControl : #Mandatory
};
annotate service.Submitted with {
    delivery_date @Common.FieldControl : #Mandatory
};
annotate service.Submitted with {
    currency @Common.FieldControl : #Mandatory
};
annotate service.Submitted with {
    company_code @Common.FieldControl : #Mandatory
};
annotate service.Submitted with {
    plant @Common.FieldControl : #Mandatory
};
annotate service.po_data_itemS with {
    material_no @Common.FieldControl : #Mandatory
};
annotate service.po_data_itemS with {
    quantity @Common.FieldControl : #Mandatory
};
annotate service.po_data_itemS with {
    unit_price @Common.FieldControl : #Mandatory
};
annotate service.Newtab with {
    po_number @Common.FieldControl : #Mandatory
};
annotate service.Newtab with {
    po_date @Common.FieldControl : #Mandatory
};
annotate service.Newtab with {
    delivery_date @Common.FieldControl : #Mandatory
};
annotate service.Newtab with {
    currency @Common.FieldControl : #Mandatory
};
annotate service.Newtab with {
    company_code @Common.FieldControl : #Mandatory
};
annotate service.Newtab with {
    plant @Common.FieldControl : #Mandatory
};
annotate service.po_data_item with {
    material_no @Common.FieldControl : #Mandatory
};
annotate service.po_data_item with {
    quantity @Common.FieldControl : #Mandatory
};
annotate service.po_data_item with {
    unit_price @Common.FieldControl : #Mandatory
};
annotate service.Newtab with @(
    UI.Identification : []
);
annotate service.Draft with @(
    UI.Identification : []
);
annotate service.Submitted with @(
    UI.Identification : []
);
/////////////////////////


