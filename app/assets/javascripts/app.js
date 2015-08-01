angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages', 'ngResource', 'Sentinel.orgsController', 'Sentinel.orgs']);
angular.module('Sentinel').config(['$stateProvider', '$urlRouterProvider', 
function($stateProvider, $urlRouterProvider) {
	$stateProvider
	.state('home', {
		url: '/home',
		templateUrl: 'home/_home.html',
		controller: 'SentinelCtrl'
	})
	.state('realm', {
		url: '/home',
		templateUrl: 'home/_realm.html',
		controller: 'SentinelCtrl'
	})
	.state('jobs', {
		url: '/home',
		templateUrl: 'home/_jobs.html',
		controller: 'SentinelCtrl'
	})
	.state('orgs', {
		url: '/orgs',
		templateUrl: 'org/_orgs.html',
		controller: 'OrganizationCtrl'
	})
	.state('createOrg', {
		url: '/createOrg',
		templateUrl: 'org/_createOrg.html',
		controller: 'OrgCreateController'
	})
	.state('showOrg', {
		url: '/orgs/:id/show',
		templateUrl: 'org/_show.html',
		controller: 'OrgViewController'
	})
	.state('editOrg', {
		url: '/orgs/{id}/edit',
		templateUrl: 'org/_edit.html',
		controller: 'OrgEditController'
	});
	
	$urlRouterProvider.otherwise('home');
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