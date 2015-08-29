angular.module('Sentinel.stagesController', [])
.controller('stageController', ['$scope', '$state', '$window', 'Stage', function($scope, $state, $window, Stage){		
		$scope.stages = Stage.query(); //fetch all Stages. Issues a GET to /api/Stages
		
		$scope.deleteStage = function(stage) { // Delete a Stage. Issues a DELETE to /api/Stage/:id
			stage.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('stages'); //redirect to home
				}
			});
		};
	}]
)
.controller('StageViewController', ['$scope', '$stateParams' ,'Stage', function($scope,$stateParams,Stage){
    $scope.stage=Stage.get({id:$stateParams.id});
}])
.controller('StageCreateController',['$scope', '$state', '$stateParams', 'Stage', function($scope,$state,$stateParams,Stage){

    $scope.stage=new Stage();
	
    $scope.addStage=function(){
        $scope.stage.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('stages'); //redirect to home
			}
        });
    }

}]).controller('StageEditController',['$scope', '$state', '$stateParams', 'Stage', function($scope,$state,$stateParams,Stage){

    $scope.updateStage=function(){
        $scope.stage.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('stages'); //redirect to home
			}
        });
    };

    $scope.loadStage=function(){
        $scope.stage=Stage.get({id:$stateParams.id});
    };

    $scope.loadStage();
}]);
