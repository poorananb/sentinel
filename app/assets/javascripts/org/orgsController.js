angular.module('Sentinel.orgsController', [])
.controller('OrgController', ['$scope', '$state', '$window', 'Org', function($scope, $state, $window, Org){	
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
        
        $scope.loadPerPage = function(option){
            $scope.main.limit = option;
            $scope.loadPage($scope.main.offset);
        }
        
        $scope.loadSortPage = function(option){
            $scope.main.sort = option;
            $scope.loadPage($scope.main.offset);
        }
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Org.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var orgs = JSON.parse(data);
		        // users from your api
                $scope.orgs = data.orgs;
                
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
		
        $scope.loadPage(1);//fetch all orgs. Issues a GET to /api/orgs
		
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