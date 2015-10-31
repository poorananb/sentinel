angular.module('Sentinel.prosessesController', [])
.controller('ProsessController', ['$scope', '$state', '$window', 'Prosess', function($scope, $state, $window, Prosess)
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
            Prosess.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		       
                $scope.prosesses = data.prosesses;
                
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
		
		$scope.deleteProsess= function(prosess)  { // Delete a client. Issues a DELETE to /api/client/:id
			prosess.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('prosesses'); //redirect to home
				}
			});
		};
	}]

)
/*{		
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
)*/
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