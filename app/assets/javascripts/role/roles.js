angular.module('Sentinel.roles', [])
.factory('Role', function($resource){console.log($resource)
    return $resource('/api/roles/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});