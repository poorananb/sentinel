var app = angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages']);
app.config(['$stateProvider', '$urlRouterProvider', 
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
	.state('createneworg', {
		url: '/createneworg',
		templateUrl: 'org/_createneworg.html',
		controller: 'OrganizationCtrl'
	})
	.state('listorg', {
		url: '/listorg',
		templateUrl: 'org/_listorg.html',
		controller: 'OrganizationCtrl',
		resolve: {
        	postPromise: ['orgs', function(orgs){
            	return orgs.getAll();
            }]
        }
	})
	.state('orgs', {
		url: '/orgs/{id}',
		templateUrl: 'org/_show.html',
		controller: 'OrganizationCtrl',
		resolve: {
			post: ['$stateParams', 'orgs', function($stateParams, orgs) {
				return orgs.get($stateParams.id);
			}]
		}
	})
	.state('editorg', {
		url: '/orgs/{id}/edit',
		templateUrl: 'org/_edit.html',
		controller: 'OrganizationCtrl',
		resolve: {
			post: ['$stateParams', 'orgs', function($stateParams, orgs) {
				return orgs.get($stateParams.id);
			}]
		}
	});
	
	$urlRouterProvider.otherwise('home');
}]);

app.directive('ngConfirmClick', [
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