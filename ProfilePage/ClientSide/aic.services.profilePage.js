sabio.services.profilePage = sabio.services.profilePage || {};


// GET PROFILE PAGE BY ID
sabio.services.profilePage.getProfile = function (id, onSuccess) {
    sabio.page.sendAjax("profile/home/" + id, "GET", null, onSuccess)
};