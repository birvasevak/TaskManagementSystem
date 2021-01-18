using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManagementApp.Domain;
using TaskManagementApp.Repository;

namespace TaskManagementApp.Services
{
    public class UserServices : IServices<User>
    {
        private UnitOfWork unitOfWork;
        private UserRepository userRepository;

        public UserServices()
        {
            this.unitOfWork = new UnitOfWork();
            this.userRepository = new UnitOfWork().UserRepository;
        }

        public UserServices(UnitOfWork unitOfWork, UserRepository userRepository)
        {
            this.unitOfWork = unitOfWork;
            this.userRepository = userRepository;
        }

        public IEnumerable<User> GetAll()
        {
            return userRepository.GetAll();
        }

        public User Get(int id)
        {
            return userRepository.Get(id);
        }

        public void Insert(User entity)
        {
            userRepository.Insert(entity);
        }

        public void Remove(User entity)
        {
            userRepository.Remove(entity);
        }

        public void Delete(User entity)
        {
            userRepository.Delete(entity);
        }

        public void Save()
        {
            userRepository.SaveChanges();
        }

        public User ValidateUser(string email, string password)
        {
            List<User> userlist = userRepository.GetAll().ToList();
            var user = userlist.FirstOrDefault(x => x.Email == email && x.Password == password);
            return user;
        }

        public void Update(User entity)
        {
            userRepository.Update(entity);
        }
    }
}
