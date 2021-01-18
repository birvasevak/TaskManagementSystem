using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManagementApp.Domain;

namespace TaskManagementApp.Repository
{
    public class UserRepository : Repository<User>
    {
        private TaskManagementEntities _context = null;
        private DbSet<User> entities = null;

        public UserRepository()
        {
            this._context = new TaskManagementEntities();
            entities = _context.Set<User>();
        }

        public UserRepository(TaskManagementEntities context)
        {
            _context = context;
            entities = _context.Set<User>();
        }
    }
}
