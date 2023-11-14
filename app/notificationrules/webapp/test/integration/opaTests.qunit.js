sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'notificationrules/test/integration/FirstJourney',
		'notificationrules/test/integration/pages/notification_rulesObjectPage'
    ],
    function(JourneyRunner, opaJourney, notification_rulesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('notificationrules') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThenotification_rulesObjectPage: notification_rulesObjectPage
                }
            },
            opaJourney.run
        );
    }
);