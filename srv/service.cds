using {demo} from '../db/schema';

service CatalogService {
    @odata.draft.enabled
    entity Newtab             as projection on demo.Newtab;

    @odata.draft.enabled
    entity Draft              as projection on demo.Draft;

    @odata.draft.enabled
    entity Submitted          as projection on demo.Submitted;

    entity Currency           as projection on demo.Currency;
    entity CompanyCode        as projection on demo.CompanyCode;
    entity Plant              as projection on demo.Plant;

    // entity podatatab as
    //     projection on demo.podatatab;
    @odata.draft.enabled
    entity po_data_item       as projection on demo.po_data_item;

    @odata.draft.enabled
    entity po_data_itemD      as projection on demo.po_data_itemD;

    @odata.draft.enabled
    entity po_data_itemS      as projection on demo.po_data_itemS;

    entity Track_po           as projection on demo.Track_po;

    entity email              as projection on demo.email actions {
        @(
            cds.odata.bindingparameter.name: '_it',
            Common.SideEffects             : {TargetProperties: ['_it/isReaded']},

        ) action buttomaction();
        @Core.OperationAvailable: {$edmJson: {$Eq: [
            {$Path: '_it/bool'},
            false
        ]}}
        //       @(  cds.odata.bindingparameter.name : '_it',
        // Common.SideEffects              : {TargetProperties : ['_it/isReaded']} ,

        //   )
        action   buttomaction1();

    };

    entity attachment         as projection on demo.attachment;
    entity invoice_No         as projection on demo.invoice_No;
    function getPdfUrl()  returns LargeString;
    function getPdfUrlD() returns LargeString;
    function getPdfUrlS() returns LargeString;
    ////////////////Rules//////////////////////////

    // entity statuss as
    //     projection on demo.statuss;

    // @odata.draft.enabled
    // entity rules_notification as
    //     projection on demo.rules_notification;
    // @odata.draft.enabled

    // entity approval_rules as
    //     projection on demo.approval_rules  actions{ @(  cds.odata.bindingparameter.name : '_it',
    //         Common.SideEffects : {TargetProperties : ['_it/criteria']} ,
    //         )action approve_conditions() ;
    //     };
    // entity criteria as
    //     projection on demo.criteria;

    // entity condition as
    //     projection on demo.condition;

    // entity currency1 as
    //     projection on demo.currency1;


    // entity conditions as
    //     projection on demo.conditions;

    // entity assignment_rules as
    //     projection on demo.assignment_rules;

    // entity members as
    //     projection on demo.members;

    function getstatus()  returns String;
    
    
    entity rules_n_status_s_h as projection on demo.rules_n_status_s_h;

    ////////////rules notification/


    @odata.draft.enabled
    entity notification_rules as projection on demo.notification_rules;

    entity rule_statuses      as projection on demo.rule_statuses;

    ////////view all r and n//////////
    @odata.draft.enabled
    entity assignment_ruless  as projection on demo.assignment_ruless actions {
        @(
            cds.odata.bindingparameter.name: '_it',
            Common.SideEffects             : {TargetProperties: ['_it/is_on']},
        ) action toggleon();
        @(
            cds.odata.bindingparameter.name: '_it',
            Common.SideEffects             : {TargetProperties: ['_it/is_on']},
        )
        action   toggleoff();
    };

    entity approvers          as projection on demo.approvers;
     entity assignmentapp_s_h          as projection on demo.assignmentapp_s_h;
    entity criteriaa          as projection on demo.criteriaa;
    entity assignmentc_s_h          as projection on demo.assignmentc_s_h;
    entity assignmentcri_s_h          as projection on demo.assignmentcri_s_h;
    

@odata.draft.enabled
    entity approval_rules     as projection on demo.approval_rules actions {
        @(
            cds.odata.bindingparameter.name: '_it',
            Common.SideEffects             : {TargetProperties: ['_it/is_on']},
        )
        action apprtoggleon();
        @(
            cds.odata.bindingparameter.name: '_it',
            Common.SideEffects             : {TargetProperties: ['_it/is_on']},
        )
        action apprtoggleoff();
    };

    entity criteria           as projection on demo.criteria;
    entity approvers1         as projection on demo.approvers1;

 @odata.draft.enabled
    entity emailnotification  as projection on demo.emailnotification;

    entity mail_cc                 as projection on demo.mail_cc;
entity cc_s_h             as projection on demo.cc_s_h;   
entity value1sh             as projection on demo.value1sh;   
entity avalue1sh             as projection on demo.avalue1sh;   
entity approvalrulesdecider_s_h       as projection on demo.approvalrulesdecider_s_h;
entity approvers_s_h             as projection on demo.approvers_s_h;   
entity approvers_s_h1             as projection on demo.approvers_s_h1;   
entity approvaltype_s_h            as projection on demo.approvaltype_s_h;   
entity members_gc             as projection on demo.members_gc;   



}
