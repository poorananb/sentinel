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
		
		var scope = $scope;
		$scope.deleteOrg = function(id){
			var msg = orgs.destroy(id);
			console.log(msg);
			//scope.changeRoute('#/listorg');
		}
		
		$scope.orgs = orgs.orgs;

		$scope.org = orgs.org;
	}]
);