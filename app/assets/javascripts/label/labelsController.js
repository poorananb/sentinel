angular.module('Sentinel.labelsController', ['ngFileUpload'])
.controller('LabelController', ['$scope', '$state', '$window', 'Label', function($scope, $state, $window, Label){	
    /*    $scope.main = {
            offset: 1,
            limit: 1,
            sort: 'label_name ASC',
            rowsArray: [
                {id:1, label:'1 Per Page'},
                {id:2, label:'2 Per Page'},
                {id:3, label:'3 Per Page'}
            ],
            sortArray: [
                {id:'org_code ASC',label:'Org Code (A-Z)'},
                {id:'client_code ASC', label:'Client Code (A-Z)'},
                {id:'key ASC',label:'Key (A-Z)'},
                {id:'label_name ASC',label:'Label (A-Z)'}
                
            ]
        };
        
        $scope.loadPage = function(page){
            $scope.main.offset = page;
            Label.get({offset:$scope.main.offset, limit:$scope.main.limit, sort:$scope.main.sort}, function(data){
		        //var orgs = JSON.parse(data);
		        // users from your api
                $scope.labels = data.labels;
                alert(data.count);
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
		
        $scope.loadPage(1);//fetch all orgs. Issues a GET to /api/orgs*/
		$scope.labels = Label.query(); 
		$scope.deleteLabel = function(label) { // Delete a org. Issues a DELETE to /api/org/:id
			label.$delete(function(response) {
				$scope.message = response;
				
				if(response.status == 'ok'){
					$state.go('labels'); //redirect to home
				}  
			});
		};
	}]
)
.controller('LabelViewController', ['$scope', '$stateParams' ,'Label', function($scope,$stateParams,Label){
    $scope.label=Label.get({id:$stateParams.id});
}])
.controller('LabelCreateController', ['$scope', '$state', '$stateParams', 'Label', 'Org', 'Client','Realm','Upload', '$timeout', function($scope,$state,$stateParams,Label,Org,Client,Realm,Upload, $timeout){

    $scope.label=new Label();

    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
   
   $scope.realms = Realm.query();
   
    $scope.uploadFiles = function(file) {
        
        $scope.f = file;
        if (file && !file.$error) {
            file.upload = Upload.upload({
                url: 'images/',
                file: file
            });

            file.upload.then(function (response) {
                $timeout(function () {
                    $scope.label.icon=response.data.filename;
                 
                    file.result = response.data;
                });
            }, function (response) {
               
                if (response.status > 0)
                    $scope.errorMsg = response.status + ': ' + response.data;
            });

      
        }
        
    }
    $scope.addLabel=function(){
        $scope.label.$save(function(response){
            $scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('labels'); //redirect to home
			}
			
			if(response.status == 'exists'){
				return false; //redirect to home
			}
        });
    }

}]).controller('LabelEditController', ['$scope', '$state', '$stateParams', 'Label', 'Org', 'Client','Realm','Upload', '$timeout', function($scope,$state,$stateParams,Label,Org,Client,Realm,Upload, $timeout){
    //orgs 
    $scope.orgs = Org.query();
    
    //clients
    $scope.clients = Client.query();
       $scope.realms = Realm.query();
       $scope.uploadFiles = function(file) {
        
        $scope.f = file;
        if (file && !file.$error) {
            file.upload = Upload.upload({
                url: 'images/',
                file: file
            });

            file.upload.then(function (response) {
                $timeout(function () {
                    $scope.label.icon=response.data.filename;
                 
                    file.result = response.data;
                });
            }, function (response) {
               
                if (response.status > 0)
                    $scope.errorMsg = response.status + ': ' + response.data;
            });

      
        }
        
    }
    $scope.updateLabel=function(){
        $scope.label.$update(function(response){
        	$scope.message = response;
        	
            if(response.status == 'ok'){
				$state.go('labels'); //redirect to home
			}
        });
    };

    $scope.loadLabel=function(){
        $scope.label=Label.get({id:$stateParams.id});
    };

    $scope.loadLabel();
}]);
