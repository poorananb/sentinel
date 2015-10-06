angular.module('Sentinel.roles', [])
.factory('Role', function($resource){
    return $resource('/api/roles/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});