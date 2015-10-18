angular.module('Sentinel.rolesController', [])
.controller('RoleController', ['$scope', '$state', '$window', 'Role', function($scope, $state, $window, Role){	
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
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Role.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var orgs = JSON.parse(data);
		        // users from your api
                $scope.roles = data.roles;
                
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
		
		$scope.deleteRole = function(role) { // Delete a org. Issues a DELETE to /api/org/:id
			role.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('orgs'); //redirect to home
				}
			});
		};
	}]
)
.controller('RoleViewController', ['$scope', '$stateParams' ,'Role', function($scope,$stateParams,Role){
    $scope.role=Role.get({id:$stateParams.id});
}])
.controller('RoleCreateController',['$scope', '$state', '$stateParams', 'Role', function($scope,$state,$stateParams,Role){
    $scope.activities = ['user:show', 'user:create', 'user:update', 'user:destroy'];
    
    $scope.role=new Role();
	
    $scope.addRole=function(){
        $scope.role.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('roles'); //redirect to home
			}
        });
    }
}]).controller('RoleEditController',['$scope', '$state', '$stateParams', 'Role', function($scope,$state,$stateParams,Role){
    $scope.acties = ['user:show', 'user:create', 'user:update', 'user:destroy'];
    
    $scope.updateRole=function(){
        var roleForm = jQuery('#roleForm').serialize();
        jQuery.ajax({
            url: '/roles/update',
            method: 'post',
            data: roleForm,
            dataType: 'json',
            success:function(response){
                $scope.message = response.message;
        	
                if(response.status == 'ok'){
    				$state.go('roles'); //redirect to home
    			}
            }
        })
    };

    $scope.activities = [];
    var array = [];
    $scope.loadRole=function(){
        Role.get({id:$stateParams.id}, function(response){
            $scope.role = response;
            array = response.activities;
            $scope.activities = JSON.parse(array);
            //console.log(Object.prototype.toString.call($scope.activities));
        });
        
    };
    
    $scope.loadRole();
    
    $scope.toggleSelection = function toggleSelection(id) {
        var idx = $scope.activities.indexOf(id);
        if (idx > -1) {
          $scope.activities.splice(idx, 1);
        }
        else {
          $scope.activities.push(id);
        }
        console.log($scope.activities)
    };
}]);