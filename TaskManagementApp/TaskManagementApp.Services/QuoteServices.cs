using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManagementApp.Domain;
using TaskManagementApp.Repository;

namespace TaskManagementApp.Services
{
    public class QuoteServices : IServices<Quote>
    {
        private UnitOfWork unitOfWork;
        private QuoteRepository quoteRepository;

        public QuoteServices()
        {
            this.unitOfWork = new UnitOfWork();
            this.quoteRepository = new UnitOfWork().QuoteRepository;
        }

        public QuoteServices(UnitOfWork unitOfWork, QuoteRepository quoteRepository)
        {
            this.unitOfWork = unitOfWork;
            this.quoteRepository = quoteRepository;
        }

        public IEnumerable<Quote> GetAll()
        {
            return quoteRepository.GetAll();
        }

        public Quote Get(int id)
        {
            return quoteRepository.Get(id);
        }

        public void Insert(Quote entity)
        {
            quoteRepository.Insert(entity);
        }

        public void Update(Quote entity)
        {
            quoteRepository.Update(entity);
        }

        public void Delete(Quote entity)
        {
            quoteRepository.Delete(entity);
        }

        public void Remove(Quote entity)
        {
            quoteRepository.Remove(entity);
        }



        public IEnumerable<Quote> GetByUserId(int id)
        {
            return quoteRepository.GetByUserId(id);
        }

        public bool QuoteExists(int id)
        {
            return quoteRepository.QuoteExists(id);
        }

        public void SaveChanges()
        {
            quoteRepository.SaveChanges();
        }
    }
}
