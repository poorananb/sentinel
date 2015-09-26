angular.module('Sentinel.usersController', [])
.controller('UserController', ['$scope', '$state', '$window', 'User', function($scope, $state, $window, User){	
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
                {id:'email ASC', label:'Email (A-Z)'},
                {id:'email DESC',label:'Email (Z-A)'}
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            User.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var Users = JSON.parse(data);
		        // users from your api
                $scope.users = data.users;
                
                // total number of rows
                $scope.count = data.count;
                
                // number of pages of Users
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
		
        $scope.loadPage(1);//fetch all Users. Issues a GET to /api/Users
		
		$scope.deleteUser = function(user) { // Delete a User. Issues a DELETE to /api/User/:id
			user.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('users'); //redirect to home
				}
			});
		};
	}]
)
.controller('UserViewController', ['$scope', '$stateParams' ,'User', function($scope,$stateParams,User){
    $scope.user=User.get({id:$stateParams.id});
}])
.controller('UserCreateController',['$scope', '$state', '$stateParams', 'User', function($scope,$state,$stateParams,User){

    $scope.user=new User();
	
    $scope.addUser=function(){
        $scope.user.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('users'); //redirect to home
			}
			
			if(response.status == 'error'){
				console.log($scope.user)
			}
        });
    }

}]).controller('UserEditController',['$scope', '$state', '$stateParams', 'User', function($scope,$state,$stateParams,User){

    $scope.updateUser=function(){
        $scope.user.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('users'); //redirect to home
			}
        });
    };

    $scope.loadUser=function(){
        $scope.user=User.get({id:$stateParams.id});
    };

    $scope.loadUser();
}])
.controller('UserLoginController',['$scope', '$state', '$stateParams', 'Session', function($scope,$state,$stateParams,Session){
    $scope.session=new Session();
	
    $scope.login=function(){
        $scope.session.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
                //$('#logPlaceHolder').attr('href', '/logout').children('span').text('Log Out');
				//$state.go('home'); //redirect to home
				window.location='/home'
			}
        });
    }
    
    $scope.logout=function(){
        $scope.session.$destroy(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
                window.location = '/login';
			}
        })
    }
}])
.controller('UserForgotController',['$scope', '$state', '$stateParams', 'User', function($scope,$state,$stateParams,User){

    $scope.User=new User();
	
    $scope.forgot=function(){
        $scope.user.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('users'); //redirect to home
			}
        });
    }

}]);