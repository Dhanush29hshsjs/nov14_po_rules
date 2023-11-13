sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'trackpodep/test/integration/FirstJourney',
		'trackpodep/test/integration/pages/Track_poList',
		'trackpodep/test/integration/pages/Track_poObjectPage'
    ],
    function(JourneyRunner, opaJourney, Track_poList, Track_poObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('trackpodep') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTrack_poList: Track_poList,
					onTheTrack_poObjectPage: Track_poObjectPage
                }
            },
            opaJourney.run
        );
    }
);