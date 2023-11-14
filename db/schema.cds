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

entity assignment_ruless
{
    key f1 : Integer;
    f2 : String;
    f3 : String;
    f4 : String;
    asstomem : Composition of many memberss on asstomem.memtoasss = $self;
}

entity memberss
{
    key memid : UUID;
    f1 : Integer;
    name : String;
    memtoasss : Association to one assignment_ruless on memtoasss.f1 = f1;
}

entity approval_rules
{
    key rule_id : Integer;
    approval_type : String;
    status : String;
    comments : String;
    apprtoapp : Composition of many approver on apprtoapp.apptoappr = $self;
    apprtorul : Composition of many rule on apprtorul.rultoappr = $self;
}

entity approver
{
    key appid : UUID;
    rule_id : Integer;
    name : String;
    apptoappr : Association to one approval_rules on apptoappr.rule_id = rule_id;
}

entity rule
{
    key appid : UUID;
    rule_id : Integer;
    rulee : String;
    rultoappr : Association to one approval_rules on rultoappr.rule_id = rule_id;
}

entity emailnotification
{key idd:UUID;
    invoice_status : String;
    status : String;
    mail_subject : String;
    mail_body : String;
    mailtocc : Association to many cc on mailtocc.cctomail = $self;
}

entity cc
{
    key invoice_status : String;
    name : String;
    key member_id : Integer;
    cctomail : Association to one emailnotification on cctomail.invoice_status = invoice_status;
}

entity cc_s_h
{
    key invoice_status : String default ' ';
    name : String;
    position : String;
    key member_id : Integer;
    key group_id : Integer;
    key department_id : Integer;
}

entity rulenoti_s_h
{
    key value2 : String;
}

entity rules_n_status_s_h
{
    key table_key : String;
    value2 : String;
}

entity notification_rules
{
    key nr_id : UUID;
    table_key : String;
    status : String;
    mail_subject : String;
    mail_body : LargeString;
    nrtocc : Composition of many n_r_cc on nrtocc.notification_rules = $self;
}

entity n_r_cc
{key idd:UUID;
      member_id : Integer;
      group_id : Integer;
     department_id : Integer;
    name : String;
    notification_rules : Association to one notification_rules;
}
