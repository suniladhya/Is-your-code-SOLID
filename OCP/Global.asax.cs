﻿using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using Microsoft.Practices.Unity;
using BoxInformation.Presenter;
using BoxInformation.Interfaces;
using BoxInformation.Model;
using BoxInformation.Logging;


namespace BoxInformation
{
    public class Global : System.Web.HttpApplication
    {
        private const string AppContainerKey = "application container";
        private const string SessionContainerKey = "session container";

        protected void Application_Start(object sender, EventArgs e)
        {
            IUnityContainer applicationContainer = new UnityContainer();

            ConfigureContainer(applicationContainer, "application");
                

            ApplicationContainer = applicationContainer;
        }

        protected void Application_End(object sender, EventArgs e)
        {
            IUnityContainer applicationContainer = ApplicationContainer;

            if (applicationContainer != null)
            {
                applicationContainer.Dispose();

                ApplicationContainer = null;
            }
        }

        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            Page handler = HttpContext.Current.Handler as Page;

            if (handler != null)
            {
                IUnityContainer container = SessionContainer;

                if (container != null)
                {
                    container.BuildUp(handler.GetType(), handler);
                }
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            IUnityContainer applicationContainer = ApplicationContainer;

            if (applicationContainer != null)
            {
                IUnityContainer sessionContainer
                    = applicationContainer.CreateChildContainer();
                ConfigureContainer(sessionContainer, "session");

                SessionContainer = sessionContainer;
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {
            IUnityContainer sessionContainer = SessionContainer;
            if (sessionContainer != null)
            {
                sessionContainer.Dispose();

                SessionContainer = null;
            }
        }

        private IUnityContainer ApplicationContainer
        {
            get
            {
                return (IUnityContainer)Application[AppContainerKey];
            }
            set
            {
                Application[AppContainerKey] = value;
            }
        }

        private IUnityContainer SessionContainer
        {
            get
            {
                return (IUnityContainer)Session[SessionContainerKey];
            }
            set
            {
                Session[SessionContainerKey] = value;
            }
        }

        private static void ConfigureContainer(
            IUnityContainer container,string containerName)
        {
            if (containerName == "application")
            {
                container.RegisterType<IDataAccess, SqlDataAccess>(
                    new InjectionConstructor(ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString))
                    .RegisterType<ILogger, DebugLogger>();
                #region Alt.Log
                //.RegisterType<ILogger, TextFileLogger>(new InjectionConstructor(ConfigurationManager.AppSettings["LogPath"])); 
                #endregion

            }

            if (containerName == "session")
            {
                container.RegisterType<SearchPresenter, SearchPresenter>()
                     .RegisterType<ISearchView, Search>()
                     .RegisterType<IBoxEntry, BoxEntry>()
                     .RegisterType<RecordPresenter, RecordPresenter>()
                     .RegisterType<IRecordView, ViewRecord>();
                
            }

        }
    }
}