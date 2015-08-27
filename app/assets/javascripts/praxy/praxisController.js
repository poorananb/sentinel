angular.module('Sentinel.praxysController', [])
.controller('PraxyController', ['$scope', '$state', '$window', 'Praxy', function($scope, $state, $window, Praxy){		
		$scope.praxys = Praxy.query(); //fetch all orgs. Issues a GET to /api/orgs
		
		$scope.deletePraxy = function(praxy) { // Delete a org. Issues a DELETE to /api/org/:id
			praxy.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('praxys'); //redirect to home
				}
			});
		};
	}]
)
.controller('PraxyViewController', ['$scope', '$stateParams' ,'Praxy', function($scope,$stateParams,Praxy){
    $scope.praxy=Praxy.get({id:$stateParams.id});
}])
.controller('PraxyCreateController',['$scope', '$state', '$stateParams', 'Praxy', function($scope,$state,$stateParams,Praxy){

    $scope.praxy=new Praxy();
	
    $scope.addPraxy=function(){
        $scope.praxy.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('praxys'); //redirect to home
			}
        });
    }

}]).controller('PraxyEditController',['$scope', '$state', '$stateParams', 'Praxy', function($scope,$state,$stateParams,Praxy){

    $scope.updateOrg=function(){
        $scope.praxy.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('praxys'); //redirect to home
			}
        });
    };

    $scope.loadPraxy=function(){
        $scope.praxy=Praxy.get({id:$stateParams.id});
    };

    $scope.loadPraxy();
}]);