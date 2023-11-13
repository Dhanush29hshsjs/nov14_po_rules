sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'pocockpitdep/test/integration/FirstJourney',
		'pocockpitdep/test/integration/pages/NewtabList',
		'pocockpitdep/test/integration/pages/NewtabObjectPage'
    ],
    function(JourneyRunner, opaJourney, NewtabList, NewtabObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('pocockpitdep') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheNewtabList: NewtabList,
					onTheNewtabObjectPage: NewtabObjectPage
                }
            },
            opaJourney.run
        );
    }
);