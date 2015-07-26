angular.module('Sentinel')
.factory('orgs', ['$http', function($http){
    var o = {
        orgs : [],
        org : {}
    };
    
    o.getAll = function() {
        $http.get('/orgs.json').success(function(data){
            angular.copy(data, o.orgs);
        });
        
        return o;
    };
    
    o.create = function(org) {
        return $http.post('/orgs.json', org).success(function(data){
            o.orgs.push(data);
        });
    };

    o.destroy = function(id) {
        return $http.delete('/orgs/' + id + '.json').then(function(data){
            console.log(data)
        });
    };
    
    o.get = function(id) {
        $http.get('/orgs/' + id + '.json').then(function(data){
            angular.copy(data.data, o.org);
        });
        
        return o;
    };
    
    return o;
}]);