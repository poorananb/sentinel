angular.module('Sentinel')
	.controller('OrganizationCtrl', ['$scope', 'orgs',	function($scope, orgs){		
		$scope.addOrg = function(){
  			if(!$scope.name || $scope.name === '') { return; }
  			if(!$scope.code || $scope.code === '') { return; }
  			
  			orgs.create({
				name: $scope.name,
				code: $scope.code,
			});
			
			$scope.name = '';
			$scope.code = '';
		}
		
		$scope.deleteOrg = function(id){
			var message = orgs.destroy(id);
			$scope.message = message;
		}
		
		$scope.updateOrg = function(){
			if(!$scope.org.name || $scope.org.name === '') { return; }
  			if(!$scope.org.code || $scope.org.code === '') { return; }
  			
  			var message = orgs.update({
							name: $scope.org.name,
							code: $scope.org.code,
						  }, $scope.org.id);
			
			$scope.message = message;
		}
		
		$scope.orgs = orgs.orgs;

		$scope.org = orgs.org;
	}]
);