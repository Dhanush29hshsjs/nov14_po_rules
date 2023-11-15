namespace demo;

entity Newtab {
    key Ref_PO_No          : Integer;
        PO_No              : String(20);
        Customer_Name      : String(50);
        Date               : String(11);
        Modified_Date_Time : String(25);
        PO_File            : String(100);
        po_number          : String(20);
        po_date            : String(11);
        delivery_date      : String(11);
        delivery_address   : String(500);
        bill_to_address    : String(100);
        customer           : String(100);
        currency           : String(5);
        purchase_group     : String(100);
        taxable_amount     : Integer;
        amount_total       : String(30);
        tax                : Integer;
        company_code       : String(10);
        plant              : String(100);
        file_link          : LargeString;
        // newtodata : Composition of many podatatab on newtodata.data = $self;
        newtoitem          : Association to many po_data_item
                                 on newtoitem.podataN = $self;
}

entity Draft {
    key Ref_PO_No          : Integer;
        PO_No              : String;
        Customer_Name      : String(50);
        Date               : String(11);
        Modified_by        : String(50);
        Modified_Date_Time : String(25);
        PO_File            : String(100);
        po_number          : String(20);
        po_date            : String(11);
        delivery_date      : String(11);
        delivery_address   : String(500);
        bill_to_address    : String(100);
        customer           : String(100);
        currency           : String(5);
        purchase_group     : String(100);
        taxable_amount     : Integer;
        amount_total       : String(30);
        tax                : Integer;
        company_code       : String(10);
        plant              : String(100);
        file_link          : LargeString;
        // drafttodata : Composition of many  podatatab on drafttodata.data1 = $self;
        drafttoitem        : Association to many po_data_itemD
                                 on drafttoitem.podataD = $self;
}

entity Submitted {
    key Ref_PO_No          : Integer;
        PO_No              : String;
        Customer_Name      : String(50);
        Date               : String(11);
        Modified_Date_Time : String(25);
        PO_File            : String(100);
        po_number          : String(20);
        po_date            : String(11);
        delivery_date      : String(11);
        delivery_address   : String(500);
        bill_to_address    : String(100);
        customer           : String(100);
        currency           : String(5);
        purchase_group     : String(100);
        taxable_amount     : Integer;
        amount_total       : String(30);
        tax                : Integer;
        company_code       : String(10);
        plant              : String(100);
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
        item_no         : String(10);
        hsn_code        : String(10);
        material_no     : String(10);
        material_name   : String(60);
        quantity        : Integer;
        unit_price      : String(20);
        unit_of_measure : String(5);
        tax_percentage  : Integer;
        taxable_amount  : String(15);
        tax_amount      : String(15);
        total_amount    : String(15);
        podataN         : Association to one Newtab
                              on podataN.Ref_PO_No = ref_po_no;
//  podataD : Association to one Draft on podataD.Ref_PO_No = ref_po_no;
//  podataS : Association to one Submitted on podataS.Ref_PO_No = ref_po_no;

}

entity po_data_itemD {
    key uid             : UUID;
        slno            : Integer;
        ref_po_no       : Integer;
        item_no         : String(10);
        hsn_code        : String(10);
        material_no     : String(10);
        material_name   : String(60);
        quantity        : Integer;
        unit_price      : String(20);
        unit_of_measure : String(5);
        tax_percentage  : Integer;
        taxable_amount  : String(15);
        tax_amount      : String(15);
        total_amount    : String(15);
        //  podataN : Association to one Newtab on podataN.Ref_PO_No = ref_po_no;
        podataD         : Association to one Draft
                              on podataD.Ref_PO_No = ref_po_no;
//  podataS : Association to one Submitted on podataS.Ref_PO_No = ref_po_no;

}

entity po_data_itemS {
    key uid             : UUID;
        slno            : Integer;
        ref_po_no       : Integer;
        item_no         : String(10);
        hsn_code        : String(10);
        material_no     : String(10);
        material_name   : String(60);
        quantity        : Integer;
        unit_price      : String(20);
        unit_of_measure : String(5);
        tax_percentage  : Integer;
        taxable_amount  : String(15);
        tax_amount      : String(15);
        total_amount    : String(15);
        //  podataN : Association to one Newtab on podataN.Ref_PO_No = ref_po_no;
        //  podataD : Association to one Draft on podataD.Ref_PO_No = ref_po_no;
        podataS         : Association to one Submitted
                              on podataS.Ref_PO_No = ref_po_no;

}

entity Currency {
    key idd         : UUID;
        code        : String(10);
        description : String(50);
}

entity Plant {
    key idd         : UUID;
        code        : String(10);
        description : String(50);
}

entity CompanyCode {
    key idd         : UUID;
        code        : String(10);
        description : String(50);
}

entity Track_po {
    key idd           : UUID;
        ref_po_no     : Integer;
        error_log     : String(20);
        modified_by   : String(30);
        Date          : String(11);
        po_number     : String;
        status        : String(10);
        supplier_name : String(20);
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
        rule_name : String;
        comments  : String;
        is_on     : String;
        asstoapp  : Composition of many approvers
                        on asstoapp.apptoass = $self;
}

entity approvers {
    key rule_id  : Integer;
    key approver : Integer;
        isgroup  : String;
        level    : Integer;
        name     : String;
        position : String;
        apptoass : Association to one assignment_ruless
                       on apptoass.rule_id = rule_id;
}

entity approval_rules {
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
    key rule_id   : Integer;
    key approver  : Integer;
        isgroup   : String;
        level     : Integer;
        name      : String;
        position  : String;
        apptoappr : Association to one approval_rules
                        on apptoappr.rule_id = rule_id;
}

entity criteria {
    key rule_id      : Integer;
    key rule         : String;
        decider_type : String;
        operator:String;
        d_value2:String;
        d_value:String;
        ////////////modify of rules
        Criteria:String;
        currCriteria:String;
        Condition:String;
        currCondition:String;
        Value1:String;
        currValue1:String;
        Value2:String;
        ////////////
        critoappr    : Association to one approval_rules
                           on critoappr.rule_id = rule_id;
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
}