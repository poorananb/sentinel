angular.module('Sentinel.indices', [])
.factory('Indice', function($resource){
    return $resource('/api/indices/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});