angular.module('Sentinel.realmsController', [])
.controller('RealmController', ['$scope', '$state', '$window', 'Realm', function($scope, $state, $window, Realm)
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
            Realm.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		       
                $scope.realms = data.realms;
                
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
		
	$scope.deleteRealm = function(realm) {  // Delete a client. Issues a DELETE to /api/client/:id
			realm.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('realms'); //redirect to home
				}
			});
		};
	}]

)
// {		
// 		$scope.realms = Realm.query(); 
		
// 		$scope.deleteRealm = function(realm) { 
// 			realm.$delete(function(response) {
// 				$scope.message = response;
				
// 				if(response.status == 'ok'){
// 					$state.go('realms'); //redirect to home
// 				}
// 			});
// 		};
// 	}]
// )
.controller('RealmViewController', ['$scope', '$stateParams' ,'Realm', function($scope,$stateParams,Realm){
    $scope.realm=Realm.get({id:$stateParams.id});
}])
.controller('RealmCreateController',['$scope', '$state', '$stateParams', 'Realm', function($scope,$state,$stateParams,Realm){

    $scope.realm=new Realm();
	
    $scope.addRealm=function(){
        $scope.realm.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('realms'); //redirect to home
			}
        });
    }

}]).controller('RealmEditController',['$scope', '$state', '$stateParams', 'Realm', function($scope,$state,$stateParams,Realm){

    $scope.updateRealm=function(){
        $scope.realm.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('realms'); //redirect to home
			}
        });
    };

    $scope.loadRealm=function(){
        $scope.realm=Realm.get({id:$stateParams.id});
    };

    $scope.loadRealm();
}]);