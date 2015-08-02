angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages', 'ngResource', 'Sentinel.orgsController', 'Sentinel.orgs']);
angular.module('Sentinel').config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
function($stateProvider, $urlRouterProvider, $locationProvider) {
	$stateProvider
	.state('home', {
		url: '/home',
		templateUrl: 'home/_home.html',
		controller: 'SentinelCtrl'
	})
	.state('realm', {
		url: '/realm',
		templateUrl: 'home/_realm.html',
		controller: 'RealmController'
	})
	.state('jobs', {
		url: '/jobs',
		templateUrl: 'home/_jobs.html',
		controller: 'JobsController'
	})
	.state('orgs', {
		url: '/orgs',
		templateUrl: 'org/_orgs.html',
		controller: 'OrgController'
	})
	.state('createOrg', {
		url: '/createOrg',
		templateUrl: 'org/_createOrg.html',
		controller: 'OrgCreateController'
	})
	.state('showOrg', {
		url: '/orgs/:id',
		templateUrl: 'org/_show.html',
		controller: 'OrgViewController'
	})
	.state('editOrg', {
		url: '/orgs/{id}/edit',
		templateUrl: 'org/_edit.html',
		controller: 'OrgEditController'
	});

	$urlRouterProvider.otherwise('home');
	
	$locationProvider.html5Mode(true);
}])
.directive('ngConfirmClick', [
  function(){
    return {
      priority: 100,
      restrict: 'A',
      link: {
          pre: function(scope, element, attrs){ //<---------
                element.bind('click touchstart', function(e){
                  var message = attrs.ngConfirmClick;
                  if(message && !window.confirm(message)){
                    e.stopImmediatePropagation();
                    e.preventDefault();
                  }
                });
              }
        }
    }
  }
]);