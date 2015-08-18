angular.module('Sentinel.communicationsController', [])
.controller('CommunicationController', ['$scope', '$state', '$window', 'Communication', function($scope, $state, $window, Communication){		
		$scope.communications = Communication.query(); //fetch all Communication. Issues a GET to /api/orgs
		
		$scope.deleteCommunication = function(communication) { // Delete a org. Issues a DELETE to /api/org/:id
			communication.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('communications'); //redirect to home
				}
			});
		};
	}]
)
.controller('CommunicationViewController', ['$scope', '$stateParams' ,'Communication', function($scope,$stateParams,Communication){
    $scope.communication=Communication.get({id:$stateParams.id});
}])
.controller('CommunicationCreateController',['$scope', '$state', '$stateParams', 'Communication', function($scope,$state,$stateParams,Communication){

    $scope.communication=new Communication();
	
    $scope.addCommunication=function(){
        $scope.communication.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('communications'); //redirect to home
			}
        });
    }

}]).controller('CommunicationEditController',['$scope', '$state', '$stateParams', 'Communication', function($scope,$state,$stateParams,Communication){

    $scope.updateCommunication=function(){
        $scope.communication.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('communications'); //redirect to home
			}
        });
    };

    $scope.loadCommunication=function(){
        $scope.communication=Communication.get({id:$stateParams.id});
    };

    $scope.loadCommunication();
}]);