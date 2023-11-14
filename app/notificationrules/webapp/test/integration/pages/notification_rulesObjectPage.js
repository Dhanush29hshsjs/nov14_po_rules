sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'notificationrules',
            componentId: 'notification_rulesObjectPage',
            contextPath: '/notification_rules'
        },
        CustomPageDefinitions
    );
});