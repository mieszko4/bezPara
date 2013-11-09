(function (angular) {
	"use strict";
	/*global angular, console*/

    console.log
	// Declare app level module which depends on filters, and services
	angular.module('bezPara', ['ngResource']);
    
    angular.module('bezPara').factory('Gift', function ($resource) {
        return $resource('../fixtures/gift.json/:giftId', {},
		//return $resource('../api/gift/:giftId', {},
			{
				update: {method: 'PUT'}
			});
	});
    
    angular.module('bezPara').factory('BezPara', function () {
		var BezPara = {
            "username": "",
            "token": "t0k3n",
            "loggedIn": true,
            "gifted": 99, //TODO, get from server
        };

		return BezPara;
	});
    
    angular.module('bezPara').controller('GiftListCtrl', function ($scope, Gift, BezPara) {
        var type = 'all';
        
        $scope.gifts = Gift.query({
            'type': type
        });
    });
    
    angular.module('bezPara').filter('humanTime', function () {
		return function (seconds) {
            return moment().lang('hr').subtract('seconds', seconds).fromNow();
		};
	});
    
}(angular));