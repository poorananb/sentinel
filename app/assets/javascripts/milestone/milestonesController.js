angular.module('Sentinel.milestonesController', [])
.controller('MilestoneController', ['$scope', '$state', '$window', 'Milestone', function($scope, $state, $window, Milestone){	
   
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
)
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
