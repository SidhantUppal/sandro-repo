using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Globalization;
using WebParking.WS;
using WebParking.WS.Data;
using WebParking.Helper;
using WebParking.Models;


namespace WebParking.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult ChangeCulture(string lang, string returnUrl)
        {
            Session["Culture"] = new CultureInfo(lang);
            return Redirect(returnUrl);
        }

    }
}
