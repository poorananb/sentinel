angular.module('Sentinel.milestonesController', [])
.controller('MilestoneController', ['$scope', '$state', '$window', 'Milestone', function($scope, $state, $window, Milestone)
{	
        $scope.main = {
            offset: 1,
            limit: 1,
            sort: 'key ASC',
            rowsArray: [
                {id:1, label:'1 Per Page'},
                {id:2, label:'2 Per Page'},
                {id:3, label:'3 Per Page'}
            ],
            sortArray: [
                {id:'key ASC', label:'key (A-Z)'},
                {id:'key DESC',label:'key (Z-A)'}
              
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Milestone.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		       
                $scope.milestones = data.milestones;
                
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
		
	   // $scope.milestones = Milestone.query(); 
		$scope.deleteMilestone = function(milestone){
		    milestone.$delete(function(response) {
				$scope.message = response;
				if(response.status == 'ok'){
					$state.go('milestones'); //redirect to home
				}
			});
		};
	}]

)
/*{	
		$scope.milestones = Milestone.query(); 
		$scope.deleteMilestone = function(milestone) { // Delete a org. Issues a DELETE to /api/org/:id
			milestone.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('milestones'); //redirect to home
				}  
			});
		};
	}]
)*/
.controller('MilestoneViewController', ['$scope', '$stateParams' ,'Milestone', function($scope,$stateParams,Milestone){
    $scope.milestone=Milestone.get({id:$stateParams.id});
}])
.controller('MilestoneCreateController', ['$scope', '$state', '$stateParams', 'Milestone', 'Org', 'Client','Realm', function($scope,$state,$stateParams,Milestone,Org,Client,Realm){

    $scope.milestone=new Milestone();

    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
   
   $scope.realms = Realm.query();
   
    
    $scope.addMilestone=function(){
        $scope.milestone.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('milestones'); //redirect to home
			}
			
			if(response.status == 'exists'){
				return false; //redirect to home
			}
        });
    }

}]).controller('MilestoneEditController', ['$scope', '$state', '$stateParams', 'Milestone', 'Org', 'Client','Realm',function($scope,$state,$stateParams,Milestone,Org,Client,Realm){
    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
       $scope.realms = Realm.query();
       
    $scope.updateMilestone=function(){
        $scope.milestone.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('milestones'); //redirect to home
			}
        });
    };

    $scope.loadMilestone=function(){
        $scope.milestone=Milestone.get({id:$stateParams.id});
    };

    $scope.loadMilestone();
}]);
