 (function () {
    "use strict";

    angular.module('aicApp')
        .controller('profilePageController', ProfilePageController)

    ProfilePageController.$inject = ['$scope', '$baseController', '$profilePageService', 'toastr', '$sce', "$userService", "$settingsService"];

    function ProfilePageController($scope, $baseController, $profilePageService, $toastr, $sce, $userService, $settingsService) {
        var vm = this;

        vm.$scope = $scope;
        vm.$profilePageService = $profilePageService;
        vm.$userService = $userService;
        vm.$settingsService = $settingsService;

        vm.aboutMode = true;
        vm.whBtn = true;
        vm.edBtn = true;
        vm.skBtn = true;
        vm.jobBtn = false;
        vm.aboutMode = true;
        vm.profile = {};
        vm.picUrl = "";
        vm.userPersonId = aic.page.personId;

        vm.getProfile = _getProfile;
        vm.getProfileSuccess = _getProfileSuccess;
        vm.showAbout = _showAbout;
        vm.showWork = _showWork;
        vm.showEd = _showEd;
        vm.showSkill = _showSkill;
        vm.showJob = _showJob;
        vm.editAbout = _editAbout;
        vm.onSettingsSuccess = _onSettingsSuccess;
        vm.settings = aic.page.settings;
        vm.personId = parseInt($("#manageId").val());
        vm.searchUser = _searchUser;
        vm.searchQuery = null;
        vm.getSearchSuccess = _getSearchSuccess;

        $baseController.merge(vm, $baseController);
        vm.notify = vm.$profilePageService.getNotifier($scope);

        render();

        //------------------------------THE FOLD--------------------------------------

        function render() {
            console.log("rendering...")
            if (aic.page.personId != 0)
            {
                vm.getProfile(vm.personId);
            }
            vm.$settingsService.getByPersonId(vm.personId, vm.onSettingsSuccess);
        }

        function _getProfile(id) {
            vm.$profilePageService.getProfile(id, vm.getProfileSuccess);
        }

        function _getProfileSuccess(data, textStatus, jqXHR) {
            vm.notify(function () {
                vm.profile = data;
                //console.log(vm.profile);
                if (vm.profile.personPic) {
                    vm.picUrl = "https://aic-training.s3-us-west-2.amazonaws.com/C30/" + vm.profile.personPic;
                }
                else {
                    vm.picUrl = "/public-assets/images/people/defaultAvatar.jpg";
                }
                var roles = data.personRoles;
                for (var i = 0; i < roles.length; i++)
                    if (roles[i].userRole == "Recruiter")
                    {
                        vm.jobBtn = true;
                    }
                // profile guid
                aic.page.profileGuid = vm.profile.personGuid;
                aic.page.profileFullName = vm.profile.personFirstName + " " + vm.profile.personLastName;
                console.log(vm.profile);
            })
        }

        function _showAbout() {
            vm.aboutMode = true;
            vm.whMode = false;
            vm.edMode = false;
            vm.skillMode = false;
            vm.jobMode = false;
        }

        function _showWork() {
            vm.whMode = true;
            vm.aboutMode = false;
            vm.edMode = false;
            vm.skillMode = false;
            vm.jobMode = false;
        }

        function _showEd() {
            vm.edMode = true;
            vm.whMode = false;
            vm.aboutMode = false;
            vm.skillMode = false;
        }

        function _showSkill() {
            vm.skillMode = true;
            vm.edMode = false;
            vm.whMode = false;
            vm.aboutMode = false;
            vm.jobMode = false;
        }

        function _showJob() {
            vm.skillMode = false;
            vm.edMode = false;
            vm.whMode = false;
            vm.aboutMode = false;
            vm.jobMode = true;
        }

        function _editAbout() {
            location.href = "/aboutme/create"
        }

        function _onSettingsSuccess(data, textStatus, jqHXR) {
            if (data.items)
            {
                vm.notify(function () {
                    var settingsArray = data.items;
                    for (var i = 0; i < settingsArray.length; i++) {
                        var settingsObject = settingsArray[i];
                        if (settingsObject.name == "Work History") {
                            if (settingsObject.value == "true") {
                                vm.whBtn = false;
                            }
                        }
                        else if (settingsObject.name == "Education") {
                            if (settingsObject.value == "true") {
                                vm.edBtn = false;
                            }
                        }
                        else if (settingsObject.name == "Skills") {
                            if (settingsObject.value == "true") {
                                vm.skBtn = false;
                            }
                        }
                    }
                });

            }
        }

        function _searchUser() {
            if (vm.searchQuery != null) {
                vm.$userService.userSearchUser(vm.searchQuery, aic.page.personId, _getSearchSuccess);
            }
            else {
                $toastr.error("You didn't search anyone.");
            }
        }
        function _getSearchSuccess() {
            self.location = "/ProfilePageNg/" + vm.searchQuery + "/Search"
        }
    }
})();
