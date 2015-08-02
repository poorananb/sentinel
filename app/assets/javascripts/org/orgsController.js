angular.module('Sentinel.orgsController', [])
.controller('OrgController', ['$scope', '$state', '$window', 'Org', function($scope, $state, $window, Org){		
		$scope.orgs = Org.query(); //fetch all orgs. Issues a GET to /api/orgs
		
		$scope.deleteOrg = function(org) { // Delete a org. Issues a DELETE to /api/org/:id
			org.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('orgs'); //redirect to home
				}
			});
		};
	}]
)
.controller('OrgViewController', ['$scope', '$stateParams' ,'Org', function($scope,$stateParams,Org){
    $scope.org=Org.get({id:$stateParams.id});
}])
.controller('OrgCreateController',['$scope', '$state', '$stateParams', 'Org', function($scope,$state,$stateParams,Org){

    $scope.org=new Org();
	
    $scope.addOrg=function(){
        $scope.org.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('orgs'); //redirect to home
			}
        });
    }

}]).controller('OrgEditController',['$scope', '$state', '$stateParams', 'Org', function($scope,$state,$stateParams,Org){

    $scope.updateOrg=function(){
        $scope.org.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('orgs'); //redirect to home
			}
        });
    };

    $scope.loadOrg=function(){
        $scope.org=Org.get({id:$stateParams.id});
    };

    $scope.loadOrg();
}]);