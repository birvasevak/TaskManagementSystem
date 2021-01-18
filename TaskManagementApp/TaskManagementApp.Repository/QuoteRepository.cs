using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManagementApp.Domain;

namespace TaskManagementApp.Repository
{
    public class QuoteRepository : Repository<Quote>
    {
        private TaskManagementEntities _context = null;
        private DbSet<Quote> entities = null;

        public QuoteRepository()
        {
            this._context = new TaskManagementEntities();
            entities = _context.Set<Quote>();
        }

        public QuoteRepository(TaskManagementEntities context)
        {
            _context = context;
            entities = _context.Set<Quote>();
        }

        public IEnumerable<Quote> GetByUserId(int id)
        {
            return entities.Where(q => q.UserId == id);
        }

        public bool QuoteExists(int id)
        {
            return entities.Count(e => e.QuoteId == id) > 0;
        }

        

        protected void Dispose()
        {
            _context.Dispose();
        }
    }
}
