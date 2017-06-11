using Sabio.Web.Controllers.Attributes;
using Sabio.Web.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sabio.Web.Controllers.Api.Tests
{
    [AnonAuthorize(Roles = "User")]
    [RoutePrefix("ProfilePageNg")]
    public class ProfilePageNgController : BaseController
    {
        [Route("Landing")]
        public ActionResult Landing()
        {
            return View();
        }
        [Route("{id:int}/Public")]
        public ActionResult Public([System.Web.Http.FromUri] int id)
        {
            ItemViewModel<int> model = new ItemViewModel<int>();
            //Hydrate our view model
            model.Item = id;
            return View(model);
        }
        [Route("{query}/Search")]
        public ActionResult ProfileSearch([System.Web.Http.FromUri] string query)
        {
            ItemViewModel<int> model = new ItemViewModel<int>();
            //Hydrate our view model
            model.SearchQuery = query;
            return View(model);
        }

    }
}