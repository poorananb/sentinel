angular.module('Sentinel.milestones', [])
.factory('Milestone', function($resource){
    return $resource('/api/milestones/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});