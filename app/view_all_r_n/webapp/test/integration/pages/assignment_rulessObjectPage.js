sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'viewallrn',
            componentId: 'assignment_rulessObjectPage',
            contextPath: '/assignment_ruless'
        },
        CustomPageDefinitions
    );
});