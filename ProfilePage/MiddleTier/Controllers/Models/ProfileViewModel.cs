using Sabio.Web.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;

namespace Sabio.Web.Models.ViewModels
{
    public class ProfileViewModel : BaseViewModel
    {
        public int MyId { get; set; }
        public string PersonFirstName { get; set; }
        public string PersonLastName { get; set; }
        public string PersonMiddleInitial { get; set; }
        public string PersonGender { get; set; }
        public DateTime PersonDob { get; set; }
        public string PersonGuid { get; set; }
        public string PersonLine1 { get; set; }
        public string PersonLine2 { get; set; }
        public string PersonCity { get; set; }
        public string PersonState { get; set; }
        public string PersonPostal { get; set; }
        public string PersonAbout { get; set; }
        public List<Schools> School { get; set; }
        public List<Companies> Company { get; set; }
        public List<PersonSkillSelectByUser> Skills { get; set; }
        public List<PersonSettings> PersonSettings { get; set; }
        public List<Role> PersonRoles { get; set; }
        public List<RecruiterJob> RecruiterJobs { get; set; }
        public int ProfileId { get; set; }
        public string PersonPic { get; set; }
    }
}