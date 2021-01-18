using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using TaskManagementApp.Domain;
using TaskManagementApp.Services;

namespace TaskManagementApp.WebAPI.Providers
{
    public class OAuthProvider : OAuthAuthorizationServerProvider
    {
        #region[GrantResourceOwnerCredentials]
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);

            UserServices userServices = new UserServices();
            var user = userServices.GetAll().Where(o => o.UserName.ToLower() == context.UserName.ToLower() && o.Password == context.Password).FirstOrDefault();
            if (user != null)
            {
                identity.AddClaim(new Claim(ClaimTypes.Role, user.UserRole ?? "User"));
                identity.AddClaim(new Claim(ClaimTypes.Name, user.UserName));
                identity.AddClaim(new Claim("CustomUserID", user.UserId.ToString() ?? ""));
                identity.AddClaim(new Claim("LoggedOn", DateTime.Now.ToString()));

                var properties = CreateProperties(user.UserName, user.UserId.ToString());

                await Task.Run(() => context.Validated(identity));

            }
            else
            {
                context.SetError("Wrong Crendtials", "Provided username and password is incorrect");
            }
        }
    #endregion

    #region[ValidateClientAuthentication]
    public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
    {
        if (context.ClientId == null)
            context.Validated();

        return Task.FromResult<object>(null);
    }
    #endregion

    #region[TokenEndpoint]
    public override Task TokenEndpoint(OAuthTokenEndpointContext context)
    {
        foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
        {
            context.AdditionalResponseParameters.Add(property.Key, property.Value);
        }

        return Task.FromResult<object>(null);
    }
    #endregion

    #region[CreateProperties]
    public static AuthenticationProperties CreateProperties(string userName, string userId)
    {
        IDictionary<string, string> data = new Dictionary<string, string>
            {
                { "userName", userName },
                { "UserId", userId }
            };
        return new AuthenticationProperties(data);
    }
    #endregion
}
}