namespace demo;

entity Newtab {
    key Ref_PO_No          : Integer;
        PO_No              : String;
        Customer_Name      : String;
        Date               : String;
        Modified_Date_Time : String;
        PO_File            : String;
        po_number          : String;
        po_date            : String;
        delivery_date      : String;
        delivery_address   : String;
        bill_to_address    : String;
        customer           : String;
        currency           : String;
        purchase_group     : String;
        taxable_amount     : Integer;
        amount_total       : String;
        tax                : Integer;
        company_code       : String;
        plant              : String;
        file_link          : LargeString;
        // newtodata : Composition of many podatatab on newtodata.data = $self;
        newtoitem          : Association to many po_data_item
                                 on newtoitem.podataN = $self;
}

entity Draft {
    key Ref_PO_No          : Integer;
        PO_No              : String;
        Customer_Name      : String;
        Date               : String;
        Modified_by        : String;
        Modified_Date_Time : String;
        PO_File            : String;
        po_number          : String;
        po_date            : String;
        delivery_date      : String;
        delivery_address   : String;
        bill_to_address    : String;
        customer           : String;
        currency           : String;
        purchase_group     : String;
        taxable_amount     : Integer;
        amount_total       : String;
        tax                : Integer;
        company_code       : String;
        plant              : String;
        file_link          : LargeString;
        // drafttodata : Composition of many  podatatab on drafttodata.data1 = $self;
        drafttoitem        : Association to many po_data_itemD
                                 on drafttoitem.podataD = $self;
}

entity Submitted {
    key Ref_PO_No          : Integer;
        PO_No              : String;
        Customer_Name      : String;
        Date               : String;
        Modified_Date_Time : String;
        PO_File            : String;
        po_number          : String;
        po_date            : String;
        delivery_date      : String;
        delivery_address   : String;
        bill_to_address    : String;
        customer           : String;
        currency           : String;
        purchase_group     : String;
        taxable_amount     : Integer;
        amount_total       : String;
        tax                : Integer;
        company_code       : String;
        plant              : String;
        file_link          : LargeString;
        // submittedtodata : Composition of many  podatatab on submittedtodata.data2 = $self;
        submittedtoitem    : Association to many po_data_itemS
                                 on submittedtoitem.podataS = $self;
}
// entity podatatab
// {
//     key uid:UUID;
//     key ref_po_no : Integer;

//     data : Association to one Newtab on data.Ref_PO_No = ref_po_no;
//     data1 : Association to one Draft on data1.Ref_PO_No = ref_po_no;
//     data2 : Association to one Submitted on data2.Ref_PO_No = ref_po_no;
// }
entity po_data_item {
    key uid             : UUID;
        slno            : Integer;
        ref_po_no       : Integer;
        item_no         : String;
        hsn_code        : String;
        material_no     : String;
        material_name   : String;
        quantity        : Integer;
        unit_price      : String;
        unit_of_measure : String;
        tax_percentage  : Integer;
        taxable_amount  : String;
        tax_amount      : String;
        total_amount    : String;
        podataN         : Association to one Newtab
                              on podataN.Ref_PO_No = ref_po_no;
//  podataD : Association to one Draft on podataD.Ref_PO_No = ref_po_no;
//  podataS : Association to one Submitted on podataS.Ref_PO_No = ref_po_no;

}

entity po_data_itemD {
    key uid             : UUID;
        slno            : Integer;
        ref_po_no       : Integer;
        item_no         : String;
        hsn_code        : String;
        material_no     : String;
        material_name   : String;
        quantity        : Integer;
        unit_price      : String;
        unit_of_measure : String;
        tax_percentage  : Integer;
        taxable_amount  : String;
        tax_amount      : String;
        total_amount    : String;
        //  podataN : Association to one Newtab on podataN.Ref_PO_No = ref_po_no;
        podataD         : Association to one Draft
                              on podataD.Ref_PO_No = ref_po_no;
//  podataS : Association to one Submitted on podataS.Ref_PO_No = ref_po_no;

}

entity po_data_itemS {
    key uid             : UUID;
        slno            : Integer;
        ref_po_no       : Integer;
        item_no         : String;
        hsn_code        : String;
        material_no     : String;
        material_name   : String;
        quantity        : Integer;
        unit_price      : String;
        unit_of_measure : String;
        tax_percentage  : Integer;
        taxable_amount  : String;
        tax_amount      : String;
        total_amount    : String;
        //  podataN : Association to one Newtab on podataN.Ref_PO_No = ref_po_no;
        //  podataD : Association to one Draft on podataD.Ref_PO_No = ref_po_no;
        podataS         : Association to one Submitted
                              on podataS.Ref_PO_No = ref_po_no;

}

entity Currency {
    key idd         : UUID;
        code        : String;
        description : String;
}

entity Plant {
    key idd         : UUID;
        code        : String;
        description : String;
}

entity CompanyCode {
    key idd         : UUID;
        code        : String;
        description : String;
}

entity Track_po {
    key idd           : UUID;
        ref_po_no     : Integer;
        error_log     : String;
        modified_by   : String;
        Date          : String;
        po_number     : String;
        status        : String;
        supplier_name : String;
}

entity email {
    key msg_id     : String;
        FROM_      : String;
        DATE       : Date;
        TIME       : Time;
        SUBJECT    : String;
        TIME_TAKEN : String;
        isReaded   : String;
        ass1       : Association to many attachment
                         on ass1.email = $self;
        ass2       : Association to many invoice_No
                         on ass2.email = $self;
}

entity attachment {
    key id           : UUID;
        msg_id       : String;
        attachmentId : LargeString;
        filename     : String;
        email        : Association to one email
                           on email.msg_id = msg_id;
}

entity invoice_No {
    key id         : UUID;
        msg_id     : String;
        invoice_no : String;
        email      : Association to one email
                         on email.msg_id = msg_id;
}

//////////////rules////////////





////notification Rules//////////////////
entity notification_rules {
    key nr_id        : UUID;
        table_key    : String;
        status       : String;
        mail_subject : String;
        mail_body    : LargeString;
        nrtocc       : Composition of many n_r_cc
                           on nrtocc.notification_rules = $self;
}

entity rule_statuses {
    key table_key : String;
        value2    : String;
        value3    : String;
        value4    : String;
}

entity n_r_cc {
    key idd                : UUID;
        member_id          : Integer;
        group_id           : Integer;
        department_id      : Integer;
        name               : String;
        notification_rules : Association to one notification_rules;
}

///////////////////////view all r & n//////
entity assignment_ruless {
    key rule_id   : Integer;
    key    rule_name : String;
        comments  : String;
        is_on     : String;
        asstoapp  : Composition of many approvers
                        on asstoapp.apptoass = $self;
        asstocri  : Composition of many criteriaa
                        on asstocri.critoass = $self;
}
entity assignmentc_s_h{
    key id:Integer;
    is_group:String;
    name:String;
}
entity assignmentcri_s_h{
    drop_key:String;
    table_key:String;
    value4:String;
    value3:String;
    value2:String;
}
entity approvers {
    key iddd : UUID;
       rule_id  : Integer;
        approver : Integer;
        isgroup  : String;
        level    : String;
        name     : String;
        position : String;
        apptoass : Association to one assignment_ruless
                       on apptoass.rule_id = rule_id;
}
entity assignmentapp_s_h {
                id:Integer;
            is_group:String;
            name:String;
            position:String;

}
entity criteriaa {
    key idd:UUID;
     rule_id  : Integer;
    decider:String;
    operator:String default '=';
    type:String;
    value1:String;
    value11:String;
    value2:String;
    decider_key:String;
     critoass : Association to one assignment_ruless
                       on critoass.rule_id = rule_id;

}
entity approval_rules {
    // key iddd:UUID;
    key rule_id              : Integer;
        ////
        criteria             : String;
        ////
        approval_type        : String;
        comments             : String;
        due_notification     : Integer;
        due_reminder         : Integer;
        ec_isgroup           : String;
        es_name              : String;
        escelator            : Integer;
        ifnot_withindays     : Integer;
        is_on                : String;
        overdue_notification : Integer;
        overdue_reminder     : Integer;
        rule_name            : String;
        apprtoapp            : Composition of many approvers1
                                   on apprtoapp.apptoappr = $self;
        apprtocri            : Composition of many criteria
                                   on apprtocri.critoappr = $self;
                                 
}

entity approvers1 {
    key testid: String default '';
    key iddd:UUID;
    name      : String ;
     rule_id   : Integer;
     approver  : Integer;
        isgroup   : String;
        ///////
        m_id :Integer;
        /////
        level     : Integer;
     
        position  : String;
     apprtomem            : Composition of many members_gc
                                   on apprtomem.memtoappr = $self;
        //  apprtomemt            : Composition of many members_gc
        //                        on apprtomemt.memtoapprt = $self;
        apptoappr : Association to one approval_rules
                        on apptoappr.rule_id = rule_id;
}
entity members_gc {
    key idd :UUID;
     kid :String;
    approver  : Integer;
    name :String;
    // rule_id   : Integer;
     approverk  : Integer ;
     m_id           : Integer;
     m_i           : Integer;
    mem_name :String default '';
        memtoappr : Association to one approvers1
                        on memtoappr.testid = kid ;
        //  memtoapprt : Association to one approvers1
        //                on memtoapprt.testid = kid ;
}

entity criteria {
    key idd_ :UUID;
    key rule_id      : Integer;
     rule         : String;
        decider_type : String;
        operator:String;
        d_value2:String;
        d_value:String;
        ////////////modify of rules
        Criteria:String;
        currCriteria:String;
        Condition:String;
        currCondition:String ;
        Value1:String;
        Value11:String;
        descri:String;
        currValue1:String;
        Value2:String;
        decider:String;
        ////////////
        critoappr    : Association to one approval_rules
                           on critoappr.rule_id = rule_id;
}

entity value1sh{
    key code:String;
       key  master_name:String;
               description:String;
}
entity avalue1sh{
    key code:String;
       key  master_name:String;
               description:String;
}
entity emailnotification {
    key e_id           : Integer;
    key invoice_status : String;
        body           : String;
        subject        : String;
        status_desc    : String;

        mailtocc       : Composition of many mail_cc
                             on mailtocc.cctomail = $self;
}


entity mail_cc {
    key idd            : UUID;
    key invoice_status : String;
        member_id      : Integer;
        name           : String;
        cctomail       : Association to one emailnotification
                             on cctomail.invoice_status = invoice_status;
}

entity cc_s_h {
    key member_id     : Integer;
    member_i :Integer;
        department_id : Integer;
        email         : String;
        fs_name       : String;
        group_id      : Integer;
        ls_name       : String;
        position      : String;
        profile_photo : String;
}
entity approvalrulesdecider_s_h {
    key table_key: String;
    drop_key: String;
            value2: String;
            value3: String;
            value4:  String;
}
entity rules_n_status_s_h {
    key table_key : String;
     key   value2    : String;
     operator:String;
}

entity approvers_s_h{
 key table_key: Integer;
 drop_key:String;
            value2:String;
            value22:String;
            value3:String;
            value4:String; 
}
entity approvers_s_h1{
 key iid: Integer;
            is_group:String;
            name:String;
}

entity approvaltype_s_h{
    key sh:String;
}
