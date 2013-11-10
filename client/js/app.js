(function (angular) {
	"use strict";
	/*global angular, console*/

    // Declare app level module which depends on filters, and services
	angular.module('bezPara', ['ngResource']);

    angular.module('bezPara').factory('Gift', function ($resource) {
        return $resource('../fixtures/gift.json', {},
		//return $resource('../api/gift/:giftId', {},
			{
				update: {method: 'PUT'}
			});
	});

    angular.module('bezPara').factory('BezPara', function () {
		var BezPara = {
            "type": 'all',
            "username": null,
            "loggedIn": false
        };

		return BezPara;
	});

    angular.module('bezPara').controller('GiftListCtrl', function ($rootScope, $http, $scope, Gift, BezPara, $window) {
        var type = BezPara.loggedIn ? 'interested' : 'all'; //default
        $scope.BezPara = BezPara;

        $scope.filterGifts = function (type) {
            console.log('filtering with type', type);
            $scope.type = type;
            $scope.gifts = Gift.query({
                'type': $scope.type,
                'username': BezPara.username
            });
        };

        $scope.remove = function (gift) {
            $http.post('../api/gift/' + gift.ID + '/disable?username=' + $window.encodeURIComponent(BezPara.username), angular.toJson({})).success(function () {
                $scope.filterGifts($scope.type);
            });
        };

        $scope.contact = function (username) {
            console.log('contact', username);
        };

        $rootScope.$on('login', function () {
            $scope.filterGifts('interested');
        });

        $rootScope.$on('logout', function () {
            $scope.filterGifts('all');
        });

        $scope.filterGifts(type);
    });

    angular.module('bezPara').controller('GiftCtrl', function ($window, $http, $scope, BezPara) {
        $scope.addGift = function () {
            if (BezPara.loggedIn) {
                if ($scope.gift) {
                    $http.post('../api/gift?username=' + $window.encodeURIComponent(BezPara.username), angular.toJson({
                        "name": $scope.gift
                    })).success(function () {
                        $scope.gift = null;
                        $scope.filterGifts($scope.type);
                    });
                    console.log('add', BezPara.username, $scope.gift);
                }
            } else {
                $window.alert('Moraš se prvo prijaviti');
            }
        };
    });

    angular.module('bezPara').controller('LoginCtrl', function ($rootScope, $scope, BezPara) {
        $scope.loginMe = function () {
            //TODO: actual login
            BezPara.username = $scope.username;
            BezPara.loggedIn = true;
            $rootScope.$emit('login');
        };
    });

    angular.module('bezPara').controller('MenuCtrl', function ($rootScope, $scope, BezPara) {
        $scope.BezPara = BezPara;

        $scope.logoutMe = function () {
            //TODO: actual logout
            BezPara.username = null;
            BezPara.loggedIn = false;
            $rootScope.$emit('logout');
        };
    });

    angular.module('bezPara').filter('humanTime', function ($window) {
		return function (seconds) {
            return $window.moment().lang('hr').subtract('seconds', seconds).fromNow();
		};
	});

    angular.module('bezPara').filter('encodeURIComponent', function ($window) {
		return $window.encodeURIComponent;
	});

}(angular));