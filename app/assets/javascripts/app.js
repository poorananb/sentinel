angular.module('Sentinel', ['ui.router', 'templates'])
.config(['$stateProvider', '$urlRouterProvider',
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
	/*.state('login', {
	  url: '/login/{id}',
	  templateUrl: 'posts/_posts.html',
	  controller: 'PostsCtrl'
	});*/

	$urlRouterProvider.otherwise('home');
}]);