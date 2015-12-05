angular.module('Sentinel.jobsController', [])
.controller('JobController', ['$scope', '$state', '$window', 'Job', function($scope, $state, $window, Job){	
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
                {id:'name ASC', label:'Code (A-Z)'},
                {id:'name DESC',label:'Code (Z-A)'}
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Job.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var orgs = JSON.parse(data);
		        // users from your api
                $scope.jobs = data.jobs;
                
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
		
		$scope.deleteJob = function(job) { // Delete a org. Issues a DELETE to /api/org/:id
			job.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('jobs'); //redirect to home
				}
			});
		};
	}]
)
.controller('JobViewController', ['$scope', '$stateParams' ,'Job', function($scope,$stateParams,Job){
    $scope.job=Job.get({id:$stateParams.id});
}])
.controller('JobCreateController',['$scope', '$state', '$stateParams', 'Job', 'Org', 'Client', function($scope,$state,$stateParams,Job,Org,Client){

    $scope.job=new Job();
    
    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
	
    $scope.addJob=function(){
        $scope.job.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('jobs'); //redirect to home
			}
			
			if(response.status == 'exists'){
				return false; //redirect to home
			}
        });
    }

}]).controller('JobEditController',['$scope', '$state', '$stateParams', 'Job', 'Org', 'Client', function($scope,$state,$stateParams,Job,Org,Client){
    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
    
    $scope.updateJob=function(){
        $scope.job.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('jobs'); //redirect to home
			}
        });
    };

    $scope.loadJob=function(){
        $scope.job=Job.get({id:$stateParams.id});
    };

    $scope.loadJob();
}]);