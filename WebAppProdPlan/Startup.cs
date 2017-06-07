using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebAppProdPlan.Startup))]
namespace WebAppProdPlan
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
