aic.services.profilePage = aic.services.profilePage || {};


// GET PROFILE PAGE BY ID
aic.services.profilePage.getProfile = function (id, onSuccess) {
    aic.page.sendAjax("profile/home/" + id, "GET", null, onSuccess)
};
