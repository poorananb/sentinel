angular.module('Sentinel', ['ui.router', 'templates', 'ngMessages', 'elif', 'ngResource', 'Sentinel.orgsController', 'Sentinel.orgs','Sentinel.prosessesController', 'Sentinel.prosesses','Sentinel.communicationsController', 'Sentinel.communications','Sentinel.realmsController','Sentinel.realms','Sentinel.stages','Sentinel.stagesController','Sentinel.clientsController', 'Sentinel.clients', 'Sentinel.praxis', 'Sentinel.praxisController', 'Sentinel.users', 'Sentinel.usersController']);
angular.module('Sentinel').config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
function($stateProvider, $urlRouterProvider, $locationProvider) {
	$stateProvider
	.state('home', {url: '/home',templateUrl: 'home/_home.html',controller: 'SentinelCtrl'})
	.state('jobs', {url: '/jobs',templateUrl: 'home/_jobs.html',controller: 'JobsController'})
	.state('orgs', {url: '/orgs',templateUrl: 'org/_orgs.html',controller: 'OrgController'})
	.state('createOrg', {url: '/createOrg',templateUrl: 'org/_createOrg.html',controller: 'OrgCreateController'})
	.state('showOrg', {url: '/orgs/:id',templateUrl: 'org/_show.html',controller: 'OrgViewController'})
	.state('editOrg', {url: '/orgs/{id}/edit',templateUrl: 'org/_edit.html',controller: 'OrgEditController'})
	.state('prosesses', {url: '/prosesses',templateUrl: 'prosess/_prosess.html',controller: 'ProsessController'})
	.state('createProsess', {url: '/createProsess',templateUrl: 'prosess/_createProsess.html',controller: 'ProsessCreateController'})
	.state('showProsess', {url: '/prosesses/:id',templateUrl: 'prosess/_show.html',controller: 'ProsessViewController'})
	.state('editProsess', {url: '/prosesses/{id}/edit',templateUrl: 'prosess/_edit.html',controller: 'ProsessEditController'})
	.state('communications', {url: '/communications',templateUrl: 'communication/_communications.html',controller: 'CommunicationController'})
	.state('createCommunication', {url: '/createCommunication',templateUrl: 'communication/_createCommunication.html',controller: 'CommunicationCreateController'})
	.state('showCommunication', {url: '/communications/:id',templateUrl: 'communication/_show.html',controller: 'CommunicationViewController'})
	.state('editCommunication', {url: '/communications/{id}/edit',templateUrl: 'communication/_edit.html',controller: 'CommunicationEditController'})
	.state('realms', {url: '/realms',templateUrl: 'realm/_realms.html',controller: 'RealmController'})
	.state('createRealm', {url: '/createRealm',templateUrl: 'realm/_createRealm.html',controller: 'RealmCreateController'})
	.state('showRealm', {url: '/realms/:id',templateUrl: 'realm/_show.html',controller: 'RealmViewController'})
	.state('editRealm', {url: '/realms/{id}/edit',templateUrl: 'realm/_edit.html',controller: 'RealmEditController'})
	.state('stages', {url: '/stages',templateUrl: 'stage/_stages.html',controller: 'stageController'})
	.state('createStage', {url: '/createStage',templateUrl: 'stage/_createStage.html',controller: 'StageCreateController'})
	.state('showStage', {url: '/stages/:id',templateUrl: 'stage/_show.html',controller: 'StageViewController'})
	.state('editStage', {url: '/stages/{id}/edit',templateUrl: 'stage/_edit.html',controller: 'StageEditController'})
	.state('clients', {url: '/clients',templateUrl: 'clients/_clients.html',controller: 'clientsController'})
	.state('createClient', {url: '/createClient',templateUrl: 'clients/_createClient.html',controller: 'ClientCreateController'})
	.state('showClient', {url: '/clients/:id',templateUrl: 'client/_show.html',controller: 'ClientViewController'})
	.state('editClient', {url: '/clients/{id}/edit',templateUrl: 'client/_edit.html',controller: 'ClientEditController'})
	.state('praxis', {url: '/praxis',templateUrl: 'praxi/_praxis.html',controller: 'PraxiController'})
	.state('createPraxi', {url: '/createPraxi',templateUrl: 'praxi/_createPraxi.html',controller: 'PraxiCreateController'})
	.state('showPraxi', {url: '/praxis/:id',templateUrl: 'praxi/_show.html',controller: 'PraxiViewController'})
	.state('editPraxi', {url: '/praxis/{id}/edit',templateUrl: 'praxi/_edit.html',controller: 'PraxiEditController'})
	.state('login', {url: '/login',templateUrl: 'user/_login.html',controller: 'UserLoginController'})
	.state('forgotpass', {url: '/forgotpass',templateUrl: 'user/_forgot.html',controller: 'UserForgotController'})
	.state('signup', {url: '/signup',templateUrl: 'user/_signup.html',controller: 'UserCreateController'})
	.state('users', {url: '/users',templateUrl: 'user/_users.html',controller: 'UserController'})
	.state('createUser', {url: '/createUser',templateUrl: 'user/_createUser.html',controller: 'UserCreateController'})
	.state('showUser', {url: '/users/:id',templateUrl: 'user/_show.html',controller: 'UserViewController'})
	.state('editUser', {url: '/users/{id}/edit',templateUrl: 'user/_edit.html',controller: 'UserEditController'});
	
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
])
.directive('validPasswordC', function() {
  return {
    require: 'ngModel',
    scope: {
      reference: '=validPasswordC'
    },
    link: function(scope, elm, attrs, ctrl) {
      ctrl.$parsers.unshift(function(viewValue, $scope) {
        var noMatch = viewValue != scope.reference
        ctrl.$setValidity('noMatch', !noMatch);
        return (noMatch)?noMatch:undefined;
      });

      scope.$watch("reference", function(value) {;
        ctrl.$setValidity('noMatch', value === ctrl.$viewValue);
      });
    }
  }
})
.directive('ngUserLogout', [
  function(){
  	return {
      priority: 100,
      restrict: 'A',
      link: {
        pre: function(scope, element, attrs){ //<---------
          element.bind('click touchstart', function(e){
            var message = attrs.ngConfirmClick;
            if(message && message =='logout'){
              console.log('test')
              window.location = '/login';
            }
          });
        }
      }
    }
  }
]);
