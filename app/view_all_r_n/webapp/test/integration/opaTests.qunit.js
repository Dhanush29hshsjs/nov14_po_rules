sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'viewallrn/test/integration/FirstJourney',
		'viewallrn/test/integration/pages/assignment_rulessList',
		'viewallrn/test/integration/pages/assignment_rulessObjectPage'
    ],
    function(JourneyRunner, opaJourney, assignment_rulessList, assignment_rulessObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('viewallrn') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheassignment_rulessList: assignment_rulessList,
					onTheassignment_rulessObjectPage: assignment_rulessObjectPage
                }
            },
            opaJourney.run
        );
    }
);