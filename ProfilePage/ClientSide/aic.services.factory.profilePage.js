(function () {
    "use strict";

    angular.module('sabioApp')
        .factory('$profilePageService', profilePageServiceFactory);

    profilePageServiceFactory.$inject = ['$baseService', '$sabio']

    function profilePageServiceFactory($baseService, $sabio) {
        var aSabioServiceObject = sabio.services.profilePage;
        var newService = $baseService.merge(true, {}, aSabioServiceObject, $baseService);
        return newService;
    }
})();
