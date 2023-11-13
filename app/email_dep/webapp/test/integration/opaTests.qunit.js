sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'emaildep/test/integration/FirstJourney',
		'emaildep/test/integration/pages/emailList',
		'emaildep/test/integration/pages/emailObjectPage'
    ],
    function(JourneyRunner, opaJourney, emailList, emailObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('emaildep') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheemailList: emailList,
					onTheemailObjectPage: emailObjectPage
                }
            },
            opaJourney.run
        );
    }
);