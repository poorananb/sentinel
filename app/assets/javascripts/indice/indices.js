angular.module('Sentinel.indices', [])
.factory('Index', function($resource){
    return $resource('/api/indices/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});