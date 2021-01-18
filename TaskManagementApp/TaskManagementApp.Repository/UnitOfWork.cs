using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManagementApp.Domain;

namespace TaskManagementApp.Repository
{
    public class UnitOfWork : IDisposable
    {
        private TaskManagementEntities context = new TaskManagementEntities();
        private UserRepository userRepository;
        private QuoteRepository quoteRepository;

        public UnitOfWork()
        {
            this.context = new TaskManagementEntities();

        }

        public UserRepository UserRepository
        {
            get
            {
                if (this.userRepository == null)
                {
                    this.userRepository = new UserRepository(context);
                }
                return userRepository;
            }
        }

        public QuoteRepository QuoteRepository
        {
            get
            {
                if (this.quoteRepository == null)
                {
                    this.quoteRepository = new QuoteRepository(context);
                }
                return quoteRepository;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }

        public void Dispose()
        {
            context.Dispose();
            //throw new NotImplementedException();
        }
    }
}
