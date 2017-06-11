(function () {
    "use strict";

    angular.module('aicApp')
        .factory('$profilePageService', profilePageServiceFactory);

    profilePageServiceFactory.$inject = ['$baseService', '$aic']

    function profilePageServiceFactory($baseService, $aic) {
        var aAicServiceObject = aic.services.profilePage;
        var newService = $baseService.merge(true, {}, aAicServiceObject, $baseService);
        return newService;
    }
})();
