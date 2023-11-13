sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'trackpodep',
            componentId: 'Track_poObjectPage',
            contextPath: '/Track_po'
        },
        CustomPageDefinitions
    );
});