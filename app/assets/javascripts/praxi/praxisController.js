angular.module('Sentinel.praxisController', [])
.controller('PraxiController', ['$scope', '$state', '$window', 'Praxi', function($scope, $state, $window, Praxi){		
		$scope.praxis = Praxi.query(); //fetch all orgs. Issues a GET to /api/orgs
		
		$scope.deletePraxi = function(praxi) { // Delete a org. Issues a DELETE to /api/org/:id
			praxi.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('praxis'); //redirect to home
				}  
			});
		};
	}]
)
.controller('PraxiViewController', ['$scope', '$stateParams' ,'Praxi', function($scope,$stateParams,Praxi){
    $scope.praxi=Praxi.get({id:$stateParams.id});
}])
.controller('PraxiCreateController', ['$scope', '$state', '$stateParams', 'Praxi', function($scope,$state,$stateParams,Praxi){

    $scope.praxi=new Praxi();
	
    $scope.addPraxi=function(){
        $scope.praxi.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('praxis'); //redirect to home
			}
        });
    }

}]).controller('PraxiEditController', ['$scope', '$state', '$stateParams', 'Praxi', function($scope,$state,$stateParams,Praxi){

    $scope.updateOrg=function(){
        $scope.praxi.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('praxis'); //redirect to home
			}
        });
    };

    $scope.loadPraxi=function(){
        $scope.praxi=Praxi.get({id:$stateParams.id});
    };

    $scope.loadPraxi();
}]);