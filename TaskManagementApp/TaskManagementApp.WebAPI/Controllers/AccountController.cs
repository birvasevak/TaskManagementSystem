using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using TaskManagementApp.Domain;
using TaskManagementApp.Services;

namespace TaskManagementApp.WebAPI.Controllers
{
    public class AccountController : ApiController
    {
        private UserServices userServices = new UserServices();

        // GET: api/Account
        [Authorize]
        [CustomExceptionFilter]
        public IEnumerable<User> GetUsers()
        {
            return userServices.GetAll();
        }

        // GET: api/Account/5
        [ResponseType(typeof(User))]
        [CustomExceptionFilter]
        [Authorize]
        public IHttpActionResult GetUser(int id)
        {
            User user = userServices.Get(id);
            if (user == null)
            {
               return Content(HttpStatusCode.NotFound, "User with "+id+" does not exist.");
            }

            return Ok(user);

        }

        [AllowAnonymous]
        [CustomExceptionFilter]
        [Route("api/Account/Register")]
        [HttpPost]
        //[EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
        public IHttpActionResult Register(RegisterModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var addUser = new User()
            {
                UserName = model.UserName ?? model.Email,
                Password = model.Password,
                Email = model.Email,
                FirstName = model.FirstName,
                LastName = model.LastName,
                UserRole = model.UserRole ?? "User"
            };
            userServices.Insert(addUser);
            userServices.Save();
            return Ok("User registered");
        }
    }
}