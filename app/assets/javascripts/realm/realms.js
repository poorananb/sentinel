angular.module('Sentinel.realms', [])
.factory('Realm', function($resource){
    return $resource('/api/realms/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});