angular.module('Sentinel.clientsController', [])
.controller('clientsController', ['$scope', '$state', '$window', 'Client', function($scope, $state, $window, Client)
{	
        $scope.main = {
            offset: 1,
            limit: 3,
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
            Client.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){

                $scope.clients = data.clients;
                $scope.count = data.meta.total_count;
                $scope.pagesCount = data.meta.total_pages;

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
.controller('ClientCreateController',['$scope', '$state', '$stateParams', 'Client','Org' ,function($scope,$state,$stateParams,Client,Org){

    $scope.client = new Client();

    Org.query({}, function (response) {
        $scope.orgs = response.orgs
    });

    $scope.addClient=function(){
        $scope.client.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('clients'); //redirect to home
			}
        });
    }

}]).controller('ClientEditController',['$scope', '$state', '$stateParams', 'Client', 'Org',function($scope,$state,$stateParams,Client,Org){
    Org.query({}, function (response) {
        $scope.orgs = response.orgs
    });

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