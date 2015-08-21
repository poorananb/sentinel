angular.module('Sentinel.clients', [])
.factory('Client', function($resource){
    return $resource('/api/clients/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});