angular.module('Sentinel')
.factory('orgs', ['$http', function($http){
    var o = {
        orgs : [],
        org : {},
        message : {}
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
    
    o.update = function(org, id) {
        $http.put('/orgs/' + id + '.json', org).then(function(data){
            angular.copy(data.data, o.message);
           
            /*if(o.message.status == 'ok'){
                o.getAll();
            }*/
        });
        
        return o;
    };

    o.destroy = function(id) {
        $http.delete('/orgs/' + id + '.json').then(function(data){
            angular.copy(data.data, o.message);
            
            if(o.message.status == 'ok'){
                o.getAll();
            }
        });
        
        return o;
    };
    
    o.get = function(id) {
        $http.get('/orgs/' + id + '.json').then(function(data){
            angular.copy(data.data, o.org);
        });
        
        return o;
    };
    
    return o;
}]);