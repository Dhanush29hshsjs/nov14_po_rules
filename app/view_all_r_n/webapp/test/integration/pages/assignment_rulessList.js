sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'viewallrn',
            componentId: 'assignment_rulessList',
            contextPath: '/assignment_ruless'
        },
        CustomPageDefinitions
    );
});