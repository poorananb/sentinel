angular.module('Sentinel.communications', [])
.factory('Communication', function($resource){
    return $resource('/api/communications/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});