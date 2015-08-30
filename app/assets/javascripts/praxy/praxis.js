angular.module('Sentinel.praxys', [])
.factory('Praxy', function($resource){
    return $resource('/api/praxys/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});