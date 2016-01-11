angular.module('Sentinel.jobs', [])
.factory('Job', function($resource){
    return $resource('/api/jobs/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});