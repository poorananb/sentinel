angular.module('Sentinel.praxis', [])
.factory('Praxi', function($resource){
    return $resource('/api/praxis/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});