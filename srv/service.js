const cds = require('@sap/cds');
function togglebutton(i) {
    if (i == 'y') {
        return true;
    } else {
        return false;
    }
}
// const { sap } = require('sap/ui/core');
////my function
// function convertDateFormat(inputDate) {
//     // Extract the "DD-MM-YYYY", "DD.MM.YYYY", or "DD/MM/YYYY" part from the input string
//     var extractedDate = inputDate.match(/\d{2}[-./]\d{2}[-./]\d{4}/)[0];

//     // Replace different delimiters with "-"
//     var formattedDate = extractedDate.replace(/[-./]/g, '-');
//     var parts = formattedDate.split('-');

//     // Rearrange the components to YYYY-MM-DD format
//     var outputDate = parts[2] + '-' + parts[1] + '-' + parts[0];
//     return outputDate;
// }
// function convertDateTimeFormat(inputDate) {
//     // Extract date and time components
//     var parts = inputDate.split(/[ /-:]/);

//     // Rearrange the components to YYYY-MM-DD HH:MM:SS format
//     var outputDate = parts[2] + '-' + parts[0] + '-' + parts[1] +
//                      ' ' + (parts[3] || '00') + ':' + (parts[4] || '00') + ':' + (parts[5] || '00');

//     return outputDate;
// }
///end of my fun

module.exports = cds.service.impl(async function () {
    /* SERVICE ENTITIES */
    let {
        members_gc,
        approvaltype_s_h,
        approvers_s_h,
        approvers_s_h1,
        value1sh,
        approvalrulesdecider_s_h,
        approval_rules,
        approvers1,
        criteria,
        approvers,
        mail_cc,
        assignment_ruless,
        rule_statuses,
        Source_Event,
        Source_Event_Name,
        NoKey,
        notification_rules,
        rules_n_status_s_h,
        emailnotification,
        cc_s_h,
        togglee,
        assignment_rules,
        members,
        condition,
        conditions,
        Newtab,
        statuss,
        po_data,
        po_data_item,
        po_data_itemD,
        po_data_itemS,
        Submitted,
        Draft,
        Currency,
        currency1,
        CompanyCode,
        Plant,
        Track_po,
        email,
        invoice_No,
        attachment,
        podatatab
    } = this.entities;
    var pagee = 1;
    // const c4re = await cds.connect.to('iflow');
    const c5re = await cds.connect.to('iflow1');
    var firstRead = true;
    // this.on('buttomaction1', async (req) => {
    //     // sap.m.MessageToast.show('Button Action 1 was triggered.');
    // });
    this.on('buttomaction1', async (req) => {
        // sap.m.MessageToast.show('Button Action 1 was triggered.');

        // Call the second function here
        // await processEmailData(req);
    });



    this.on('buttomaction', async (req) => {
        var msgid = req.params[0].msg_id;
        // console.log("button hit aytu");
        var bodyy = {};
        var res = await c5re.post(`/dev/gmail-s3?user_id=einvoiceportal@gmail.com&msg_id=${msgid}`, bodyy);
    });
    // this.on('next', async (req) => {
    //     pagee = req.params[0].msg_id;
    //     console.log("next hit aytu");

    // });
    // this.on('prev', async (req) => {
    //     var msgid = req.params[0].msg_id;
    //     // console.log("button hit aytu");
    //     var bodyy = {};
    //     var res = await c5re.post(`/dev/gmail-s3?user_id=einvoiceportal@gmail.com&msg_id=${msgid}`, bodyy);
    // });
    this.on('getPdfUrl', async (req) => {
        debugger
        const fileLinkValue = await SELECT`file_link`.from(Newtab);
        return fileLinkValue;
    });
    this.on('getPdfUrlD', async (req) => {
        debugger
        const fileLinkValue = await SELECT`file_link`.from(Draft);
        return fileLinkValue;
    });
    this.on('getPdfUrlS', async (req) => {
        debugger
        const fileLinkValue = await SELECT`file_link`.from(Submitted);
        return fileLinkValue;
    });
    /* SERVICE HANDLERS */
    this.before('READ', Newtab, async (req) => {
        debugger
        try {
            debugger
            var er = false;

            if (req.params[0].Ref_PO_No != null) {
                debugger
                cds.tx(req).run(DELETE(Newtab));
                var er = true;
                // cds.tx(req).run(DELETE(podatatab));
                const pono = req.params[0].Ref_PO_No;
                const link = `/dev/getpo?po_no=${pono}`;
                const resp1 = await c5re.post(link);
                const spaces1 = resp1.body;
                const entries1 = [];
                debugger
                entries1.push({
                    Ref_PO_No: `${spaces1.ref_po_no}`,
                    po_number: `${spaces1.po_number}` || `NA`,
                    po_date: `${spaces1.po_date}`,
                    delivery_date: `${spaces1.delivery_date}`,
                    delivery_address: `${spaces1.delivery_address}`,
                    bill_to_address: `${spaces1.bill_to_address}`,
                    customer: `${spaces1.buyer}`,
                    currency: `${spaces1.currency}`,
                    purchase_group: `${spaces1.purchase_group}`,
                    taxable_amount: `${spaces1.taxable_amount}`,
                    amount_total: `${spaces1.total_amount}`,
                    tax: `${spaces1.tax_percentage}`,
                    company_code: `${spaces1.company_code}`,
                    plant: `${spaces1.plant}`,
                    file_link: `${spaces1.files.file_link}`
                });
                // await cds.tx(req).run(INSERT.into(Newtab).entries(entries1));
                await cds.tx(req).run(INSERT.into(Newtab).entries(entries1));

            } debugger

            // }
            var er = false;
            return req;
        } catch (err) {
            if (er) {
                req.error(500, err.message);
            }
            try {
                var er = false;

                if (req.query.SELECT.where[2].val != null) {
                    debugger
                    cds.tx(req).run(DELETE(Newtab));
                    var er = true;
                    // cds.tx(req).run(DELETE(podatatab));
                    const pono = req.query.SELECT.where[2].val;
                    const link = `/dev/getpo?po_no=${pono}`;
                    const resp1 = await c5re.post(link);
                    const spaces1 = resp1.body;
                    const entries1 = [];
                    debugger
                    entries1.push({
                        Ref_PO_No: `${spaces1.ref_po_no}`,
                        po_number: `${spaces1.po_number}` || `NA`,
                        po_date: `${spaces1.po_date}`,
                        delivery_date: `${spaces1.delivery_date}`,
                        delivery_address: `${spaces1.delivery_address}`,
                        bill_to_address: `${spaces1.bill_to_address}`,
                        customer: `${spaces1.buyer}`,
                        currency: `${spaces1.currency}`,
                        purchase_group: `${spaces1.purchase_group}`,
                        taxable_amount: `${spaces1.taxable_amount}`,
                        amount_total: `${spaces1.total_amount}`,
                        tax: `${spaces1.tax_percentage}`,
                        company_code: `${spaces1.company_code}`,
                        plant: `${spaces1.plant}`,
                        file_link: `${spaces1.files.file_link}`
                    });
                    // await cds.tx(req).run(INSERT.into(Newtab).entries(entries1));
                    await cds.tx(req).run(INSERT.into(Newtab).entries(entries1));

                } debugger

                // }
                var er = false;
                return req;
            } catch (error) {
                if (er) {
                    req.error(500, err.message);
                }
                try {
                    if (firstRead) {
                        debugger
                        cds.tx(req).run(DELETE(Newtab));

                        const resp = await c5re.get('/dev/getpo?pageno=1&nooflines=50&tabname=new');
                        const spaces = resp.body;
                        const entries = [];
                        spaces.forEach(space => {
                            entries.push({
                                PO_No: `${space.po_number}` || `NA`,
                                Ref_PO_No: `${space.ref_po_no}`,
                                Customer_Name: `${space.buyer}` || `NA`,
                                Date: `${space.po_date}` || `NA`,
                                Modified_Date_Time: `${space.modified_date}` || `NA`,
                                PO_File: `${space.file.length}` || `NA`
                            });
                        });
                        await cds.tx(req).run(INSERT.into(Newtab).entries(entries));
                    }
                    return req;

                } catch (err) {
                    req.error(500, err.message);
                }
            }





        }
    });
    /* SERVICE HANDLERS */
    this.before('READ', Draft, async (req) => {
        try {
            var er = false;

            if (req.params[0].Ref_PO_No != null) {
                var er = true;
                // cds.tx(req).run(DELETE(podatatab));
                cds.tx(req).run(DELETE(Draft));
                const pono = req.params[0].Ref_PO_No;
                const link = `/dev/getpo?po_no=${pono}`;
                const resp1 = await c5re.post(link);
                const spaces1 = resp1.body;
                const entries1 = [];

                entries1.push({
                    Ref_PO_No: `${spaces1.ref_po_no}`,
                    po_number: `${spaces1.po_number}` || `NA`,
                    po_date: `${spaces1.po_date}`,
                    delivery_date: `${spaces1.delivery_date}`,
                    delivery_address: `${spaces1.delivery_address}`,
                    bill_to_address: `${spaces1.bill_to_address}`,
                    customer: `${spaces1.buyer}`,
                    currency: `${spaces1.currency}`,
                    purchase_group: `${spaces1.purchase_group}`,
                    taxable_amount: `${spaces1.taxable_amount}`,
                    amount_total: `${spaces1.total_amount}`,
                    tax: `${spaces1.tax_percentage}`,
                    company_code: `${spaces1.company_code}`,
                    plant: `${spaces1.plant}`,
                    file_link: `${spaces1.files.file_link}`
                });
                await cds.tx(req).run(INSERT.into(Draft).entries(entries1));
            }
            // await cds.tx(req).run(INSERT.into(Draft).entries(entries));
            // }
            var er = false;
            return req;
        } catch (err) {
            if (er) {
                req.error(500, err.message);
            }

            try {
                var er = false;

                if (req.query.SELECT.where[2].val != null) {
                    var er = true;
                    // cds.tx(req).run(DELETE(podatatab));
                    cds.tx(req).run(DELETE(Draft));
                    const pono = req.query.SELECT.where[2].val;
                    const link = `/dev/getpo?po_no=${pono}`;
                    const resp1 = await c5re.post(link);
                    const spaces1 = resp1.body;
                    const entries1 = [];

                    entries1.push({
                        Ref_PO_No: `${spaces1.ref_po_no}`,
                        po_number: `${spaces1.po_number}` || `NA`,
                        po_date: `${spaces1.po_date}`,
                        delivery_date: `${spaces1.delivery_date}`,
                        delivery_address: `${spaces1.delivery_address}`,
                        bill_to_address: `${spaces1.bill_to_address}`,
                        customer: `${spaces1.buyer}`,
                        currency: `${spaces1.currency}`,
                        purchase_group: `${spaces1.purchase_group}`,
                        taxable_amount: `${spaces1.taxable_amount}`,
                        amount_total: `${spaces1.total_amount}`,
                        tax: `${spaces1.tax_percentage}`,
                        company_code: `${spaces1.company_code}`,
                        plant: `${spaces1.plant}`,
                        file_link: `${spaces1.files.file_link}`
                    });
                    await cds.tx(req).run(INSERT.into(Draft).entries(entries1));
                }
                // await cds.tx(req).run(INSERT.into(Draft).entries(entries));
                // }
                var er = false;
                return req;
            } catch (error) {
                if (er) {
                    req.error(500, err.message);
                }
                try {
                    if (firstRead) {
                        cds.tx(req).run(DELETE(Draft));

                        const resp = await c5re.get('/dev/getpo?pageno=1&nooflines=50&tabname=draft');
                        const spaces = resp.body;
                        const entries = [];
                        spaces.forEach(space => {
                            entries.push({
                                PO_No: `${space.po_number}` || `NA`,
                                Ref_PO_No: `${space.ref_po_no}`,
                                Customer_Name: `${space.buyer}` || `NA`,
                                Date: `${space.po_date}` || `NA`,
                                Modified_Date_Time: `${space.modified_date}` || `NA`,
                                PO_File: `${space.file.length}` || `NA`
                            });
                        });
                        await cds.tx(req).run(INSERT.into(Draft).entries(entries));
                    }
                    return req;

                } catch (err) {
                    req.error(500, err.message);
                }
            }



        }
    });
    /* SERVICE HANDLERS */
    this.before('READ', Submitted, async (req) => {
        try {
            var er = false;

            if (req.params[0].Ref_PO_No != null) {
                var er = true;
                // cds.tx(req).run(DELETE(podatatab));
                cds.tx(req).run(DELETE(Submitted));
                const pono = req.params[0].Ref_PO_No;
                const link = `/dev/getpo?po_no=${pono}`;
                const resp1 = await c5re.post(link);
                const spaces1 = resp1.body;
                const entries1 = [];

                entries1.push({
                    Ref_PO_No: `${spaces1.ref_po_no}`,
                    po_number: `${spaces1.po_number}` || `NA`,
                    po_date: `${spaces1.po_date}`,
                    delivery_date: `${spaces1.delivery_date}`,
                    delivery_address: `${spaces1.delivery_address}`,
                    bill_to_address: `${spaces1.bill_to_address}`,
                    customer: `${spaces1.buyer}`,
                    currency: `${spaces1.currency}`,
                    purchase_group: `${spaces1.purchase_group}`,
                    taxable_amount: `${spaces1.taxable_amount}`,
                    amount_total: `${spaces1.total_amount}`,
                    tax: `${spaces1.tax_percentage}`,
                    company_code: `${spaces1.company_code}`,
                    plant: `${spaces1.plant}`,
                    file_link: `${spaces1.files.file_link}`
                });
                await cds.tx(req).run(INSERT.into(Submitted).entries(entries1));
            }
            // await cds.tx(req).run(INSERT.into(Submitted).entries(entries));
            // }
            var er = false;
            return req;
        } catch (err) {
            if (er) {
                req.error(500, err.message);
            }
            try {
                var er = false;

                if (req.query.SELECT.where[2].val != null) {
                    var er = true;
                    // cds.tx(req).run(DELETE(podatatab));
                    cds.tx(req).run(DELETE(Submitted));
                    const pono = req.query.SELECT.where[2].val;
                    const link = `/dev/getpo?po_no=${pono}`;
                    const resp1 = await c5re.post(link);
                    const spaces1 = resp1.body;
                    const entries1 = [];

                    entries1.push({
                        Ref_PO_No: `${spaces1.ref_po_no}`,
                        po_number: `${spaces1.po_number}` || `NA`,
                        po_date: `${spaces1.po_date}`,
                        delivery_date: `${spaces1.delivery_date}`,
                        delivery_address: `${spaces1.delivery_address}`,
                        bill_to_address: `${spaces1.bill_to_address}`,
                        customer: `${spaces1.buyer}`,
                        currency: `${spaces1.currency}`,
                        purchase_group: `${spaces1.purchase_group}`,
                        taxable_amount: `${spaces1.taxable_amount}`,
                        amount_total: `${spaces1.total_amount}`,
                        tax: `${spaces1.tax_percentage}`,
                        company_code: `${spaces1.company_code}`,
                        plant: `${spaces1.plant}`,
                        file_link: `${spaces1.files.file_link}`
                    });
                    await cds.tx(req).run(INSERT.into(Submitted).entries(entries1));
                }
                // await cds.tx(req).run(INSERT.into(Submitted).entries(entries));
                // }
                var er = false;
                return req;
            } catch (error) {
                if (er) {
                    req.error(500, err.message);
                }
                try {
                    if (firstRead) {
                        cds.tx(req).run(DELETE(Submitted));

                        const resp = await c5re.get('/dev/getpo?pageno=1&nooflines=50&tabname=submitted');
                        const spaces = resp.body;
                        const entries = [];
                        spaces.forEach(space => {
                            entries.push({
                                PO_No: `${space.po_number}` || `NA`,
                                Ref_PO_No: `${space.ref_po_no}`,
                                Customer_Name: `${space.buyer}` || `NA`,
                                Date: `${space.po_date}` || `NA`,
                                Modified_Date_Time: `${space.modified_date}` || `NA`,
                                PO_File: `${space.file.length}` || `NA`
                            });
                        });
                        await cds.tx(req).run(INSERT.into(Submitted).entries(entries));
                    }
                    return req;

                } catch (err) {
                    req.error(500, err.message);
                }
            }



        }
    });
    ////////////////////////////
    // var firstRead = true;
    // /* SERVICE HANDLERS */
    // this.before('READ', podatatab, async (req) => {
    //    try {
    //     const pono = req.params[0].Ref_PO_No;
    //        if (firstRead) {
    //            cds.tx(req).run(DELETE(podatatab));

    //            const resp = await c5re.post('/dev/getpo?po_no='+pono);
    //            const `${spaces = resp.body;
    //            const entries = [];

    //                entries.push({
    //                 ref_po_no : `${spaces.ref_po_no,
    //                 po_number : `${spaces.po_number ||`NA`,
    //                 po_date : `${spaces.po_date,
    //                 delivery_date : `${spaces.delivery_date,
    //                 delivery_address : `${spaces.delivery_address,
    //                 bill_to_address : `${spaces.bill_to_address,
    //                 customer : `${spaces.buyer,
    //                 currency : `${spaces.currency,
    //                 purchase_group : `${spaces.purchase_group,
    //                 taxable_amount : `${spaces.taxable_amount,
    //                 amount_total : `${spaces.total_amount,
    //                 tax : `${spaces.tax_percentage,
    //                 company_code : `${spaces.company_code,
    //                 plant : `${spaces.plant
    //                });


    //            await cds.tx(req).run(INSERT.into(podatatab).entries(entries));
    //        }
    //        return req;
    //    } catch (err) {
    //        req.error(500, err.message);
    //    }
    // });
    //////////////////////////
    this.before('READ', po_data_item, async (req) => {
        debugger
        try {

            const poid = req.params[0].Ref_PO_No;
            // console.log(poid);
            const str = "/dev/getpo?po_no=" + poid.toString()
            const resp = await c5re.post(str);
            // console.log("poid");
            // cds.tx(req).run(DELETE(po_data));
            cds.tx(req).run(DELETE(po_data_item));
            // const `${spaces = resp.content;
            // console.log(resp);
            // console.log("------------------------------");
            // console.log(resp.body);
            // if (resp.body == "") {

            // }    else{
            //     const spaces = resp.body;
            // }
            const spaces = resp.body.item;
            // const entries1 = [];
            const entries11 = [];


            spaces.forEach(item => {
                if (resp.body.is_igst === "y") {
                    gstLabel = `IGST: ${item.gst_per}%`;
                } else {
                    gstLabel = `CGST: ${item.gst_per / 2}% SGST: ${item.gst_per / 2}%`;
                };
                var TA = `${(item.unit_price * item.quantity * item.gst_per) / 100}`;
                var tot_amt = Number(item.unit_price * item.quantity) + Number(TA);
                entries11.push({
                    slno: 1,
                    ref_po_no: item.ref_po_no,
                    item_no: item.item_no,
                    hsn_code: item.hsn_code,
                    material_no: item.material_no,
                    material_name: item.material_name,
                    quantity: item.quantity,
                    unit_price: item.unit_price,
                    unit_of_measure: item.unit_of_measure,
                    tax_percentage: item.tax_percentage,
                    taxable_amount: item.unit_price * item.quantity,
                    tax_amount: TA,
                    total_amount: tot_amt
                });
            });
            await cds.tx(req).run(INSERT.into(po_data_item).entries(entries11));
            // await cds.tx(req).run(INSERT.into(po_data).entries(entries1));

            // return `${spaces;
            //  firstRead = true;

            return req;
        } catch (err) {
            req.error(500, err.message);
        }
    });
    //////////////////////////
    this.before('READ', po_data_itemD, async (req) => {
        debugger
        try {

            const poid = req.params[0].Ref_PO_No;
            // console.log(poid);
            const str = "/dev/getpo?po_no=" + poid.toString()
            const resp = await c5re.post(str);
            // console.log("poid");
            // cds.tx(req).run(DELETE(po_data));
            cds.tx(req).run(DELETE(po_data_itemD));
            // const `${spaces = resp.content;
            // console.log(resp);
            // console.log("------------------------------");
            // console.log(resp.body);
            // if (resp.body == "") {
            //     resp.body = [];
            // }
            const spaces = resp.body.item;
            // const entries1 = [];
            const entries11 = [];


            spaces.forEach(item => {
                if (resp.body.is_igst === "y") {
                    gstLabel = `IGST: ${item.gst_per}%`;
                } else {
                    gstLabel = `CGST: ${item.gst_per / 2}% SGST: ${item.gst_per / 2}%`;
                };
                var TA = `${(item.unit_price * item.quantity * item.gst_per) / 100}`;
                var tot_amt = Number(item.unit_price * item.quantity) + Number(TA);
                entries11.push({
                    slno: 1,
                    ref_po_no: item.ref_po_no,
                    item_no: item.item_no,
                    hsn_code: item.hsn_code,
                    material_no: item.material_no,
                    material_name: item.material_name,
                    quantity: item.quantity,
                    unit_price: item.unit_price,
                    unit_of_measure: item.unit_of_measure,
                    tax_percentage: item.tax_percentage,
                    taxable_amount: item.unit_price * item.quantity,
                    tax_amount: TA,
                    total_amount: tot_amt
                });
            });
            await cds.tx(req).run(INSERT.into(po_data_itemD).entries(entries11));
            // await cds.tx(req).run(INSERT.into(po_data).entries(entries1));

            // return `${spaces;
            //  firstRead = true;

            return req;
        } catch (err) {
            req.error(500, err.message);
        }
    });
    //////////////////////////
    this.before('READ', po_data_itemS, async (req) => {
        debugger
        try {

            const poid = req.params[0].Ref_PO_No;
            // console.log(poid);
            const str = "/dev/getpo?po_no=" + poid.toString()
            const resp = await c5re.post(str);
            // console.log("poid");
            // cds.tx(req).run(DELETE(po_data));
            cds.tx(req).run(DELETE(po_data_itemS));
            // const `${spaces = resp.content;
            // console.log(resp);
            // console.log("------------------------------");
            // console.log(resp.body);
            // if (resp.body == "") {
            //     resp.body = [];
            // }
            const spaces = resp.body.item;
            // const entries1 = [];
            const entries11 = [];


            spaces.forEach(item => {
                if (resp.body.is_igst === "y") {
                    gstLabel = `IGST: ${item.gst_per}%`;
                } else {
                    gstLabel = `CGST: ${item.gst_per / 2}% SGST: ${item.gst_per / 2}%`;
                };
                var TA = `${(item.unit_price * item.quantity * item.gst_per) / 100}`;
                var tot_amt = Number(item.unit_price * item.quantity) + Number(TA);
                entries11.push({
                    slno: 1,
                    ref_po_no: item.ref_po_no,
                    item_no: item.item_no,
                    hsn_code: item.hsn_code,
                    material_no: item.material_no,
                    material_name: item.material_name,
                    quantity: item.quantity,
                    unit_price: item.unit_price,
                    unit_of_measure: item.unit_of_measure,
                    tax_percentage: item.tax_percentage,
                    taxable_amount: item.unit_price * item.quantity,
                    tax_amount: TA,
                    total_amount: tot_amt
                });
            });
            await cds.tx(req).run(INSERT.into(po_data_itemS).entries(entries11));
            // await cds.tx(req).run(INSERT.into(po_data).entries(entries1));

            // return `${spaces;
            //  firstRead = true;

            return req;
        } catch (err) {
            req.error(500, err.message);
        }
    });
    ///////////Currency help
    this.before('READ', Currency, async (req) => {
        debugger
        try {
            if (true) {
                const resp = await c5re.get('/dev/search-help?master_id=12');
                cds.tx(req).run(DELETE(Currency));
                const spaces = resp.body.search_help;
                const entries = [];
                spaces.forEach(space => {
                    entries.push({
                        code: `${space.code}`,
                        description: `${space.description}`
                    });
                });
                await cds.tx(req).run(INSERT.into(Currency).entries(entries));
            }
            return req;

        } catch (err) {
            req.error(500, err.message);
        }
    });
    ///////////Currency help
    this.before('READ', CompanyCode, async (req) => {
        try {
            if (true) {
                const resp = await c5re.get('/dev/search-help?master_id=1');
                cds.tx(req).run(DELETE(CompanyCode));
                const spaces = resp.body.search_help;
                const entries = [];
                spaces.forEach(space => {
                    entries.push({
                        code: `${space.code}`,
                        description: `${space.description}`
                    });
                });
                await cds.tx(req).run(INSERT.into(CompanyCode).entries(entries));
            }
            return req;

        } catch (err) {
            req.error(500, err.message);
        }
    });
    ///////////Currency help
    this.before('READ', Plant, async (req) => {
        try {
            if (true) {
                const resp = await c5re.get('/dev/search-help?master_id=7');
                cds.tx(req).run(DELETE(Plant));
                const spaces = resp.body.search_help;
                const entries = [];
                spaces.forEach(space => {
                    entries.push({
                        code: `${space.code}`,
                        description: `${space.description}`
                    });
                });
                await cds.tx(req).run(INSERT.into(Plant).entries(entries));
            }
            return req;

        } catch (err) {
            req.error(500, err.message);
        }
    });
    /* SERVICE HANDLERS */
    this.before('READ', Track_po, async (req) => {
        try {
            if (firstRead) {
                const resp = await c5re.post('/dev/trackso?userid=einvoiceportal@gmail.com&pageno=1&nooflines=50');
                cds.tx(req).run(DELETE(Track_po));
                // const `${spaces = resp.content;
                const spaces = resp.body;
                const entries = [];
                spaces.forEach(space => {
                    // var datee = convertDateFormat(`${space.po_date);
                    // if (`${space.modified_date == null) {
                    //     var dateTime = `${space.modified_date;
                    // } else {
                    //     var dateTime = convertDateTimeFormat(`${space.modified_date);
                    // }

                    entries.push({
                        // Srcevtname: `${space.Srcevtname,
                        // CreatedBy: `${space.CreatedBy,
                        po_number: `${space.po_number}` || `NA`,
                        ref_po_no: `${space.ref_po_no}`,
                        supplier_name: `${space.supplier_name}` || `NA`,
                        Date: `${space.po_date}` || `NA`,
                        Modified_by: `${space.modified_by}` || `NA`,
                        //Date :convertDateFormat(datee),
                        // Modified_Date_Time : `${space.modified_date,
                        status: `${space.status}` || `NA`,
                        error_log: `${space.error_log}` || `NA`
                        // Version: `${space.Version,
                        // event_id: `${space.event_id,
                        // status: `${space.status
                    });
                });
                await cds.tx(req).run(INSERT.into(Track_po).entries(entries));
                // return `${spaces;
                firstRead = true;
            }
            return req;
        } catch (err) {
            req.error(500, err.message);
        }
    });
    /////////////////

    //   const c4re = await cds.connect.to('iflow');
    var firstRead = true;

    /* SERVICE HANDLERS */
    this.before('READ', email, async (req) => {
        // console.log("email hit aytu");
        try {
            if (firstRead) {
                var pgno = 1;
                cds.tx(req).run(DELETE(email));
                cds.tx(req).run(DELETE(attachment));
                cds.tx(req).run(DELETE(invoice_No));
                const entries = [];
                const entries1 = [];
                const entries2 = [];

                while (true) {
                    const resp = await c5re.get(`/dev/gmail-s3?user_id=einvoiceportal@gmail.com&user_id2=einvoiceportal@elipo.awsapps.com&pageno=${pgno}&condn=`);
                    const spaces = resp.body;
                    pgno++;
                    if (pgno == 5) {
                        break;
                    }

                    spaces.forEach(space => {

                        const dateTimeString = space.dateobj;
                        const dateTimeParts = dateTimeString.split(/[ +]/);
                        entries.push({
                            msg_id: `${space.msg_id}` || `NA`,
                            FROM_: `${space.sender}` || `NA`,
                            DATE: `${dateTimeParts[0]}` || `NA`,
                            TIME: `${dateTimeParts[1]}` || `NA`,
                            SUBJECT: `${space.subject}` || `NA`,
                            TIME_TAKEN: `${space.time_taken}` || `NA`,
                            isReaded: `${space.isReaded}` || `NA`
                        });
                        const spaces1 = space.attachments;
                        spaces1.forEach(space1 => {
                            entries1.push({
                                msg_id: `${space1.msg_id}` || `NA`,
                                attachmentId: `${space1.attachmentId}` || `NA`,
                                filename: `${space1.filename}` || `NA`
                            });
                        });
                        var spaces2 = space.invoice_no;
                        if (space.invoice_no.length == 0) {
                            spaces2 = [`NA`];
                        }
                        spaces2.forEach(space2 => {
                            entries2.push({
                                msg_id: `${space.msg_id}` || `NA`,
                                invoice_no: `${space2}` || `NA`
                            });
                        });


                    });
                }
                entries.sort((a, b) => {
                    // Parse the 'DATE' values into Date objects and compare them
                    const dateA = new Date(a.DATE);
                    const dateB = new Date(b.DATE);
                    const dateComparison = dateB - dateA;

                    if (dateComparison === 0) {
                        // Parse the 'TIME' values into Date objects and compare them
                        const timeA = new Date(`1970-01-01T${a.TIME}`);
                        const timeB = new Date(`1970-01-01T${b.TIME}`);
                        return timeB - timeA;
                    }

                    return dateComparison;
                });
                await cds.tx(req).run(INSERT.into(email).entries(entries));
                await cds.tx(req).run(INSERT.into(attachment).entries(entries1));
                await cds.tx(req).run(INSERT.into(invoice_No).entries(entries2));
                // return `${spaces;
                firstRead = true;

                return req;
            }
        } catch (err) {
            req.error(500, err.message);
        }
    });

    ////////////////////rules///////////////////////////
    //////////////////
    let no = 1;
    this.before('READ', assignment_ruless, async (req) => {
        
        try {
            const resp = await c5re.get('/dev/rules?is_approval=n');


            const spaces = resp.body;
            let entries = [];
            let entries1 = [];
            // let entries2 = {state : true};
            // if (no == 1) {
            // no++;
            // } else {
            // cds.tx(req).run(DELETE(assignment_ruless));
            // cds.tx(req).run(DELETE(memberss)); 
            // no = 1;   
            // }
            await cds.tx(req).run(DELETE(assignment_ruless));
            await cds.tx(req).run(DELETE(approvers));
            spaces.forEach(space => {
                entries.push({
                    rule_id: space.rule_id,
                    rule_name: `${space.rule_name}`,
                    comments: `${space.comments}`,
                    is_on: `${space.is_on}`
                });
                // entries2.push({

                //     state :togglebutton(`${space.is_on}`)

                // });
                const space1 = space.approvers;

                space1.forEach(space11 => {
                    entries1.push({
                        rule_id: space.rule_id,
                        approver: space11.approver,
                        isgroup: `${space11.isgroup}`,
                        level: space11.level,
                        name: `${space11.name}`,
                        position: `${space11.position}`
                    });
                });
            });
            // }
            await cds.tx(req).run(INSERT.into(assignment_ruless).entries(entries));
            // await cds.tx(req).run(INSERT.into(togglee).entries(entries2));
            await cds.tx(req).run(INSERT.into(approvers).entries(entries1));
            return req;

        } catch (err) {
            req.error(500, err.message);
        }
    });
    this.on('toggleon', async (req) => {
        debugger
        var ruleid = req.params[0].rule_id
        // console.log("button hit aytu");
        const stat = await SELECT`is_on`.from(assignment_ruless).where`rule_id = ${ruleid}`;
        if (stat[0].is_on == 'y') {
            stat[0].is_on = 'n';
        } else {
            stat[0].is_on = 'y';
        }
        var bodyy = {};
        var res = await c5re.patch(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].is_on}`, bodyy);
        // const statr =  await SELECT `f4`.from(assignment_ruless) .where `f1 = ${ruleid}`;
        //    console.log(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].f4}`);
        //    console.log(statr);

    });
    this.on('toggleoff', async (req) => {
        debugger
        var ruleid = req.params[0].rule_id
        // console.log("button hit aytu");
        const stat = await SELECT`is_on`.from(assignment_ruless).where`rule_id = ${ruleid}`;
        if (stat[0].is_on == 'y') {
            stat[0].is_on = 'n';
        } else {
            stat[0].is_on = 'y';
        }
        var bodyy = {};
        var res = await c5re.patch(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].is_on}`, bodyy);
        // const statr =  await SELECT `f4`.from(assignment_ruless) .where `f1 = ${ruleid}`;
        //    console.log(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].f4}`);
        //    console.log(statr);

    });
    /* SERVICE HANDLERS */
    this.before('READ', approval_rules, async (req) => {
        

        try {
            const resp = await c5re.get('/dev/rules');
            // const r_id = req.params[0].rule_id;
           
            // throw new Error("This is a custom error message");
            await cds.tx(req).run(DELETE(approval_rules));
                await cds.tx(req).run(DELETE(criteria));
                await cds.tx(req).run(DELETE(approvers1));
    
                const spaces = resp.body;
                let entries = [];
                let entries1 = [];
                let entries2 = [];
                let prev_ent = 0;
                    spaces.forEach(space => {
                        entries.push({
                                        rule_id: space.rule_id,
                                        approval_type: `${space.approval_type}`,
                                        comments: `${space.comments}`,
                                        due_notification: space.due_notification,
                                        due_reminder: space.due_reminder,
                                        ec_isgroup: `${space.ec_isgroup}`,
                                        es_name: `${space.es_name}`,
                                        escelator: space.escelator,
                                        ifnot_withindays: space.ifnot_withindays,
                                        is_on: `${space.is_on}`,
                                        overdue_notification: space.overdue_notification,
                                        overdue_reminder: space.overdue_reminder,
                                        rule_name: `${space.rule_name}`,
                                    });
                                    const spaces1 = space.criteria;
                                            spaces1.forEach(space1 => {
                                                let parts = space1.rule.split(/\s*([=!<>]+|between)\s*/);
                                                if (parts[1]=="between") {
                                                     parts = space1.rule.split(/(\b\w+\b)\s+(between)\s+(\d+)\s+and\s+(\d+)/);
                                                     parts[0] = parts[1];
                                                     parts[1] = parts[2];
                                                     parts[2] = parts[3];
                                                     parts[3] = parts[4];
                                                }

                                                entries1.push({
                                                    Criteria:`${parts[0]}`,
                                                    Condition:`${parts[1]}`,
                                                    Value1:`${parts[2]}`,
                                                    Value11:`${parts[2]}`,
                                                    Value2:`${parts[3]}`,

                                                    operator:`${parts[1]}`,
                                                    rule_id: space.rule_id,
                                                    rule: `${space1.rule}`,
                                                    decider_type: `${space1.decider_type}`,
                                                });
                                            });
                    // let resp1 = await c5re.get(`/dev/rules?rule_id=${space.rule_id}`);
                    // let spaces1 = resp1.body.criteria;
                    // spaces1.forEach(space1 => {

                    //     prev_ent = entries1.length -1;
                    //     if (space1.decider == "currency") {
                    //         let sub = entries1[prev_ent].Value1;
                    //         entries1[prev_ent].Value1 = "";
                    //         entries1[prev_ent].currValue1 = `${space1.d_value}`;
                    //             entries1[prev_ent].Value2 = sub;
                    //     }else{
                    //         entries1.push({
                    //             Criteria:`${space1.decider}`,
                    //             Condition:`${space1.operator}`,
                    //             Value1:`${space1.d_value}`,
                    //             currCondition:`${space1.d_value2}`,
    
                    //             rule_id: parseInt(space.rule_id, 10),
                    //             // rule: `${space.criteria.rule}`,
                    //             operator:`${space1.operator}`,
                    //             d_value2:`${space1.d_value2}`,
                    //             d_value:`${space1.d_value}`,
                    //             // decider_type: `${space.criteria.decider_type}`,
                    //         });
                    //     }  
                    // });
                    const spaces2 = space.approvers;
                    spaces2.forEach(space2 => {
                                    entries2.push({
                                        rule_id: space.rule_id,
                                        approver: space2.approver,
                                        isgroup: `${space2.isgroup}`,
                                        level: space2.level,
                                        name: `${space2.name}`,
                                        position: `${space2.position}`,
                                    });
                                });
                    });
    
                await cds.tx(req).run(INSERT.into(approval_rules).entries(entries));
                await cds.tx(req).run(INSERT.into(criteria).entries(entries1));
                await cds.tx(req).run(INSERT.into(approvers1).entries(entries2));
                return req;
    
    
        } catch (err) {
            // try {

            //     const resp = await c5re.get('/dev/rules');
            //     await cds.tx(req).run(DELETE(approval_rules));
            //     await cds.tx(req).run(DELETE(criteria));
            //     await cds.tx(req).run(DELETE(approvers1));
    
            //     const spaces = resp.body;
            //     let entries = [];
            //     let entries1 = [];
            //     let entries2 = [];
            //     spaces.forEach(space => {
            //         entries.push({
            //             rule_id: space.rule_id,
            //             approval_type: `${space.approval_type}`,
            //             comments: `${space.comments}`,
            //             due_notification: space.due_notification,
            //             due_reminder: space.due_reminder,
            //             ec_isgroup: `${space.ec_isgroup}`,
            //             es_name: `${space.es_name}`,
            //             escelator: space.escelator,
            //             ifnot_withindays: space.ifnot_withindays,
            //             is_on: `${space.is_on}`,
            //             overdue_notification: space.overdue_notification,
            //             overdue_reminder: space.overdue_reminder,
            //             rule_name: `${space.rule_name}`,
            //         });
            //         const spaces1 = space.criteria;
            //         spaces1.forEach(space1 => {
            //             entries1.push({
            //                 rule_id: space.rule_id,
            //                 rule: `${space1.rule}`,
            //                 decider_type: `${space1.decider_type}`,
            //             });
            //         });
            //         const spaces2 = space.approvers;
            //         spaces2.forEach(space2 => {
            //             entries2.push({
            //                 rule_id: space.rule_id,
            //                 approver: space2.approver,
            //                 isgroup: `${space2.isgroup}`,
            //                 level: space2.level,
            //                 name: `${space2.name}`,
            //                 position: `${space2.position}`,
            //             });
            //         });
            //     });
    
            //     await cds.tx(req).run(INSERT.into(approval_rules).entries(entries));
            //     await cds.tx(req).run(INSERT.into(criteria).entries(entries1));
            //     await cds.tx(req).run(INSERT.into(approvers1).entries(entries2));
            //     return req;
    
    
            // } catch (err) {
    
                req.error(500, err.message);
            // }
        }


       
    });
    /////////////////
    this.before('READ', emailnotification, async (req) => {
        
        try {
            const resp = await c5re.get('/dev/rule-notification');
            await cds.tx(req).run(DELETE(emailnotification));
            await cds.tx(req).run(DELETE(mail_cc));
            const spaces = resp.body;
            let entries = [];
            let entries1 = [];
let ccc = 1;
            spaces.forEach(space => {
                entries.push({
                    e_id:ccc,
                    invoice_status: `${space.invoice_status}`,
                    body: `${space.body}`,
                    status_desc: `${space.status_desc}`,
                    subject: `${space.subject}`,
                });
                ccc++;
                const space1 = space.mail_cc;
                space1.forEach(space11 => {
                    entries1.push({
                        invoice_status: `${space.invoice_status}`,
                        name: `${space11.name}`,
                        member_id: space11.member_id,
                    });
                });

            });
            await cds.tx(req).run(INSERT.into(emailnotification).entries(entries));
            await cds.tx(req).run(INSERT.into(mail_cc).entries(entries1));
            return req;
        } catch (err) {
            //      try { 
            //         const resp = await c5re.get('/dev/rule-notification');

            //         await cds.tx(req).run(DELETE(emailnotification));
            //         cds.tx(req).run(DELETE(cc));
            //         const spaces = resp.body;
            //         let entries = [];
            //         let entries1 = [];
            //         let sl = 1;
            //         spaces.forEach(space =>  {        
            //             entries.push({
            //                 id : sl,
            //                 status :`${space.status_desc}`,
            //                 mail_subject : `${space.subject}`,
            //                 mail_body :`${space.body}`
            //             });
            //             const space1 = space.mail_cc;
            //         space1.forEach(space11 =>  {   
            //         entries1.push({
            //             id : sl,
            //             name : `${space11.name}`,
            //             member_id : `${space11.member_id}`,
            //         });
            //     });
            //     sl++;
            //         });
            //         await cds.tx(req).run(INSERT.into(emailnotification).entries(entries));
            //         await cds.tx(req).run(INSERT.into(cc).entries(entries1));
            //     return req;
            // } catch (err) {        
            req.error(500, err.message);
            // }
        }
    });
    this.on('getstatus', async (req) => {
        debugger
        const statusValue = await SELECT`f4`.from(assignment_ruless);
        return statusValue;
    });

    this.on('apprtoggleon', async (req) => {
        debugger
        var ruleid = req.params[0].rule_id
        // console.log("button hit aytu");
        const stat = await SELECT`is_on`.from(approval_rules).where`rule_id = ${ruleid}`;
        if (stat[0].is_on == 'y') {
            stat[0].is_on = 'n';
        } else {
            stat[0].is_on = 'y';
        }
        var bodyy = {};
        var res = await c5re.patch(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].is_on}`, bodyy);
        // const statr =  await SELECT `f4`.from(assignment_ruless) .where `f1 = ${ruleid}`;
        //    console.log(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].f4}`);
        //    console.log(statr);

    });
    this.on('apprtoggleoff', async (req) => {
        debugger
        var ruleid = req.params[0].rule_id
        // console.log("button hit aytu");
        const stat = await SELECT`is_on`.from(approval_rules).where`rule_id = ${ruleid}`;
        if (stat[0].is_on == 'y') {
            stat[0].is_on = 'n';
        } else {
            stat[0].is_on = 'y';
        }
        var bodyy = {};
        var res = await c5re.patch(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].is_on}`, bodyy);
        // const statr =  await SELECT `f4`.from(assignment_ruless) .where `f1 = ${ruleid}`;
        //    console.log(`/dev/rule-status?rule_id=${ruleid}&is_on=${stat[0].f4}`);
        //    console.log(statr);

    });








    ///////////rulenoti_s_h help
    this.before('READ', approvalrulesdecider_s_h, async (req) => {
        debugger
        try {
            if (true) {
                const resp = await c5re.get('/dev/dropdown?drop_key=rule-decider-fields');
                cds.tx(req).run(DELETE(approvalrulesdecider_s_h));
                const spaces = resp.body;
                const entries = [];
                spaces.forEach(space => {
                    entries.push({
                        table_key: `${space.table_key}`,
                        drop_key:`${space.drop_key}`,
                                value2:`${space.value2}`,
                                value3:`${space.value3}`,
                                value4:`${space.value4}`,
                    });
                });
                entries.push({
                    table_key: `currency`,
                    drop_key:`Currency`,
                            value2:`Currency`,
                            value3:`Currency`,
                            value4:`Currency`,
                });
                await cds.tx(req).run(INSERT.into(approvalrulesdecider_s_h).entries(entries));
            }
            return req;
        }
        catch (err) {
            req.error(500, err.message);
        }
    });
    ///////////rulenoti_s_h help
    this.before('READ', cc_s_h, async (req) => {
        
        try {
            if (true) {
                // const stat = await SELECT`table_key`.from(notification_rules);
                const resp = await c5re.get('/dev/member?search_string=');
                await cds.tx(req).run(DELETE(cc_s_h));
                const spaces = resp.body.Member;
                const entries = [];
                spaces.forEach(space => {
                    entries.push({
                        department_id: space.department_id,
                        email: `${space.email}`,
                        fs_name: `${space.fs_name} ${space.ls_name}`,
                        group_id: space.group_id,
                        ls_name: `${space.ls_name}`,
                        member_id: space.member_id,
                        position: `${space.position}`,
                        profile_photo: `${space.profile_photo}`,
                    });
                });
                await cds.tx(req).run(INSERT.into(cc_s_h).entries(entries));
            }
            return req;
        }
        catch (err) {
            req.error(500, err.message);
        }
    });
    // update Currency
    this.on('UPDATE', emailnotification, async (req) => {
        debugger
        const input =req.data.mailtocc;

const output = input.map(item => item.member_id);
        const bodyy = {
            body: req.data.body,
            mail_cc:output,
            subject: req.data.subject
        }
        const inv_stat = req.params[0].invoice_status;
        try {
            resp = await c5re.patch('/dev/rule-notification?invoice_status='+inv_stat, bodyy);
            // await UPDATE(Currency).set(req.data).where({ code: req.data.code });
            return req.data;
        } catch (err) {
            req.error(500, err.message);
        }
    });
    ///////////rule_statuses
    this.before('READ', rule_statuses, async (req) => {
        debugger
        try {
            if (true) {
                const resp = await c5re.get('/dev/dropdown?drop_key=rule_statuses');
                await cds.tx(req).run(DELETE(rule_statuses));
                const spaces = resp.body;
                const entries = [];
                spaces.forEach(space => {
                    entries.push({
                        table_key: `${space.table_key}`,
                        value2: `${space.value2}`,
                        value3: `${space.value3}`,
                        value4: `${space.value4}`,
                    });
                });
                await cds.tx(req).run(INSERT.into(rule_statuses).entries(entries));
            }
            return req;
        }
        catch (err) {
            req.error(500, err.message);
        }
    });
//////////rules_n_status_s_h
this.before('READ',rules_n_status_s_h, async (req) => {
    
    try {
        if (true) {
            cds.tx(req).run(DELETE(rules_n_status_s_h));
            const entries = []; 
            
                entries.push({
                    table_key :`Amount`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Amount`,
                    value2    :`In Between`,
                    operator:`between`,
                });
                entries.push({
                    table_key :`Amount`,
                    value2    :`Less Than`,
                    operator:`<`,
                });
                entries.push({
                    table_key :`Amount`,
                    value2    :`More Than`,
                    operator:`>`,
                });
                entries.push({
                    table_key :`Cost Center`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Department`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Document Type`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`G/ L Account`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Item Category`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Jurisdiction Code`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`PO Type`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Vendor`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                entries.push({
                    table_key :`Currency`,
                    value2    :`Equal To`,
                    operator:`=`,
                });
                
            await cds.tx(req).run(INSERT.into(rules_n_status_s_h).entries(entries));
        }
        return req;
    }
    catch (err) {
        req.error(500, err.message);
    }
});
 ///////////value1sh
 this.before('READ', value1sh, async (req) => {
    
    try {
        if (true) {
            
            let resp = await c5re.get('/dev/search-help?master_id=3');
            await cds.tx(req).run(DELETE(value1sh));
            let spaces = resp.body.search_help;
            let entries = [];
            spaces.forEach(space => {
                entries.push({
                     code:`${space.code}`,
                    master_name:`${space.master_name}`,
                             description:`${space.description}`,
                            });
            });
             resp = await c5re.get('/dev/report?document_type=invoice');
             spaces = resp.body.search_help;
            
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`${space.master_name}`,
                              description:`${space.description}`,
                             });
             });
             resp = await c5re.get('/dev/search-help?master_id=12');
             spaces = resp.body.search_help;
            
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`${space.master_name}`,
                              description:`${space.description}`,
                             });
             });
             resp = await c5re.get('/dev/search-help?master_id=2');
             spaces = resp.body.search_help;
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`G/ L Account`,
                              description:`${space.description}`,
                             });
             });
             
             resp = await c5re.get('/dev/search-help?master_id=11');
             spaces = resp.body.search_help;
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`${space.master_name}`,
                              description:`${space.description}`,
                             });
             });
             resp = await c5re.get('/dev/report?department=department');
             spaces = resp.body.search_help;
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`${space.master_name}`,
                              description:`${space.description}`,
                             });
             });
             resp = await c5re.get('/dev/search-help?master_id=0');
             spaces = resp.body.search_help;
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`${space.master_name}`,
                              description:`${space.description}`,
                             });
             });
             resp = await c5re.get('/dev/report?po_type=npo');
             spaces = resp.body.search_help;
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                     master_name:`${space.master_name}`,
                              description:`${space.description}`,
                             });
             });
             resp = await c5re.get('/dev/svendor');
             spaces = resp.body.search_help;
             spaces.forEach(space => {
                 entries.push({
                      code:`${space.code}`,
                      master_name:`Vendor`,
                              description:`${space.description}`,
                             });
             });


            await cds.tx(req).run(INSERT.into(value1sh).entries(entries));
        }
        return req;
    }
    catch (err) {
        req.error(500, err.message);
    }
});
 ///////////approvers_s_h
 this.before('READ', approvers_s_h, async (req) => {
    debugger
    try {
        if (true) {
            const resp = await c5re.get('/dev/dropdown?drop_key=approver');
            await cds.tx(req).run(DELETE(approvers_s_h));
            const spaces = resp.body;
            const entries = [];
            spaces.forEach(space => {
                entries.push({
        
                 table_key:space.table_key,
 drop_key:`${space.drop_key}`,
            value2:`${space.value2}`,
            value3:`${space.value3}`,
            value4:`${space.value4}`,
                });
            });
            await cds.tx(req).run(INSERT.into(approvers_s_h).entries(entries));
        }
        return req;
    }
    catch (err) {
        req.error(500, err.message);
    }
});
///////////approvers_s_h1
this.before('READ', approvers_s_h1, async (req) => {
    debugger
    try {
        if (true) {
            const resp = await c5re.get('/dev/assignment-approver');
            await cds.tx(req).run(DELETE(approvers_s_h1));
            const spaces = resp.body;
            const entries = [];
            spaces.forEach(space => {
                entries.push({
                    id:space.id,
                    is_group:`${space.is_group}`,
                    name:`${space.name}`,
                });
            });
            await cds.tx(req).run(INSERT.into(approvers_s_h1).entries(entries));
        }
        return req;
    }
    catch (err) {
        req.error(500, err.message);
    }
});
this.before('READ', approvaltype_s_h, async (req) => {
    debugger
    try {
        if (true) {
            await cds.tx(req).run(DELETE(approvaltype_s_h));
            const entries = [];
                entries.push({
                    sh:`Parallel`
                });
                entries.push({
                    sh:`Series`
                });
                entries.push({
                    sh:`Single`
                });
            
            await cds.tx(req).run(INSERT.into(approvaltype_s_h).entries(entries));
        }
        return req;
    }
    catch (err) {
        req.error(500, err.message);
    }
});
    // update Currency
    this.on('UPDATE', approval_rules, async (req) => {
        debugger
//         const input =req.data.mailtocc;
spaces=req.data.apprtocri;
spaces.forEach(space => {
    if (space.Value2 == 'undefined'){
        space.Value2 = null;
    };
    if (space.Value2 != 'undefined'){
        space.Value1 = space.Value11;
    };
if (space.decider == null) {
    space.decider = req.data.apprtocri.Criteria.replace(/\s+/g, '_').toLowerCase();    
}
});
// const output = input.map(item => item.member_id);
        let approvers= apprtoapp.map(approver => ({ name: approver.name, age: approver.age }));
        let criteria= req.data.apprtocri.map(approver => ({ decider: approver.decider, operator: approver.operator, type: approver.decider_type, value1: approver.Value1, value2: approver.Value2 }));
        const bodyy = {
        approval_type:req.data.approval_type ,
        comments:req.data.comments ,
        due_notification:req.data.due_notification ,
        due_reminder:req.data.due_reminder ,
        ec_isgroup:req.data.ec_isgroup ,
        escelator:req.data.escelator ,
        ifnot_withindays:req.data.ifnot_withindays ,
        overdue_notification:req.data.overdue_notification,
        overdue_reminder:req.data.overdue_reminder,
        // post_noti_app:,
        // post_noti_isgroup:,
        }
        const inv_stat = req.params[0].invoice_status;
        try {
            resp = await c5re.patch('/dev/rule-notification?invoice_status='+inv_stat, bodyy);
            // await UPDATE(Currency).set(req.data).where({ code: req.data.code });
            return req.data;
        } catch (err) {
            req.error(500, err.message);
        }
    });



});
