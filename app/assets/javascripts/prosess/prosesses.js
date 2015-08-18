angular.module('Sentinel.prosesses', [])
.factory('Prosess', function($resource){
    return $resource('/api/prosesses/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});