(function (angular) {
	"use strict";
	/*global angular, console*/
    
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
            "username": null,
            "loggedIn": false
        };

		return BezPara;
	});
    
    angular.module('bezPara').controller('GiftListCtrl', function ($scope, Gift, BezPara) {
        $scope.BezPara = BezPara;
        $scope.type = BezPara.loggedIn ? 'interested' : 'all'; //default
        
        $scope.filterGifts = function (type) {
            console.log('filtering with type', type);
            $scope.type = type;
            $scope.gifts = Gift.query({
                'type': $scope.type,
                'username': BezPara.username
            });
        };
        
        $scope.remove = function (giftId) {
            console.log('remove', giftId);
        };
        
        $scope.contact = function (username) {
            console.log('contact', username);
        };
        
        $scope.filterGifts($scope.type);
    });
    
    angular.module('bezPara').controller('GiftCtrl', function ($scope, Gift, BezPara) {
        $scope.addGift = function () {
            if (BezPara.loggedIn) {
                console.log('add', BezPara.username, $scope.gift);
            } else {
                alert('You must log in first');
            }
        };
    });
    
    angular.module('bezPara').controller('LoginCtrl', function ($scope, Gift, BezPara) {
        $scope.loginMe = function () {
            //TODO: actual login
            BezPara.username = $scope.username;
            BezPara.loggedIn = true;
        };
    });
    
    angular.module('bezPara').controller('MenuCtrl', function ($scope, BezPara) {
        $scope.BezPara = BezPara;
        
        $scope.logoutMe = function () {
            //TODO: actual logout
            BezPara.username = null;
            BezPara.loggedIn = false;
        };
    });
    
    angular.module('bezPara').filter('humanTime', function () {
		return function (seconds) {
            return moment().lang('hr').subtract('seconds', seconds).fromNow();
		};
	});
    
    angular.module('bezPara').directive('a', function() {
        return {
            restrict: 'E',
            link: function(scope, elem, attrs) {
                if(attrs.ngClick || attrs.href === '' || attrs.href === '#'){
                    elem.on('click', function(e){
                        //e.preventDefault();
                        //e.stopPropagation();
                        //return false;
                    });
                }
            }
       };
    });
    
}(angular));