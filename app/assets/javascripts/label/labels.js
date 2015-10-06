angular.module('Sentinel.labels', [])
.factory('Label', function($resource){
    return $resource('/api/labels/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});