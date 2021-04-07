using Demo.Domain.Request.Subject;
using Demo.Domain.Respone.Subject;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Demo.DAL.Interface
{
    public interface ISubjectRepository
    {
        Task<IEnumerable<SubjectView>> Gets();
        Task<SubjectView> Get(int id);
        Task<SaveSubjectRes> Save(SaveSubjectReq request);
        Task<SaveSubjectRes> Deleted(int id);
    }
}
