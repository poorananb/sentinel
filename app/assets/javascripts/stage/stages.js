angular.module('Sentinel.stages', [])
.factory('Stage', function($resource){
    return $resource('/api/stages/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});