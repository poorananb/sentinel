angular.module('Sentinel.realmsController', [])
.controller('RealmController', ['$scope', '$state', '$window', 'Realm', function($scope, $state, $window, Realm){		
		$scope.realms = Realm.query(); 
		
		$scope.deleteRealm = function(realm) { 
			realm.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('realms'); //redirect to home
				}
			});
		};
	}]
)
.controller('RealmViewController', ['$scope', '$stateParams' ,'Realm', function($scope,$stateParams,Realm){
    $scope.realm=Realm.get({id:$stateParams.id});
}])
.controller('RealmCreateController',['$scope', '$state', '$stateParams', 'Realm', function($scope,$state,$stateParams,Realm){

    $scope.realm=new Realm();
	
    $scope.addRealm=function(){
        $scope.realm.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('realms'); //redirect to home
			}
        });
    }

}]).controller('RealmEditController',['$scope', '$state', '$stateParams', 'Realm', function($scope,$state,$stateParams,Realm){

    $scope.updateRealm=function(){
        $scope.realm.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('realms'); //redirect to home
			}
        });
    };

    $scope.loadRealm=function(){
        $scope.realm=Realm.get({id:$stateParams.id});
    };

    $scope.loadRealm();
}]);