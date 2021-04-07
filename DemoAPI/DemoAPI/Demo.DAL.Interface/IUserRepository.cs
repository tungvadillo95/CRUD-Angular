using Demo.Domain.Request.User;
using Demo.Domain.Respone.User;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Demo.DAL.Interface
{
    public interface IUserRepository
    {
        Task<IEnumerable<UserView>> Gets();
        Task<UserView> Get(int id);
        Task<SaveUserRes> Save(SaveUserReq request);
    }
}
