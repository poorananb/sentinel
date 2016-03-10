angular.module('Sentinel.orgs', [])
    .factory('Org', function($resource){
        return $resource('/api/orgs/:id',{id:'@id'},{
            'get': { method: 'GET', isArray: false },
            'query': { method: 'GET', isArray: false },
            update: { method: 'PUT' }
        });
    });