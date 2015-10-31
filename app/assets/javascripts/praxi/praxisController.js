angular.module('Sentinel.praxisController', [])
.controller('PraxiController', ['$scope', '$state', '$window', 'Praxi', function($scope, $state, $window, Praxi){	
        $scope.main = {
            offset: 1,
            limit: 1,
            sort: 'praxis_code ASC',
            rowsArray: [
                {id:1, label:'1 Per Page'},
                {id:2, label:'2 Per Page'},
                {id:3, label:'3 Per Page'}
            ],
            sortArray: [
                {id:'praxis_code ASC', label:'Praxi Code (A-Z)'},
                {id:'org_code ASC',label:'Org Code (A-Z)'},
                {id:'client_code ASC', label:'Client Code (A-Z)'},
                {id:'realm_code ASC',label:'Realm Code (A-Z)'},
                {id:'prosess_code ASC',label:'Process Code (A-Z)'},
                {id:'stage_code ASC',label:'Stage Code (A-Z)'}
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Praxi.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var orgs = JSON.parse(data);
		        // users from your api
                $scope.praxis = data.praxis;
                
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
		
		$scope.deletePraxi = function(praxi) { // Delete a org. Issues a DELETE to /api/org/:id
			praxi.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('praxis'); //redirect to home
				}  
			});
		};
	}]
)
.controller('PraxiViewController', ['$scope', '$stateParams' ,'Praxi', function($scope,$stateParams,Praxi){
    $scope.praxi=Praxi.get({id:$stateParams.id});
}])
.controller('PraxiCreateController', ['$scope', '$state', '$stateParams', 'Praxi', 'Org', 'Client', 'Realm', 'Prosess', 'Stage', 'Milestone', function($scope,$state,$stateParams,Praxi,Org,Client,Realm,Prosess,Stage,Milestone){

    $scope.praxi=new Praxi();

    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
    
    //Realm
    $scope.realms = Realm.query();
    
    //prosess
    $scope.prosesses = Prosess.query();
    
    //stage
    $scope.stages = Stage.query();
    
    //milestone
     $scope.milestones = Milestone.query();
	
    $scope.addPraxi=function(){
        $scope.praxi.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('praxis'); //redirect to home
			}
			
			if(response.status == 'exists'){
				return false; //redirect to home
			}
        });
    }

}]).controller('PraxiEditController', ['$scope', '$state', '$stateParams', 'Praxi', 'Org', 'Client', 'Realm', 'Prosess', 'Stage','Milestone', function($scope,$state,$stateParams,Praxi,Org,Client,Realm,Prosess,Stage,Milestone){
    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
    
    //Realm
    $scope.realms = Realm.query();
    
    //prosess
    $scope.prosesses = Prosess.query();
    
    //stage
    $scope.stages = Stage.query();
    
    $scope.milestones = Milestone.query();
    
    $scope.updatePraxi=function(){
        $scope.praxi.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('praxis'); //redirect to home
			}
        });
    };

    $scope.loadPraxi=function(){
        $scope.praxi=Praxi.get({id:$stateParams.id});
    };

    $scope.loadPraxi();
}]);