﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.Web.UI;

namespace Project_07_1269074
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            ScriptManager.ScriptResourceMapping.AddDefinition(
            "jquery",
            new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-3.6.0.min.js",
                DebugPath = "~/scripts/jquery-3.6.0.js",
                //CdnPath = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js",
                //CdnDebugPath = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js",
                //CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "jQuery"
            });
        }
    }
}