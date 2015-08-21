<<<<<<< HEAD
angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages', 'ngResource', 'Sentinel.orgsController', 'Sentinel.orgs','Sentinel.prosessesController', 'Sentinel.prosesses','Sentinel.communicationsController', 'Sentinel.communications','Sentinel.realmsController','Sentinel.realms']);
=======
angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages', 'ngResource', 'Sentinel.orgsController', 'Sentinel.orgs', 'Sentinel.prosessesController', 'Sentinel.prosesses', 'Sentinel.communicationsController', 'Sentinel.communications', 'Sentinel.clientsController', 'Sentinel.clients']);
>>>>>>> 1fbc2f62e3962e7d585c2afc8ba86bde066bbd7e
angular.module('Sentinel').config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
function($stateProvider, $urlRouterProvider, $locationProvider) {
	$stateProvider
	.state('home', {
		url: '/home',
		templateUrl: 'home/_home.html',
		controller: 'SentinelCtrl'
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
	})
	.state('prosesses', {
		url: '/prosesses',
		templateUrl: 'prosess/_prosess.html',
		controller: 'ProsessController'
	})
	.state('createProsess', {
		url: '/createProsess',
		templateUrl: 'prosess/_createProsess.html',
		controller: 'ProsessCreateController'
	})
	.state('showProsess', {
		url: '/prosesses/:id',
		templateUrl: 'prosess/_show.html',
		controller: 'ProsessViewController'
	})
	.state('editProsess', {
		url: '/prosesses/{id}/edit',
		templateUrl: 'prosess/_edit.html',
		controller: 'ProsessEditController'
	})
	.state('communications', {
		url: '/communications',
		templateUrl: 'communication/_communications.html',
		controller: 'CommunicationController'
	})
	.state('createCommunication', {
		url: '/createCommunication',
		templateUrl: 'communication/_createCommunication.html',
		controller: 'CommunicationCreateController'
	})
	.state('showCommunication', {
		url: '/communications/:id',
		templateUrl: 'communication/_show.html',
		controller: 'CommunicationViewController'
	})
	.state('editCommunication', {
		url: '/communications/{id}/edit',
		templateUrl: 'communication/_edit.html',
		controller: 'CommunicationEditController'
	})
<<<<<<< HEAD
		.state('realms', {
		url: '/realms',
		templateUrl: 'realm/_realms.html',
		controller: 'RealmController'
	})
	.state('createRealm', {
		url: '/createRealm',
		templateUrl: 'realm/_createRealm.html',
		controller: 'RealmCreateController'
	})
	.state('showRealm', {
		url: '/realms/:id',
		templateUrl: 'realm/_show.html',
		controller: 'RealmViewController'
	})
	.state('editRealm', {
		url: '/realms/{id}/edit',
		templateUrl: 'realm/_edit.html',
		controller: 'RealmEditController'
=======
	.state('clients', {
		url: '/clients',
		templateUrl: 'clients/_clients.html',
		controller: 'clientsController'
	})
	.state('createClient', {
		url: '/createClient',
		templateUrl: 'clients/_createClient.html',
		controller: 'ClientCreateController'
	})
	.state('showClient', {
		url: '/clients/:id',
		templateUrl: 'client/_show.html',
		controller: 'ClientViewController'
	})
	.state('editClient', {
		url: '/clients/{id}/edit',
		templateUrl: 'client/_edit.html',
		controller: 'ClientEditController'
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
]);angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages', 'ngResource', 'Sentinel.orgsController', 'Sentinel.orgs', 'Sentinel.prosessesController', 'Sentinel.prosesses', 'Sentinel.communicationsController', 'Sentinel.communications', 'Sentinel.clientsController', 'Sentinel.clients']);
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
	})
	.state('process', {
		url: '/prosesses',
		templateUrl: 'prosess/_prosess.html',
		controller: 'ProsessController'
	})
	.state('createProsess', {
		url: '/createProsess',
		templateUrl: 'prosess/_createProsess.html',
		controller: 'ProsessCreateController'
	})
	.state('showProsess', {
		url: '/prosesses/:id',
		templateUrl: 'prosess/_show.html',
		controller: 'ProsessViewController'
	})
	.state('editProsess', {
		url: '/prosesses/{id}/edit',
		templateUrl: 'prosess/_edit.html',
		controller: 'ProsessEditController'
	})
	.state('communications', {
		url: '/communications',
		templateUrl: 'communication/_communications.html',
		controller: 'CommunicationController'
	})
	.state('createCommunication', {
		url: '/createCommunication',
		templateUrl: 'communication/_createCommunication.html',
		controller: 'CommunicationCreateController'
	})
	.state('showCommunication', {
		url: '/communications/:id',
		templateUrl: 'communication/_show.html',
		controller: 'CommunicationViewController'
	})
	.state('editCommunication', {
		url: '/communications/{id}/edit',
		templateUrl: 'communication/_edit.html',
		controller: 'CommunicationEditController'
	})
	.state('clients', {
		url: '/clients',
		templateUrl: 'clients/_clients.html',
		controller: 'clientsController'
	})
	.state('createClient', {
		url: '/createClient',
		templateUrl: 'clients/_createClient.html',
		controller: 'ClientCreateController'
	})
	.state('showClient', {
		url: '/clients/:id',
		templateUrl: 'clients/_show.html',
		controller: 'ClientViewController'
	})
	.state('editClient', {
		url: '/clients/{id}/edit',
		templateUrl: 'clients/_edit.html',
		controller: 'ClientEditController'
>>>>>>> 1fbc2f62e3962e7d585c2afc8ba86bde066bbd7e
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