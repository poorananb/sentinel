angular.module('Sentinel.indicesController', [])
.controller('IndiceController', ['$scope', '$state', '$window', 'Index', function($scope, $state, $window, Index){	
        $scope.main = {
            offset: 1,
            limit: 1,
            sort: 'job_code ASC',
            rowsArray: [
                {id:1, label:'1 Per Page'},
                {id:2, label:'2 Per Page'},
                {id:3, label:'3 Per Page'}
            ],
            sortArray: [
                {id:'job_code ASC', label:'Name (A-Z)'},
                {id:'job_code DESC',label:'Name (Z-A)'},
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Index.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var orgs = JSON.parse(data);
		        // users from your api
                $scope.indices = data.indices;
                
                // total number of rows
                
                $scope.count = data.count;
                
                // number of pages of orgs
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
		
        $scope.loadPage(1);//fetch all orgs. Issues a GET to /api/orgs
		
		$scope.deleteIndice = function(index) { // Delete a org. Issues a DELETE to /api/org/:id
			index.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('indices'); //redirect to home
				}
			});
		};
	}]
)
.controller('IndiceViewController', ['$scope', '$stateParams' ,'Index', function($scope,$stateParams,Index){
    $scope.indice=Index.get({id:$stateParams.id});
}])
.controller('IndiceCreateController',['$scope', '$state', '$stateParams', 'Index', 'Job', 'Realm', function($scope,$state,$stateParams,Index,Job,Realm){
    //indice
    $scope.indice=new Index();
    
    //jobs 
    $scope.jobs = Job.query();
    
    //realms
    $scope.realms = Realm.query();
	
    $scope.addIndice=function(){
        $scope.indice.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('indices'); //redirect to home
			}
			
			if(response.status == 'exists'){
				return false; //redirect to home
			}
        });
    }

}]).controller('IndiceEditController',['$scope', '$state', '$stateParams', 'Index', 'Job', 'Realm', function($scope,$state,$stateParams,Index,Job,Realm){
    //orgs 
    $scope.jobs = Job.query();
    
    //realms
    $scope.realms = Realm.query();
    
    $scope.updateIndice=function(){
        $scope.indice.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('indices'); //redirect to home
			}
        });
    };

    $scope.loadIndice=function(){
        $scope.indice=Index.get({id:$stateParams.id});
    };

    $scope.loadIndice();
}]);