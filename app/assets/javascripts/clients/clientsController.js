angular.module('Sentinel.clientsController', [])
.controller('clientsController', ['$scope', '$state', '$window', 'Client', function($scope, $state, $window, Client){		
		$scope.clients = Client.query(); //fetch all clients. Issues a GET to /api/clients
		
		$scope.deleteClient = function(client) { // Delete a client. Issues a DELETE to /api/client/:id
			client.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('clients'); //redirect to home
				}
			});
		};
	}]
)
.controller('ClientViewController', ['$scope', '$stateParams' ,'Client', function($scope,$stateParams,Client){
    $scope.client=Client.get({id:$stateParams.id});
}])
.controller('ClientCreateController',['$scope', '$state', '$stateParams', 'Client', function($scope,$state,$stateParams,Client){

    $scope.client=new Client();
	
    $scope.addClient=function(){
        $scope.client.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('clients'); //redirect to home
			}
        });
    }

}]).controller('ClientEditController',['$scope', '$state', '$stateParams', 'Client', function($scope,$state,$stateParams,Client){

    $scope.updateClient=function(){
        $scope.client.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('clients'); //redirect to home
			}
        });
    };

    $scope.loadClient=function(){
        $scope.client=Client.get({id:$stateParams.id});
    };

    $scope.loadClient();
}]);