angular.module('Sentinel.users', [])
.factory('User', function($resource){
    return $resource('/api/users/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
})
.factory('Session', function($resource){
    return $resource('/api/sessions/:id',{id:'@id'},{
        update: { method: 'PUT' }
    });
});