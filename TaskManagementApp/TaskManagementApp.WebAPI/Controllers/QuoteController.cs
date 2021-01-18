using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Description;
using TaskManagementApp.Domain;
using TaskManagementApp.Services;

namespace TaskManagementApp.WebAPI.Controllers
{
    [Authorize]
    [CustomExceptionFilter]
    public class QuoteController : ApiController
    {
        private QuoteServices quoteServices;

        public QuoteController()
        {
            this.quoteServices = new QuoteServices();
        }

        public QuoteController(QuoteServices quoteServices)
        {
            this.quoteServices = quoteServices;
        }

        // GET: api/Quote
        public IEnumerable<Quote> GetQuotes()
        {
            return quoteServices.GetAll();
        }

        // GET: api/QuotesperUser
        [Route("api/QuotesperUser")]
        [HttpGet]
        public IEnumerable<Quote> GetQuotesByUserId()
        {

            var userid = userID();
            var quotes = quoteServices.GetByUserId(Convert.ToInt32(userid));
            return quotes;
        }

        // GET: api/Quote/5
        [ResponseType(typeof(Quote))]
        public IHttpActionResult GetQuote(int id)
        {
            Quote quote = quoteServices.Get(id);
            if (quote == null)
            {
                return NotFound();
            }

            return Ok(quote);
        }

        // PUT: api/Quote/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutQuote(int id, Quote quote)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != quote.QuoteId)
            {
                return BadRequest();
            }

            var userid = userID();
            quote.UserId = Convert.ToInt32(userid);
            //quote.DueDate = DateTime.Today;
            quoteServices.Update(quote);

            try
            {
                quoteServices.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuoteExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.OK);
        }


        // POST: api/Quote
        [ResponseType(typeof(Quote))]
        public IHttpActionResult PostQuote(Quote quote)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var userid = userID();
            quote.UserId = Convert.ToInt32(userid);
            if (quote.DueDate == null)
            {
                quote.DueDate = DateTime.Now;
            }
            quoteServices.Insert(quote);
            quoteServices.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = quote.QuoteId }, quote);
        }

        // DELETE: api/Quote/5
        [ResponseType(typeof(Quote))]
        public IHttpActionResult DeleteQuote(int id)
        {
            Quote quote = quoteServices.Get(id);
            if (quote == null)
            {
                return NotFound();
            }

            quoteServices.Remove(quote);
            quoteServices.SaveChanges();

            return Ok(quote);
        }

        #region Helpers

        private bool QuoteExists(int id)
        {
            return quoteServices.QuoteExists(id);
        }

        private string userID()
        {
            var identity = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identity.Claims;

            var v = claims.FirstOrDefault(c => c.Type == "CustomUserID").Value;
            return v;
        }
        #endregion
    }
}
