angular.module('Sentinel.stagesController', [])
.controller('stageController', ['$scope', '$state', '$window', 'Stage', function($scope, $state, $window, Stage)
{	
        $scope.main = {
            offset: 1,
            limit: 1,
            sort: 'name ASC',
            rowsArray: [
                {id:1, label:'1 Per Page'},
                {id:2, label:'2 Per Page'},
                {id:3, label:'3 Per Page'}
            ],
            sortArray: [
                {id:'name ASC', label:'Name (A-Z)'},
                {id:'name DESC',label:'Name (Z-A)'},
                {id:'code ASC', label:'Code (A-Z)'},
                {id:'code DESC',label:'Code (Z-A)'}
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Stage.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		       
                $scope.stages = data.stages;
                
                // total number of rows
                
                $scope.count = data.count;
                
            
                $scope.pagesCount = data.count/$scope.main.limit;
                
                // build pages array
                var pagesArray = [];
                for(var p = 1; p < $scope.pagesCount+1; p++){
                     pagesArray.push(p);   
                }
                $scope.pages = pagesArray;
		    }); 
        }
        
        $scope.loadPerPage = function(option){
            $scope.main.limit = option;
            $scope.loadPage($scope.main.offset);
        }
        
        $scope.loadSortPage = function(option){
            $scope.main.sort = option;
            $scope.loadPage($scope.main.offset);
        }
		
        $scope.loadPage(1);//fetch all clients. Issues a GET to /api/clients
		
	$scope.deleteStage = function(stage) {  // Delete a client. Issues a DELETE to /api/client/:id
			stage.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('stages'); //redirect to home
				}
			});
		};
	}]

)
/*{		
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
)*/
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
