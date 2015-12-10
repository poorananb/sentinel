angular.module('Sentinel.settings', [])
.factory('Setting', function($resource){
    return $resource('/api/settings/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});