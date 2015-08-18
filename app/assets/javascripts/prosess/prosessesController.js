angular.module('Sentinel.prosessesController', [])
.controller('ProsessController', ['$scope', '$state', '$window', 'Prosess', function($scope, $state, $window, Prosess){		
		$scope.prosesses = Prosess.query(); //fetch all orgs. Issues a GET to /api/orgs
		
		$scope.deleteProsess= function(prosess) { // Delete a org. Issues a DELETE to /api/org/:id
			prosess.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('prosesses'); //redirect to home
				}
			});
		};
	}]
)
.controller('ProsessViewController', ['$scope', '$stateParams' ,'Prosess', function($scope,$stateParams,Prosess){
    $scope.prosess=Prosess.get({id:$stateParams.id});
}])
.controller('ProsessCreateController',['$scope', '$state', '$stateParams', 'Prosess', function($scope,$state,$stateParams,Prosess){

    $scope.prosess=new Prosess();
	
    $scope.addProsess=function(){
        $scope.prosess.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('prosesses'); //redirect to home
			}
        });
    }

}]).controller('ProsessEditController',['$scope', '$state', '$stateParams', 'Prosess', function($scope,$state,$stateParams,Prosess){

    $scope.updateProsess=function(){
        $scope.prosess.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('prosesses'); //redirect to home
			}
        });
    };

    $scope.loadProsess=function(){
        $scope.prosess=Prosess.get({id:$stateParams.id});
    };

    $scope.loadProsess();
}]);