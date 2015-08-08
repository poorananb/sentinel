                                                        angular.module('Sentinel.orgs', [])
.factory('Org', function($resource){
    return $resource('/api/orgs/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});